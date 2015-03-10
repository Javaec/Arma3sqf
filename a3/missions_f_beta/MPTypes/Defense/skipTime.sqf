if (_this select 0) then {
	if (isserver) then {
		//--- Move time forward based on the value set by player
		if (RscDisplayModuleSkiptime_value > 0) then {
			_timeNew = daytime + RscDisplayModuleSkiptime_value;
			_hour = floor _timeNew;
			_minute = (_timeNew % 1) * 60;

			_date = date;
			_date set [3,_hour];
			_date set [4,_minute];

			_overcast = random 0.5;
			_fog = random 0.1;
			BIS_fnc_moduleMPTypeDefense_environment = [_date,_overcast,_fog];
			publicvariable "BIS_fnc_moduleMPTypeDefense_environment";

			[[false],"BIS_fnc_moduleMPTypeDefense_skipTime"] call bis_fnc_mp;

			RscDisplayModuleSkiptime_value = 0;
		};
	};

} else {

	_fnc_set = {
		_environment = BIS_fnc_moduleMPTypeDefense_environment;
		setdate (_environment select 0);
		0 setovercast (_environment select 1);
		0 setfog (_environment select 2);
	};

	_curator = missionnamespace getvariable ["bis_curator",objnull];
	if (player == _curator) then {
		[] call _fnc_set;
	} else {

/*
		_environment = BIS_fnc_moduleMPTypeDefense_environment;
		_dateEnd = _environment select 0;
		_nStart = datetonumber date;
		_nEnd = datetonumber _dateEnd;
		_year = _dateEnd select 0;

		_diff = _nEnd - _nStart;
		_time = time;
		_duration = 10;
		waituntil {
			_nStep = _nStart + (((time - _time) / _duration) * _diff);
			setdate (numbertodate [_year,_nStep]);
			sleep 0.01;
			_nStep >= _nEnd
		};
		setdate _dateEnd;
*/

		cuttext ["","black out"];
		1 fadesound 0;
		sleep 1;

		_showtime = [
			date, //--- Start time
			BIS_fnc_moduleMPTypeDefense_environment select 0, //--- End time
			95
		] call bis_fnc_showTime;

		[] call _fnc_set;
		2 fadesound 1;
		sleep 2;

		_showtime cuttext ["","black in"];
		cuttext ["","black in"];

	};
};