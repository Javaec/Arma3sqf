"init" call bis_fnc_startloadingscreen;
enableenvironment false;
enablesaving [false,false];
player allowdamage false;
//player call bis_fnc_traceBullets;
activateKey format ["BIS_%1.%2_done", missionName, worldName];

cuttext ["","black in",1e10];

waituntil {!isnull (finddisplay 46)};
player switchmove "amovpercmstpslowwrfldnon";

//--- Static targets in various distance
{
	_pos = [player,_x,180 + _foreachindex] call bis_fnc_relpos;
	[_pos,"B_Soldier_VR_F"] call arsenal_fnc_createTarget;
} foreach [10,20,30,40,50,100,500,1000,2000];

//--- Target line
_pos = [player,20,90] call bis_fnc_relpos;
for "_i" from 0 to 5 do {
	_iPos = [(_pos select 0),(_pos select 1) - 3 + _i,0];
	[_ipos,"O_Soldier_VR_F"] call arsenal_fnc_createTarget;
};

//--- Target cluster
_pos = [player,20,-90] call bis_fnc_relpos;
for "_i" from 0 to 8 do {
	_index = floor (_i / 3);
	_iPos = [
		(_pos select 0) + _index * 1.5,
		(_pos select 1) + 1.5 + (_i % 3),
		0
	];
	_target = [_ipos,"I_Soldier_VR_F"] call arsenal_fnc_createTarget;

	_target switchmove (["aidlpercmstpslowwrfldnon","aidlpknlmstpslowwrfldnon_ai","aidlppnemstpsraswrfldnon_ai"] select _index);
	_target setunitpos (["up","middle","down"] select _index);
};

//--- Target patrol
_grp = creategroup east;
{
	_wp = _grp addwaypoint [[player,10,_x] call bis_fnc_relpos,0];
	if (_foreachindex == 4) then {_wp setwaypointtype "cycle";};
} foreach [0,90,180,270,0];

_pos = [player,10,0] call bis_fnc_relpos;
for "_i" from 0 to 1 do {
	_target = [_pos,"B_Soldier_VR_F"] call arsenal_fnc_createTarget;
	[_target] join _grp;
	_target stop false;
	_target enableai "move";
	_target setspeedmode "limited";
};

//--- Armored vehicles
_step = 15;
_posCenter = [position player select 0,(position player select 1) + 30,0];
{
	_row = _foreachindex;
	_rowCount = (count _x - 1) * 0.5;
	{
		_pos = [
			(_posCenter select 0) + (-_rowCount + _foreachindex) * _step,
			(_posCenter select 1) + _row * _step,
			0
		];
		_veh = createvehicle [_x,_pos,[],0,"none"];
		_veh setpos _pos;
		_veh setdir 180;
		_veh setvelocity [0,0,-1];
		[_veh] call bis_fnc_VRHitpart;
	} foreach _x;
} foreach [
	[
		"Land_VR_Target_MBT_01_cannon_F",
		"Land_VR_Target_MBT_01_cannon_F"
	]
/*,
	[
		"Land_VR_Target_MBT_01_cannon_F",
		"Land_VR_Target_MBT_01_cannon_F"
	],
	[
		"B_MRAP_01_F",
		"B_APC_Wheeled_01_cannon_F",
		"B_APC_Tracked_01_rcws_F",
		"B_MBT_01_cannon_F"
	],
	[
		"O_MRAP_02_F",
		"O_APC_Wheeled_02_rcws_F",
		"O_APC_Tracked_02_cannon_F",
		"O_MBT_02_cannon_F"
	],
	[
		"I_MRAP_03_F",
		"I_APC_Wheeled_03_cannon_F",
		"I_APC_tracked_03_cannon_F",
		"I_MBT_03_cannon_F"
	]
*/
];

//--- Starting point
_square = createvehicle ["VR_Area_01_square_1x1_grey_F",position player,[],0,"none"];
_square setpos position player;

//--- Garage position
_centerPos = [player,[16,16,0] vectorDistance [0,0,0],135] call bis_fnc_relpos;
_squareGarage = createvehicle ["VR_Area_01_square_4x4_grey_F",_centerPos,[],0,"none"];
_squareGarage setpos _centerPos;
BIS_fnc_garage_center = createvehicle ["Land_HelipadEmpty_F",_centerPos,[],0,"none"];
BIS_fnc_garage_center setpos _centerPos;
BIS_fnc_garage_center enablesimulation false;

//--- Randomize default loadout
_soldiers = [];
{
	_soldiers set [count _soldiers,configname _x];
} foreach ("isclass _x && getnumber (_x >> 'scope') > 1 && gettext (_x >> 'simulation') == 'soldier'" configclasses (configfile >> "cfgvehicles"));
[player,_soldiers call bis_fnc_selectrandom] call bis_fnc_loadinventory;

player addeventhandler [
	"animchanged",
	{
		_unit = _this select 0;
		_anim = _this select 1;
		_animSplit = [_anim,"_"] call bis_fnc_splitstring;
		if ("salute" in _animSplit) then {
			{
				_x playaction "salute";
			} foreach ((position _unit nearobjects ["man",10]) - [player]);
		};
	}
];

disableserialization;
"init" call bis_fnc_endloadingscreen;
bis_typeLast = 0;

[
	missionnamespace,
	"arsenalOpened",
	{
		_this call arsenal_fnc_opened;
		bis_typeLast = 0;
	}
] call bis_fnc_addscriptedeventhandler;
[
	missionnamespace,
	"arsenalClosed",
	{
		_this call arsenal_fnc_closed;
	}
] call bis_fnc_addscriptedeventhandler;
[
	missionnamespace,
	"garageOpened",
	{
		_this call arsenal_fnc_opened;
		bis_typeLast = 1;
	}
] call bis_fnc_addscriptedeventhandler;
[
	missionnamespace,
	"garageClosed",
	{
		_this call arsenal_fnc_closed;
	}
] call bis_fnc_addscriptedeventhandler;



//--- Open Arsenal
["Open",true] spawn bis_fnc_arsenal;
["#(argb,8,8,3)color(0,0,0,1)",false,nil,0.1,[0,0.5]] spawn bis_fnc_textTiles;