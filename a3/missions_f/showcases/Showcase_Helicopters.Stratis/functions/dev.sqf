//print 2-part debuglog
BIS_debugLog =
{
	private ["_id", "_message"];

	if isNil{BIS_DebugMode} then {
		BIS_DebugMode = false;
	};

	if (BIS_DebugMode) then {
		if (count _this == 1) then {
			_message = _this select 0;

			DEBUGLOG format [">> %1", _message];
		} else {
			_message = _this select 0;
			_id = _this select 1;

			DEBUGLOG format [">> %2: %1", _id, _message];
		};
	};
};

//print formated debuglog
BIS_debugLogF =
{
	private ["_str", "_array", "_i"];

	if isNil{BIS_DebugMode} then {
		BIS_DebugMode = false;
	};

	if !(BIS_DebugMode) exitWith {};

	_str = ">> ";
	_array = [];
	_i = 0;

	{
		if (_i == 0) then {
			_str = _str + _x;
			_array = [_str];
		} else {
			_array = _array + [_x];
		};

		_i = _i + 1;

	} forEach _this;

	DEBUGLOG format _array;
};

//------------------------------------------------------------------------------
// DEVELOPER INFO
//------------------------------------------------------------------------------
#define COLOR_NORMAL			"#ffffff"
#define COLOR_HIGHLIGHT			"#55cbe9"		//[0.59,0.94,1]
#define COLOR_DISABLED			"#80ffffff"
#define COLOR_GHOST				"#00ffffff"

#define STYLE_H1(text)			format["<t color='%2' size='1.2' align='center'>%1</t>",##text##,COLOR_HIGHLIGHT]
#define STYLE_NORMAL(text)		format["<t color='%2' align='left'>%1</t>",##text##,COLOR_NORMAL]

//shows hint about developer intentions
//["...","...","...","...","...","..."] call BIS_showDevHint;
BIS_showDevHint = {
	private["_text"];

	_text = STYLE_H1("Developer Notes");

	{
		_text = _text + format["<br/><br/>(%1) ",_forEachIndex+1] + _x;

	} forEach _this;

	_text = STYLE_NORMAL(_text);

	hint parseText(_text);

	sleep (5 * (count _this));

	hintSilent "";
};

//shows hint describing conversation
//["...","...","...","...","...","..."] call BIS_showConvHint;
BIS_showConvHint = {
	private["_text"];

	_text = STYLE_H1("Conversation Placeholder");

	{
		_text = _text + format["<br/><br/>(%1) ",_forEachIndex+1] + _x;

	} forEach _this;

	_text = STYLE_NORMAL(_text);

	hint parseText(_text);

	sleep (5 * (count _this));

	hintSilent "";
};

//[_filter:string] call BIS_getWeaponParents;
BIS_getWeaponParents = {
	private ["_filter","_cfgWeapons","_cfgWeapon","_parents","_class","_output"];

	_filter = [_this, 0, ""] call BIS_fnc_param;
	_output = [];

	_cfgWeapons = configFile >> "cfgWeapons";

	for "_i" from 0 to ((count _cfgWeapons) - 1) do
	{
		_cfgWeapon = _cfgWeapons select _i;

		_parents = [_cfgWeapon,true] call BIS_fnc_returnParents;

		_class = configName _cfgWeapon;

		if (((_filter != "") && (_filter in _parents)) || (_filter == "")) then
		{
			_output = _output + [_class];
		};
	};

	//copyToClipboard str(_output);

	_output
};

BIS_getIsInArea = {
	private["_corners","_checked","_inArea","_dir","_start","_end"];

	_corners = [_this,0,[]] call BIS_fnc_param;
	_checked = [_this,1,player] call BIS_fnc_param;

	_inArea = true;

	for "_i" from 0 to ((count _corners)-1) do
	{
		_start = _corners select _i;

		if (_i == ((count _corners)-1)) then
		{
			_end = _corners select 0;
		}
		else
		{
			_end = _corners select (_i + 1);
		};

		_dir = [[_start,_end],_checked] call BIS_relativeDirTo;

		if (_dir > 180) exitWith {_inArea = false};
	};

	_inArea
};

