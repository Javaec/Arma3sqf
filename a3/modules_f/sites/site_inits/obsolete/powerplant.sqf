[] call BIS_createUnitsCiv;
_sitePos = position _this;
_radius = 250;


//================ Location detection ================
_dieselPP = false;
_solarPP = false;
_windPP = false;
_objects = getPos _this nearObjects _radius;

// ----- Diesel powerplant -----
_diesel = [];
{
	_test = _x isKindOf "land_dp_mainFactory_F";
	if (_test) then {
		_diesel = _diesel + [_x]
	}
} forEach _objects;

if ((count _diesel) > 0) then {_dieselPP = true};

// ----- Solar powerplant -----
_solar = [];
{
	_test = _x isKindOf "name";			//name is unknown
	if (_test) then {
		_solar = _solar + [_x]
	}
} forEach _objects;

if ((count _solar) > 0) then {_solarPP = true};

// ----- Wind turbine -----
_wind = [];
{
	_test1 = _x isKindOf "Land_windTurbine_F";
	_test2 = _x isKindOf "Land_windTurbine_V2_F";
	if (_test1 || _test2) then {
		_wind = _wind + [_x]
	}
} forEach _objects;

if ((count _wind) > 0) then {_windPP = true};

// ----- Nearest village -----
_village = [nearestLocation [_sitePos,"NameCityCapital"]];
_village = _village + [nearestLocation [_sitePos,"NameCity"]];
_village = _village + [nearestLocation [_sitePos,"NameVillage"]];
_nearestVillage = _village select 0;
{if ((_x distance _sitePos) < (_nearestVillage distance _sitePos)) then {_nearestVillage = _x}} forEach _village;



//================ Places detection & creation scripts ================
// ----- Diesel powerplant -----
if (_dieselPP) then {
	[] spawn {
		
	}
};

// ----- Solar powerplant -----
if (_solarPP) then {
	[] spawn {
		
	}
};

// ----- Wind turbine -----
if (_windPP) then {
	[] spawn {
		
	}
};