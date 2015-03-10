// Keep screen black
("BIS_blackIn" call BIS_fnc_rscLayer) cutText ["", "BLACK FADED", 10e10];

[] spawn {
	waitUntil {time > 0};
	enableEnvironment false;
};

// Disable saving
"BIS_disabledSave" call BIS_fnc_disableSaving;

// Show cinema border
[0, 0, false, true] spawn BIS_fnc_cinemaBorder;

// Mission variables
BIS_hideLogo = false;
BIS_introEnded = false;
BIS_hasAmmo = false;
BIS_hasCompass = false;
BIS_hasMap = false;
BIS_endLoop = false;
BIS_targetsDown = false;
BIS_compassOpened = false;
BIS_regrouped = false;
BIS_terminateHeli = false;
BIS_courseCompleted = false;

// Set up the mission
#include "setup\VR.hpp"
#include "setup\characters.hpp"
#include "setup\anims.hpp"
#include "setup\scenes.hpp"

BIS_reprimands = [
	"x01_Adams_Shot_1",
	"x05_Adams_Shot_2",
	"x10_Adams_Shot_3"
];

BIS_reprimand_time = 0;

// Reprimand the player
BIS_reprimand = {
	if (time > BIS_reprimand_time) then {
		if (count BIS_reprimands == 0) then {
			// Replenish reprimands
			BIS_reprimands = [
				"x01_Adams_Shot_1",
				"x05_Adams_Shot_2",
				"x10_Adams_Shot_3"
			];
		};
		
		// Reprimand
		private ["_reprimand"];
		_reprimand = BIS_reprimands call BIS_fnc_selectRandom;
		_reprimand spawn BIS_fnc_missionConversations;
		BIS_reprimands = BIS_reprimands - [_reprimand];
		
		// Increase delay
		BIS_reprimand_time = time + 10;
	};
};

// Code to rearm the player
BIS_rearm = {
	private ["_unit", "_container"];
	_unit = _this select 0;
	_container = _this select 1;
	
	if (_container != _unit && (_container isKindOf "Man" || typeOf _container in ["GroundWeaponHolder", "WeaponHolderSimulated"])) then {
		// Delete container if necessary
		if (typeOf _container in ["GroundWeaponHolder", "WeaponHolderSimulated"]) then {
			clearWeaponCargo _container;
			clearMagazineCargo _container;
			clearItemCargo _container;
			clearBackpackCargo _container;
			deleteVehicle _container;
		};
		
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeVest _unit;
		removeHeadgear _unit;
		_unit linkItem "ItemRadio";
		_unit addUniform "U_B_Protagonist_VR";
		_unit addGoggles "G_Goggles_VR";
		
		// Add items if necessary
		if (BIS_hasCompass) then {_unit linkItem "ItemCompass"};
		if (BIS_hasMap) then {_unit linkItem "ItemMap"};
		
		// Add magazines if necessary
		if (BIS_hasAmmo) then {
			_unit addMagazines ["30Rnd_65x39_caseless_mag", 4];
		};
		
		// Add weapon
		_unit addWeapon "arifle_MX_Black_F";
		_unit selectWeapon primaryWeapon _unit;
		_unit switchMove "AmovPercMstpSrasWrflDnon";
		
		// Static reset effect
		titleRsc ["RscStatic", "PLAIN"];
		
		// Reprimand player
		[] call BIS_reprimand;
	};
};

// Handle if the player drops or takes other equipment
BIS_lacey addEventHandler ["Put", {_this call BIS_rearm}];
BIS_lacey addEventHandler ["Take", {_this call BIS_rearm}];

// Reprimand player if he tries to shoot Adams
BIS_adamsFake addEventHandler ["HitPart", {[] call BIS_reprimand}];

// Swap player when simulation starts
[] spawn {
	waitUntil {time > 0};
	selectPlayer BIS_laceyFake;
	{BIS_lacey disableAI _x} forEach ["ANIM", "AUTOTARGET", "MOVE", "TARGET"];
};

// Create marker at player's position
["BIS_firstMarker", "CREATE", position BIS_lacey] call BIS_markerControl;