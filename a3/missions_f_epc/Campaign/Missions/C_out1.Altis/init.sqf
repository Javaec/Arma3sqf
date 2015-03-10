["bis_missionInit",false] call BIS_fnc_blackOut;

#include "initBriefing.hpp"
#include "initMission.hpp"

waitUntil {!isNil "BIS_fnc_quotations_playing"};
waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
waitUntil {!BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};

["bis_missionInit"] call BIS_fnc_blackIn;