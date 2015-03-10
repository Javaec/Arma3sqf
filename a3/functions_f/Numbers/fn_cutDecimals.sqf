
/************************************************************
	cut Decimals
	Author: Markus Kurzawa

rounds a number to the given amount of decimal places
************************************************************/
private ["_number","_factor"];
_number = _this select 0;
_factor = 10^(_this select 1);
_number = (round (_number * _factor)) / _factor;
_number;