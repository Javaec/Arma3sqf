private ["_group","_pos","_target","_wp"];
_group = [_this,0,grpnull,[grpnull]] call bis_fnc_param;
_pos = [_this,1,[],[[]],3] call bis_fnc_param;
_target = [_this,2,objnull,[objnull]] call bis_fnc_param;
_wp = [_group,currentwaypoint _group];