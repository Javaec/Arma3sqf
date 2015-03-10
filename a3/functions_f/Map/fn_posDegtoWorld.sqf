/*
	Author: Karel Moricky

	Description:
	Convert latitude/longtitude coordinates into game world position

	Parameter(s):
	_this select 0: longtitude (X)
	_this select 1: latitude (Y)

	Returns:
	ARRAY - [x,y]
*/

_lon =		[_this,0,0,[0]] call bis_fnc_param;
_lat =		[_this,1,0,[0]] call bis_fnc_param;
_world =	[_this,2,worldname,[""]] call bis_fnc_param;

//--- World params
_worldPath = configfile >> "cfgworlds" >> _world;
_worldSize = getnumber (_worldPath >> "mapSize");
_UTMworld = getarray (_worldPath >> "mapArea");

//--- Wrong config params - terminate
if (_worldSize == 0) exitwith {["Param 'mapSize' missing or incorrectly defined for '%1'",_world] call bis_fnc_error; []};
if (count _UTMworld != 4) exitwith {["Param 'mapArea' missing or incorrectly defined for '%1'",_world] call bis_fnc_error; []};

_UTMworldBottomLeft = [_UTMworld select 0,_UTMworld select 1] call bis_fnc_posDegToUTM;
_UTMzone = _UTMworldBottomLeft select 2; //--- Unify UTM zone
_UTMworldTopRight = [_UTMworld select 2,_UTMworld select 3,_UTMzone] call bis_fnc_posDegToUTM;

_UTMsizeX = (_UTMworldTopRight select 0) - (_UTMworldBottomLeft select 0);
_UTMsizeY = (_UTMworldTopRight select 1) - (_UTMworldBottomLeft select 1);

//--- Convert long/lat to UTM
_UTMpos = [_lon,_lat,_UTMzone] call bis_fnc_posDegToUTM;
_UTMposX = (_UTMpos select 0) - (_UTMworldBottomLeft select 0);
_UTMposY = (_UTMpos select 1) - (_UTMworldBottomLeft select 1);

//--- Convert UTM to game
_UTMposX = (_UTMposX / _UTMsizeX) * _worldSize;
_UTMposY = (_UTMposY / _UTMsizeY) * _worldSize;

[_UTMposX,_UTMposY]
