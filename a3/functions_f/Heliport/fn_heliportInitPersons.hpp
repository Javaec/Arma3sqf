//--- Load identites
{
	_cfgIdentities = _x >> "cfgIdentities";

	for "_i" from 0 to (count _cfgIdentities - 1) do {
		_current = _cfgIdentities select _i;
		if (isclass _current) then {
			_class = configname _current;
			if !(isnil _class) then {

				_unit = missionnamespace getvariable _class;

				//--- Set identity
				_unit setidentity _class;

				//--- Set VIP status
				_unit call bis_fnc_heliportStaffKilled;

				//["Identity loaded for %1",_class] call bis_fnc_log;				
			};
		};
	};
} foreach [
	configfile,
	campaignconfigfile,
	missionconfigfile
];