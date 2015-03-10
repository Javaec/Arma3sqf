//create vehicle
private["_cfg","_variants","_variant","_class","_i","_path"];

_cfg = missionconfigfile >> "Vehicles" >> "Matrix";

for "_i" from 0 to ((count _cfg)-1) do
{
	_path = [_cfg select _i] call BIS_fnc_configPath;
	_class = _path select ((count _path) - 1);

	_variants = [_cfg >> _class] call BIS_fnc_getCfgDataArray;

	{
		if (vehicle player != _x) then
		{
			_variant  = _variants call BIS_fnc_selectRandom;

			[_x,_variant] call BIS_fnc_camp_setupVehicle;
		};
	}
	forEach (allMissionObjects _class);
};

/*
{
	_variant  = _x getVariable ["BIS_customizationId",""];

	if (_variant == "") then
	{
		["[i][%1] Vehicle type not customized!",typeOf _x] call BIS_fnc_logFormat;
	};
}
forEach (allMissionObjects "Car");
*/