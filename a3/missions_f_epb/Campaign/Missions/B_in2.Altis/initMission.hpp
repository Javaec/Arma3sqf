// creating compositions

_compositions = BIS_inf execVM "Compositions\Composition.sqf";

// Temporary loadout for Miller (ToDo: remove when fixed)
BIS_recon addUniform "U_BG_Guerilla2_3";
BIS_recon addVest "V_TacVest_blk";
removeHeadgear BIS_recon;
removeGoggles BIS_recon;
{BIS_recon linkItem _x} forEach ["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "NVGoggles"];

BIS_reconLoadout = {
	removeAllWeapons BIS_recon;
	BIS_recon addMagazines ["30Rnd_65x39_caseless_mag", 7];
	BIS_recon addWeapon "arifle_MX_Black_Hamr_pointer_F";
	BIS_recon addItem "FirstAidKit";
	BIS_recon selectWeapon primaryWeapon BIS_recon;
};

// Ensure unlimited ammo
[] call BIS_reconLoadout;
BIS_recon addEventHandler ["Fired", {[] call BIS_reconLoadout}];

// Define trigger sets
BIS_check2EntTrigs = [BIS_check2Ent1, BIS_check2Ent2];
BIS_check2ExtTrigs = [BIS_check2Ext1, BIS_check2Ext2];
BIS_exZone1 = [BIS_exZone1_1, BIS_exZone1_2];
BIS_exZone2 = [BIS_exZone2_1, BIS_exZone2_2];
BIS_exZones = (BIS_exZone1 + BIS_exZone2 + [BIS_exZone3]);

// Define unit sets
BIS_dropTeam = [BIS_dropLead, BIS_dropGuer1, BIS_dropGuer2, BIS_dropGuer3];
BIS_check1Guards = [BIS_offFriend, BIS_roadblock, BIS_driver, BIS_check1Guard1, BIS_check1Guard2];
BIS_check2Guards = ([BIS_offEnemy, BIS_check2Truck1, BIS_check2Truck2, BIS_check2Guard1, BIS_check2Guard2, BIS_check2Guard3, BIS_check2Guard4, BIS_check2Guard5, BIS_ambTank1, BIS_ambTank2, BIS_ambTruck1, BIS_checkTruck, BIS_checkTruckD, BIS_ambGuard1, BIS_ambGuard2, BIS_ambGuard3, BIS_ambGuard4] + units group BIS_check2Truck1C + units group BIS_ambTank1C + units group BIS_ambTank2C + units group BIS_ambTruck1G);
BIS_checkGuards = BIS_check1Guards + BIS_check2Guards;
BIS_attackers = [BIS_attacker1, BIS_attacker2, BIS_attacker3, BIS_attacker4, BIS_attacker5, BIS_attacker6, BIS_attacker7, BIS_attacker8];

// Track the status of the travel
BIS_atCheckpoint = 0;
BIS_offroad = false;

BIS_destroyTruck = {
	// Register its destruction
	BIS_truckDestroyed = true;
	
	waitUntil {BIS_inf distance BIS_truck > 50};
	
	// Hide negotiator
	BIS_negotiator hideObject true;
	BIS_negotiator enableSimulation false;
	BIS_negotiator setCaptive true;
	BIS_negotiator allowDamage false;
	[BIS_negotiator, 1000] call BIS_fnc_setHeight;
	
	// Destroy truck
	BIS_truck setDamage 1;
	
	// Kill support units
	{if (alive _x) then {_x setDamage 1}} forEach units BIS_factoryGroup;
};

{
	private ["_unit"];
	_unit = _x;
	
	// Prevent units from fleeing
	_unit allowFleeing 0;
	
	// Remove pistols
	{
		private ["_type"];
		_type = getNumber (configFile >> "CfgWeapons" >> _x >> "type");
		
		if (_type == 2) then {
			{_unit removeMagazines _x} forEach (getArray (configFile >> "CfgWeapons" >> _x >> "magazines"));
			_unit removeWeapon _x;
		};
	} forEach weapons _unit;
	
	// Remove rifle silencers (ToDo: remove when fixed?)
	{
		private ["_type"];
		_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
		if (_type == 101) then {_unit removePrimaryWeaponItem _x};
	} forEach primaryWeaponItems _unit;
} forEach (allUnits - [BIS_inf]);

// Hide waypoints
{_x setWaypointVisible false} forEach waypoints BIS_SFGroup;

// KAVALA
// Destroy buildings
{
	private ["_position", "_class"];
	_position = _x select 0;
	_class = _x select 1;
	
	private ["_building"];
	_building = _position nearestObject _class;
	_building setDamage 1;
} forEach [
	[[3757.26,13477.9,0.000263214], "Land_fs_roof_F"],
	[[3757.76,13485.9,-0.110536], "Land_fs_roof_F"],
	[[3732.57,12979.6,-0.0683002], "Land_Hospital_side2_F"],
	[[3732.57,12979.6,-0.0683002], "Land_Hospital_side2_F"],
	[[3764.66,13022.7,-0.043951], "Land_Hospital_side1_F"]
];

// POWERPLANT
// Destroy buildings
{
	private ["_position", "_class"];
	_position = _x select 0;
	_class = _x select 1;
	
	private ["_building"];
	_building = _position nearestObject _class;
	_building setDamage 1;
} forEach [
	[[4262.42,15068,-0.227665], "Land_dp_bigTank_F"],
	[[4244.39,15087.1,0.0729866], "Land_dp_smallTank_F"],
	[[4252.18,15044.6,-0.00175667], "Land_dp_smallTank_F"],
	[[4264.79,15048.3,-2.71464], "Land_dp_smallTank_F"],
	[[4261.82,15038.6,-0.000671387], "Land_spp_Transformer_F"],
	[[4296.85,15032.3,0.00229263], "Land_dp_bigTank_F"],
	[[4241.16,15011.6,0.039444], "Land_u_Addon_02_V1_F"],
	[[4183.97,15026.7,-0.0292492], "Land_cargo_house_slum_F"],
	[[4241.8,15057.7,0.0953884], "Land_TBox_F"],
	[[4225.89,15085.4,-0.0242424], "Land_cargo_house_slum_F"],
	[[4244.26,15072.5,-0.0267258], "Land_dp_smallTank_F"],
	[[4186.29,14950.5,0.0188761], "Land_u_Addon_02_V1_F"],
	[[4183.53,14945.3,-0.344453], "Land_u_Addon_01_V1_F"],
	[[4181.1,14944.7,-0.345064], "Land_u_Addon_01_V1_F"],
	[[4162.6,14956.1,-0.0584497], "Land_u_Addon_02_V1_F"]
];

// Build array of lamps
private ["_lamps"];
_lamps = (
	nearestObjects [
		markerPos "BIS_city",
		[
			"Land_LampDecor_F",
			"Land_LampStreet_small_F",
			"Land_PowerPoleWooden_L_F",
			"Land_LampStreet_F",
			"Land_LampShabby_F",
			"Land_LampHalogen_F"
		],
		1000
	]
)
+
(
	nearestObjects [
		markerPos "BIS_plant",
		[
			"Land_LampShabby_F",
			"Land_PowerPoleWooden_L_F",
			"Land_LampStreet_F"
		],
		150
	]
)
+
[[4922.34,16148.3,-0.000747681] nearestObject "Land_LampDecor_F"];

// Turn them off
{
	private ["_lamp"];
	_lamp = _x;
	{_lamp setHit [format ["Light_%1_hitpoint", _x], 1]} forEach [1,2,3,4,5,6,7,8];
} forEach _lamps;

// Ensure the truck always looks the same
[] spawn {
	scriptName "initMission.hpp: truck appearance control";
	
	waitUntil {time > 0};
	
	{BIS_truck animate [_x, 0]} forEach ["HideDoor1", "HideDoor2", "HideDoor3"];
	BIS_truck setObjectTexture [0, "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"];
	BIS_truck setObjectTexture [1, "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"];
};

// Change player's loadout
[] spawn {
	scriptName "initMission.hpp: loadout change";
	
	sleep 1;
	
	private ["_magazines", "_items"];
	_magazines = magazines BIS_inf;
	_items = items BIS_inf;
	
	private ["_class", "_path"];
	_class = "I_G_Story_Protagonist_F";
	_path = configFile >> "CfgVehicles" >> _class;
	
	// Find player's new uniform
	private ["_uniform"];
	_uniform = getText (_path >> "uniformClass");
	
	private ["_linkedItems", "_vest"];
	_linkedItems = getArray (_path >> "linkedItems");
	_vest = "";
	
	// Find player's new vest
	{
		private ["_type"];
		_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
		if (_type == 701) exitWith {_vest = _x};
	} forEach _linkedItems;
	
	// Remove unnecessary stuff
	removeHeadgear BIS_inf;
	removeGoggles BIS_inf;
	
	// Add new uniform and vest
	BIS_inf addUniform _uniform;
	BIS_inf addVest _vest;
	
	private ["_backpack"];
	_backpack = unitBackpack BIS_inf;
	
	if (!(isNull _backpack)) then {
		// Clear backpack of unnecessary stuff
		clearMagazineCargo _backpack;
		clearItemCargo _backpack;
	};
	
	// Add back magazines and items
	{BIS_inf addMagazine _x} forEach _magazines;
	{BIS_inf addItem _x} forEach _items;
	
	private ["_NVGs"];
	_NVGs = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"];
	
	if ({_x in assignedItems BIS_inf} count _NVGs == 0) then {
		if ({_x in items BIS_inf} count _NVGs == 0) then {
			// Give player NVGs
			BIS_inf linkItem "NVGoggles";
		} else {
			// Player has them, just not assigned
			private ["_items", "_options"];
			_items = items BIS_inf;
			_options = [];
			
			// Add first pair of NVGs found
			{if (_x in _NVGs) then {_options = _options + [_x]}} forEach _items;
			BIS_inf assignItem (_options select 0);
		};
	};
	
	// Ensure player has Compass, Map and Radio
	{
		private ["_item"];
		_item = _x;
		
		if (!(_item in assignedItems BIS_inf)) then {
			if (!(_item in items BIS_inf)) then {
				// Give player the item
				BIS_inf linkItem _item;
			} else {
				// Assign the item
				BIS_inf assignItem _item;
			};
		};
	} forEach ["ItemCompass", "ItemMap", "ItemRadio"];
	
	// Use the correct animation for the player
	private ["_anim"];
	_anim = if (primaryWeapon BIS_inf != "") then {
		// Has a rifle
		"AmovPknlMstpSlowWrflDnon"
	} else {
		if (handgunWeapon BIS_inf != "") then {
			// Has a handgun
			"AmovPknlMstpSlowWpstDnon"
		} else {
			// Has no weapon
			"AmovPknlMstpSnonWnonDnon"
		};
	};
	
	BIS_inf switchMove _anim;
};

// Track if player damages checkpoint guards
{
	_x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_checkDamaged = true};
			
			_damage
		}
	];
} forEach (BIS_check1Guards + BIS_check2Guards);

