while {alive _this} do
{
	_clock_hour10 = floor ((date select 3)/10);
	_textureName = format ["\A3\soft_f_gamma\van_01\Data\num%1_ca.paa", _clock_hour10];
	_textureName = format [_textureName];
	_this setObjectTexture [2, _textureName];

	_clock_hour = ((date select 3)-(_clock_hour10*10));
	_textureName = format ["\A3\soft_f_gamma\van_01\Data\num%1_ca.paa", _clock_hour];
	_this setObjectTexture [3, _textureName];

	_clock_minute10 = floor ((date select 4)/10);
	_textureName = format ["\A3\soft_f_gamma\van_01\Data\num%1_ca.paa", _clock_minute10];
	_this setObjectTexture [4, _textureName];

	_clock_minute = ((date select 4)-(_clock_minute10*10));
	_textureName = format ["\A3\soft_f_gamma\van_01\Data\num%1_ca.paa", _clock_minute];
	_this setObjectTexture [5, _textureName];

	sleep 5;
};

