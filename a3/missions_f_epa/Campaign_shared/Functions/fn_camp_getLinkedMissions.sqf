/*
	Author: Warka

	Description:
	Returns list of all missions linked to a given mission.

	Remarks:
	* Links and link conditions are defined in campaign description.fsm.
	* By default all linked missions that meet their conditions are returned.
	* User can define attributes to further filter the linked missions.

	Parameter(s):
	0: ARRAY  - to be included tags. All missions with the following tags will be included. By default all are included.
	1: ARRAY  - to be excluded tags. All missions with the following tags will be excluded. Subtracted from list defined by 0 (previous) param.
	2: STRING - mission name from that the links are evaluated (default: current mission => missionName)
	3: BOOL   - use link conditions (default: true)?

	Returns:
	Filtered list of the missions in an array.

	Example:
	_missions = [_toInclude:array,_toExclude:array,_missionName:string,_useConditions:bool] call BIS_fnc_camp_getLinkedMissions;
*/

private ["_toInclude","_toExclude","_missionName","_useConditions","_isCampaign"];

_toInclude	= [_this, 0, [], [[]]] call BIS_fnc_param;
_toExclude	= [_this, 1, [], [[]]] call BIS_fnc_param;
_missionName	= [_this, 2, missionName, [""]] call BIS_fnc_param;
_useConditions	= [_this, 3, true, [true]] call BIS_fnc_param;

_isCampaign	= [] call BIS_fnc_isCampaign;

//overrride the condition filter if outside campaign / testing from editor
/*
if !(_isCampaign) then
{
	_useConditions = false;
};
*/

private ["_cfg","_links","_linkConditions"];

_cfg = ([] call BIS_fnc_camp_campaignConfig) >> "campaign" >> "missions";

//get next missions
_links = getArray (_cfg >> _missionName >> "links");
_links set [0, -1];
_links = _links - [-1];

//get mission conditions
_linkConditions = getArray (_cfg >> _missionName >> "linkConditions");
_linkConditions set [0, -1];
_linkConditions = _linkConditions - [-1];

private["_condition","_mission","_index","_include"];

{
	_mission = _x;
	_index = _forEachIndex;

	if (_useConditions) then
	{
		_condition = _linkConditions select _index;
	}
	else
	{
		_condition = "true";
	};

	//remove mission whose condition has not been met
	if (_condition != "") then
	{
		if (!(call compile _condition)) then
		{
			_links set [_index, -1];
		};
	};

	//remove finished mission that cannot be repeated
	if (missionNamespace getVariable [format["BIS_%1",_mission], false]) then
	{
		if (getNumber (_cfg >> _mission >> "repeat") == 0) then
		{
			_links set [_index, -1];
		};
	};

	//remove mission if it does NOT have AT LEAST ONE of the -to be included- parameter
	if (count _toInclude > 0) then
	{
		_include = false;
	}
	else
	{
		_include = true;		//if no -to be included- parameter is defined we assume, all should be included
	};

	{
		if (getNumber (_cfg >> _mission >> _x) == 1) exitWith
		{
			_include = true;
		};
	}
	forEach _toInclude;

	if !(_include) then
	{
		_links set [_index, -1];
	};

	//remove mission if it includes ANY of the -to be omitted- parameter
	{
		if (getNumber (_cfg >> _mission >> _x) == 1) exitWith
		{
			_links set [_index, -1];
		};
	}
	forEach _toExclude;
}
forEach _links;


//remove disabled missions
_links = _links - [-1];

//["Mission '%1' has following linked missions: %2",_missionName,_links] call BIS_fnc_logFormat;

_links