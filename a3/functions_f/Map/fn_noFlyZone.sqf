_trigger = [_this,0,objnull,[objnull]] call bis_fnc_param;
if (isnil "hsim_noFlyZones") then {[] call bis_fnc_noFlyZonesCreate;};

if (player in list _trigger) then {
	_type = [_this,1,-1,[0]] call bis_fnc_param;
	_mode = [_this,2,true,[true]] call bis_fnc_param;

	switch _type do {{

		//--- Airport (D)
		case 0: {
		};

		//--- International Airport (B)
		case 1: {
		};

		//--- Restricted
		case 2: {
		};
	};

	};
};
