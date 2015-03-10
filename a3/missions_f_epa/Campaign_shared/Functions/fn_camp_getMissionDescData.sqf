/*
	Author: Jiri Wainar (Warka)

	Description:
	Return meta data from mission's description.ext included in campaign config.

	Parameter(s):
	_this select 0 (Optional): mission class (default: current mission class)
	_this select 1 (Optional): attribute from the mission's description.ext

	Example:
	_metadata:array = ["A_hub01"] call BIS_fnc_camp_getMissionDescData;

	Returns:
	Array in format [config path, full name (e.g. "Stage A: Rescue"), description, overview picture, short name (e.g. "Rescue"), stage id (a letter, e.g. "A")]
*/
private ["_attribute","_cfg","_r"];

_cfg = _this call BIS_fnc_camp_getMissionDesc;


_attribute = [_this,1,"",[""]] call BIS_fnc_param;
_attribute = toLower _attribute;

if !(_attribute in ["","onloadname","onloadmission","loadscreen","name","stage"]) then
{
	["Misssion's description.ext attribute not found!"] call BIS_fnc_error;

	_attribute = "";
};

if (_attribute == "") then
{
	_r = [
		_cfg,
		getText (_cfg >> "onLoadName"),
		getText (_cfg >> "onLoadMission"),
		getText (_cfg >> "loadScreen"),
		getText (_cfg >> "name"),
		getText (_cfg >> "stage")
	];
}
else
{
	_r = getText (_cfg >> _attribute);
};

_r