// Stop units from taking damage from anyone other than the player
{
	private ["_damageEH"];
	_damageEH = _x addEventHandler [
		"HandleDamage",
		{
			private ["_damage", "_source"];
			_damage = _this select 2;
			_source = _this select 3;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {_damage} else {0};
		}
	];
	
	_x setVariable ["BIS_damageEH", _damageEH];
} forEach [BIS_recon, BIS_2IC, BIS_SF1, BIS_SF2, BIS_SF3, BIS_SF4, BIS_negotiator];

// Punish the player for killing important units
{
	private ["_killedEH"];
	_killedEH = _x addEventHandler [
		"Killed",
		{
			private ["_source"];
			_source = _this select 1;
			
			if (_source in [vehicle BIS_inf, BIS_inf]) then {BIS_courtMartial = true};
		}
	];
	
	_x setVariable ["BIS_killedEH", _killedEH];
} forEach ([BIS_recon, BIS_2IC, BIS_SF1, BIS_SF2, BIS_SF3, BIS_SF4, BIS_negotiator] + BIS_dropTeam);

// Kill player if he enters the city
[] spawn {
	scriptName "initMission.hpp: city zone restriction";
	
	waitUntil {triggerActivated BIS_cityTrig};
	
	// Spawn artillery
	private ["_arty"];
	_arty = "Sh_155mm_AMOS" createVehicle [position vehicle BIS_inf select 0, position vehicle BIS_inf select 1, 1];
	_arty setVelocity [0,0,-1];
	
	waitUntil {!(alive _arty)};
	
	// Kill player
	{if (alive _x) then {_x setDamage 1}} forEach [vehicle BIS_inf, BIS_inf];
};

