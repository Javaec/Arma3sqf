/*
	Author: Joris-Jan van 't Land

	Description:
	Converts values to a target system of units.

	Parameter(s):
	_this select 0: source value (Scalar)
	_this select 1: source unit (Scalar)
		0: m (meters)
		1: km (kilometers)
		2: ms (meters per second)
		3: kmh (kilometers per hour)
		4: ft (feet)
		5: mi (miles)
		6: fts (feet per second)
		7: mph (miles per hour)
		8: nm (nautical miles)
		9: kts (knots)
	_this select 2: destination unit (Scalar) [optional - default: detected system of units]
	_this select 3: destination mode (Scalar) [optional - default: 0]
		0: destination value (Scalar)
		1: destination text long (String) "5 meters" e.g.
		2: destination text short (String) "5 m" e.g.
	_this select 4: destination precision factor (Scalar) [optional - default: 1 (uses rounding)]
		-1: no changes to converted value

	Returns:
	converted value (Scalar or String)
*/

private ["_source", "_sourceUnit", "_destUnit", "_destMode", "_destPrecFact", "_converted"];
_source = [_this, 0, 0, [-1]] call BIS_fnc_Param;
_sourceUnit = [_this, 1, 0, [-1]] call BIS_fnc_Param;
_destUnit = [_this, 2, -1, [-1]] call BIS_fnc_Param;
_destMode = [_this, 3, 0, [-1]] call BIS_fnc_Param;
_destPrecFact = [_this, 4, 1, [-1]] call BIS_fnc_Param;
_converted = _source;

//TODO: handle 1 - mixed (ground units uses metric, air units uses imperial)
private ["_metric"];
_metric = if (systemOfUnits == 0) then {true} else {false};

//Find best match for source, if no destination unit was provided
if (_destUnit == -1) then 
{
	switch (_sourceUnit) do 
	{
		//m
		case 0: 
		{
			//m or ft
			if (_metric) then {_destUnit = 0} else {_destUnit = 4};
		};
		//km
		case 1: 
		{
			//km or mi
			if (_metric) then {_destUnit = 1} else {_destUnit = 5};
		};
		//ms
		case 2: 
		{
			//ms or fts
			if (_metric) then {_destUnit = 2} else {_destUnit = 6};
		};
		//kmh
		case 3: 
		{
			//kmh or mph
			if (_metric) then {_destUnit = 3} else {_destUnit = 7};
		};
		//ft
		case 4: 
		{
			//m or ft
			if (_metric) then {_destUnit = 0} else {_destUnit = 4};
		};
		//mi
		case 5: 
		{
			//mi or km
			if (_metric) then {_destUnit = 1} else {_destUnit = 5};
		};
		//fts
		case 6: 
		{
			//fts or ms
			if (_metric) then {_destUnit = 2} else {_destUnit = 6};
		};
		//mph
		case 7: 
		{
			//mph or kmh
			if (_metric) then {_destUnit = 3} else {_destUnit = 7};
		};
		//nm
		case 8: 
		{
			//km or nm
			if (_metric) then {_destUnit = 1} else {_destUnit = 8};
		};
		//kts
		case 9: 
		{
			//kmh or kts
			if (_metric) then {_destUnit = 3} else {_destUnit = 9};
		};
		default {_destUnit = 0;};
	};
};

