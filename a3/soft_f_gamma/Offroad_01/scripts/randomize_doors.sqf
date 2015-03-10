if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd2 = floor random 2;
	if (_rnd2 == 1) then
	{
		_rnd3 = floor random 3;
		_this animate [["HideDoor1","HideDoor2","HideDoor3"] select _rnd3, 1];
		if (_rnd3 == 1) then {_this animate ["HideGlass2", 1]};
		_this execVM "\A3\soft_F\Offroad_01\scripts\randomize_doors.sqf";
	};
};