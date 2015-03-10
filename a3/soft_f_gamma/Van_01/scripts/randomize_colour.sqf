if (local _this) then {
	if !(_this getVariable ["BIS_enableRandomization",true]) exitWith {};

	_rnd1 = floor random 2;
	if (((_this getVariable "color")>=0)&&((_this getVariable "color")<=1))
	then
	{
		_rnd1 = _this getVariable "color";
	};
	_this setObjectTextureGlobal [0, 
	[
		"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa",
		"\A3\soft_f_gamma\van_01\Data\van_01_ext_red_CO.paa"
	] select _rnd1];
};