//Do the conversion
if (_sourceUnit != _destUnit) then 
{
	private ["_factor","_unitMatrix"];
	_factor = 1;

	_unitMatrix = [
		//--- m
		[
			1,
			0.001, //m to km
			1,
			1,
			3.2808399, //m to ft
			0.000621371192, //m to mi
			1,
			1,
			0.000539956803, //m to nm
			1
		],

		//--- km
		[
			1000, //km to m
			1,
			1,
			1,
			3280.8399, //km to ft
			0.621371192, //km to mi
			1,
			1,
			0.539956803, //km to nm
			1
		],

		//--- ms
		[
			1,
			1,
			1,
			3.6, //ms to kmh
			1,
			1,
			3.2808399, //ms to fts
			2.23693629, //ms to mph
			1,
			1.94384449 //ms to kts
		],

		//--- kmh
		[
			1,
			1,
			0.277777778, //kmh to ms
			1,
			1,
			1,
			0.911344415, //kmh to fts
			0.621371192, //kmh to mph
			1,
			0.539956803 //kmh to kts
		],

		//--- ft
		[
			0.3048, //ft to m
			0.0003048, //ft to km
			1,
			1,
			1,
			0.000189393939, //ft to mi
			1,
			1,
			1,
			0.000164578834 //ft to nm
		],

		//--- mi
		[
			1609.344, //mi to m
			1.609344, //mi to km
			1,
			1,
			5280, //mi to ft
			0.868976242, //mi to nm
			1,
			1,
			1,
			1
		],

		//--- fts
		[
			1,
			1,
			0.3048, //fts to 
			1.09728, //fts to kmh
			1,
			1,
			1,
			0.681818182, //fts to mph
			1,
			0.592483801 //fts to kts
		],

		//--- mph
		[
			1,
			1,
			0.44704, //mph to ms
			1.609344, //mph to kmh
			1,
			1,
			1.46666667, //mph to fts
			1,
			1,
			0.868976242 //mph to kts
		],

		//--- nm
		[
			1852, //nm to m
			1.85200, //nm to km
			1,
			1,
			6076.11549, //nm to ft
			1.15077945, //nm to mi
			1,
			1,
			1,
			1
		],

		//--- kts
		[
			1,
			1,
			0.514444444, //kts to ms
			1.85200, //kts to kmh
			1,
			1,
			1.68780986, //kts to fts
			1.15077945, //kts to mph
			1,
			1
		]
	];

	if (
		(_sourceUnit >= 0 && _sourceUnit < 10)
		&&
		(_destUnit >= 0 && _destUnit < 10)
	) then {
		_factor = (_unitMatrix select _sourceUnit) select _destUnit;
	};
	_converted = _source * _factor;
};

//Do desired rounding or precision conversions
if (_destPrecFact != -1) then 
{
	if (_destPrecFact == 1) then 
	{
		_converted = round _converted;
	} 
	else 
	{
		_converted = round (_converted / _destPrecFact) * _destPrecFact;
	};
};

//Do desired output formatting
private ["_output"];
_output = _converted;

if (_destMode != 0) then 
{
	private ["_units"];
	_units = "";

	switch (_destMode) do 
	{
		case 1: 
		{
			switch (_destUnit) do 
			{
				case 0: {_units = localize "STR_HSIM_unitFull_m";};
				case 1: {_units = localize "STR_HSIM_unitFull_km";};
				case 2: {_units = localize "STR_HSIM_unitFull_ms";};
				case 3: {_units = localize "STR_HSIM_unitFull_kmh";};
				case 4: {_units = localize "STR_HSIM_unitFull_ft";};
				case 5: {_units = localize "STR_HSIM_unitFull_mi";};
				case 6: {_units = localize "STR_HSIM_unitFull_fts";};
				case 7: {_units = localize "STR_HSIM_unitFull_mph";};
				case 8: {_units = localize "STR_HSIM_unitFull_nm";};
				case 9: {_units = localize "STR_HSIM_unitFull_kts";};
				case 10: {_units = localize "STR_HSIM_unitFull_kg";};
				case 11: {_units = localize "STR_HSIM_unitFull_lb";};
			};
		};
		
		case 2: 
		{
			switch (_destUnit) do 
			{
				case 0: {_units = localize "STR_HSIM_unitShort_m";};
				case 1: {_units = localize "STR_HSIM_unitShort_km";};
				case 2: {_units = localize "STR_HSIM_unitShort_ms";};
				case 3: {_units = localize "STR_HSIM_unitShort_kmh";};
				case 4: {_units = localize "STR_HSIM_unitShort_ft";};
				case 5: {_units = localize "STR_HSIM_unitShort_mi";};
				case 6: {_units = localize "STR_HSIM_unitShort_fts";};
				case 7: {_units = localize "STR_HSIM_unitShort_mph";};
				case 8: {_units = localize "STR_HSIM_unitShort_nm";};
				case 9: {_units = localize "STR_HSIM_unitShort_kts";};
				case 10: {_units = localize "STR_HSIM_unitShort_kg";};
				case 11: {_units = localize "STR_HSIM_unitShort_lb";};
			};
		};
	};
	
	_output = (str _output) + " " + _units;
};

_output