/*
	Author: Karel Moricky

	Description:
	Delete body of a virtual soldier after he's killed

	Parameter(s):
		0: OBJECT
		1 (Optional): BOOL - true to delete the body right away, false to add KILLED event handler which will delete it after death
		2 (Optional): NUMBER - time in seconds before the body disappears

	Returns:
	BOOL
*/

private ["_unit","_exec","_timeout"];
_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_exec = [_this,1,false,[false]] call bis_fnc_param;
_timeout = [_this,2,_unit getvariable ["bis_fnc_VREffectKilled_timeout",10],[0]] call bis_fnc_param;

if !(_exec) then {
	//--- Add effect event handler
	if (isnil {_unit getvariable "bis_fnc_VREffectKilled_killed"}) then {
		_unit setvariable [
			"bis_fnc_VREffectKilled_killed",
			_unit addeventhandler ["killed",{[_this select 0,true] spawn bis_fnc_VREffectKilled}]
		];
		_unit setvariable ["bis_fnc_VREffectKilled_timeout",_timeout];
	};
} else {
	//--- Execute the effect (not when Arsenal is opened)
	sleep _timeout;
	_unit enablesimulation false;
	sleep 0.2;
	if (isnull (missionnamespace getvariable ["BIS_fnc_arsenal_target",objnull])) then {
		for "_i" from 0 to 10 do {
			_unit hideobject true;
			sleep 0.05;
			_unit hideobject false;
			sleep 0.05;
		};
	};
	removebackpack _unit; //--- Remove the backpack first, otherwise it stays on the ground
	deletevehicle _unit;
};
true