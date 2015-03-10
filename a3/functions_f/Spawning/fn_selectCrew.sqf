
/*
	File: selectCrew.sqf
	Author: Joris-Jan van 't Land

	Description:
	Return an appropriate crew type for a certain vehicle.
	
	Parameter(s):
	_this select 0: side (Side)
	_this select 1: vehicle config entry (Config)
	
	Returns:
	String - crew type
*/

//Validate parameter count
if ((count _this) < 2) exitWith {debugLog "Log: [selectCrew] Function requires at least 2 parameters!"; ""};

private ["_side", "_entry"];
_side = _this select 0;
_entry = _this select 1;

//Validate parameters
if ((typeName _side) != (typeName sideEnemy)) exitWith {debugLog "Log: [selectCrew] Side (0) must be a Side!"; ""};
if ((typeName _entry) != (typeName configFile)) exitWith {debugLog "Log: [selectCrew] Vehicle config entry (1) must be a Config!"; ""};

//Try to find the crew type in the config
private ["_crew"];
_crew = "";
_crew = getText (_entry >> "crew");

//If not found, use defaults
if (_crew == "") then
{
	switch (_side) do
	{
		case west:
		{
			//TODO: should be randomized instead of overriding?
			if (configName(configFile >> "CfgVehicles" >> "USMC_Soldier_Crew") != "") then 
			{
				_crew = "USMC_Soldier_Crew";
			};
			
			if (configName(configFile >> "CfgVehicles" >> "US_Soldier_Crew_EP1") != "") then 
			{
				_crew = "US_Soldier_Crew_EP1";
			};
		};

		case east:
		{
			if (configName(configFile >> "CfgVehicles" >> "RU_Soldier_Crew") != "") then 
			{
				_crew = "RU_Soldier_Crew";
			};
			
			if (configName(configFile >> "CfgVehicles" >> "TK_Soldier_Crew_EP1") != "") then 
			{
				_crew = "TK_Soldier_Crew_EP1";
			};
		};

		default {};
	};
};

_crew