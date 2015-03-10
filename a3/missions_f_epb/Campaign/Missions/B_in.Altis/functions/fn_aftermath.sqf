/**********************************
Destroy villages
**********************************/
{
	private ["_center", "_bodyThreshold", "_destroy"];
	_center 	= _x select 0;
	_bodyThreshold 	= _x select 1;
	_destroy	= _x select 2;
	
	private "_blacklisted";
	_blacklisted = [
		toLower "land_chapel_small_v1_f"
	];
	
	private "_structures";
	_structures 	= _center nearObjects ["House", 150];
	_structures 	= _structures call BIS_fnc_arrayShuffle;
	_destroyed	= [];
	
	for "_i" from 0 to (round ((count _structures) / 2)) do {
		if (((boundingBox (_structures select _i)) select 1) select 0 > 3 && { !(toLower typeOf (_structures select _i) in _blacklisted) }) then {
			_destroyed set [count _destroyed, _structures select _i];
		};
	};
	
	_structures = _structures - _destroyed;
	
	{ _x setDamage 0.7; } forEach _structures;
	{ _x setDamage (if (_destroy) then { 1 } else { 0.7 }); } forEach _destroyed;
	
	private "_bodyCount";
	_bodyCount = 0;
	
	private "_group";
	_group = createGroup WEST;
	
	{
		private "_positions";
		_positions = [_x] call BIS_fnc_buildingPositions;
		_positions = _positions call BIS_fnc_arrayShuffle;
		
		{
			if (_bodyCount < _bodyThreshold && { random 1 < 0.25 }) then {
				_bodyCount = _bodyCount + 1;
				
				private "_class";
				_class = [
					"C_man_1",
					"C_man_p_fugitive_F",
					"C_man_w_worker_F",
					"B_G_Soldier_F",
					"B_G_Soldier_GL_F",
					"B_G_Soldier_AR_F",
					"B_G_Soldier_lite_F"
				] call BIS_fnc_selectRandom;
				
				private "_animation";
				_animation = [
					"KIA_driver_boat01",
					"KIA_gunner_standup01",
					"KIA_gunner_static_low01",
					"KIA_passenger_boat_holdleft",
					"KIA_passenger_boat_rightrear",
					"KIA_passenger_injured_medevac_truck01",
					"KIA_passenger_injured_medevac_truck02",
					"KIA_passenger_injured_medevac_truck03",
					"KIA_passenger_low01",
					"Mk201_Dead"
				] call BIS_fnc_selectRandom;
				
				private "_unit";
				_unit = _group createUnit [_class, _x, [], 0, "NONE"];
				_unit setDir random 360;
				_unit setPos _x;
				_unit switchMove _animation;
				_unit setVehicleAmmo 0.2;
				_unit setDamage 1;
			};
		} forEach _positions;
	} forEach _destroyed;
} forEach [
	[[3378.764,14262.667,0.000], 20, true],
	[[3623.427,14425.532,0.000], 5, false],
	[[3700.533,14135.399,0.000], 5, false]
];

[] spawn {
	sleep 10;
	
	//Initialize poster module
	private "_logic";
	_logic = (createGroup SideLogic) createUnit ["Logic", getMarkerPos "BIS_postersCenter", [], 0, "none"];
	_logic setVariable ["Radius", 300];
	_logic setVariable ["Rotation", 15];
	_logic setVariable ["Probability", 0.5];
	[_logic] execVM "A3\Modules_f_epb\Misc\functions\fn_modulePoster.sqf";
};
