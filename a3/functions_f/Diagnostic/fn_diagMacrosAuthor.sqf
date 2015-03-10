private ["_path","_br","_result","_resultText"];
startloadingscreen [""];
_path = [_this,0,configfile >> "cfgvehicles",[configfile]] call bis_fnc_param;
_pathText = toupper configname _path;
_br = tostring [13,10];
_result = [];
{
	_result = _result + [format ["#define %1_AUTHOR_%2	author = $STR_A3_Bohemia_Interactive;",_pathText,configname _x]];
} foreach (_path call bis_fnc_returnChildren);
_result = _result call BIS_fnc_sortAlphabetically;

_resultText = "";
{_resultText = _resultText + _x + _br;} foreach _result;
copytoclipboard _resultText;
endloadingscreen;