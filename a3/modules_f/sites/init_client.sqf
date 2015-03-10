waitUntil {!isNil "BIS_scrPath" && !isNull player && isPlayer player};

['[SITES] Initializing client (%1)...', name player] call BIS_fnc_logFormat; 

call compile preprocessFileLineNumbers (BIS_scrPath + "init_common.sqf");

["[SITES] Client initialized (%1)", name player] call BIS_fnc_logFormat;