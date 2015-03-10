//--- Open config viewer
_result = [
	nil,
	configfile >> "CfgORBAT",
	true,
	{
		_class = _this select 0;
		_params = _class call bis_fnc_ORBATgetgroupparams;

		_texture = _params select ("texture" call bis_fnc_ORBATGetGroupParams);
		_insignia = _params select ("insignia" call bis_fnc_ORBATGetGroupParams);
		_color = _params select ("color" call bis_fnc_ORBATGetGroupParams);
		_text = _params select ("infotext" call bis_fnc_ORBATGetGroupParams);
		_assets = _params select ("assetstext" call bis_fnc_ORBATGetGroupParams);

		_text = format ["<img image='%1' color='%2' /> ",_texture,_color call bis_fnc_colorRGBtoHTML] + _text;
		if (_insignia != "") then {
			_text = _text + format ["<br /><br /><img image='%1' size='10' shadow='0' align='center' />",_insignia]
		};
		if (_assets != "") then {
			_text = _text + format ["<br /><br />%1",_assets]
		};

		_text
	},
	{
		_class = _this select 0;
		(_class call bis_fnc_ORBATgetgroupparams) select ("text" call bis_fnc_ORBATGetGroupParams)
	},
	"Select ORBAT Group" //--- ToDo: Localize
] call bis_fnc_configviewer;

//--- Select result
if (count _result > 0) then {
	[_result select 0,""] call bis_fnc_configpath;
} else {
	nil
};