// Mission start
[] spawn {
	scriptName "initMission.hpp: mission start";
	
	if (!(isNil "BIS_missionScope")) then {
		sleep 2;
		
		["\A3\Missions_F_EPB\video\B_in2_12_hours_later.ogv", "STR_A3_B_in2_12_hours_later"] call BIS_fnc_quotations;
		
		waitUntil {BIS_fnc_quotations_playing || !(isNil "BIS_fnc_quotations_skip")};
		
		playMusic "LeadTrack03_F_EPB";
		
		[] spawn {
			scriptName "initMission.hpp: music control";
			
			private ["_time"];
			_time = time + 10;
			
			waitUntil {time >= _time || !(isNil "BIS_fnc_quotations_skip")};
			
			// Fade music
			30 fadeMusic 0.2;
		};
	};
	
	if (isNil "BIS_missionScope") then {
		// Immediately move to RV
		BIS_toRV = true;
	} else {
		waitUntil {!(BIS_fnc_quotations_playing) || !(isNil "BIS_fnc_quotations_skip")};
		
		sleep 1;
		
		// Make James watch the town
		BIS_2IC switchMove "HubShootingRangeKneel_move2";
		
		private ["_animEH"];
		_animEH = BIS_2IC addEventHandler [
			"AnimDone",
			{
				private ["_unit", "_anim"];
				_unit = _this select 0;
				_anim = toLower (_this select 1);
				
				switch (_anim) do {
					case "hubshootingrangekneel_move2": {
						// Make him continue watching the town
						_unit switchMove "HubShootingRangeKneel_move1";
					};
					
					case "hubshootingrangekneel_move1": {
						// Move to default animation
						_unit switchMove "HubShootingRangeKneel_shoot";
						
						_unit spawn {
							scriptName "initMission.hpp: animation reset";
							
							sleep 2;
							
							// Move him back to default state
							_this switchMove "AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon";
						};
					};
					
					case "amovpknlmstpsraswrfldnon_amovpknlmstpslowwrfldnon": {
						// Remove eventhandler
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						
						// Let him move again
						_unit enableAI "ANIM";
					};
				};
			}
		];
		
		BIS_2IC setVariable ["BIS_animEH", _animEH];
		
		(format ["%1_blackScreen", missionName]) call BIS_fnc_blackIn;
	};
	
	BIS_inf enableSimulation true;
	format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
	
	sleep 1;
	
	enableSentences false;
	
	if (!(isNil "BIS_missionScope")) then {
		// Rest of CTRG contact group
		[] spawn {
			scriptName "initMission.hpp: CTRG conversation";
			
			"BIS_CTRGReady" call BIS_fnc_missionConversations;
			"BIS_hungry" call BIS_fnc_missionConversations;
			
			// Stop CTRG lead talking on radio
			BIS_SF1 playMoveNow "Acts_listeningToRadio_Out";
			
			private ["_animEH"];
			_animEH = BIS_SF1 addEventHandler [
				"AnimDone",
				{
					private ["_unit", "_anim"];
					_unit = _this select 0;
					_anim = _this select 1;
					
					if (_anim == "Acts_listeningToRadio_Out") then {
						// Remove eventhandler
						_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
						_unit setVariable ["BIS_animEH", nil];
						
						// Let him move again
						{_unit enableAI _x} forEach ["ANIM", "MOVE"];
					};
				}
			];
			
			BIS_SF1 setVariable ["BIS_animEH", _animEH];
			
			"BIS_enRoute" call BIS_fnc_missionConversations;
			"BIS_prepare" call BIS_fnc_missionConversations;
			
			// 30 second time limit
			private ["_time"];
			_time = time + 30;
			
			waitUntil {!(isNil "BIS_takeEquipment") || time >= _time};
			
			if (time < _time) then {
				// Tell player to take equipment if he needs it
				"BIS_equipment" spawn BIS_fnc_missionConversations;
				waitUntil {time >= _time};
			};
			
			"BIS_moving" call BIS_fnc_missionConversations;
			
			// Move out
			BIS_toRV = true;
		};
		
		sleep 1;
		
		// Make new CTRG lead answer radio
		BIS_SF1 playMove "Acts_listeningToRadio_In";
		
		_animEH = BIS_SF1 addEventHandler [
			"AnimDone",
			{
				private ["_unit", "_anim"];
				_unit = _this select 0;
				_anim = _this select 1;
				
				if (_anim == "Acts_listeningToRadio_In") then {
					// Remove eventhandler
					_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
					_unit setVariable ["BIS_animEH", nil];
					
					// Switch to loop animation
					_unit playMoveNow "Acts_listeningToRadio_Loop";
				};
			}
		];
		
		BIS_SF1 setVariable ["BIS_animEH", _animEH];
	};
	
	waitUntil {!(isNil "BIS_toRV")};
	
	BIS_2IC setUnitPos "AUTO";
	
	{
		private ["_unit"];
		_unit = _x;
		
		{_unit enableAI _x} forEach ["ANIM", "MOVE"];
		_unit setBehaviour "AWARE";
		_unit playMoveNow "AmovPercMstpSrasWrflDnon";
	} forEach [BIS_2IC, BIS_SF1];
	
	// Join units together
	[BIS_SF1, BIS_inf] joinSilent BIS_SFGroup;
	
	// Set correct group ID
	BIS_SFGroup setGroupID [localize "STR_A3_Group_Ice1"];
	
	sleep 6;
	
	// Unhide plane
	BIS_flybyer hideObject false;
	BIS_flybyer enableSimulation true;
	BIS_flybyer allowDamage true;
};