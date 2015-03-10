if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd1 = floor random 2;
	if (((_this getVariable "color")>=0)&&((_this getVariable "color")<=1))
	then
	{
		_rnd1 = _this getVariable "color";
	};
	_this setObjectTextureGlobal [0, ["\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_INDP_Hunter_CO.paa", "\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_IG_CO.paa"] select _rnd1];
	_this setObjectTextureGlobal [1, ["\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa", "\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa"] select _rnd1];
};
