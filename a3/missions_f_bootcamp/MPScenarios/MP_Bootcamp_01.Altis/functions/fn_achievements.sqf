// Defines
#define TOTAL_NUMBER_CHALLENGES 17

// Exit on dedicated server
if (isDedicated) exitWith {};

// Find out if we are dealing with a Recruit or a Instructor
if (!isNil { BIS_instructor } && { !isNull BIS_instructor } && { player == BIS_instructor }) then {
	["Instructor achievements tested, Player: %1, Achievement: %2, Condition: %3", player, "BCDrillInstructor", player getVariable "BIS_completedChallenges" >= TOTAL_NUMBER_CHALLENGES] call BIS_fnc_logFormat;
	
	// Drill Instructor
	if (!isNil { player getVariable "BIS_completedChallenges" } && { player getVariable "BIS_completedChallenges" >= TOTAL_NUMBER_CHALLENGES }) then {
		setStatValue ["BCDrillInstructor", 1];
		["Instructor achievement unlocked, Player: %1, Achievement: %2", player, "BCDrillInstructor"] call BIS_fnc_logFormat;
	};
} else {
	["Recruit achievements tested, Player: %1, Achievement: %2, Condition: %3, Player: %4, Achievement: %5, Condition: %6", player, "BCReadyForDuty", player getVariable "BIS_completedChallenges" >= TOTAL_NUMBER_CHALLENGES, player, "BCStarRecruit", isNil { player getVariable "BIS_starRecruitFailure" } && !isNil { player getVariable "BIS_presentInCombatChallenge" }] call BIS_fnc_logFormat;
	
	// Ready for duty
	if (!isNil { player getVariable "BIS_completedChallenges" } && { player getVariable "BIS_completedChallenges" >= TOTAL_NUMBER_CHALLENGES }) then {
		setStatValue ["BCReadyForDuty", 1];
		["Recruit achievement unlocked, Player: %1, Achievement: %2", player, "BCReadyForDuty"] call BIS_fnc_logFormat;
	};
	
	// Star Recruit
	if (isNil { player getVariable "BIS_starRecruitFailure" } && { !isNil { player getVariable "BIS_presentInCombatChallenge" } }) then {
		setStatValue ["BCStarRecruit", 1];
		["Recruit achievement unlocked, Player: %1, Achievement: %2", player, "BCStarRecruit"] call BIS_fnc_logFormat;
	};
};

["Achievements function terminated, IsServer: %1", isServer] call BIS_fnc_logFormat;
