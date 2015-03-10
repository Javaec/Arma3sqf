_forced = FALSE;
_tempFTMarkers = []; // ---------- spawn FT markers for all available destinations

if (count _this == 1) then {		// ---------- forced FT
	_forced = TRUE;
	player setVariable ["BIS_FTDestination", position (_this select 0)]
} else {
	{
		if (player distance _x > 200) then {
			_mrkrName = format ["BIS_tempFT_%1", count _tempFTMarkers];
			_tempFTMarkers = (_tempFTMarkers + [_mrkrName]);
			createMarkerLocal [_mrkrName, position _x];
			_mrkrName setMarkerTypeLocal "selector_selectedMission";
			_mrkrName setMarkerSizeLocal [1.5, 1.5];
			_mrkrName setMarkerColorLocal "colorIndependent";
		}
	} forEach (player getVariable "BIS_FTDestinations");
	
	openMap [TRUE, FALSE];
	player setVariable ["BIS_FTDestination", [0,0,0]];
	
	// ---------- make sure a valid destination was selected
	onMapSingleClick {
		if ({[_pos select 0, _pos select 1] distance [(position _x) select 0, (position _x) select 1] < 250} count (player getVariable "BIS_FTDestinations") > 0) then {
			_selected = objNull;
			{if ((_pos distance position _x) < (_pos distance position _selected)) then {_selected = _x}} forEach (player getVariable "BIS_FTDestinations");
			player setVariable ["BIS_FTDestination", position _selected]
		} else {
			hint localize "STR_A3_mdl_sites_hint_FT_fail";
		}
	};
	
	waitUntil {!(visibleMap) || (player getVariable "BIS_FTDestination") distance [0,0,0] > 0}
};

if (visibleMap || _forced) then {
	_FTPos = player getVariable "BIS_FTDestination";
	openMap [FALSE, FALSE];
	titleCut ["", "BLACK OUT", 2];
	sleep 3;

	_minSpeed = 999;
	_travellers = [player];
	{_who = _x; if (_who distance player < 500 && if (formationLeader _who != player) then {{(expectedDestination _who) select 0 distance _x < 200} count allSites == 0} else {TRUE}) then {_travellers = _travellers + [_who]}} forEach (units player - [player]);
	_grpVehs = [];
	{
		if (!(vehicle _x in _grpVehs) && vehicle _x != vehicle leader _x) then {_grpVehs = _grpVehs + [vehicle _x]};
		_maxSpeed = getNumber (configFile >> "CfgVehicles" >> typeof vehicle _x >> "maxSpeed");
		if (_maxSpeed < _minSpeed) then {_minSpeed = _maxSpeed}
	} forEach _travellers;
	if ({vehicle _x == _x} count units player > 0 && _minSpeed > 15) then {_minSpeed = 15};
	
	if (!isMultiplayer) then {skipTime ((player distance _FTPos) / (_minSpeed * 1000))};	// ---------- skipped time is based on the speed of the slowest vehicle in the group
	
	// ---------- travellers are positioned in the relative direction between the start and the destination
	vehicle leader player setPos ([_FTPos, (25 + random 25), [_FTPos, player] call BIS_fnc_dirTo] call BIS_fnc_relPos);
	vehicle leader player setDir ([player, _FTPos] call BIS_fnc_dirTo);
	
	_i = 1;
	{_x setPos ([position vehicle leader player, 10 * _i, (direction vehicle leader player) - 180] call BIS_fnc_relPos); _i = _i + 1} forEach _grpVehs;
	{_x setDir direction vehicle leader player} forEach _grpVehs;
	
	titleCut ["", "BLACK IN", 2];
};

{deleteMarker _x} forEach _tempFTMarkers;
onMapSingleClick {}