//[_group:group,_wpTarget:object,_wpType:string,_wpCond:string,_wpCode:string,_wpBehav:string,_wpCombat:string,_wpDesc:string] call BIS_createWaypoint;
BIS_createWaypoint = {
	private["_group","_wpTarget","_wp","_wpType","_wpCond","_wpBehav","_wpCombat","_wpCode","_wpDesc"];

	_group 		= [_this,0] call BIS_fnc_param;
	_wpTarget 	= [_this,1] call BIS_fnc_param;
	_wpType 	= [_this,2,"HOLD"] call BIS_fnc_param;
	_wpCond 	= [_this,3,"true",[""]] call BIS_fnc_param;
	_wpCode		= [_this,4,"",[""]] call BIS_fnc_param;
	_wpBehav	= [_this,5,"COMBAT"] call BIS_fnc_param;
	_wpCombat	= [_this,6,"NO CHANGE"] call BIS_fnc_param;
	_wpDesc		= [_this,7,""] call BIS_fnc_param;

	_wp = _group addWaypoint [_wpTarget, 0];
	_wp setWaypointType _wpType;
	_wp setWaypointDescription _wpDesc;
	_wp setWaypointBehaviour _wpBeh;
	_wp setWaypointCombatMode _wpCombat;

	_wp setWaypointStatements [_wpCond, _wpCode];
};

//[_unit or _group] call BIS_deleteAllWaypoints;
BIS_deleteAllWaypoints = {
	private["_group"];

	_group = _this;

	if (typeName _group == typeName []) then
	{
		{
			_x call BIS_deleteAllWaypoints;
		}
		forEach _group;
	};

	if (typeName _group == typeName objNull) then
	{
		_group = group _group;
	};

	//delete waypoints
	while {count(waypoints _group) > 0} do
	{
		deleteWaypoint [_group, 0];
	};
};

//retype (unit | array of units | group) to array of units
Bis_getUnits = {

	//retype to array of units
	switch (typeName _this) do
	{
		case "OBJECT":
		{
			_this = [_this];
		};

		case "ARRAY":
		{
		};

		case "GROUP":
		{
			_this = units _this;
		};

		default
		{
			["[Bis_getUnits] Wrong input type!"] call Bis_debugLog;
			_this = [];
		};
	};

	_this
};

//[[4458.61,16448.7,0.00156403],[4451.98,16450.7,0.00177002]] call Bis_convertToSqmPos;
//[4458.61,16448.7,0.00156403] call Bis_convertToSqmPos;
Bis_convertToSqmPos = {
	if (count _this == 0) exitWith {[]};

	private["_pos","_posSqm","_output"];

	if (typeName (_this select 0) == "SCALAR") exitWith
	{
		_posSqm = format(["%1,%3,%2"] + _this);

		(compile _posSqm)
	};

	{
		_posSqm = compile format(["%1,%3,%2"] + _x);

		if (_forEachIndex == 0) then
		{
			_output = format["%1",_posSqm];
		}
		else
		{
			_output = format["%1,%2",_output,_posSqm];
		};
	}
	forEach _this;

	(compile _output)
};

