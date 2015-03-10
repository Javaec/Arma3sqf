[_this] spawn {
	_site = _this select 0;
	_animalList = ["Hen_random_F","Hen_random_F","Hen_random_F","Hen_random_F","Cock_random_F"];
	_genDist = 500;

	[_site,_animalList,_genDist] call BIS_fnc_animalSiteSpawn;
};