private ["_pos","_side","_obj","_grp","_type","_target"];
_pos = [_this,0,[],[[],objnull]] call bis_fnc_param;
_type = [_this,1,"B_Soldier_VR_F",["",objnull]] call bis_fnc_param;

_obj = _pos;
_grp = grpnull;

if (typename _obj == typename objnull) then {
	_grp = group _obj;
	_type = typeof _obj;
	_pos = _obj getvariable ["pos",position objnull];
	[_obj,true] call bis_fnc_VREffectKilled;
} else {
	_grp = creategroup east;
};

_target = _grp createunit [_type,[10,10,0],[],0,"none"];
if !(isnull (missionnamespace getvariable ["BIS_fnc_arsenal_target",objnull])) then {_target hideobject true};
_target setpos _pos;
_target setdir ([_pos,player] call bis_fnc_dirto);
_target dowatch position player;
_target addrating -10e10;
_target setunitpos "up";
_target setbehaviour "careless";
_target setcombatmode "blue";
_target setspeedmode "limited";
_target disableai "target";
_target disableai "autotarget";
_target allowfleeing 0;
_target setspeaker "base";
_target spawn {_this setspeaker "base";};

_target addvest vest player;
_target addbackpack backpack player;
_target addheadgear headgear player;
_target addgoggles goggles player;
_target addweapon primaryweapon player;
_target addweapon secondaryweapon player;
_target addweapon handgunweapon player;

_target switchmove "amovpercmstpslowwrfldnon";
_target setvariable ["pos",_pos];
_target addeventhandler ["killed",{_this spawn arsenal_fnc_createTarget;}];

_target