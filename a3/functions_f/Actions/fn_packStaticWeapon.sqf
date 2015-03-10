/*
	File: fn_packStaticWeapon.sqf
	Author: Dean "Rocket" Hall

	Description:
	Function which uses a weapon team to pack a static weapon such
	as the HMG or Mortar. Requires three personnel in the team as
	a minimum (leader, gunner, assistant).

	Parameter(s):
	_this select 0: the support team group (group)
	_this select 1: the weapon (option if weapon registered as "supportWeaponSetup" variable)
*/
private["_group","_weapon","_position","_leader","_units","_gunner","_assistant","_type","_wait","_weaponBP","_tripodBP"];

_group = 	[_this, 0, grpNull] call bis_fnc_param;
_weapon = 	_group getVariable ["supportWeaponSetup",objNull];

if (isNull _weapon) then {
	_weapon = [_this, 1, grpNull] call bis_fnc_param;
};

_position = position _weapon;
_leader = 	leader _group;
_units = 	(units _group) - [leader _group];
_gunner = 	_units select 0;
_assistant = _units select 1;
_type = 	typeOf _weapon;
_gunner leaveVehicle _weapon;

{
	_x enableAI "MOVE";
	_x enableAI "ANIM";
	_x setUnitPos "AUTO";
} forEach [_leader,_assistant];
_leader selectWeapon primaryWeapon _leader;

{
	_x doMove position _weapon;
} forEach _units;

sleep 3;
_gunner action ["DisAssemble",_weapon];

_wait = true;
while {_wait} do {
	_weaponBP = nearestObject [_position,"B_Mk30HMG_Wpn"];
	_tripodBP = nearestObject [_position,"B_HMG_01_support_F"];
	if (alive _weaponBP) then {_wait = false};
	sleep 1;
};

_weaponBP = nearestObject [_position,"B_Mk30HMG_Wpn"];
_tripodBP = nearestObject [_position,"B_HMG_01_support_F"];
_gunner action ["takeBag",_weaponBP];
_assistant action ["takeBag",_tripodBP];
_group setVariable ["supportWeapon",_type];
sleep 3;
{
	_x enableAI "move";
} forEach _units;