
/*
	Author: Karel Moricky

	Description:
	Replaces GPS frame.
	Following line have to be defined in mission Description.ext:
	onMinimapScript[] = {"BIS_fnc_customGPS_Spawn"};

	Parameter(s):
	_this select 0: STRING - Image path
	_this select 1 (Optional): NUMBER - Delta X
	_this select 2 (Optional): NUMBER - Delta Y

	Returns:
	True
*/
BIS_fnc_customGPS_Params = _this;

BIS_fnc_customGPS_Spawn = {scriptName "fn_customGPS.sqf: Loop";

	_params = BIS_fnc_customGPS_Params;
	_frame = _params select 0;
	_dx = if (count _params > 1) then {_params select 1} else {0};
	_dy = if (count _params > 2) then {_params select 2} else {0};

	#define GPS_DISPLAY	(_this select 0)
	#define GPS_MAP		(GPS_DISPLAY displayctrl 101)
	#define GPS_FRAME	(GPS_DISPLAY displayctrl 101000)

	_posMap = ctrlposition GPS_MAP;
	_posMap set [0,(_posMap select 0) + _dx];
	_posMap set [1,(_posMap select 1) + _dy];
	GPS_MAP ctrlsetposition _posMap;
	GPS_MAP ctrlcommit 0;

	_posFrame = ctrlposition GPS_FRAME;
	_posFrame set [0,(_posFrame select 0) + _dx];
	_posFrame set [1,(_posFrame select 1) + _dy];

	GPS_FRAME ctrlsetposition _posFrame;
	GPS_FRAME ctrlsettext _frame;
	GPS_FRAME ctrlcommit 0;
};

true