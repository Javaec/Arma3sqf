/*
	Author: Karel Moricky

	Description:
	Animate an ORBAT viewer.

	Parameter(s):
		0: (Optional) CONFIG or ARRAY - either config path to target group, or offset position [X,Y] from structure center.
						When empty, view is reset to original level where whole structure is visible.
		1: (Optional): NUMBER - zoom in range 0 (maximum zoom) to 1 (minimum zoom).
		2: (Optional): NUMBER - commit time in seconds

	Returns:
	BOOL - true when animation is applied
*/

private ["_target","_zoom","_commit","_display","_map","_scaleMin","_scaleMax","_scale","_targetID","_position"];
disableserialization;
_target = [_this,0,[],[[],configfile]] call bis_fnc_param;
_zoom = [_this,1,-1,[0]] call bis_fnc_param;
_commit = [_this,2,1,[0]] call bis_fnc_param;

//--- Check if ORBAT is opened
_display = finddisplay 505;
if (isnull _display) exitwith {"ORBAT is not open. Do it first by calling 'BIS_fnc_ORBATOpen' function." call (uinamespace getvariable "bis_fnc_error"); false};
_map = _display displayctrl 51;

//--- Calmculate map scale
if (_zoom >= 0) then {
	_scaleMin = getnumber (configfile >> "RscDisplayORBAT" >> "ControlsBackground" >> "Map" >> "scaleMin");
	_scaleMax = getnumber (configfile >> "RscDisplayORBAT" >> "ControlsBackground" >> "Map" >> "scaleMax");
	_scale = linearConversion [0,1,_zoom,_scaleMin,_scaleMax,true];
} else {
	_scale = ctrlmapscale _map;
};

//--- Calculate target position
if (typename _target == typename configfile) then {

	//--- Group
	 _targetID = BIS_fnc_ORBAT_posArray find _target;
	_position = if (_targetID >= 0) then {
		BIS_fnc_ORBAT_posArray select (_targetID + 1);
	} else {
		["Group '%1' not found in ORBAT.",_target] call bis_fnc_error;
		[]
	};
} else {
	_position = if (count _target >= 2) then {
		[
			(BIS_fnc_ORBAT_posStart select 0) + ((_target select 0) call bis_fnc_parsenumber),
			(BIS_fnc_ORBAT_posStart select 1) + ((_target select 1) call bis_fnc_parsenumber)
		]
	} else {
		//--- Reset the view when params are empty
		_parentParams = BIS_fnc_ORBAT_structure select 1;
		_subclassesCount = _parentParams select 1;
		_scale = ((0.0007 * _subclassesCount)) / BIS_fnc_ORBAT_sizeCoef;
		BIS_fnc_ORBAT_posStart;
	};
};

//--- Animate
if (count _position > 0) then {
	_map ctrlmapanimadd [_commit,_scale,_position];
	ctrlmapanimcommit _map;
	waituntil {ctrlmapanimdone _map};
	true
} else {
	false
};