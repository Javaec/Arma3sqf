_object = _this select 0;
_anchorList = (getPos _object) nearObjects ["Land_Communication_anchor_F",12];
{_x setDamage 1} forEach _anchorList;