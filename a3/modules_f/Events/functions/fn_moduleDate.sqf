private ["_logic","_year","_month","_day","_hour","_minute"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_year = parseNumber (_logic getvariable ["Year","-1"]);
	_month = parseNumber (_logic getvariable ["Month","-1"]);
	_day = parseNumber (_logic getvariable ["Day","-1"]);
	_hour = parseNumber (_logic getvariable ["Hour","-1"]);
	_minute = parseNumber (_logic getvariable ["Minute","-1"]);
	_skiptime = _logic getvariable ["Skiptime",0];

	_currentDate= date;
	_modify = false;

	switch (_year) do 
	{
		case -1 : {};
		default {
					_currentDate set [0,_year];
					_modify = true;
				};
	};
	switch (_month) do 
	{
		case -1 : {};
		default {
					_currentDate set [1,_month];
					_modify = true;
				};
	};
	switch (_day) do 
	{
		case -1 : {};
		default {
					_currentDate set [2,_day];
					_modify = true;
				};
	};
	switch (_hour) do 
	{
		case -1 : {};
		default {
					_currentDate set [3,_hour];
					_modify = true;
				};
	};
	switch (_minute) do 
	{
		case -1 : {};
		default {
					_currentDate set [4,_minute];
					_modify = true;
				};
	};

	if (_modify) then {setDate _currentDate;};

	if (_skiptime >0) then {skiptime _skiptime;};
};

true