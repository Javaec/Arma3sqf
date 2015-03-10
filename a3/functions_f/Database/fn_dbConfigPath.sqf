private ["_path","_config"];

_path =		[_this,0,[],[[]]] call bis_fnc_param;
_config =	[_this,1,configfile >> "CfgBase",[configfile]] call bis_fnc_param;
{
	_config = _config >> _x;
} foreach _path;

_config