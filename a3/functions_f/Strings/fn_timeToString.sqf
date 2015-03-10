

//------------------
// Authors: Peter Morrison (snYpir) & Philipp Pilhofer (raedor)
// Purpose: This function returns a 24-hour time as a string from a decimal
// Arguments: [daytime]
// Return: boolean

/*
	This is meant to be used with the 'daytime' command, for
	example if 'daytime' was 7.36, '[daytime] call TimeToString'
	would return 07:21:36

	No rounding of the time is done - ie time is returned as per
	a clock

	The second array element passed in is the return time format.
	It can be:

	"HH"          - Hour
	"HH:MM"       - Hour:Minute
	"HH:MM:SS"    - Hour:Minute:Seconds
	"HH:MM:SS:MM" - Hour:Minute:Seconds:Milliseconds
	"ARRAY"       - [Hour,Minute,Seconds,Milliseconds]

	If the second parameter is not passed in, it defaults to
	"HH:MM:SS"
*/

//
// Revision History:
// 09/01/08 0.1 - First cut VBS2
//------------------


private ["_in", "_format", "_min", "_hour", "_sec", "_msec"];

_in = _this select 0;

if (count _this > 1) then 
{
	_format = _this select 1
} else
{
	_format = "HH:MM:SS"
};

_min = _in mod 1;
_hour = _in - _min;
_sec = (60 * _min) mod 1;
_msec = (60 * _sec) mod 1;

_hour = (if (_hour <= 9) then {"0"} else {""}) + str _hour;

_min = (60 * _min) - ((60 * _min) mod 1);
_min = (if (_min <= 9) then {"0"} else {""}) + str _min;

_sec = (60 * _sec) - ((60 * _sec) mod 1);
_sec = (if (_sec <= 9) then {"0"} else {""}) + str _sec;

_msec = (60 * _msec) - ((60 * _msec) mod 1);
_msec = (if (_msec <= 9) then {"0"} else {""}) + str _msec;

switch _format do
{
	case "HH": {format["%1",_hour]};
	case "HH:MM": {format["%1:%2",_hour,_min]};
	case "HH:MM:SS": {format["%1:%2:%3",_hour,_min,_sec]};
	case "HH:MM:SS:MM": {format["%1:%2:%3:%4",_hour,_min,_sec,_msec]};
	case "ARRAY": {[_hour,_min,_sec,_msec]};
	default {""}
}

