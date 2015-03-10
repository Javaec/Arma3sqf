//Parameters
private ["_object", "_selectionName", "_damage", "_source", "_projectile"];
_object		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_selectionName	= [_this, 1, "", [""]] call BIS_fnc_param;
_damage		= [_this, 2, 0, [0]] call BIS_fnc_param;
_source		= [_this, 3, objNull, [objNull]] call BIS_fnc_param;
_projectile	= [_this, 4, "", [""]] call BIS_fnc_param;

if (_object isKindOf "Man" || _object isKindOf "B_APC_Tracked_01_rcws_F" || _object isKindOf "B_MBT_01_cannon_F" || _object isKindOf "O_MBT_02_cannon_F") then {
	//Only allow damage if caused by the player
	if (_source == player || _source == vehicle player) then {
		_damage;
	} else {
		0;
	};
} else {
	//Enemy batteries
	//If damage is caused by satchel charge we manually destroy it
	if (_source == player || _source == vehicle player) then {
		//Make sure it was a satchel charge causing the damage
		if (_projectile == "DemoCharge_Remote_Ammo" && _damage > 0.15) then {
			1;
		} else {
			_damage;
		};
	} else {
		_damage;
	};
};
