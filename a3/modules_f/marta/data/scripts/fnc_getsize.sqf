scriptName "Marta\data\scripts\fnc_getSize.sqf";
/*
	File:fnc_getSize.sqf
	Author: Karel Moricky

	Description:
	Get group's size.

	Parameter(s):
	_this: Group


	Description:
	0:	Fireteam	o
	1:	Squad		.
	2:	Section		..
	3:	Platoon		...
	4:	Company		|
	5:	Battalion	||
	6:	Regiment	|||
	7:	Brigade		X
	8:	Division	XX
	9:	Corps		XXX
	10:	Army		XXXX
	11:	Army Group	XXXXX
*/
private ["_grp","_prefix","_type","_side","_units","_groupSize","_infantry","_armor","_air","_count"];

_grp = _this select 0;
_grpUnits = _this select 1;
_type = _this select 2;

_side = side _grp;
_groupSize = -1;

//--- Basic classes
_infantry = ["inf","motor_inf","mech_inf"];
_armor = ["armor"];
_air = ["air","plane"];
_support = ["support","med","ammo","fuel","maint"];


//--- Infantry group
if (_type in _infantry) then {
	_count = {alive _x} count (units _grp);

	_groupSize = 0;
	if (_count >= 4) then {_groupSize = 1};
	if (_count >= 12) then {_groupSize = 2};
	if (_count >= 25) then {_groupSize = 3};
	if (_count >= 60) then {_groupSize = 4};
	if (_count >= 300) then {_groupSize = 5};
	if (_count >= 1000) then {_groupSize = 6};

};

//--- Armored group
if (_type in _armor) then {
	_count = {_x == effectivecommander vehicle _x && vehicle _x iskindof "tank" && alive _x} count _grpUnits;

	_groupSize = 1;
	if (_count >= 2) then {_groupSize = 2};
	if (_count >= 4) then {_groupSize = 3};
	if (_count >= 12) then {_groupSize = 4};
	if (_count >= 100) then {_groupSize = 5};
};


//--- Air Force group
if (_type in _air) then {
	_count = {_x == effectivecommander vehicle _x && _x iskindof "air" && alive _x} count _grpUnits;

	_groupSize = 2;
	if (_count >= 4) then {_groupSize = 3};
	if (_count >= 20) then {_groupSize = 4};

};

//--- Support
if (_type in _support) then {
	_groupSize = -1;
};


_groupSize;
