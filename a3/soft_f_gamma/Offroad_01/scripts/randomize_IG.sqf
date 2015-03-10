if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_this execVM "\A3\soft_f_gamma\Offroad_01\scripts\randomize_doors.sqf";

	_this animate [["HideBumper1","HideBumper2"] select floor random 2, 0];
	_this animate ["HideBackpacks", 0];
	_this animate ["HideConstruction", 0];
	_this animate ["HidePolice", 1];
	_this animate ["HideServices", 1];

	_this setObjectTextureGlobal [0, "\A3\soft_f_gamma\Offroad_01\Data\Offroad_01_ext_IG01_CO.paa"];
	_this setObjectTextureGlobal [1, "\A3\soft_f_gamma\Offroad_01\Data\Offroad_01_ext_IG01_CO.paa"];
};

