_logic = _this select 0;
_enemySectors = +(_logic getvariable ["enemySectors",[]]);


//--- Select the nearest sector
_dis = 1e10;
_sector = objnull;
{
	_xSector = _x;
	if !(_xSector getvariable ["used",false]) then {
		_xDis = 0;
		{
			_xDis = _xDis + (_xSector distance _x);
		} foreach (switchableunits + playableunits);
		if (_xDis < _dis) then {
			_dis = _xDis;
			_sector = _xSector;
		};
	};
} foreach _enemySectors;

if !(isnull _sector) then {
	_sector setvariable ["used",true];

	//--- Unlock the sector
	_sectorPos = position _sector;
	_sectorArea = triggerarea _sector select 0;
	_sectorName = triggertext _sector;
	[bis_curator,_sectorPos,_sectorArea] call BIS_fnc_curatorAddEditingArea;

	//--- Mark the sector by smoke
	{
		if (isnull group  _x) then {
			_smoke = createvehicle ["test_EmptyObjectForSmoke",position _x,[],0,"none"];
			_smoke setpos position _x;
		};
	} foreach (synchronizedobjects _sector);
};