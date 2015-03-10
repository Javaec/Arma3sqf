//Wounded/Healing
#define ANIMS_MEDIC 	["Acts_TreatingWounded01", "Acts_TreatingWounded02", "Acts_TreatingWounded03", "Acts_TreatingWounded04"]
#define ANIMS_WOUNDED	["Acts_LyingWounded_loop", "Acts_LyingWounded_loop1", "Acts_LyingWounded_loop2", "Acts_LyingWounded_loop3"]

private ["_medic", "_wounded"];
_medic		= [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_wounded	= [_this, 1, objNull, [objNull]] call BIS_fnc_param;

//Attach
_medic attachTo [_wounded, [-0.5,0,0]];
_medic setDir ((getDir _wounded) - 90);

//Remove unwanted gear from wounded
_wounded removeWeapon "NVGoggles";
removeGoggles _wounded;
removeVest _wounded;
removeHeadgear _wounded;

//Set damage on the wounded
//_wounded setDamage 0.8;

//Add event handlers
{
	_x disableAi "MOVE";
	_x disableAi "ANIM";
	
	if (_forEachIndex < 1) then {
		_x setVariable ["BIS_animDone", _x addEventHandler ["AnimDone", { (_this select 0) playMove (ANIMS_MEDIC call BIS_fnc_selectRandom); }]];
	} else {
		_x setVariable ["BIS_animDone", _x addEventHandler ["AnimDone", { (_this select 0) playMove (ANIMS_WOUNDED call BIS_fnc_selectRandom); }]];
	};
} forEach [_medic, _wounded];

//Play start animations
_medic playMoveNow (ANIMS_MEDIC call BIS_fnc_selectRandom);
_wounded switchMove (ANIMS_WOUNDED call BIS_fnc_selectRandom);
