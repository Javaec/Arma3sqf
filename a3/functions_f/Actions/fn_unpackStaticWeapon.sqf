/*
	File: fn_unpackStaticWeapon.sqf
	Author: Dean "Rocket" Hall

	Description:
	Function which uses a weapon team to pack a static weapon such
	as the HMG or Mortar. Requires three personnel in the team as
	a minimum (leader, gunner, assistant).

	Parameter(s):
	_this select 0: the support team group (group)
	_this select 1: location to place gun (position)
	_this select 2: location of target (position)
*/
private["_group","_position","_targetPos","_leader","_units","_gunner","_assistant","_type","_weapon","_wait","_tripodBP","_dirTo"];

_group = 		[_this, 0, grpNull] call bis_fnc_param;
_position =		[_this, 1, grpNull] call bis_fnc_param;
_targetPos = 	[_this, 2, grpNull] call bis_fnc_param;
_weapon = 		objNull;
_leader = 		leader _group;
_units = 		(units _group) - [leader _group];
_gunner = 		_units select 0;
_assistant = 	_units select 1;
_type = 		_group getVariable ["supportWeapon","B_HMG_01_F"];

{
	_x doMove _position;
} forEach _units;

waitUntil{unitReady _gunner};
_gunner disableAI "move";
_assistant disableAI "move";

{
	_x disableAI "MOVE";
	_x setUnitPos "Middle";
} forEach [_leader,_assistant];

_assistant action ["PutBag",_assistant];
_gunner action ["Assemble",unitbackpack _gunner];

_wait = true;
while {_wait} do {
	_weapon = nearestObject [_position,"StaticWeapon"];
	if (alive _weapon) then {_wait = false};
	sleep 1;
};
_tripodBP = nearestObject [_position,"B_HMG_01_support_F"];
_weapon = nearestObject [_position,"StaticWeapon"];
_dirTo = [position _weapon,_targetPos] call BIS_fnc_dirTo;
_weapon setDir _dirTo;
deleteVehicle _tripodBP;
sleep 2;
_gunner assignAsGunner _weapon;
_gunner moveInGunner _weapon;
_group setVariable ["supportWeaponSetup",_weapon];
sleep 1;
_gunner commandWatch _targetPos;
_leader selectWeapon "Binocular";
sleep 6;
_leader disableAI "ANIM";
_leader commandWatch _targetPos;
_leader setDir _dirTo;