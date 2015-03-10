/*
	Author: Jiri Wainar

	Description:
	Returns classnames of all linked/valid POI for given HUB or Skirmish mission.

	Example:
	[missionName] call BIS_fnc_camp_poiGetLinked;
*/

private["_mission","_pois"];

_mission = [_this, 0, missionName, [""]] call BIS_fnc_param;

//get all linked pois
private["_linked","_templates"];

_pois = ["POIs"] call Bis_fnc_getCfgSubClasses;
_templates = ["POIs","templates"] call BIS_fnc_getCfgData;
_pois = _pois - _templates;

{
	_linked = ["POIs",_x,"linked"] call BIS_fnc_getCfgData;

	if !(_mission in _linked) then
	{
		_pois set [_forEachIndex, "DELETE_ME"];
	};
}
forEach _pois;

_pois = _pois - ["DELETE_ME"];

_pois