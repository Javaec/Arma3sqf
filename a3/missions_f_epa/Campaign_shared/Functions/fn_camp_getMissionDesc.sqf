/*
	Author: Jiri Wainar (Warka)

	Description:
	Return config path to description.ext of any campaign mission.

	Parameter(s):
	_this select 0 (Optional): Mission class (default: current mission class)

	Returns:
	config path

	Example:
	_cfg = ["A_hub01"] call BIS_fnc_camp_getMissionDesc;
*/
private ["_mission","_missionDescConfig"];

_mission = [_this,0,missionname,[""]] call bis_fnc_param;

if (_mission == missionName) then
{
	_missionDescConfig = missionConfigFile;
}
else
{
	_missionDescConfig  = ([] call BIS_fnc_camp_campaignConfig) >> "campaign" >> "missions" >> _mission >> "Description";
};

_missionDescConfig