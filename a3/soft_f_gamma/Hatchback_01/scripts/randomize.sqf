if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd1 = floor random 10;
	if (((_this getVariable "color")>=0)&&((_this getVariable "color")<=9))
	then
	{
		_rnd1 = _this getVariable "color";
	};
	_this setObjectTextureGlobal [0, ["\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa",
	"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa"] select _rnd1];
};
