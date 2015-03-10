private ["_confirm"];
_confirm = [localize "STR_A3_FIRING_DRILLS_CLEAR_STATS2", localize "STR_A3_FIRING_DRILLS_CLEAR_STATS1", true, true] call BIS_fnc_guiMessage;

waitUntil {!(isNil "_confirm")};

if (_confirm) then 
{
	"CONFIRMED" call BIS_fnc_log;
	
	private ["_cfgFiringDrills"];
	_cfgFiringDrills = configFile >> "CfgFiringDrills";

	for "_i" from 0 to ((count _cfgFiringDrills) - 1) do 
	{
		//TODO: relies on mission classes and this class to be the same (is not enforced?)
		private ["_class"];
		_class = _cfgFiringDrills select _i;
		if (isClass _class) then 
		{
			private ["_preFix", "_ruleSets"];
			_preFix = (configName _class) + "_" + (str 0) + "_";
			_ruleSets = _class >> "RuleSets";
			
			for "_k" from 0 to ((count _ruleSets) - 1) do 
			{
				profileNamespace setVariable [_preFix + (str _k), nil];
			};
		};
	};

	saveProfileNamespace;
};

true