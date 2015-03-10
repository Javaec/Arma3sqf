/*
	Author: Jiøí Wainar

	Description:
	--------------------------------------------------------------------------------------------
	Creates key strings according to the unit identity, next mission(s) and campaign progression and saves unit status into it/them.

	Example:
	--------------------------------------------------------------------------------------------
	_result:bool = [_unit:object(,_identity:string,_missions:string or array of string,_counter:number)] call BIS_fnc_camp_saveStatus;
*/

private["_fnc_log_disable"]; _fnc_log_disable = true;

private["_unit","_identity","_missions","_counter","_next","_id","_result"];

_next	  = [] call BIS_fnc_camp_nextMission;

_unit 	  = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_identity = [_this, 1, _unit getVariable ["BIS_identity","MISSING_IDENTITY"], [""]] call bis_fnc_param;
_missions = [_this, 2, _next, ["",[]]] call bis_fnc_param;
_counter  = [_this, 3, BIS_PER_step + 1, [123]] call bis_fnc_param;

if (typeName _missions != typeName []) then
{
	_missions = [_missions];
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

{
	if (isNull _unit) exitWith {false};

	_id 	  = format["%1_%2_%3",_identity,_x,_counter];
	_result	  = _unit saveStatus _id;

	if (_result) then
	{
		["[i][%1] Saving gear [key:%2] succeeded.",_unit,_id] call BIS_fnc_logFormat;
	}
	else
	{
		["[x][%1] Saving gear [key:%2] failed.",_unit,_id] call BIS_fnc_logFormat;
	};
}
forEach _missions;