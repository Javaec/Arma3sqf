["BIS_fnc_moduleMPTypeDefense"] call bis_fnc_startLoadingScreen;

_logic = _this select 0;
_playerSideLogics = _logic getvariable "playerSideLogics";
_enemySideLogics = _logic getvariable "enemySideLogics";

//--- Kill player when the last wave is in effect (ToDo: Move to respawn system)
if (_logic getvariable ["lastStand",false]) then {player setdamage 1};

//--- Detect side logic
{
	_side = _x getvariable ["side",sideunknown];
	if (_side == playerSide) then {
		player setvariable ["BIS_fnc_moduleMPTypeDefense_mission",_x];
	};
} foreach _playerSideLogics;

//--- Player sides
_avgX = 0;
_avgY = 0;
{
	_flag = _x getvariable ["flag",_x];
	_side = _x getvariable ["side",sideunknown];
	_color = [_side,true] call bis_fnc_sideColor;

	_avgX = _avgX + (position _flag select 0);
	_avgY = _avgY + (position _flag select 1);

	_markerFlag = createmarkerlocal [str _side + "flag",position _flag];
	_markerFlag setmarkertypelocal "mil_flag";
	_markerFlag setmarkercolorlocal _color;
} foreach _playerSideLogics;

_avgX = _avgX / (count _playerSideLogics);
_avgY = _avgY / (count _playerSideLogics);

//--- Enemy sides
{
	_sectors = _x getvariable ["sectors",[]];
	_side = _x getvariable ["side",sideunknown];
	_size = 0.75 + random 1;
	_color = [_side,true] call bis_fnc_sideColor;
	{
		_side = _x getvariable ["side",sideunknown];
		_markerArrow = createmarkerlocal [str _side + "arrow" + str _foreachindex,position _x];
		_markerArrow setmarkertypelocal "mil_arrow2";
		_markerArrow setmarkercolorlocal _color;
		_markerArrow setmarkersizelocal [_size,_size * (2 + random 1)];
		_markerArrow setmarkerdirlocal ([position _x,[_avgX,_avgY]] call bis_fnc_dirto);
	} foreach _sectors;
} foreach _enemySideLogics;

["BIS_fnc_moduleMPTypeDefense"] call bis_fnc_endLoadingScreen;