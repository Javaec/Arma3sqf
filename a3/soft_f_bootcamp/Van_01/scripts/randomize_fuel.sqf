if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd1 = floor random 3;
	if (((_this getVariable "color")>=0)&&((_this getVariable "color")<=2))
	then
	{
		_rnd1 = _this getVariable "color";
	};
	_this setObjectTextureGlobal [0, ["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa", "\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa", "\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa"] select _rnd1];
	_this setObjectTextureGlobal [1, ["\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_01_CO.paa", "\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_03_CO.paa", "\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_03_CO.paa"] select _rnd1];
};
