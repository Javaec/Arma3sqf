//================ Places detection ================
_debug = true;

_activeSite = _this select 0;
_radius = 100;
_dirChecks = 24;
_disStep = 2;

_checkedPos = [0,0,0];
_dirListLand = [];
_posListLand = [];
_posListSea = [];
_invalid = false;
_complete = false;
_i2 = 0;
_j2 = 1;

_pierList = getPos _activeSite nearObjects ["land_sea_piert_small_f",100];

if (surfaceIsWater position _activeSite) then {
	while {!_complete} do {
		if ((360 / _dirChecks) * _i2 > 360) then {
			_complete = true
		};
		_checkedPos = [position _activeSite, (_radius/10 + random (_radius*0.9)), (360 / _dirChecks) * _i2] call BIS_fnc_relPos;
		if (!surfaceIsWater _checkedPos) then {
			_dirListLand = _dirListLand + [_i2];
		} else {
			if ((getTerrainHeightASL _checkedPos) < -3) then {
				_posListSea = _posListSea + [_checkedPos]
			}
		};
		_i2 = _i2 + 1
	};
	
	{
		_complete = false;
		_i2 = _x;
		_j2 = 1;
		while {!_complete} do {
			if (_radius - (_disStep * _j2) < 0) then {
				_complete = true
			};
			_checkedPos = [(position _activeSite), _radius - (_disStep * _j2), (360 / _dirChecks) * _i2] call BIS_fnc_relPos;
			if (surfaceIsWater _checkedPos) then {
				if ((getTerrainHeightASL _checkedPos) > -1) then {
					_posListLand = _posListLand + [_checkedPos];
				} else {
					_checkedPos = [position _activeSite, _radius - (_disStep * (_j2 - 1)), (360 / _dirChecks) * _i2] call BIS_fnc_relPos;
					_posListLand = _posListLand + [_checkedPos];
				};
				_complete = true
			};
			_j2 = _j2 + 1
		}
	} forEach _dirListLand
} else {
	while {!_complete} do {
		if ((360 / _dirChecks) * _i2 > 360) then {
			_complete = true
		};
		_checkedPos = [position _activeSite, (_radius/10 + random (_radius*0.9)), (360 / _dirChecks) * _i2] call BIS_fnc_relPos;
		if (surfaceIsWater _checkedPos) then {
			_dirListLand = _dirListLand + [_i2]; 
			if ((getTerrainHeightASL _checkedPos) < -3) then {
				_posListSea = _posListSea + [_checkedPos];
			}
		};
		_i2 = _i2 + 1
	};

	{
		_complete = false;
		_i2 = _x;
		_j2 = 1;
		while {!_complete} do {
			if (_radius - (_disStep * _j2) < 0) then {
				_complete = true
			};
			_checkedPos = [(position _activeSite), _radius - (_disStep * _j2), (360 / _dirChecks) * _i2] call BIS_fnc_relPos;
			if (!surfaceIsWater _checkedPos) then {
				_checkedPos = [(position _activeSite), _radius - (_disStep * (_j2 - 1)), (360 / _dirChecks) * _i2] call BIS_fnc_relPos;
				if ((getTerrainHeightASL _checkedPos) > -1) then {
					_posListLand = _posListLand + [_checkedPos]
				} else {
					_checkedPos = [position _activeSite, _radius - (_disStep * _j2), (360 / _dirChecks) * _i2] call BIS_fnc_relPos;
					_posListLand = _posListLand + [_checkedPos]
				};
				_complete = true
			};
			_j2 = _j2 + 1
		}
	} forEach _dirListLand;
};

if (((count _posListland) + (count _posListSea)) == 0) then {_invalid = true};

