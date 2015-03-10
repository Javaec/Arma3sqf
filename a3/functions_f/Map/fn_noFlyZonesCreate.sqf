private ["_heliport","_cfgNoFlyZones","_current","_class","_position","_area","_type","_trigger","_markershape","_markercolor","_marker"];

//---- Delete previous markers
if (isnil "hsim_noFlyZonesMarkes") then {hsim_noFlyZonesMarkes = [];};
{deletemarker _x} foreach hsim_noFlyZonesMarkes;
hsim_noFlyZonesMarkes = [];

//--- Delete previous zones
if (isnil "hsim_noFlyZones") then {hsim_noFlyZones = [];};
{deletevehicle _x} foreach hsim_noFlyZones;
hsim_noFlyZones = [];


//--- Create triggers
_heliport = worldname;
_cfgNoFlyZones = configfile >> "CfgBase" >> _heliport >> "NoFlyZones";
for "_i" from 0 to (count _cfgNoFlyZones - 1) do {
	_current = _cfgNoFlyZones select _i;
	_class = configname _current;
	_position = getarray (_current >> "position");
	_area = getarray (_current >> "area");
	_type = getnumber (_current >> "type");

	//--- Trigger
	_area set [3,(_area select 3) == 1];
	_trigger = createtrigger ["emptydetector",_position];
	_trigger settriggertext _class;
	_trigger settriggerarea _area;
	_trigger triggerattachvehicle [vehicle player];
	_trigger settriggeractivation ["VEHICLE","PRESENT",true];
	_trigger settriggerstatements [
		"this",
		format ["[thisTrigger,%2,true] call bis_fnc_noFlyZone;",_i,_type],
		format ["[thisTrigger,%2,false] call bis_fnc_noFlyZone;",_i,_type]
	];
	_trigger setvariable ["type",_type];
	_trigger setvariable ["class",_class];

	missionnamespace setvariable [format ["hsim_nofly_%1",_class],_trigger];
	hsim_noFlyZones = hsim_noFlyZones + [_trigger];
};


//--- Create markers
{
	_triggerPos = position _x;
	_triggerArea = triggerarea _x;
	_triggerDir = _triggerArea select 2;
	_type = _x getvariable "type";
	_class = _x getvariable "class";

	_lineThickness = 100;
	_lineThicknessWarning = 100;
	_lineLength = 100;
	_lineSpace = 100;
	switch _type do {

		//--- Airport (D)
		case 0: {
			_lineThickness = 40;
			_lineLength = 300;
			_lineSpace = 100;
		};

		//--- International Airport (B)
		case 1: {
			_lineThickness = 100;
			_lineLength = 500;
			_lineSpace = 0;
		};

		//--- Restricted
		case 2: {
			_lineThickness = 40;
			_lineLength = 300;
			_lineSpace = 0;
			_lineThicknessWarning = 200;
		};
	};
	_lineDistance = (_lineLength + _lineSpace) * 2;

	if (_triggerArea select 3) then {

		//--- Rectangle
		_a = _triggerArea select 0;
		_b = _triggerArea select 1;

		_side1 = [_triggerPos,_b,_triggerDir] call bis_fnc_relpos;
		_side2 = [_triggerPos,-_b,_triggerDir] call bis_fnc_relpos;

		_corner1 = [_side1,_a,_triggerDir + 90] call bis_fnc_relpos;
		_corner2 = [_side1,_a,_triggerDir - 90] call bis_fnc_relpos;
		_corner3 = [_side2,_a,_triggerDir - 90] call bis_fnc_relpos;
		_corner4 = [_side2,_a,_triggerDir + 90] call bis_fnc_relpos;
		_corners = [_corner1,_corner2,_corner3,_corner4,_corner1];

		for "_i" from 0 to 3 do {
			_cornerStart = _corners select (_i);
			_cornerEnd = _corners select (_i + 1);
			_dis = _cornerStart distance _cornerEnd;

			_lineDistanceLocal = _dis / (round (_dis / _lineDistance));
			_lineLengthLocal = (_lineDistanceLocal - _lineSpace) / 2;

			if (_lineSpace == 0) then {
				_lineDistanceLocal = _dis / 1;
				_lineLengthLocal = _dis / 2;
			};

			for "_d" from 0 to (_dis - _lineDistanceLocal) step _lineDistanceLocal do {
				_dir = _triggerDir - 90 - _i * 90;
				_pos = [_cornerStart,(_d + (_lineDistanceLocal/2)),_dir] call bis_fnc_relpos;

				if ({[_x,_pos] call bis_fnc_intrigger} count (hsim_noFlyZones - [_x]) == 0) then {
					_marker = createmarkerlocal [_class + str _foreachindex + str _i + str _d,_pos];
					_marker setmarkershapelocal "rectangle";
					_marker setmarkerbrushlocal "solid";
					_marker setmarkercolorlocal "colorblue";
					_marker setmarkersizelocal [_lineLengthLocal,_lineThickness];
					_marker setmarkerdirlocal (_dir + 90);
					hsim_noFlyZonesMarkes set [count hsim_noFlyZonesMarkes,_marker];

					if (_type == 2) then {
						_pos = [_pos,_lineThicknessWarning + _lineThickness,_dir - 90] call bis_fnc_relpos;
						_marker = createmarkerlocal [_class + str _foreachindex + str _i + str _d + "in",_pos];
						_marker setmarkershapelocal "rectangle";
						_marker setmarkerbrushlocal "fdiagonal";
						_marker setmarkercolorlocal "colorblue";
						_marker setmarkersizelocal [_lineLengthLocal,_lineThicknessWarning];
						_marker setmarkerdirlocal (_dir + 90);
						hsim_noFlyZonesMarkes set [count hsim_noFlyZonesMarkes,_marker];
					};
				};
			};		
		};
	} else {

		//--- Circle
		_r = _triggerArea select 0;

		_circleLength = pi * _r * 2;
		_circleStep = 360 / _circleLength * _lineDistance;

		for "_i" from 0 to 360 step (_circleStep) do {
			_pos = [_triggerPos,_r,_i] call bis_fnc_relpos;
			if (
				{
					_type <= (_x getvariable "type")
					&&
					[_x,_pos] call bis_fnc_intrigger
				} count (hsim_noFlyZones - [_x]) == 0
			) then {
				_marker = createmarkerlocal [_class + str _foreachindex + str _i,_pos];
				_marker setmarkershapelocal "rectangle";
				_marker setmarkerbrushlocal "solid";
				_marker setmarkercolorlocal "colorblue";
				_marker setmarkersizelocal [_lineLength,_lineThickness];
				_marker setmarkerdirlocal _i;
				hsim_noFlyZonesMarkes set [count hsim_noFlyZonesMarkes,_marker];
			};
		};
	};
} foreach hsim_noFlyZones;