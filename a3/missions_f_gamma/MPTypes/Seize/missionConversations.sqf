case "BIS_start": {
	sleep 2;
	{
		_base = missionnamespace getvariable [_x,objnull];
		if !(isnull _base) then {_base sideradio "SentGenCmdSeize";};
	} foreach ["BIS_HQ_WEST","BIS_HQ_EAST","BIS_HQ_GUER"];
};
case "BIS_timeRunningOut": {
	{
		_base = missionnamespace getvariable [_x,objnull];
		if !(isnull _base) then {_base sideradio "SentGenTime";};
	} foreach ["BIS_HQ_WEST","BIS_HQ_EAST","BIS_HQ_GUER"];
};
case "BIS_sectorCaptured": {
	sleep 2;
	{
		_base = missionnamespace getvariable [_x,objnull];
		if !(isnull _base) then {_base sideradio "SentGenComplete";};
	} foreach ["BIS_HQ_WEST","BIS_HQ_EAST","BIS_HQ_GUER"];
};
case "BIS_sectorNotCaptured": {
	sleep 2;
	{
		_base = missionnamespace getvariable [_x,objnull];
		if !(isnull _base) then {_base sideradio "SentGenLost";};
	} foreach ["BIS_HQ_WEST","BIS_HQ_EAST","BIS_HQ_GUER"];
};