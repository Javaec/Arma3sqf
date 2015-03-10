/*
	File: fn_animalSiteSpawn.sqf
	Author: Borivoj Hlava

	Description:
	Spawn of animals in animal sites.

	Parameter(s):
	_this select 0: Object - Site.
	_this select 1: Array - Spawned config classes.
	_this select 2: Number - Animals are spawned/deleted when the player is close/far to the site than this distance (in meters).

	Returned value:
	None
*/

if (isServer) then {
	_this spawn {
		_site = _this select 0;
		_animalList = _this select 1;
		_genDist = _this select 2;		//creation distance
		
		_sitePos = getPos _site;
		_active = false;
		_animalCount = _site getvariable ["animalCount",5];
		_radius = _site getvariable ["radius",10];	
		_siteAnimals = [];
		
		while {!(isNull _site)} do {
			_dist = 10000;
			{
				if (isPlayer _x) then {
					_checkDist = (_x distance _site) - _radius;
					if (_dist > _checkDist) then {_dist = _checkDist};
				};
			} forEach allUnits;

			if !(_active) then {
				if (_dist < _genDist) then {
					_count = round ((_animalCount - (_animalCount/5) + (random (_animalCount/2.5))));
					_i = 0;
					while {_i < _animalCount} do {
						_animal = _animalList select (round ((random ((count _animalList) - 0.01)) - 0.499));
						_pos = [((_sitePos select 0) - _radius + random (_radius * 2)), ((_sitePos select 1) - _radius + random (_radius * 2)), 0];
						_unit = createAgent [_animal,_pos,[],0,"NONE"];
						_unit setVariable ["inSite",_site];
						_unit setDir (random 360);
						_siteAnimals = _siteAnimals + [_unit];
						_i = _i + 1;
						sleep 0.05
					};
					_active = true
				}
			} else {
				if (_dist > (_genDist + _genDist/10)) then {
					{deleteVehicle _x} forEach _siteAnimals;
					_siteAnimals = [];
					_active = false;
				}
			};

			sleep (2.5 + random 1);
		};
	};
};