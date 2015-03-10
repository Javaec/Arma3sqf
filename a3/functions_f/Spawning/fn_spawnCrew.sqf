
/*
	File: spawnCrew.sqf
	Author: Joris-Jan van 't Land

	Description:
	Function to fill all crew positions in a vehicle, including turrets.
	In dummy mode no objects are created and the returned array contains only ones.
	In this mode the function can be used to count the actual crew of an existing vehicle or vehicle type.

	Parameter(s):
	_this select 0: the vehicle (Object)
	_this select 1: the crew's group (Group)
	_this select 2: (optional) dummy mode toggle (Boolean)
	_this select 3: (optional) dummy mode type (String)
	_this select 4: (optional) crew type (String)

	Returns:
	Array of Objects or Scalars - newly created crew or crew count
*/

//Validate parameter count
if ((count _this) < 2) exitWith {debugLog "Log: [spawnCrew] Function requires at least 2 parameters!"; []};

private ["_vehicle", "_grp"];
_vehicle = _this select 0;
_grp = _this select 1;

private ["_dummy"];
_dummy = false;
if ((count _this) > 2) then
{
	_dummy = _this select 2;
};

private ["_dummyType"];
_dummyType = "";
if ((count _this) > 3) then 
{
	_dummyType = _this select 3;
};

private ["_crewType"];
_crewType = "";
if ((count _this) > 4) then 
{
	_crewType = _this select 4;
};

//Validate parameters
if ((typeName _vehicle) != (typeName objNull)) exitWith {debugLog "Log: [spawnCrew] Vehicle (0) must be an Object!"; []};
if ((typeName _grp) != (typeName grpNull)) exitWith {debugLog "Log: [spawnCrew] Crew group (1) must be a Group!"; []};
if ((typeName _dummy) != (typeName false)) exitWith {debugLog "Log: [spawnCrew] Dummy mode toggle (2) must be a Boolean!"; []};
if ((typeName _dummyType) != (typeName "")) exitWith {debugLog "Log: [spawnCrew] Dummy mode type (3) must be a String!"; []};
if ((typeName _crewType) != (typeName "")) exitWith {debugLog "Log: [spawnCrew] Crew type (4) must be a String!"; []};

private ["_type", "_entry", "_crew"];
if (!_dummy) then 
{
	_type = typeOf _vehicle;
} 
else 
{
	if (_dummyType != "") then 
	{
		_type = _dummyType;
	};
};
_entry = configFile >> "CfgVehicles" >> _type;
_crew = [];

private ["_hasDriver"];
_hasDriver = getNumber (_entry >> "hasDriver");

//Select the appropriate crew type
private ["_crewType", "_unit"];
if (!_dummy && (_crewType == "")) then
{
	_crewType = [side _grp, _entry] call BIS_fnc_selectCrew;
};

//Spawn a driver if needed
if ((_hasDriver == 1) && (isNull (driver _vehicle))) then
{
	if (!_dummy) then
	{
		_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "NONE"];
		_crew = _crew + [_unit];

		_unit moveInDriver _vehicle;
	}
	else
	{
		_crew = _crew + [1];
	};
};

//Search through all turrets and spawn crew for these as well.
_turrets = [_entry >> "turrets"] call BIS_fnc_returnVehicleTurrets;

//All turrets were found, now spawn crew for them
_funcSpawnTurrets =
{
	private ["_turrets", "_path"];
	_turrets = _this select 0;
	_path = _this select 1;

	private ["_i"];
	_i = 0;
	while {_i < (count _turrets)} do
	{
		private ["_turretIndex", "_thisTurret"];
		_turretIndex = _turrets select _i;
		_thisTurret = _path + [_turretIndex];
		
		if (!_dummy) then
		{
			if (isNull (_vehicle turretUnit _thisTurret)) then 
			{
				//Spawn unit into this turret, if empty.
				_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "NONE"];
				_crew = _crew + [_unit];
				
				_unit moveInTurret [_vehicle, _thisTurret];
			};
		}
		else
		{
			_crew = _crew + [1];
		};
		
		//Spawn units into subturrets.
		[_turrets select (_i + 1), _thisTurret] call _funcSpawnTurrets;

		_i = _i + 2;
	};
};

[_turrets, []] call _funcSpawnTurrets;

if (!_dummy) then 
{
	[_vehicle,"LIEUTENANT"] call bis_fnc_setRank;
};

_crew