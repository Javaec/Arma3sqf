_player = [missionnamespace getvariable ["BIS_fnc_arsenal_center",player]];
{
	{
		_x hideobject true;
		_x enablesimulation false;
	} foreach ([_x] + crew _x - _player);
} foreach (allmissionobjects "All" - _player);

("RscVRMeta" call bis_fnc_rscLayer) cuttext ["","plain"];