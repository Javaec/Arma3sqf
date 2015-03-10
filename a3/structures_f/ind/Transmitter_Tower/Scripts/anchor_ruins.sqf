_object = _this select 0;
_tower = (getPos _object) nearestObject "Land_Communication_F";
_anchorList = (getPos _tower) nearObjects ["Land_Communication_anchor_F",12];
_anchorCount = count _anchorList;

if (_anchorCount < 2) then {_tower setDamage 1};