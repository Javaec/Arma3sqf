/*
	Author: Thomas Ryan

	Description:
	Creates Alpha Squad's ORBAT marker, setting the squad leader's name correctly in the process.

	Parameters:
		_this (Optional):
			OBJECT: created where this unit is placed.
			STRING: marker position.
			ARRAY: exact [x,y,z] position.

	Returns:
	True if successful, false if not.
*/

_this spawn {
	scriptName "BIS_fnc_camp_createAlphaORBAT";

	private ["_identity"];
	_identity = "EPA_B_Conway";

	// Wait for data to be loaded correctly
	waitUntil {!(["BIS_PER_IDENT_Main"] call BIS_fnc_camp_hasImplicitValue)};
	waitUntil {!(isNil {[BIS_PER_IDENT_Main, _identity] call BIS_fnc_getFromPairs})};

	private ["_pos"];
	_pos = [_this, 0, objNull, [objNull, "", []], 3] call BIS_fnc_param;

	_pos = switch (typeName _pos) do {
		case (typeName objNull): {position _pos};
		case (typeName ""): {markerPos _pos};
		case (typeName []): {_pos};
	};

	// Create logic
	private ["_group", "_logic"];
	_group = createGroup sideLogic;
	_logic = _group createUnit ["Logic", [10,10,10], [], 0, "NONE"];
	_logic setPos _pos;

	// Search for the leader's current name
	private ["_data", "_name"];
	_data = [BIS_PER_IDENT_Main, _identity] call BIS_fnc_getFromPairs;
	_name = [_data, "name"] call BIS_fnc_getFromPairs;

	// Set the leader's name in the ORBAT
	[
		configFile >> "CfgORBAT" >> "BIS" >> "B_Falcon_A",
		nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,
		_name
	] call BIS_fnc_ORBATSetGroupParams;

	// Set the logic's variables
	_logic setVariable ["Path", "configFile >> 'CfgORBAT' >> 'BIS' >> 'B_Falcon_A'"];
	_logic setVariable ["Parent", "configFile >> 'CfgORBAT' >> 'BIS' >> 'B_Falcon'"];

	// Change to ORBAT marker
	_logic call BIS_fnc_moduleStrategicMapORBAT;
};