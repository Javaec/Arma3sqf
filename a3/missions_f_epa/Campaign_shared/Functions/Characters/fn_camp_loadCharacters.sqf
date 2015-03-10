/*
	Author: Jiøí Wainar

	Description:
	--------------------------------------------------------------------------------------------
	Persistant equipment front-end "load" function.

	Function:
	--------------------------------------------------------------------------------------------
	1. gathers info about mission characters
	2. checks their equipment against equipment pool content
	3. loads the equipment and adjusts it

	Example:
	--------------------------------------------------------------------------------------------
	[missionName,["BIS_inf","BIS_recon"]] call BIS_fnc_camp_loadCharacters;
*/

//control debug log spam
private["_fnc_log_disable"];_fnc_log_disable = true;

private["_mission","_units","_addSurvivors","_equipSubtract","_loadGear","_unit","_unitVar","_identity","_cfgCharacters"];
private["_missionMeta","_isHub","_isSkirmish","_isCampaign","_identities","_hasBriefing","_loadingBriefing","_refreshIdentity"];

_missionMeta	= [] call BIS_fnc_camp_getMissionMeta;
_isHub		= _missionMeta select 1;
_isSkirmish	= _missionMeta select 2;
_isCampaign	= [] call BIS_fnc_isCampaign;

_mission 	= [_this, 0, missionName, [""]] call bis_fnc_param;
_units 		= [_this, 1, [_mission] call BIS_fnc_camp_getCharacters, [[]]] call bis_fnc_param;
_addSurvivors	= [_this, 2, false, [true]] call bis_fnc_param;

_cfgCharacters  = ([_mission] call BIS_fnc_camp_getMissionDesc) >> "Characters";
_identities	= [];		//all identities used

//does the mission have briefing?
_hasBriefing 	= ["briefing"] call BIS_fnc_getCfgData;

if (isNil "_hasBriefing") then
{
	_hasBriefing = 1;
};

_hasBriefing = _hasBriefing > 0;

//check if game is going to open the briefing (not opening briefing on restart)
if isNull(findDisplay 46) then
{
	_loadingBriefing = true;
}
else
{
	_loadingBriefing = false;
};

if (!_loadingBriefing && _hasBriefing) then
{
	["[i] Mission RESTART detected! Only identities will be loaded."] call BIS_fnc_logFormat;
};

{
	if (true) then
	{
		_unitVar 	 = _x;
		_unit 		 = missionNamespace getVariable [_unitVar, objNull];
		_refreshIdentity = [_cfgCharacters,_unitVar,"refreshIdentity"] call BIS_fnc_getCfgDataBool;

		if (isNull _unit) exitWith
		{
			["[x][%1] Unit is NULL!",_unitVar] call BIS_fnc_logFormat;
		};

		//check if unit has identity ready to load-up --------------------------------------
		_identity = [_cfgCharacters,_unitVar,"identity"] call BIS_fnc_getCfgData;

		if (isNil "_identity") then
		{
			_identity = "";
		};

		//make sure identity is unique
		if (_identity in _identities) exitWith
		{
			["[x][%1] Identity '%2' is already used!",_unit,_identity] call BIS_fnc_logFormat;
		};

		//store loaded identitites to make them unique
		if (_identity != "") then
		{
			_identities = _identities + [_identity];
		};

		if ((_identity in BIS_PER_IDENT_killed) && !(_refreshIdentity)) exitWith
		{
			if (_isHub) then
			{
				[_unit,_identity,true,_mission] call BIS_fnc_camp_setIdentity;
			}
			else
			{
				["[!][%1] Unit was recently killed and is not loaded!",_unit] call BIS_fnc_logFormat;

				//make sure unit is dead
				_unit setPos [30,30,0]; _unit setDamage 1; _unit hideObject true;

				_identity = "";
			};
		};

		if ((_identity in BIS_PER_IDENT_killed) && (_refreshIdentity)) then
		{
			["[!][%1] Unit identity was refreshed!",_unit] call BIS_fnc_logFormat;

			[_unit,_identity,true,_mission] call BIS_fnc_camp_setIdentity;
		};

		//init the loading behaviour -------------------------------------------------------
		if (_isCampaign) then
		{
			if (_isHub) then
			{
				_loadGear = [_cfgCharacters,_unitVar,"GearHub","loadGear"] call BIS_fnc_getCfgData;
			}
			else
			{
				_loadGear = [_cfgCharacters,_unitVar,"GearMission","loadGear"] call BIS_fnc_getCfgData;
			};
		}
		else
		{
			_loadGear = 4;
		};

		if (!_loadingBriefing && _hasBriefing) then
		{
			_loadGear = 0;
		};

		if (_loadGear == 0) exitWith
		{
			["[i][%1] Gear is marked as *don't load & keep current*! Only identity is set.",_unit] call BIS_fnc_logFormat;

			if (_identity != "") then
			{
				[_unit,_identity,true,_mission] call BIS_fnc_camp_setIdentity;
			};
		};

		//if no identity is set, we cannot load the status - use description.ext instead
		if (_loadGear == 1 && _identity == "") then
		{
			_loadGear = 3;

			["[x][%1][identity:%2][loadGear:%3] Identity not defined, loading gear from description.ext.",_unit,_identity,_loadGear] call BIS_fnc_logFormat;
		};
		if (_loadGear == 2 && _identity == "") then
		{
			_loadGear = 4;

			["[x][%1][identity:%2][loadGear:%3] Identity not defined, loading gear from description.ext.",_unit,_identity,_loadGear] call BIS_fnc_logFormat;
		};

		//load gear from the unit's status
		if (_loadGear in [1,2]) then
		{
			["[i][%1] Gear is being loaded...",_unit] call BIS_fnc_logFormat;

			_unit enableSimulation true;
			_unit setDamage 0;

			[_unit,_identity,_mission] call BIS_fnc_camp_loadStatus;
		}
		//set character loadout and identity
		else
		{
			["[i][%1] Set according to description.ext.",_unit] call BIS_fnc_logFormat;

			[_mission,_unitVar] call BIS_fnc_camp_setupCharacter;
		};

		//remove the unit's equipment from the pool
		if (_loadGear in [1,3]) then
		{
			["[i][%1] Gear is subtracted from the pool.",_unit] call BIS_fnc_logFormat;

			[_unitVar] call BIS_fnc_camp_poolRemoveCharacter;
		};
	};
}
forEach _units;

