scriptName "Showcase_Night\scripts\deserted.sqf";

//Params
private ["_marker", "_center", "_distance"];
_marker		= "BIS_markerAreaOfOperation";
_center 	= getMarkerPos _marker;
_distance 	= ((getMarkerSize _marker) select 0) max ((getMarkerSize _marker) select 1);

//Main loop
while { true } do {
	//Is kerry outside the AO?
	if (vehicle BIS_player distance _center > _distance) then {
		//The strike accuracy in meters
		private "_accuracy";
		_accuracy = 100;
		
		//While Kerry is outside AO bring hell on him
		while { vehicle BIS_player distance _center > _distance } do {
			//Position of the arty strike
			private "_position";
			_position = [vehicle BIS_player, _accuracy, random 360] call BIS_fnc_relPos;
			
			//The arty round
			private "_round";
			_round = "M_NLAW_AT_F" createVehicle _position;
			
			//Increase strike accuracy for next round
			if (_accuracy > 0) then {
				_accuracy = _accuracy - 10;
			} else {
				vehicle BIS_player setDamage 1;
				BIS_player setDamage 1;
			};
			
			//Add some delay between each round
			sleep 10 + random 15;
		};
	};
	
	//Some delay between each update
	sleep 5;
};

//Log
"Showcase_Night\scripts\deserted.sqf" call BIS_fnc_log;
