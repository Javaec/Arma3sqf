/*
	Author: Jiøí Wainar

	Description:
	--------------------------------------------------------------------------------------------
	Persistant equipment front-end "save" function.

	Function:
	--------------------------------------------------------------------------------------------
	1. gathers info about mission chracters
	2. scans their equipment, gather the info
	3. stores the info into the equipment pool

	Example:
	--------------------------------------------------------------------------------------------
	[missionName] call BIS_fnc_camp_saveCharacters;
*/

private["_fnc_log_disable"]; _fnc_log_disable = true;

//reset the mission result arrays
BIS_PER_IDENT_survived 	= [];
BIS_PER_IDENT_return 	= [];

private["_mission","_units","_equipAdd","_saveGear","_identity","_cfgCharacters","_identityIndex"];
private["_missionMeta","_isHub","_isSkirmish","_isCampaign","_returning","_nextMission"];

_missionMeta	= [] call BIS_fnc_camp_getMissionMeta;
_isHub		= _missionMeta select 1;
_isSkirmish	= _missionMeta select 2;
_isCampaign	= [] call BIS_fnc_isCampaign;
_nextMission	= [] call BIS_fnc_camp_nextMission;

_mission 	= [_this, 0, missionName, [""]] call bis_fnc_param;
_units 	 	= [_mission] call BIS_fnc_camp_getCharacters;

_cfgCharacters  = ([_mission] call BIS_fnc_camp_getMissionDesc) >> "Characters";

["[!] Saving characters according to mission: %1",_mission] call BIS_fnc_logFormat;
["[!] Characters processed: %1",_units] call BIS_fnc_logFormat;

{
	if (true) then
	{
		_unitVar = _x;
		_unit = missionNamespace getVariable [_unitVar, objNull];

		if (isNull _unit) exitWith
		{
			["[x][%1] Unit is null!",_unitVar] call BIS_fnc_logFormat;
		};

		//check if unit has a valid identity assigned ----------------------------------------------
		_identity = [_cfgCharacters,_unitVar,"identity"] call BIS_fnc_getCfgData;

		if (isNil "_identity") then
		{
			["[x][%1] Unit doesn't have an identity assigned!",_unit] call BIS_fnc_logFormat;

			_identity = "";
		}
		else
		{
			//["[ ][%1][identity:%2]",_unit,_identity] call BIS_fnc_logFormat;
		};

		_identityIndex = [BIS_PER_IDENT_Main,_identity] call BIS_fnc_findInPairs;

		if (_identityIndex == -1) then
		{
			_identity = "";
		};

		//init the saving behaviour ----------------------------------------------------------------
		if (_isCampaign) then
		{
			if (_isHub) then
			{
				_saveGear = [_cfgCharacters,_unitVar,"GearHub","saveGear"] call BIS_fnc_getCfgData;
			}
			else
			{
				_saveGear = [_cfgCharacters,_unitVar,"GearMission","saveGear"] call BIS_fnc_getCfgData;
			};
		}
		else
		{
			_saveGear = 0;
		};

		//if no identity is set, we cannot save the status
		if (_saveGear == 1 && _identity == "") then
		{
			_saveGear = 3;

			["[x][%1][identity:%2][saveGear:%3] Identity not defined, save status cannot be done.",_unit,_identity,_saveGear] call BIS_fnc_logFormat;
		};
		if (_saveGear == 2 && _identity == "") then
		{
			_saveGear = 4;

			["[x][%1][identity:%2][saveGear:%3] Identity not defined, save status cannot be done.",_unit,_identity,_saveGear] call BIS_fnc_logFormat;
		};

		["[i][%1][identity:%2][saveGear:%3]",_unit,_identity,_saveGear] call BIS_fnc_logFormat;

		//unit killed, gear is lost
		if !(canMove _unit) exitWith
		{
			//mark the identity as *disabled*/*killed*
			if (_identity != "") then
			{
				["[!][%1] Unit was killed, the gear is lost.",_unit] call BIS_fnc_logFormat;

				BIS_PER_IDENT_killed = BIS_PER_IDENT_killed + [_identity];

				private["_data"];

				_data = [BIS_PER_IDENT_Main,_identity,[]] call BIS_fnc_getFromPairs;

				//mark identity as dead
				[_data,"status","DEAD"] call BIS_fnc_setToPairs;
			};
		};

		//mark unit as survivor
		BIS_PER_IDENT_survived = BIS_PER_IDENT_survived + [_identity];

		//store the player's squad
		_returning = [_cfgCharacters,_unitVar,"HubPresence","return"] call BIS_fnc_getCfgDataBool;

		if (_returning && _unit != player) then
		{
			BIS_PER_IDENT_return = BIS_PER_IDENT_return + [_identity];
		};

		//replace the special backpack with backpack without the baked-in cargo
		private["_backpackFixed","_backpackOld"];

		_backpackOld   = backpack _unit;
		_backpackFixed = [_unit] call BIS_fnc_camp_fixUnitBackpack;

		if (_backpackFixed != "") then
		{
			private["_fnc_log_disable"]; _fnc_log_disable = false;

			["[!][%1] Backpack [%2] replaced for [%3]!",_unit,_backpackOld,_backpackFixed] call BIS_fnc_logFormat;
		};

		//save gear to character's identity
		if (_saveGear in [1,2,5]) then
		{
			["[!][%1] Gear is being saved...",_unit] call BIS_fnc_logFormat;

			_unit enableSimulation true;
			_unit setDamage 0;

			[_unit,_identity] call BIS_fnc_camp_saveStatus;
		};

		//add gear to pool
		if (_saveGear in [1,3]) then
		{
			["[!][%1] Gear stored into the pool.",_unit] call BIS_fnc_logFormat;

			[_unit] call BIS_fnc_camp_poolAddCharacter;
		};

		if (_saveGear in [2,4]) then
		{
			["[!][%1] Gear removed from the pool.",_unit] call BIS_fnc_logFormat;

			[_unit] call BIS_fnc_camp_poolRemoveCharacter;
		};
	};
}
forEach _units;