// Do not allow units to flee
{
	_x allowFleeing 0;
} forEach allGroups;

// Start ambient combat sounds
[] execVM "\A3\Missions_F_EPA\Campaign_shared\Functions\AmbientLife\fn_camp_ambientCombatSounds.sqf";

// The maximum number of units that can be killed by artillery support before player being punished
BIS_artyFriendlyFireMax = 2;

// The container of how many friendly units killed using artillery
BIS_artyFriendlyFire = 0;

// Add killed event handler to all friendly units and check when killed by ARTY
{
	if (side _x == WEST) then {
		_x addEventHandler ["Killed", {
			private ["_killed", "_killer"];
			_killed = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
			_killer = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
			
			// Was killed by Arty
			if (_killer in crew BIS_supportArty1 + [BIS_supportArty1]) then {
				// Increment number of friendly fire
				BIS_artyFriendlyFire = BIS_artyFriendlyFire + 1;
				
				// Log
				["[Artillery Friendly Fire] Unit (%1) killed by (%2), Total units killed (%3/%4)", _killed, _killer, BIS_artyFriendlyFire, BIS_artyFriendlyFireMax] call BIS_fnc_logFormat;
				
				//If threshold has been reached, trigger Friendly Fire ending
				if (BIS_artyFriendlyFire > BIS_artyFriendlyFireMax) then {
					// End mission
					["FriendlyFire", false] call BIS_fnc_endMission;
					
					// Log
					["[Artillery Friendly Fire] Threshold of %1 units reached", BIS_artyFriendlyFireMax] call BIS_fnc_logFormat;
				};
			};
		}];
	};
} forEach allUnits;
