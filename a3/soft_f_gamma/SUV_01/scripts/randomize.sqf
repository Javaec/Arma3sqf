if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd1 = floor random 4;
	if (((_this getVariable "color")>=0)&&((_this getVariable "color")<=3))
	then
	{
		_rnd1 = _this getVariable "color";
	};
	_this setObjectTextureGlobal [0, ["\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa",
	"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa",
	"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_03_CO.paa",
	"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa"] select _rnd1];
};
