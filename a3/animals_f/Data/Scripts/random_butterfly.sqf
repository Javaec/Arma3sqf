if (local _this) then {
	_rnd1 = floor random 4;
	_this setObjectTextureGlobal [0, ["\A3\Animals_F\Data\Butterfly_Pasha_co.paa",
	"\A3\Animals_F\Data\Butterfly_Swallow_co.paa",
	"\A3\Animals_F\Data\Butterfly_Tortoise_co.paa",
	"\A3\Animals_F\Data\Butterfly_White_co.paa"] select _rnd1];
};