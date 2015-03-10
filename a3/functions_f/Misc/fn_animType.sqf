/*
	Author: Karel Moricky

	Description:
	Returns type of animation

	Parameter(s):
	_this: STRING - animation name

	Returns:
	ARRAY
*/

#define COMPOSE_NAME(ID,NAME)\
	if (_includeType && _typeName != "<Unknown>" && !_ignoreIncludeType) then {_typeName = format ["[%1] %2",_type,_typeName];};\
	if (_includeCategory) then {\
		_animType set [##ID##,[##NAME##,_typeName]];\
	} else {\
		_animType set [##ID##,_typeName];\
	};

private ["_anim","_includeType","_includeCategory","_animArray","_animArray4","_animArrayTemp","_animType","_typeName","_ignoreIncludeType"];

_anim = [_this,0,"",[""]] call bis_fnc_param;
_includeType = [_this,1,false,[false]] call bis_fnc_param;
_includeCategory = [_this,2,true,[true]] call bis_fnc_param;
_animArray = toarray _anim;
_animArray4 = [];
_animArrayTemp = [];

for "_a" from 0 to (count _animArray - 1) do {
	private ["_char"];

	_char = _animArray select _a;
	if (_char in [95]) exitwith {};

	_animArrayTemp = _animArrayTemp + [_char];
	if ((_a % 4) == 3 || (_a == count _animArray - 1)) then {
		_animArray4 = _animArray4 + [_animArrayTemp];
		_animArrayTemp = [];
	};
};

_animType = if (_includeCategory) then {
	[["Action","<Unknown>"],["Pose","<Unknown>"],["Movement","<Unknown>"],["Stance","<Unknown>"],["Hand item","<Unknown>"],["Direction","<Unknown>"]]
} else {
	["<Unknown>","<Unknown>","<Unknown>","<Unknown>","<Unknown>","<Unknown>"]
};
private ["_prefix","_type"];
{
	_prefix = toupper tostring [_x select 0];
	_type = tolower tostring [
		[_x,1,""] call bis_fnc_param,
		[_x,2,""] call bis_fnc_param,
		[_x,3,""] call bis_fnc_param
	];
	_ignoreIncludeType = false;

	switch _prefix do {

		//--- Action class
		case "A": {
			_typeName = switch _type do {
				case "mov": {"Move"};
				case "idl": {"Idle"};
				case "ldr": {"Ladder"};
				case "mel": {"Melee"};
				case "crg": {"Cargo"};
				case "inj": {"Injury"};
				case "cin": {"Carry injured"};
				case "dth": {"Death"};
				case "inv": {"Inventory"};
				case "cts": {"Cutscene"};
				case "swm": {"Swim"};
				case "ssw": {"Surface swim"};
				case "bsw": {"Bottom swim"};
				case "sig": {"Signal"};
				case "wop": {"Operate a weapon"};
				case "ddg": {"Dodge"};
				case "adj": {"Adjust"};
				case "dve": {"Dive"};
				case "sdv": {"Surface dive"};
				case "bdv": {"Bottom dive"};
				case "ovr": {"Over obstacle"};
				case "csm": {"Consume"};
				case "exc": {"Excretion"};
				default {_ignoreIncludeType = true; "<Unknown>"};
			};
			COMPOSE_NAME(0,"Action")
		};

		//--- Pose
		case "P": {
			_typeName = switch _type do {
				case "erc": {"Erect"};
				case "knl": {"Kneel"};
				case "pne": {"Prone"};
				case "sit": {"Sit"};
				case "fal": {"Fall"};
				case "sqt": {"Squat"};
				case "crh": {"Crouch"};
				case "inc": {"Incapacitated"};

				case "001": {_ignoreIncludeType = true; "<Unknown> (CargoActions)"}; //--- Anim viewer exception
				case "002": {_ignoreIncludeType = true; "<Unknown> (DeadActions)"}; //--- Anim viewer exception
				case "003": {_ignoreIncludeType = true; "<Unknown> (ParachuteFreeFall)"}; //--- Anim viewer exception

				default {_ignoreIncludeType = true; "<Unknown>"};
			};
			COMPOSE_NAME(1,"Pose")
		};

		//--- Movement
		case "M": {
			_typeName = switch _type do {
				case "stp": {"Stop"};
				case "wlk": {"Walk"};
				case "tac": {"Tactical"};
				case "run": {"Run"};
				case "spr": {"Sprint"};
				case "len": {"Lean"};
				case "trn": {"Turn"};
				case "jmp": {"Jump"};
				case "wtl": {"Water level"};
				case "uwt": {"Under water"};
				case "eva": {"Evasive"};
				case "mnt": {"Mount"};
				case "dnt": {"Dismount"};
				case "crg": {"Cargo"};
				default {_ignoreIncludeType = true; "<Unknown>"};
			};
			COMPOSE_NAME(2,"Movement")
		};

		//--- Stance
		case "S": {
			_typeName = switch _type do {
				case "ras": {"Raised"};
				case "low": {"Lowered"};
				case "opt": {"Optics"};
				case "sur": {"Surrender"};
				case "sig": {"Hand signal"};
				case "pat": {"Patrol position"};
				case "non": {"No weapon"};
				case "lay": {"Lay weapon"};
				case "car": {"Carry weapon"};
				case "obk": {"Weapon on back"};
				case "rld": {"Reload"};
				case "gth": {"Grenade throw"};
				case "grl": {"Grenade roll"};
				case "old": {"Old"};
				default {_ignoreIncludeType = true; "<Unknown>"};
			};
			COMPOSE_NAME(3,"Stance")
		};

		//--- Hand item
		case "W": {
			_typeName = switch _type do {
				case "una": {"Unarmed"};
				case "pst": {"Pistol"};
				case "rfl": {"Rifle"};
				case "mag": {"Machinegun"};
				case "lnr": {"Launcher"};
				case "knf": {"Knife"};
				case "dog": {"Dog handler"};
				case "non": {"Nothing"};
				case "cwo": {"Carry wounded"};
				case "bin": {"Binocular"};
				case "drl": {"Disposable launcher"};
				default {_ignoreIncludeType = true; "<Unknown>"};
			};
			COMPOSE_NAME(4,"Hand item")
		};

		//--- Direction
		case "D": {
			_typeName = switch _type do {
				case "f": {"Forward"};
				case "fl": {"Forward Left"};
				case "l": {"Left"};
				case "bl": {"Backward Left"};
				case "b": {"Backward"};
				case "br": {"Backward Right"};
				case "r": {"Right"};
				case "fr": {"Forward Right"};
				case "dn": {"Down"};
				case "up": {"Up"};
				case "mul": {"Multiple"};
				case "non": {"Not specified"};
				case "up": {"Adjust up"};
				case "dow": {"Adjust down"};
				case "lef": {"Adjust left"};
				case "rig": {"Adjust right"};
				default {_ignoreIncludeType = true; "<Unknown>"};
			};
			COMPOSE_NAME(5,"Direction")
		};
	};
} foreach _animArray4;

_animType