/*
	Author: Jiøí Wainar

	Description:
	--------------------------------------------------------------------------------------------
	Creates key string according to the unit identity and campaign progression and loads unit status from it.

	Example:
	--------------------------------------------------------------------------------------------
	_result:bool = [_unit:object(,_identity:string,_mission:string,_counter:number)] call BIS_fnc_camp_loadStatus;
*/

private["_fnc_log_disable"]; _fnc_log_disable = true;

private["_unit","_identity","_mission","_counter","_id","_result","_unitVar"];

_unit 	  = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_identity = [_this, 1, "MISSING_IDENTITY", [""]] call bis_fnc_param;
_mission  = [_this, 2, missionName, [""]] call bis_fnc_param;
_counter  = [_this, 3, BIS_PER_step, [123]] call bis_fnc_param;

if (isNull _unit) exitWith {false};

_id 	  = format["%1_%2_%3",_identity,_mission,_counter];
_unitVar  = vehicleVarName _unit;

_result	 = _unit loadStatus _id;

if (_result) then
{
	["[i][%1] Loading gear [key:%2] succeeded!",_unit,_id] call BIS_fnc_logFormat;

	[_unit,_identity,false,_mission] call BIS_fnc_camp_setIdentity;	//_processGoggles = false; goggles are loaded by loadStatus

	//replace the special backpack with backpack without the baked-in cargo
	private["_backpackFixed","_backpackOld"];

	_backpackOld   = backpack _unit;
	_backpackFixed = [_unit] call BIS_fnc_camp_fixUnitBackpack;

	if (_backpackFixed != "") then
	{
		private["_fnc_log_disable"]; _fnc_log_disable = false;

		["[!][%1] Backpack [%2] replaced for [%3]!",_unit,_backpackOld,_backpackFixed] call BIS_fnc_logFormat;
	};
}
else
{
	["[x][%1] Loading gear [key:%2] failed! > Gear will be loaded from 'cfgCharacters'.",_unit,_id] call BIS_fnc_logFormat;

	[_mission,_unitVar] call BIS_fnc_camp_setupCharacter;
};

//safecheck to prevent the headgear and goggle randomization
[_unit,goggles _unit,diag_tickTime] spawn
{
	private["_unit","_goggles","_time"];

	_unit	 = _this select 0;
	_goggles = _this select 1;
	_time	 = _this select 2;

	_time	  = _time + 10;

	waitUntil
	{
		diag_tickTime > _time || {goggles _unit != _goggles}
	};

	if (diag_tickTime < _time) then
	{
		["[x][%1] Goggles forced from '%2' back to '%3'.",_unit,goggles _unit,_goggles] call bis_fnc_logFormat;

		_unit addGoggles _goggles;
	};
};
[_unit,headgear _unit,diag_tickTime] spawn
{
	private["_unit","_headgear","_time"];

	_unit	  = _this select 0;
	_headgear = _this select 1;
	_time	  = _this select 2;

	_time	  = _time + 10;

	waitUntil
	{
		diag_tickTime > _time || {headgear _unit != _headgear}
	};

	if (diag_tickTime < _time) then
	{
		["[x][%1] Headgear forced from '%2' back to '%3'.",_unit,headgear _unit,_headgear] call bis_fnc_logFormat;

		_unit addHeadgear _headgear;
	};
};

_result