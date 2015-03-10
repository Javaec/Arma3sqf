/*
	Author: Jiri Wainar

	Description:
	Create a squad unit in given vehicle.

	Example:
	[_unitVar:string(,_mission:string,_vehicle:object)] call BIS_fnc_camp_createSkirmishSquadUnit;
*/

private["_unitVar","_mission","_vehicle","_unit"];

_unitVar = [_this, 0, "", [""]] call bis_fnc_param;
_mission = [_this, 1, missionName, [""]] call bis_fnc_param;
_vehicle = [_this, 2, objNull, [objNull]] call bis_fnc_param;
_unit	 = missionNamespace getVariable [_unitVar,objNull];

if (isNull _vehicle) exitWith {objNull};
if (_unitVar == "") exitWith {objNull};

_cfg = ([_mission] call BIS_fnc_camp_getMissionDesc) >> "Characters" >> _unitVar;

//if unit doesn't exist create it
if (isNull _unit) then
{
	private["_class","_side","_group"];

	_class  = [_cfg,"appearance"] call BIS_fnc_getCfgData;
	_side = getNumber(configfile >> "cfgVehicles" >> _class >> "side");
	_side = [east,west,resistance,civilian] select _side;

	_group 	= createGroup _side;
	_unit 	= _group createUnit [_class,[120,120,0],[],0,"NONE"];

	missionNamespace setVariable [_unitVar,_unit];
};

_unit setVehicleVarName _unitVar;

_unit moveInCargo _vehicle;

if !(_unit in _vehicle) exitWith
{
	deleteVehicle _unit;

	objNull
};

if (time == 0) then
{
	[_mission,[_unitVar]] spawn
	{
		waitUntil{time > 0};

		_this call BIS_fnc_camp_loadCharacters;
	};
}
else
{
	[_mission,[_unitVar]] call BIS_fnc_camp_loadCharacters;
};

_unit