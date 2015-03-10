scriptName "Marta\data\scripts\fnc_getVisibleGroups.sqf";
/*
	File:fnc_getVisibleGroups.sqf
	Function: BIS_marta_getVisibleGroups (defined in marta fsm)
	Author: Vilem Benes

	Description:
	Get groups visible in HC - take into account position and radius if given.

	Parameter(s):	
	_this select 0: position (optional) - position
	_this select 1: scalar (optional) - radius	
	
	Note: Marta is local, parameters for groups are set respective to player on given client
	Example: [player,position player, 10] call BIS_marta_getVisibleGroups;
*/
private ["_commander", "_position", "_radius", "_ret","_distanceCheck"];
_distanceCheck = false;
if (count _this > 1) then
{
  _distanceCheck = true;
  _position = _this select 0;
  _radius = _this select 1;
};

_ret = [];
{
  
  
  if ((!isNil {getGroupIconParams _x}) && (!isNil {_x getVariable "BIS_MARTA_ICON_TYPE"})) then
  {
  if (!isNil {_x getgroupicon (_x getVariable "BIS_MARTA_ICON_TYPE")}) then
  {
    //textLogFormat ["WFUI_CITY marta: %1 %2 %3 %4", _x, (getGroupIconParams _x)];	     
    if ((getGroupIconParams _x) select 3) then
    {//flag set to visible      
      if (_distanceCheck) then
      {              
        private ["_groupPos"];
        _groupPos = position leader _x; //TODO: use position of icon given by engine ()
        if ((_groupPos distance _position) <= _radius) then
        {
          _ret = _ret + [_x];
        };     
      }
      else
      {
        _ret = _ret + [_x];
      };
    };
  };
  };
} forEach (allGroups);

//return all visible groups for player (in given radius from given position)
//textLogFormat ["WFUI_CITY marta icons near %1 (<%2m) %3", _position, _radius, _ret];	     
_ret