if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd1 = floor random 2;
	if (((_this getVariable "color")>=0)&&((_this getVariable "color")<=1))
	then
	{
		_rnd1 = _this getVariable "color";
	};
	_this setObjectTextureGlobal [0, [
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"] select _rnd1];

	_this setObjectTextureGlobal [1, [
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"] select _rnd1];

	_this execVM "\A3\soft_F\Offroad_01\scripts\randomize_doors.sqf";

	_this animate [["HideBumper1","HideBumper2"] select floor random 2, 0];
	_this animate ["HideBackpacks", 0];
	_this animate ["HideConstruction", 0];
	_this animate ["HidePolice", 1];
	_this animate ["HideServices", 1];
};