BIS_stopTimer = FALSE;
_startTime = time;

RscFiringDrillTime_done = FALSE;

1 cutRsc ["RscFiringDrillTime", "PLAIN"];

while {!BIS_stopTimer && BIS_interruptable} do {
	_t = time - _startTime;
	_timeNowFormat = [_t, "MM:SS.MS", TRUE] call BIS_fnc_secondsToString;
	_text = "<t align='left' color='" + BIS_TT_colorWarningHTML + "'>";

	_textCurrent = "";
	_colorCurrent = BIS_TT_colorWarningHTML;
	_iconCurrent = "A3\Modules_F_Beta\data\FiringDrills\timer_ca";

	_textCurrent = _textCurrent + "<img image='" + _iconCurrent + "' /> ";
	_textCurrent = _textCurrent + (format ["%1:%2<t size='0.8'>.%3</t>", _timeNowFormat select 0, _timeNowFormat select 1, _timeNowFormat select 2]);
	_textCurrent = _textCurrent + "</t>";

	_text  = _text + _textCurrent;

	RscFiringDrillTime_current = parseText _text;

	sleep 0.01;
};