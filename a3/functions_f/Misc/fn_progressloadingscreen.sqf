/*
	Author: Karel Moricky

	Description:
	Progress scripted loading screen. The value will be preserved even when a new screen is opened.

	Parameter(s):
		0: NUMBER - progress, in range <0,1>

	Returns:
	NUMBER - progress value
*/
disableserialization;

private ["_progress"];
_progress = [_this,0,0,[0]] call bis_fnc_param;
if (_progress < 0) then {
	uinamespace setvariable ["BIS_fnc_progressloadingscreen_progress",nil];
} else {

	//--- Make sure the bar won't "return"
	private ["_progressBar"];
	_progressBar = uinamespace getvariable ["RscDisplayLoading_progress",controlnull];
	if !(isnull _progressBar) then {
		_progress = _progress max (progressposition _progressBar / 10000);
	};

	//--- Save the value for outside use
	uinamespace setvariable ["BIS_fnc_progressloadingscreen_progress",_progress];
};
progressloadingscreen _progress;
_progress