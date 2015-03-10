#include "initBriefing.hpp"

_player = _this select 0;
_jip = _this select 1;

if !(_jip) then {
	0 setfog [0.2,0.1,5];
};

{
	_x setwaypointvisible false;
} foreach waypoints player;


//Wait for support variables
waitUntil {
	!isNil { BIS_availableBlue }
	&&
	!isNil { BIS_availableGreen }
};

//Add triggers for supports
{
	//Parameters
	private ["_requester", "_provider", "_available", "_index", "_support", "_side"];
	_requester	= _x select 0;
	_provider	= _x select 1;
	_available	= _x select 2;
	_index		= _x select 3;
	_support	= _x select 4;
	_side		= _x select 5;
	
	if (side group player == _side) then {
		//Trigger
		private "_trigger";
		_trigger = createTrigger ["EmptyDetector", [0,0,0]];
		_trigger setTriggerStatements [
			format ["(player getVariable ['%1', 0]) > 0", _support],
			format ["player setVariable ['%5', 0, true]; %3 set [%4, (%3 select %4) - 1]; publicVariable '%3'; if ((%3 select %4) < 1) then { [[%1, %2], 'BIS_fnc_removeSupportLink'] call BIS_fnc_mp; }; 'Player (%6) requested support (%5), Available calls (%3 select %4)' call BIS_fnc_log;", _requester, _provider, _available, _index, _support, name player],
			""
		];
	};
} forEach [
	//WEST
	["BIS_supportBlue", "BIS_supplyBlue", "BIS_availableBlue", 0, "BIS_SUPP_used_Drop", west],
	["BIS_supportBlue", "BIS_artyBlue", "BIS_availableBlue", 1, "BIS_SUPP_used_Artillery", west],
	["BIS_supportBlue", "BIS_casBlue", "BIS_availableBlue", 2, "BIS_SUPP_used_CAS_Heli", west],
	//Resistance
	["BIS_supportGreen", "BIS_supplyGreen", "BIS_availableGreen", 0, "BIS_SUPP_used_Drop", resistance],
	["BIS_supportGreen", "BIS_artyGreen", "BIS_availableGreen", 1, "BIS_SUPP_used_Artillery", resistance],
	["BIS_supportGreen", "BIS_casGreen", "BIS_availableGreen", 2, "BIS_SUPP_used_CAS_Heli", resistance]
];

if (side group player == west) then {
	BIS_supportBlue synchronizeObjectsAdd [player];
} else {
	BIS_supportGreen synchronizeObjectsAdd [player];
};
