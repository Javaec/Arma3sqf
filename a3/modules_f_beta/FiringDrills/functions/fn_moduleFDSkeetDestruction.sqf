private ["_pos", "_vel", "_color", "_colorArray", "_colorPostfix"];
_pos = [_this, 0, [10, 10, 10], [[]]] call BIS_fnc_param;
_vel = [_this, 1, [0, 0, 0], [[]]] call BIS_fnc_param;
_color = [_this, 2, "", [""]] call BIS_fnc_param;
_colorArray = [0.8, 0.8, 0.8];
if (_color != "") then 
{
	switch (toLower _color) do  
	{
		case "green": {_colorArray = [0.678,0.749,0.514];};
		case "red": {_colorArray = [0.694, 0.2, 0.224];};
		case "blue": {_colorArray = [0.404, 0.545, 0.608];};
		case "orange": {_colorArray = [0.941,0.510,0.192];};
		case "white": {_colorArray = [0.8,0.8,0.8];};
	};
};
_colorPostfix = "";
if (_color != "") then {_colorPostFix = "_" + _color;};

//---------- particle effect start ----------
private ["_velX", "_velY", "_velZ", "_slowB", "_slowS", "_impB", "_impS"];
_velX = _vel select 0;
_velY = _vel select 1;
_velZ = _vel select 2;
_slowB = 0.9;
_slowS = 0.5;
_impB = 2;
_impS = 10;

//dust
private ["_source01d"];
_source01d = "#particlesource" createVehicleLocal _pos;	
_source01d setPos _pos;
_source01d setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8, 0], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0], 5, 0.1275, 0.1, 0.15, [0.3,4.2],
						[_colorArray + [0.2],_colorArray + [0.1],_colorArray + [0.01]], [0,1], 0.1, 0.06, "", "", ""];
_source01d setParticleRandom [1.5, [0,0,0], [0.5,0.5,0.5], 20, 0.1, [0,0,0,0], 0.02, 0.02, 0];
_source01d setDropInterval 0.005; 

//small pieces
private ["_source01s"];
_source01s = "#particlesource" createVehicleLocal _pos;		
_source01s setPos _pos;
_source01s setParticleParams ["\A3\Structures_F\Training\Skeetmachine\Skeet_Clay_Part04" + _colorPostFix + "_F", "", "SpaceObject", 1, 2, [0, 0, 0], [_velX * _slowS, _velY * _slowS, _velZ * _slowS], 0, 10, 1, 0.05, [0.4],
						[_colorArray + [0.2],_colorArray + [0.1],_colorArray + [0.01]], [0,1], 0.1, 0.06, "", "", ""];
_source01s setParticleRandom [0.5, [0,0,0], [_impS,_impS,_impS], 4, 0.1, [0,0,0,0], 0.02, 0.02, 0];
_source01s setDropInterval 0.01; 

//bigger pieces
private ["_paramsArray", "_randomArray", "_int", "_source01b", "_source02b", "_source03b"];
_paramsArray = ["", "SpaceObject", 1, 30, [0, 0, 0], [_velX * _slowB, _velY * _slowB, _velZ * _slowB], 0, 10, 1, 0.05, [1],[_colorArray + [0.2],_colorArray + [0.1],_colorArray + [0.01]], [0,1], 0.1, 0.06, "", "", "", 0, false, 0.2];
_randomArray = [15, [0,0,0], [_impB,_impB,_impB], 4, 0.1, [0,0,0,0], 0.02, 0.02, 0, 0.2];
_int = 0.2;

_source01b = "#particlesource" createVehicleLocal _pos;		
_source01b setPos _pos;
_source01b setParticleParams (["\A3\Structures_F\Training\Skeetmachine\Skeet_Clay_Part01" + _colorPostFix + "_F"] + _paramsArray);
_source01b setParticleRandom _randomArray;
_source01b setDropInterval _int;

_source02b = "#particlesource" createVehicleLocal _pos;		
_source02b setPos _pos;
_source02b setParticleParams (["\A3\Structures_F\Training\Skeetmachine\Skeet_Clay_Part02" + _colorPostFix + "_F"] + _paramsArray);
_source02b setParticleRandom _randomArray;
_source02b setDropInterval _int;

_source03b = "#particlesource" createVehicleLocal _pos;		
_source03b setPos _pos;
_source03b setParticleParams (["\A3\Structures_F\Training\Skeetmachine\Skeet_Clay_Part03" + _colorPostFix + "_F"] + _paramsArray);
_source03b setParticleRandom _randomArray;
_source03b setDropInterval _int;

sleep 0.1;

deleteVehicle _source01d;
deleteVehicle _source01s;
deleteVehicle _source01b;
deleteVehicle _source02b;
deleteVehicle _source03b;

//---------- particle effect end ----------

true