scriptName "Marta\data\scripts\fnc_zone.sqf";
/*
	File: fnc_setZone.sqf
	Author: Karel Moricky

	Description:
	Set reveal zones for MARTA

	Parameter(s):
	_this select 0: String - Mode

		* ADD - add zone to list
			o _this select 1: Array or Object - [center,radius] or trigger which will define the zone
			o _this select 2: Array - Optional param - array with vehicle classes which will be displayed (and all subclasses)
			o Returned value: Number - ID of zone

		* REMOVE - remove zone with given ID from list
			o _this select 1: Number - ID of zone
			o Returned value: true
*/
private ["_logic","_zones","_result","_zone","_types","_id","_marker","_center","_radius","_grp"];

_logic = BIS_marta_mainscope;
_zones = _logic getvariable "zones";
_result = false;

switch (_this select 0) do {

	//-----------------------------------------------------------------------------------------------	
	//--- ADD ---------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "ADD": {
		_zone = _this select 1;
		_factions = _this select 2;
		_types = if (count _this > 3) then {_this select 3} else {["All"]};
		_id = count _zones;
		_zones = _zones + [[_zone,_factions,_types]];
		_logic setvariable ["zones",_zones];
		_result = _id;

		if (_logic getvariable "debug") then {
			_marker = createmarkerlocal [format ["BIS_marta_zone_%1",_id],[1,1,1]];
			_marker setmarkershapelocal "ellipse";
			_marker setmarkerbrushlocal "border";
			_marker setmarkercolorlocal "colorblack";
			if (typename _zone == "ARRAY") then {
				_center = _zone select 0;
				_radius = _zone select 1;
				_marker setmarkerposlocal _center;
				_marker setmarkersizelocal [_radius,_radius];

			} else {
				_marker setmarkerpos position _zone;
				_marker setmarkersizelocal [triggerarea _zone select 0,triggerarea _zone select 1];
				_marker setmarkerdirlocal (triggerarea _zone select 2);
			};
		};
	};


	//-----------------------------------------------------------------------------------------------	
	//--- REMOVE ------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "REMOVE": {
		_id = _this select 1;
		_zones set [_id,-1];
		//_zones = _zones - ["X"];
		_logic setvariable ["zones",_zones];
		_result = true;

		if (_logic getvariable "debug") then {
			_marker = format ["BIS_marta_zone_%1",_id];
			deletemarker _marker;
		};
	};


	//-----------------------------------------------------------------------------------------------	
	//--- CHECK -------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	case "CHECK": {
		scopename "start";
		_grp = _this select 1;
		{
			if (typename _x == "ARRAY") then {
				_zone = _x select 0;
				_factions = _x select 1;
				_types = _x select 2;

				//--- Check if zone is on player's side
				if (
					{
						if (typename _x == "SIDE") then {
							if (_x == side player) then {true} else {false};
						} else {
							if (_x == faction player) then {true} else {false};
						};
					} count _factions > 0
				) then {

					//--- Check if group is in zone
					switch (typename _zone) do {
						case "ARRAY": {
							_center = _zone select 0;
							_radius = _zone select 1;
							if (
								{
									_unit = _x;
									_x distance _center < _radius && {vehicle _unit iskindof _x} count _types > 0
								} count units _grp > 0
							) then {_result = true; breakto "start"};
						};
						case "OBJECT": {
							if (
								{
									_unit = _x;
									([_zone,position _unit] call BIS_fnc_inTrigger) && {_unit iskindof _x} count _types > 0
								} count units _grp > 0
							) then {_result = true; breakto "start"};
						};
						default {};
					};
				};
			};
		} foreach _zones;
	};


	//-----------------------------------------------------------------------------------------------	
	//--- DEFAULT -----------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------
	default {debuglog "Log: MARTA: Error in fnc_setZone.sqf"};
};

//--- Result
_result;




