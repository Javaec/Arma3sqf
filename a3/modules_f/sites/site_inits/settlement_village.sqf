[_this] call BIS_createUnitsCiv;

//==== Revealing player to the enemy ====
_this spawn {sleep 10; _this execFSM (BIS_scrPath + "behaviour\collaboration.fsm")};