//add survivors for hub missions -------------------------------------------------------------------
if (_isHub && _addSurvivors) then
{
	private["_returningIds","_group","_spawnpoints","_point","_unit","_unitVar","_identity","_prevMission","_prevMissionCfg","_unitClass","_characterClass"];

	if (["BIS_PER_prevMission"] call BIS_fnc_camp_hasImplicitValue) exitWith {BIS_PER_IDENT_return = [];};

	_prevMission 	= BIS_PER_prevMission;
	_prevMissionCfg = [_prevMission] call BIS_fnc_camp_getMissionDesc;
	_returningIds   = BIS_PER_IDENT_return - _identities;

	if (count _returningIds == 0) exitWith
	{
		["[i] No xtra survivor detected!"] call BIS_fnc_logFormat;
	};

	["[i] Xtra survivors detected: %1", _returningIds] call BIS_fnc_logFormat;

	_spawnpoints =
	[
		"BIS_point_introSquad1",
		"BIS_point_introSquad2",
		"BIS_point_introSquad3",
		"BIS_point_introSquad4",
		"BIS_point_introSquad5",
		"BIS_point_introSquad6",
		"BIS_point_introSquad7",
		"BIS_point_introSquad8",
		"BIS_point_introSquad9",
		"BIS_point_introSquad10"
	];

	_spawnpoints = _spawnpoints call BIS_fnc_arrayShuffle;

	{
		_point = missionNamespace getVariable [_x, objNull];

		_spawnpoints set [_forEachIndex, _point];
	}
	forEach _spawnpoints;

	_spawnpoints = _spawnpoints - [objNull];

	{
		if (_forEachIndex >= count _spawnpoints) exitWith {};

		_identity  	= _x;
		_characterClass = [_identity,_prevMission] call BIS_fnc_camp_getCharacterByIdentity;
		_unitClass	= [_prevMissionCfg,"Characters",_characterClass,"appearance"] call BIS_fnc_getCfgData;

		_point     	= _spawnpoints select _forEachIndex;
		_group 	   	= createGroup west;
		_unit 	   	= _group createUnit [_unitClass,getPos _point,[],0,"NONE"];

		//create unit's gvar
		_unitVar  = format["BIS_squadMember%1",_forEachIndex + 1];
		missionnamespace setVariable [_unitVar,_unit];
		_unit setVehicleVarName _unitVar;

		//reposition the unit & set direction
		_unit setPos getPos _point;
		_unit setDir getDir _point;

		//["[i][%1][identity:%2] Adding an xtra survivor for hub intro.",_unitVar,_identity] call BIS_fnc_logFormat;

		_unit setDamage 0;
		_unit enableSimulation false;
		_unit hideObject true;

		_unit setVariable ["BIS_identity",_identity];

		//set the unit's status
		[_unit,_identity,_mission] spawn
		{
			waitUntil{time > 0};

			_this call BIS_fnc_camp_loadStatus;
		};
	}
	forEach _returningIds;
};