if (_invalid) then {
	hint format ["Warning: Failed to initialize location for fishermen site '%1' - invalid position.", _activeSite]
} else {

	//================ Units creation ================
	_boatTypes = ["C_Fishing_Boat","C_Smallboat_1","C_Smallboat_2"];
	_unitTypes = ["C_man_w_fisherman_1_F","C_man_w_fisherman_2_F"];
	_boatNumber = round (random (count _posListSea));
	_unitNumber = 1;
	createCenter Civilian;
	if ((count _posListLand) > 1) then {_unitNumber = 1 + round (random ((count _posListLand) - 2))};

	//------- boats open sea creation -------
	_boats = 0;
	while {((_boatNumber > _boats) && (_boats < 5) && (count _pierList == 0)) || ((_boatNumber > _boats) && (_boats < 2) && (count _pierList != 0))} do {
		_selectedBoatType = (_boatTypes select floor random count _boatTypes);
		_pos = (_posListSea select floor random count _posListSea);
		_pos = [_pos,0.1,10,5,2,1000,0] call BIS_fnc_findSafePos;
		_group = createGroup Civilian;
		_boat = [_pos,random 360,_selectedBoatType,_group] call BIS_fnc_spawnVehicle;

		_tempList = [];
		{
			if ((str _x) != (str _pos)) then {_tempList = _tempList + [_x]}
		} forEach _posListSea;
		_posListSea = _tempList;
		_boats = _boats + 1;
	};
	
	//------- boats pier creation -------
	{
		_boats = 0;
		_randomBoats = random 3;
		
		_boatTypesMin = ["C_Smallboat_1","C_Smallboat_2"];
		_pier = _x;
		_pierPos = getPos _pier;
		_pierDir = getDir _pier;
		
		_pierPos1 = [_pier,13,(_pierDir + 15.5)] call BIS_fnc_relPos;
		_pierDir1 = _pierDir + 15.5;
		_pierPos2 = [_pier,5.5,(_pierDir + 26)] call BIS_fnc_relPos;
		_pierDir2 = _pierDir + 8;
		_pierPos3 = [_pier,8.8,(_pierDir - 8.8)] call BIS_fnc_relPos;
		_pierDir3 = _pierDir + 8;
		_posListPier = [[_pierPos1,_pierDir1],[_pierPos2,_pierDir2],[_pierPos3,_pierDir3]];
		
		while {_randomBoats > _boats} do {
			_selectedBoatType = (_boatTypesMin select floor random count _boatTypesMin);
			_item = (_posListPier select floor random count _posListPier);
			_pos = _item select 0;
			_dir = _item select 1;
			_boat = createVehicle [_selectedBoatType,_pos,[],0,"None"];
			_boat setPos _pos;
			_boat setDir _dir;

			_tempList = [];
			{
				if ((str _x) != (str _item)) then {_tempList = _tempList + [_x]}
			} forEach _posListPier;
			_posListPier = _tempList;
			_boats = _boats + 1;
		}
	} forEach _pierList;


	//------- fishermen creation -------
	_units = 0;
	while {(_unitNumber > _units) && (_units < 4)} do {
		_selectedUnitType = (_unitTypes select floor random count _unitTypes);
		_pos = (_posListLand select floor random count _posListLand);
		_pos = [_pos,0.1,10,1.5,0,1000,0] call BIS_fnc_findSafePos;
		_civPos = [_pos,_activeSite,_selectedUnitType];
		BIS_siteCivPos = BIS_siteCivPos + [_civPos];

		_tempList = [];
		{
			if ((str _x) != (str _pos)) then {_tempList = _tempList + [_x]}
		} forEach _posListLand;
		_posListLand = _tempList;
		_units = _units + 1;
	};
	

	//------------ debug start ------------
	if (_debug) then {
		hint format ["Sea positions: %1\nLand positions: %2\n\nBoats created: %3\nUnits created: %4",count _posListSea,count _posListLand,_boats,_units];

		_markerNumber = 1;
		{
			_markerName = "MarkerLand" + str _markerNumber;
			_marker = createMarkerLocal [_markerName,_x];
			_markerName setMarkerType "Destroy";
			_markerName setMarkerColor "colorIndependent";
			_markerNumber = _markerNumber + 1;
		} forEach _posListLand;

		_markerNumber = 1;
		{
			_markerName = "MarkerSea" + str _markerNumber;
			_marker = createMarkerLocal [_markerName,_x];
			_markerName setMarkerType "Destroy";
			_markerName setMarkerColor "colorBLUFOR";
			_markerNumber = _markerNumber + 1;
		} forEach _posListSea
	}
	//------------ debug end ------------
};