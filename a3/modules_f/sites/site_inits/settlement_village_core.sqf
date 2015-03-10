_sitePos = position (_this select 0);
_activeSite = _this select 0;


//==== Size of village ====
_village = [nearestLocation [_sitePos,"NameCityCapital"]];
_village = _village + [nearestLocation [_sitePos,"NameCity"]];
_village = _village + [nearestLocation [_sitePos,"NameVillage"]];
_nearestVillage = _village select 0;
{if ((_x distance _sitePos) < (_nearestVillage distance _sitePos)) then {_nearestVillage = _x}} forEach _village;
_activeSite setVariable ["nearestVillage",_nearestVillage];

_houses = (getPos _nearestVillage) nearObjects ["Building",1500];
_villageSizeList = [];
{if ((getPos _x) in _nearestVillage) then {_villageSizeList = _villageSizeList + [_x]}} forEach _houses;
_villageSize = count _villageSizeList;			//number of houses in nearest village

_distHouse = _villageSizeList select 0;
{if ((_x distance (getPos _nearestVillage)) > (_distHouse distance (getPos _nearestVillage))) then {_distHouse = _x}} forEach _villageSizeList;
_dist = (getPos _nearestVillage) distance _distHouse;
_activeSite setVariable ["dist",_dist];


//==== Civilian creation ====
_maxPersons = 0;
_maxTests = 0;
if ((daytime > 8) && (daytime < 20)) then {
	_maxPersons = _villageSize/8;
	_maxTests = _villageSize*2
} else {
	if ((daytime < 5) || (daytime > 23)) then {
		_maxPersons = _villageSize/80;
		_maxTests = (_villageSize/10)*2
	} else {
		if (daytime < 8) then {
			_maxPersons = (_villageSize/8)/(10-(2.6*(daytime - 4.6)));
			_maxTests = (_villageSize/(10-(2.6*(daytime - 4.6))))*2
		} else {
			_maxPersons = (_villageSize/8)/(2.6*(daytime - 19.6));
			_maxTests = (_villageSize/(2.6*(daytime - 19.6)))*2
		}
	}
};

_killed = _activeSite getVariable "killed";
if (_killed > 0) then {								//--- killed
	_killRatio = (_killed/(_villageSize/8))*100;
	_killRatio = _killRatio - 10 + (random 20);
	if (_killRatio < 100) then {
		if (_killRatio < 15) then {_killRatio = 15};
		_maxPersons = _maxPersons * (_killRatio/100);
		_maxTests = _maxTests * (_killRatio/100)
	}
};

_i = 0;
_j = 0;
_nr = 0;
while {(_i < _maxPersons) && (_j < _maxTests)} do {
	_pos = [[(getPos _nearestVillage) select 0,(getPos _nearestVillage) select 1,0], random (_dist * 0.75), random 360] call BIS_fnc_relPos;
	_blocks = _pos nearObjects ["Building",20];
	_nearBuildings = _pos nearObjects ["Building", 50];
	_nearestPerson = _pos nearestObject "CAManBase";
	_distPerson = 0;
	
	if (isNull _nearestPerson) then {_distPerson = 1000} else {_distPerson = _nearestPerson distance _pos};
	_goodPoint = true;
	if ((count _nearBuildings != 0) && (_distPerson > 10)) then {
		if (count _blocks != 0) then {
			{
				_block = _x;
				if (_goodPoint) then {
					_box = boundingBox _block;
					_boxX = [((getPos _block) select 0) + ((_box select 0) select 0),((getPos _block) select 0) + ((_box select 1) select 0)];
					_boxY = [((getPos _block) select 1) + ((_box select 0) select 1),((getPos _block) select 1) + ((_box select 1) select 1)];
					
					if ((_boxX select 0 < _pos select 0) && (_boxX select 1 > _pos select 0)) then {_goodPoint = false};
					if ((_boxY select 0 < _pos select 1) && (_boxY select 1 > _pos select 1)) then {_goodPoint = false};
				}
			} forEach _blocks
		};
			
		if (_goodPoint) then {
			if (surfaceIsWater [_pos select 0, _pos select 1]) then {_goodPoint = false}
		};
			
		if (_goodPoint) then {
			if (isOnRoad _pos) then {
				_loop = 0;
				while {_loop < (random 4)} do {
					_posF = [(_pos select 0) + random 1,(_pos select 1) + random 1,0];
					_n = count BIS_siteCUnitsList;
					_class = BIS_siteCUnitsList select (floor random _n);
					_civPos = [_posF,_activeSite,_class];
					BIS_siteCivPos = BIS_siteCivPos + [_civPos];
					_i = _i + 1;
					_loop = _loop + 1;
				}
			} else {
				if (_nr < (_maxPersons/3)) then {
					_n = count BIS_siteCUnitsList;
					_class = BIS_siteCUnitsList select (floor random _n);
					_civPos = [_pos,_activeSite,_class];
					BIS_siteCivPos = BIS_siteCivPos + [_civPos];
					_i = _i + 1;
					_nr = _nr + 1;
				} else {
					_roads = _pos nearRoads 25;
					if (count _roads != 0) then {
						_posRoad = getPos (_roads select (floor random (count _roads)));
						_n = count BIS_siteCUnitsList;
						_class = BIS_siteCUnitsList select (floor random _n);
						_civPos = [[(_posRoad select 0),(_posRoad select 1),0],_activeSite,_class];
						BIS_siteCivPos = BIS_siteCivPos + [_civPos];
						_i = _i + 1;
					}
				}
			}
		}
	};
	_j = _j + 1;
	sleep 0.002
};


