/*
	Author: Karel Moricky, modified by Thomas Ryan

	Description:
	Return meta data about the campaign mission

	Parameter(s):
	_this select 0 (Optional): Mission class (default: current mission class)

	Returns:
	Array in format [config path, hub, skirmish, repeat, weapon pool disabled]
*/
private ["_mission","_missionConfig"];

_mission 	= [_this,0,missionname,[""]] call bis_fnc_param;
_missionConfig 	= ([] call BIS_fnc_camp_campaignConfig) >> "campaign" >> "missions" >> _mission;

[
	_missionConfig,
	getnumber(_missionConfig >> "isHub") > 0,
	getnumber(_missionConfig >> "isSkirmish") > 0,
	getnumber(_missionConfig >> "repeat") > 0,
	getNumber(_missionConfig >> "noWeaponPool") > 0
];