//Parameters
private ["_position", "_direction", "_distance"];
_position 	= [_this, 0, position player, [[]]] call BIS_fnc_param;
_distance	= [_this, 1, 500, [0]] call BIS_fnc_param;
_direction 	= [_this, 2, random 360, [0]] call BIS_fnc_param;

//Relative positionn
private "_relativePosition";
_relativePosition = [_position, _distance, _direction] call bis_fnc_relPos;

//The bold
private "_bolt";
_bolt = createvehicle ["LightningBolt", _relativePosition, [], 0, "can_collide"];
_bolt setVelocity [0, 0, -10];

//The lighting
_lighting = "lightning_F" createvehiclelocal _relativePosition;
_lighting setdir random 360;
_lighting setpos _relativePosition;

//The light source
_light = "#lightpoint" createvehiclelocal _relativePosition;
_light setpos _relativePosition;
_light setLightBrightness 30;
_light setLightAmbient [0.5, 0.5, 1];
_light setlightcolor [1, 1, 2];

//Some delay
sleep (0.2 + random 0.1);

//Clean up
deletevehicle _bolt;
deletevehicle _light;
deletevehicle _lighting;

//Some delay
sleep (1 + random 1);

//Random thunder sample
private "_thunder";
_thunder = ["thunder_1", "thunder_2"] call BIS_fnc_selectRandom;

//Play thunder sound
playSound _thunder;