//==== Debug ====
///hint format ["Vygenerovano postav:\n%1 (max%3)\n\nCyklu:\n%2 (max%4)",_i,_j,_maxPersons,_maxTests];


//==== Vehicles creation ====
_i = 0;
_j = 0;
_nr = 0;
_maxCars = _maxPersons/2;

while {(_i < _maxCars) && (_j < _maxTests)} do {
	_pos = [[(getPos _nearestVillage) select 0,(getPos _nearestVillage) select 1,0], random (_dist * 0.75), random 360] call BIS_fnc_relPos;
	_blocks = _pos nearObjects ["Building",20];
	_nearBuildings = _pos nearObjects ["Building", 50];
	_nearestPerson = _pos nearestObject "CAManBase";
	_distPerson = 0;
	
	if (count _nearBuildings != 0) then {
		_roads = _pos nearRoads 25;
		if (count _roads != 0) then {
			_road = _roads select (floor random (count _roads));
			_posRoad = getPos _road;
			_dirRoad = direction _road;
			_connectedRoads = roadsConnectedTo _road;
			_crossroad = false;
			_crossroadAngle = 40;
			{
				_dirCross = direction _x;
				_angle1 = 0;
				_angle2 = 0;
				if (_dirRoad > _dirCross) then {_angle1 = _dirRoad;_angle2 = _dirCross} else {_angle1 = _dirCross;_angle2 = _dirRoad};		//_angle1 > _angle2
				_devAngle = _angle1 - _angle2;
				if (((_devAngle > 40) && (_devAngle < 140)) || ((_devAngle > 220) && (_devAngle < 320))) then {
					_crossroad = true;
				}
			} forEach _connectedRoads;
			
			if !(_crossroad) then {
				{
					_siteRoad = _x select 2;
					if (_siteRoad == _road) then {_crossroad = true}
				} forEach BIS_siteCarsList
			};
			
			if !(_crossroad) then {
				_sideOfRoad = 0;
				_dirOfCar = 0;
				if ((random 1) > 0.5) then {_sideOfRoad = _dirRoad + 90} else {_sideOfRoad = _dirRoad - 90};
				if ((random 1) > 0.5) then {_dirOfCar = _dirRoad} else {_dirOfCar = _dirRoad - 180};
				_posCar = [_posRoad,(4 + random 1.5),_sideOfRoad] call BIS_fnc_relPos;
				_posCar = [_posCar select 0,_posCar select 1,0.4];
				
				_class = "";
				if ((random 1) > 0.25) then {
					_class = BIS_cVehCarsList select (floor (random (count BIS_cVehCarsList)))
				} else {
					_class = BIS_cVehOtherList select (floor (random (count BIS_cVehOtherList)))
				};
				_car = _class createVehicle _posCar;
				_car setPos _posCar;
				_car setDir _dirOfCar;
				_car setVariable ["inSite",_activeSite];
				_car setvariable ["assigned",false];
				BIS_siteCarsList = BIS_siteCarsList + [[_car,_activeSite,_road]];
				_i = _i + 1;
				sleep 0.01
			}
		}
	};
	_j = _j + 1;
	sleep 0.002
};

[_activeSite] spawn {
	_activeSite = _this select 0;
	_cars = [];
	sleep 4;
	
	{
		if ((_x select 1) == _activeSite) then {_cars = _cars + [_x]}
	} forEach BIS_siteCarsList;
	
	{
		_car = _x select 0;
		if ((damage _car) == 1) then {
			deleteVehicle _car;
			_tempList = [];
			{
				if (_car != (_x select 0)) then {_tempList = _tempList + [_x]}
			} forEach BIS_siteCarsList;
			BIS_siteCarsList = _tempList
		}
	} forEach _cars;
};