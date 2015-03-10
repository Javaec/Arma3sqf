/*
	File: randomize.sqf
	Author: pettka

	Description:
	Removes all proxies from the car, randomizes use of rear doors (according to _rnd2) and randomizes one of the skins (according to _rnd1)

	Parameter(s):
	None

	Returns:
	Nothing
*/

if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd1 = floor random 6;
	if (((_this getVariable "color")>=0)&&((_this getVariable "color")<=5))
	then
	{
		_rnd1 = _this getVariable "color";
	};
	_this animate ["HidePolice", 1];
	_this animate ["HideServices", 1];
	_this animate ["HideBackpacks", 1];
	_this animate ["HideBumper1", 1];
	_this animate ["HideBumper2", 1];
	_this animate ["HideConstruction", 1];
	_rnd2 = floor random 3;
	if (_rnd2==0) then {_this animate ["HideDoor3", 1];};

	_this setObjectTextureGlobal [0, ["\A3\soft_F\Offroad_01\Data\Offroad_01_ext_co.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE04_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE05_CO.paa"] select _rnd1];

	_this setObjectTextureGlobal [1, ["\A3\soft_F\Offroad_01\Data\Offroad_01_ext_co.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE01_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE04_CO.paa",
	"\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE05_CO.paa"] select _rnd1];
};
