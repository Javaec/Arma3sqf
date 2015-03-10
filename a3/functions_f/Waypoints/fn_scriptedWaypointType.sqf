/*
	Author: Karel Moricky

	Description:
	Return CfgWaypoints type of scripted waypoint.
	Returns empty string/config when waypoint is not scripted
	Returns "Custom"/CfgWaypoints root when waypoint is using custom script

	Parameters:
		0: ARRAY - waypoint
		2: (Optional) STRING or CONFIG - type of returned value

	Returns:
	STRING (in format "category/class") or CONFIG (CfgWaypoints path)
*/


private ["_wp","_returnType","_returnString"];
_wp = [[_this],0,[],[[]],2] call bis_fnc_param;
_returnType = [[_this],1,"",["",configfile]] call bis_fnc_param;
_returnString = typename _returnType == typename "";

if (waypointtype _wp == "SCRIPTED") then {
	private ["_scriptArray"];
	_scriptArray = [waypointscript _wp," "] call bis_fnc_splitstring;
	if (count _scriptArray > 0) then {
		private ["_script","_type"];
		_script = _scriptArray select 0;

		//--- Preload waypoint list to avoid constant config search
		if (isnil {uinamespace getvariable "BIS_fnc_scriptedWaypointType_list"}) then {
			private ["_list"];
			_list = [];
			{
				{
					_list set [count _list,[gettext (_x >> "file"),str _x,_x]];
				} foreach (_x call bis_fnc_returnchildren);
			} foreach ((configfile >> "cfgwaypoints") call bis_fnc_returnchildren);
			uinamespace setvariable ["BIS_fnc_scriptedWaypointType_list",_list];
		};

		//--- Compare waypoint script with existing ones
		_list = uinamespace getvariable ["BIS_fnc_scriptedWaypointType_list",[]];
		_type = if (_returnString) then {"Custom"} else {configfile >> "CfgWaypoints"};
		{
			if (_script == _x select 0) exitwith {
				_type = if (_returnString) then {_x select 1} else {_x select 2}
			};
		} foreach _list;
		_type
	} else {
		if (_returnString) then {""} else {configfile >> ""}
	};
} else {
	if (_returnString) then {""} else {configfile >> ""}
};