Bis_enableUnit =
{
	//if (true) exitWith {};

	//handle group using recursion calling
	if (typeName _this == typeName grpNull) exitWith
	{
		private["_units","_vehicles"];

		_units = units _this;
		_vehicles = [];

		{
			if (vehicle _x != _x) then
			{
				_vehicles = _vehicles - [vehicle _x];
				_vehicles = _vehicles + [vehicle _x];
			};
		}
		forEach _units;

		//run recursion
		{
			_x call Bis_enableUnit;
		}
		forEach (_units + _vehicles);
	};

	//handle array of units using recursion calling
	if (typeName _this == typeName []) exitWith
	{
		{
			_x call Bis_enableUnit;
		}
		forEach _this;
	};

	//handle vehicle crew of units using recursion calling
	if !(_this isKindOf "man") then
	{
		{
			_x call Bis_enableUnit;
		}
		forEach (crew _this);
	};

	//exit if unit is already enabled
	if !(_this getVariable ["IS_DISABLED",false]) exitWith {};

	//["Enabled Unit: %1 (%2)",_this,typeOf _this] call BIS_debugLogF;

	//flag as enabled
	_this setVariable ["IS_DISABLED",false];

	_this enableSimulation true;
	_this hideObject false;
	_this setCaptive false;

	_this allowDamage true;

	if (_this iskindOf "man") then
	{
		//enable Ai
		{
			_this enableAI _x;
		}
		forEach ["TARGET","AUTOTARGET","ANIM","FSM","MOVE"];
	};
};

Bis_disableUnit =
{
	//if (true) exitWith {};

	//handle group using recursion calling
	if (typeName _this == typeName grpNull) exitWith
	{
		private["_units","_vehicles"];

		_units = units _this;
		_vehicles = [];

		{
			if (vehicle _x != _x) then
			{
				_vehicles = _vehicles - [vehicle _x];
				_vehicles = _vehicles + [vehicle _x];
			};
		}
		forEach _units;

		//run recursion
		{
			_x call Bis_disableUnit;
		}
		forEach (_units + _vehicles);
	};

	//handle array of units using recursion calling
	if (typeName _this == typeName []) exitWith
	{
		{
			_x call Bis_disableUnit;
		}
		forEach _this;
	};

	//handle vehicle crew of units using recursion calling
	if !(_this isKindOf "man") then
	{
		{
			_x call Bis_disableUnit;
		}
		forEach (crew _this);
	};

	//exit if unit is already disabled
	if (_this getVariable ["IS_DISABLED",false]) exitWith {};

	//["Disabled Unit: %1 (%2)",_this,typeOf _this] call BIS_debugLogF;

	//flag as disabled
	_this setVariable ["IS_DISABLED",true];

	_this enableSimulation false;
	_this hideObject true;
	_this setCaptive true;

	_this allowDamage false;

	if (_this iskindOf "man") then
	{
		//disable Ai
		{
			_this disableAI _x;
		}
		forEach ["TARGET","AUTOTARGET","ANIM","FSM","MOVE"];
	};
};

//safely deletes vehicle with its crew
//<_vehicle/crewmember:object> call BIS_deleteVehicleSafe
BIS_deleteVehicleSafe = {
	private["_vehicle","_crew"];

	_vehicle = vehicle _this;
	_crew = crew _vehicle;

	{
		//["Object '%1' deleted!",_x] call BIS_debugLogF;

		deleteVehicle _x;

	} forEach (_crew + [_vehicle]);
};


//returns true if player landed successfully
//[BIS_Heli,BIS_Helipad,20] call BIS_hasLanded;
BIS_hasLanded =
{
	private ["_vehicle", "_landingTarget", "_landingTolerance", "_result", "_cond"];

	_vehicle 			= _this select 0;
	_landingTarget 		= _this select 1;
	_landingTolerance 	= _this select 2;
	_cond				= [_this, 3, {canMove _this}] call BIS_fnc_param;

	_result = false;

	scopename "main";

	if (_vehicle call _cond) then
	{
		//not in correct vehicle
		if (vehicle player != _vehicle) then {
			breakto "main";
		};

		//flying too high
		if (round((getPos _vehicle select 2) * 5) > 0) then {
			breakto "main";
		};

		//too far
		if ((_vehicle distance _landingTarget) > _landingTolerance) then {
			breakto "main";
		};

		//moving
		if (round((velocity _vehicle select 0) * 10) != 0 || round((velocity _vehicle select 1) * 10) != 0 || round((velocity _vehicle select 2) * 10) != 0) then {
			breakto "main";
		};

		//["Height:"+str(getPos _vehicle select 2)+", Distance:"+str(_vehicle distance _landingTarget)] call BIS_debuglog;

		_result = true;
	};

	_result
};
