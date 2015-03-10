[_this] spawn {
	_site = _this select 0;
	_animalList = ["Goat_random_F"];
	_genDist = 500;

	[_site,_animalList,_genDist] call BIS_fnc_animalSiteSpawn;
};