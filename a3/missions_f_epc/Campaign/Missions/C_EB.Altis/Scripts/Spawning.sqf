BIS_corpseRemoval = {
	_x addEventHandler ["Killed", {
		(_this select 0) spawn {
			waitUntil {{_x distance _this < 1750} count units BIS_grpMain == 0};
			_grp = group _this;
			deleteVehicle _this;
			if (count units _grp == 0) then {deleteGroup _grp};
		};
	}]
};

BIS_civilCars = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_Offroad_01_RP_F",
	"C_Quadbike_01_F",
	"C_SUV_01_F",
	"C_Van_01_box_F",
	"C_Van_01_transport_F"
];

BIS_civilCars_garage = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_SUV_01_F"
];

[] spawn {
	waitUntil {!(isNil "BIS_initSitesDone")};

	{_x call BIS_corpseRemoval} forEach allUnits;
};


waitUntil {!(isNil "BIS_initSitesDone") && !(isNil "BIS_fps_manager_init")};

{

// *******************
// Patrolling infantry
// *******************

// ***
// AAF
// ***

	if (triggerText _x == "AAF_Infantry") then {
		_x spawn {

			_groupCategory = (triggerStatements _this) select 1;
			_groupType = (triggerStatements _this) select 2;

			_groupCategoryClass = switch (_groupCategory) do {

				case "Infantry": {"Infantry"};
				case "Support": {"Support"};

			};

			_groupTypeClass = switch (_groupType) do {

				case "AA_Team": {"HAF_InfTeam_AA"};
				case "AT_Team": {"HAF_InfTeam_AT"};
				case "EOD_Team": {"HAF_Support_EOD"};
				case "GMG_Team": {"HAF_Support_GMG"};
				case "MG_Team": {"HAF_Support_MG"};
				case "Mortar_Team": {"HAF_Support_Mort"};
				case "Repair_Team": {"HAF_Support_ENG"};
				case "Sniper_Team": {"HAF_SniperTeam"};
				case "Squad": {"HAF_InfSquad"};
				case "Team": {"HAF_InfTeam"};

			};

			_basePos = position _this;
			_rad = (triggerArea _this) select 0;
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < (1500 + _rad) && (_x distance _basePos) >= (250 + _rad) && !(vehicle _x isKindOf "Air")} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};
			for [{_x = 1}, {_x <= (_rad / 50)}, {_x = _x + 1}] do {
				_pos = [_basePos, random _rad, random 360] call BIS_fnc_relPos;
				_newGrp = grpNull;

					_newGrp = [_pos, Resistance, configFile >> "CfgGroups" >> "Indep" >> "Ind_F" >> _groupCategoryClass >> _groupTypeClass, [], [], [0.40, 0.60]] call BIS_fnc_spawnGroup;

				{_x call BIS_corpseRemoval} forEach units _newGrp;

				{_x unlinkItem "NVGoggles_indep"} forEach (units _newGrp);
				{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (units _newGrp);
				{_x addPrimaryWeaponItem "acc_flashlight"} forEach (units _newGrp);
				{_x allowFleeing 0} forEach (units _newGrp);

				[_newGrp, _rad] spawn {
					_oldFPSStep = BIS_fps_simulSteps;
					while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
						waitUntil {BIS_fps_simulSteps > _oldFPSStep};
						if ({(_x distance leader (_this select 0)) < (2000 + (_this select 1))} count units BIS_grpMain == 0) exitWith {};
						_oldFPSStep = BIS_fps_simulSteps;
					};
					{deleteVehicle _x} forEach units (_this select 0);
					deleteGroup (_this select 0);
					BIS_fps_rescanNewObjects = TRUE;
				};
					{
						_wp = _newGrp addWaypoint [_basePos, _rad];
						_wp setWaypointType "SaD";
						_wp setWaypointBehaviour "Combat";
					} forEach [1, 2, 3, 4, 5];
					_wp = _newGrp addWaypoint [waypointPosition [_newGrp, 1], 0];
					_wp setWaypointType "CYCLE";
				
			};
			BIS_fps_rescanNewObjects = TRUE;
		};
	};

// ****
// CSAT
// ****

	if (triggerText _x == "CSAT_Infantry") then {
		_x spawn {

			_groupCategory = (triggerStatements _this) select 1;
			_groupType = (triggerStatements _this) select 2;

			_groupCategoryClass = switch (_groupCategory) do {

				case "Infantry": {"Infantry"};
				case "Support": {"Support"};
				case "Urban": {"UInfantry"};
			};

			_groupTypeClass = switch (_groupType) do {

				case "AA_Team": {"OIA_InfTeam_AA"};
				case "AT_Team": {"OIA_InfTeam_AT"};
				case "EOD_Team": {"OI_support_EOD"};
				case "GMG_Team": {"OI_support_GMG"};
				case "MG_Team": {"OI_support_MG"};
				case "Mortar_Team": {"OI_support_Mort"};
				case "Recon_Patrol": {"OI_reconPatrol"};
				case "Recon_Team": {"OI_reconTeam"};
				case "Repair_Team": {"OI_support_ENG"};
				case "Sniper_Team": {"OI_SniperTeam"};
				case "Squad": {"OIA_InfSquad"};
				case "Team": {"OIA_InfTeam"};
				case "Urban_Squad": {"OIA_GuardSquad"};
				case "Urban_Team": {"OIA_GuardTeam"};

			};

			_basePos = position _this;
			_rad = (triggerArea _this) select 0;
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < (1500 + _rad) && (_x distance _basePos) >= (250 + _rad) && !(vehicle _x isKindOf "Air")} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};
			for [{_x = 1}, {_x <= (_rad / 50)}, {_x = _x + 1}] do {
				_pos = [_basePos, random _rad, random 360] call BIS_fnc_relPos;
				_newGrp = grpNull;

					_newGrp = [_pos, EAST, configFile >> "CfgGroups" >> "East" >> "OPF_F" >> _groupCategoryClass >> _groupTypeClass, [], [], [0.40, 0.60]] call BIS_fnc_spawnGroup;

				{_x call BIS_corpseRemoval} forEach units _newGrp;

				{_x unlinkItem "NVGoggles_opfor"} forEach (units _newGrp);
				{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (units _newGrp);
				{_x addPrimaryWeaponItem "acc_flashlight"} forEach (units _newGrp);
				{_x removePrimaryWeaponItem "muzzle_snds_H"} forEach (units _newGrp);
				{_x removePrimaryWeaponItem "muzzle_snds_B"} forEach (units _newGrp);
				{_x removeHandgunItem "muzzle_snds_L"} forEach (units _newGrp);
				{_x allowFleeing 0} forEach (units _newGrp);

				[_newGrp, _rad] spawn {
					_oldFPSStep = BIS_fps_simulSteps;
					while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
						waitUntil {BIS_fps_simulSteps > _oldFPSStep};
						if ({(_x distance leader (_this select 0)) < (2000 + (_this select 1))} count units BIS_grpMain == 0) exitWith {};
						_oldFPSStep = BIS_fps_simulSteps;
					};
					{deleteVehicle _x} forEach units (_this select 0);
					deleteGroup (_this select 0);
					BIS_fps_rescanNewObjects = TRUE;
				};
					{
						_wp = _newGrp addWaypoint [_basePos, _rad];
						_wp setWaypointType "SaD";
						_wp setWaypointBehaviour "Combat";
					} forEach [1, 2, 3, 4, 5];
					_wp = _newGrp addWaypoint [waypointPosition [_newGrp, 1], 0];
					_wp setWaypointType "CYCLE";
				
			};
			BIS_fps_rescanNewObjects = TRUE;
		};
	};
	
// ***
// FIA
// ***

	if (triggerText _x == "FIA_Infantry") then {
		_x spawn {

			_groupCategory = (triggerStatements _this) select 1;
			_groupType = (triggerStatements _this) select 2;

			_groupCategoryClass = switch (_groupCategory) do {

				case "Infantry": {"Infantry"};

			};

			_groupTypeClass = switch (_groupType) do {

				case "Squad": {"IRG_InfSquad"};
				case "Team": {"IRG_InfTeam"};

			};

			_basePos = position _this;
			_rad = (triggerArea _this) select 0;
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < (1500 + _rad) && (_x distance _basePos) >= (250 + _rad) && !(vehicle _x isKindOf "Air")} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};
			for [{_x = 1}, {_x <= (_rad / 50)}, {_x = _x + 1}] do {
				_pos = [_basePos, random _rad, random 360] call BIS_fnc_relPos;
				_newGrp = grpNull;

					_newGrp = [_pos, WEST, configFile >> "CfgGroups" >> "West" >> "Guerilla" >> _groupCategoryClass >> _groupTypeClass, [], [], [0.40, 0.60]] call BIS_fnc_spawnGroup;

				{_x call BIS_corpseRemoval} forEach units _newGrp;

				{_x allowFleeing 0} forEach (units _newGrp);
				{_x addPrimaryWeaponItem "acc_flashlight"} forEach (units _newGrp);

				[_newGrp, _rad] spawn {
					_oldFPSStep = BIS_fps_simulSteps;
					while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
						waitUntil {BIS_fps_simulSteps > _oldFPSStep};
						if ({(_x distance leader (_this select 0)) < (2000 + (_this select 1))} count units BIS_grpMain == 0) exitWith {};
						_oldFPSStep = BIS_fps_simulSteps;
					};
					{deleteVehicle _x} forEach units (_this select 0);
					deleteGroup (_this select 0);
					BIS_fps_rescanNewObjects = TRUE;
				};
					{
						_wp = _newGrp addWaypoint [_basePos, _rad];
						_wp setWaypointType "SaD";
						_wp setWaypointBehaviour "Combat";
					} forEach [1, 2, 3, 4, 5];
					_wp = _newGrp addWaypoint [waypointPosition [_newGrp, 1], 0];
					_wp setWaypointType "CYCLE";
				
			};
			BIS_fps_rescanNewObjects = TRUE;
		};
	};

// ****
// NATO
// ****

	if (triggerText _x == "NATO_Infantry") then {
		_x spawn {

			_groupCategory = (triggerStatements _this) select 1;
			_groupType = (triggerStatements _this) select 2;

			_groupCategoryClass = switch (_groupCategory) do {

				case "Infantry": {"Infantry"};
				case "Support": {"Support"};
			};

			_groupTypeClass = switch (_groupType) do {

				case "AA_Team": {"BUS_InfTeam_AA"};
				case "AT_Team": {"BUS_InfTeam_AT"};
				case "EOD_Team": {"BUS_Support_EOD"};
				case "GMG_Team": {"BUS_Support_GMG"};
				case "MG_Team": {"BUS_Support_MG"};
				case "Mortar_Team": {"BUS_Support_Mort"};
				case "Recon_Patrol": {"BUS_ReconPatrol"};
				case "Recon_Team": {"BUS_ReconTeam"};
				case "Repair_Team": {"BUS_Support_ENG"};
				case "Sniper_Team": {"BUS_SniperTeam"};
				case "Squad": {"BUS_InfSquad"};
				case "Team": {"BUS_InfTeam"};

			};

			_basePos = position _this;
			_rad = (triggerArea _this) select 0;
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < (1500 + _rad) && (_x distance _basePos) >= (250 + _rad) && !(vehicle _x isKindOf "Air")} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};
			for [{_x = 1}, {_x <= (_rad / 50)}, {_x = _x + 1}] do {
				_pos = [_basePos, random _rad, random 360] call BIS_fnc_relPos;
				_newGrp = grpNull;

					_newGrp = [_pos, WEST, configFile >> "CfgGroups" >> "West" >> "BLU_F" >> _groupCategoryClass >> _groupTypeClass, [], [], [0.40, 0.60]] call BIS_fnc_spawnGroup;

				{_x call BIS_corpseRemoval} forEach units _newGrp;

				{_x unlinkItem "NVGoggles"} forEach (units _newGrp);
				{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (units _newGrp);
				{_x addPrimaryWeaponItem "acc_flashlight"} forEach (units _newGrp);
				{_x removePrimaryWeaponItem "muzzle_snds_H"} forEach (units _newGrp);
				{_x removeHandgunItem "muzzle_snds_L"} forEach (units _newGrp);
				{_x allowFleeing 0} forEach (units _newGrp);

				[_newGrp, _rad] spawn {
					_oldFPSStep = BIS_fps_simulSteps;
					while {TRUE} do {	// no need to test every frame, use Simulation Manager test loops instead
						waitUntil {BIS_fps_simulSteps > _oldFPSStep};
						if ({(_x distance leader (_this select 0)) < (2000 + (_this select 1))} count units BIS_grpMain == 0) exitWith {};
						_oldFPSStep = BIS_fps_simulSteps;
					};
					{deleteVehicle _x} forEach units (_this select 0);
					deleteGroup (_this select 0);
					BIS_fps_rescanNewObjects = TRUE;
				};
					{
						_wp = _newGrp addWaypoint [_basePos, _rad];
						_wp setWaypointType "SaD";
						_wp setWaypointBehaviour "Combat";
					} forEach [1, 2, 3, 4, 5];
					_wp = _newGrp addWaypoint [waypointPosition [_newGrp, 1], 0];
					_wp setWaypointType "CYCLE";
				
			};
			BIS_fps_rescanNewObjects = TRUE;
		};
	};

// *******************
// Patrolling vehicles
// *******************

	if (triggerText _x == "AAF_Vehicle") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 1500} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_vehClass = switch (_vehType) do {

				case "AAF_MRAP_HMG": {"I_MRAP_03_hmg_F"};
				case "AAF_MRAP_GMG": {"I_MRAP_03_gmg_F"};
				case "AAF_LightArmor": {"I_APC_Wheeled_03_cannon_F"};
				case "AAF_MediumArmor": {"I_APC_tracked_03_cannon_F"};
				case "AAF_HeavyArmor": {"I_MBT_03_cannon_F"};
				case "AAF_Speedboat": {"I_Boat_Armed_01_minigun_F"};

			};
			_veh = ([_basePos, _dir, _vehClass, Resistance] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;

			clearItemCargo (_veh select 0);
			ClearMagazineCargo (_veh select 0);
			clearWeaponCargo (_veh select 0);

			(_veh select 0) setFuel (0.15 + (random 0.15));
			(_veh select 0) setVehicleAmmo (0.2 + (random 0.2));
			(_veh select 0) setDamage (random 0.25);

			{_x unlinkItem "NVGoggles_indep"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "CSAT_Vehicle") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 1500} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_vehClass = switch (_vehType) do {

				case "CSAT_MRAP_HMG": {"O_MRAP_02_hmg_F"};
				case "CSAT_MRAP_GMG": {"O_MRAP_02_gmg_F"};
				case "CSAT_LightArmor": {"O_APC_Wheeled_02_rcws_F"};
				case "CSAT_MediumArmor": {"O_APC_Tracked_02_cannon_F"};
				case "CSAT_HeavyArmor": {"O_MBT_02_cannon_F"};
				case "CSAT_AA": {"O_APC_Tracked_02_AA_F"};
				case "CSAT_Speedboat": {"O_Boat_Armed_01_hmg_F"};

			};
			_veh = ([_basePos, _dir, _vehClass, East] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;

			clearItemCargo (_veh select 0);
			ClearMagazineCargo (_veh select 0);
			clearWeaponCargo (_veh select 0);

			(_veh select 0) setFuel (0.15 + (random 0.15));
			(_veh select 0) setVehicleAmmo (0.2 + (random 0.2));
			(_veh select 0) setDamage (random 0.25);

			{_x unlinkItem "NVGoggles_opfor"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "FIA_Vehicle") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 1500} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_vehClass = switch (_vehType) do {

				case "FIA_Offroad_HMG": {"B_G_Offroad_01_armed_F"};
			};

			_veh = ([_basePos, _dir, _vehClass, WEST] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;

			clearItemCargo (_veh select 0);
			ClearMagazineCargo (_veh select 0);
			clearWeaponCargo (_veh select 0);

			(_veh select 0) setFuel (0.15 + (random 0.15));
			(_veh select 0) setVehicleAmmo (0.2 + (random 0.2));
			(_veh select 0) setDamage (random 0.25);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "NATO_Vehicle") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 1500} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_vehClass = switch (_vehType) do {

				case "NATO_MRAP_HMG": {"B_MRAP_01_hmg_F"};
				case "NATO_MRAP_GMG": {"B_MRAP_01_gmg_F"};
				case "NATO_LightArmor": {"B_APC_Tracked_01_rcws_F"};
				case "NATO_MediumArmor": {"B_APC_Wheeled_01_cannon_F"};
				case "NATO_HeavyArmor": {"B_MBT_01_cannon_F"};
				case "NATO_AA": {"B_APC_Tracked_01_AA_F"};
				case "NATO_Speedboat": {"B_Boat_Armed_01_minigun_F"};

			};
			_veh = ([_basePos, _dir, _vehClass, WEST] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;

			clearItemCargo (_veh select 0);
			ClearMagazineCargo (_veh select 0);
			clearWeaponCargo (_veh select 0);

			(_veh select 0) setFuel (0.15 + (random 0.15));
			(_veh select 0) setVehicleAmmo (0.2 + (random 0.2));
			(_veh select 0) setDamage (random 0.25);

			{_x unlinkItem "NVGoggles"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "Wipeout") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 2000} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_veh = ([_basePos, _dir, "B_Plane_CAS_01_F", WEST] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;


			(_veh select 0) setFuel (0.30 + (random 0.30));
			(_veh select 0) setVehicleAmmo (0.40 + (random 0.35));

			{_x unlinkItem "NVGoggles"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "Neophron") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 2000} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_veh = ([_basePos, _dir, "O_Plane_CAS_02_F", EAST] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;


			(_veh select 0) setFuel (0.25 + (random 0.25));
			(_veh select 0) removeMagazine "4Rnd_Missile_AGM_01_F";
			(_veh select 0) setVehicleAmmo (0.30 + (random 0.30));

			{_x unlinkItem "NVGoggles_opfor"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "Blackfoot") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 2000} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_veh = ([_basePos, _dir, "B_Heli_Attack_01_F", WEST] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;


			(_veh select 0) setFuel (0.25 + (random 0.25));
			(_veh select 0) setVehicleAmmo (0.25 + (random 0.25));

			{_x unlinkItem "NVGoggles"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "Pawnee") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 2000} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_veh = ([_basePos, _dir, "B_Heli_Light_01_armed_F", WEST] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;


			(_veh select 0) setFuel (0.25 + (random 0.25));
			(_veh select 0) setVehicleAmmo (0.50 + (random 0.50));

			{_x unlinkItem "NVGoggles"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "Orca") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 2000} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_veh = ([_basePos, _dir, "O_Heli_Light_02_F", EAST] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;


			(_veh select 0) setFuel (0.25 + (random 0.25));
			(_veh select 0) removeMagazine "12Rnd_PG_missiles";
			(_veh select 0) setVehicleAmmo (0.30 + (random 0.30));

			{_x unlinkItem "NVGoggles_opfor"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	if (triggerText _x == "Hellcat") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			_vehType = (triggerStatements _this) select 1;
			_wpPath = group ((synchronizedObjects _this) select 0);	// synchronized civilian unit is used as waypoint storage
			deleteVehicle ((synchronizedObjects _this) select 0);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 2000} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};

			_veh = ([_basePos, _dir, "I_Heli_light_03_F", Resistance] call BIS_fnc_spawnVehicle);
			{_x call BIS_corpseRemoval} forEach (_veh select 1);
			(_veh select 2) copyWaypoints _wpPath;


			(_veh select 0) setFuel (0.25 + (random 0.25));
			(_veh select 0) setVehicleAmmo (0.30 + (random 0.30));

			{_x unlinkItem "NVGoggles_indep"} forEach (_veh select 1);
			{_x removePrimaryWeaponItem "acc_pointer_ir"} forEach (_veh select 1);

			BIS_fps_rescanNewObjects = TRUE;

		};
	};

	// civilian vehicles
	if (triggerText _x == "GEN_civilCar") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_dir = _dir - 90;
			deleteVehicle _this;
			if (random 1 >= 0.25) then {	// don't need to have all the vehicles present
				_oldFPSStep = BIS_fps_simulSteps;
				while {TRUE} do {
					waitUntil {BIS_fps_simulSteps > _oldFPSStep};
					if ({(_x distance _basePos) < 2000} count units BIS_grpMain > 0) exitWith {};
					_oldFPSStep = BIS_fps_simulSteps;
				};
				_veh = (BIS_civilCars select floor random count BIS_civilCars) createVehicle _basePos;
				_veh setFuel (0.15 + (random 0.15));
				_veh setHit ["karoserie",(0.15 + (random 0.45))];
 				_veh setHit ["engine",(0.15 + (random 0.45))];
				_veh setHit ["motor",(0 + (random 0.45))];
				_veh setDir _dir;
				_veh setVelocity [0, 0, -1];
				clearItemCargo _veh;
				BIS_fps_rescanNewObjects = TRUE;
			};
		};
	};
	
	// ammoboxes
	if (triggerText _x == "GEN_ammo") then {
		_x spawn {
			_basePos = position _this;
			_dir = (triggerArea _this) select 2;
			if (_dir < 0) then {_dir = 360 + _dir};
			_boxPoolMin = (triggerTimeout _this) select 0; if (_boxPoolMin == 0) then {_boxPoolMin = 3};	// use timeout values in triggers to define how many boxes should be spawned
			_boxPoolMax = (triggerTimeout _this) select 2; if (_boxPoolMax == 0) then {_boxPoolMax = 3};
			_boxPool = _boxPoolMin + round random (_boxPoolMax - _boxPoolMin);
			deleteVehicle _this;
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _basePos) < 1500} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};
			_boxes = +BIS_ammoBoxes;
			_boxes resize _boxPool;
			[_boxes, _basePos, _dir] call BIS_spawnAmmo;
			BIS_fps_rescanNewObjects = TRUE;
		};
	};
} forEach (allMissionObjects "EmptyDetector");

// civilian vehicles in garages
{
	if (random 1 > 0.60) then {
		_x spawn {
			_oldFPSStep = BIS_fps_simulSteps;
			while {TRUE} do {
				waitUntil {BIS_fps_simulSteps > _oldFPSStep};
				if ({(_x distance _this) < 1500} count units BIS_grpMain > 0) exitWith {};
				_oldFPSStep = BIS_fps_simulSteps;
			};
			_garageArr = (_this nearObjects ["House", 4]);
			if ((count _garageArr) > 0) then {
				_garage = _garageArr select 0;
				if ((typeOf _garage) in ["Land_i_Garage_V1_dam_F", "Land_i_Garage_V1_F", "Land_i_Garage_V2_dam_F", "Land_i_Garage_V2_F", "Land_i_Shed_Ind_F"]) then {
					_dir = direction _garage;
					_veh = (BIS_civilCars_garage select floor random count BIS_civilCars_garage) createVehicle [100 + random 100, 100 + random 100, 100 + random 100];
					if (random 1 >= 0.25) then {_veh setDir (_dir + 90)} else {_veh setDir (_dir - 90)};
					_veh setPos [_this select 0, _this select 1, (_this select 2) + 0.3];
					_veh setFuel random 1;
					_veh setVelocity [0, 0, -0.1];
					BIS_fps_rescanNewObjects = TRUE;
				};
			};
		};	
	};
} forEach [[3600.54,13334.1,0.418342],[3601.27,13655.4,0.00461102],[3703.55,13362.3,0.592755],[3696.55,13409.8,0.577665],[3690.62,13718,0.25249],[3745.56,13287.9,0.132163],[3736.53,13280.2,0.147925],[3741.06,13284,0.0683327],[3750.08,13291.8,0.348058],[3745.62,13323.5,0.251697],[3731.01,13675.9,0.17119],[3754.66,13315.7,0.0906019],[3763.72,13308,0.0848103],[3759.18,13311.9,0.102081],[3750.14,13319.6,0.140862],[3769.05,13817.4,0.30899],[3780.43,13546.9,0.101624],[3802.41,13857.5,0.544609],[3867.42,13645,0.0364876],[3882.38,13399,0.0091629],[3879.42,13752.8,0.164242],[3924.07,13581.5,0.195309],[3929.92,13605.2,0.319448],[3719.95,11673.6,-0.009758],[3715.81,11761,0.215445],[3721.29,11949,0.00485229],[3777.85,11591.6,-0.106504],[3770.3,11682.7,-0.0660391],[3751.7,11882.9,0.0696507],[3846.94,11423.9,0.0854378],[3881.54,11570.3,0.0637341],[3871.09,11732.4,-0.0228424],[3941.5,11642.4,0.108885],[3990.73,11507.9,0.141983],[4007.37,11642.8,0.589748],[3997.36,11696.1,1.23679],[4075.74,11716.4,0.128113],[4059.66,11702.5,0.300327],[4057.65,11772.4,0.00507736],[4140.83,11785.8,0.320583],[4177.11,11695.5,0.255062],[4217.62,11858.5,-0.0896416],[4747.06,11120.9,-0.00346756],[4948.35,11451,0.423267],[5061.54,11183.2,0.629578],[4960.03,11394,-0.00647354],[5060.29,11356.3,0.361656],[5086.62,10822.5,0.47604],[5073.9,11079.1,0.321083],[5149.33,11114.1,0.389046],[4913.31,11127.1,0.531658],[4995.04,11058.8,0.158478],[5233.97,11529.9,0.365044],[9258.66,11898.6,-0.00502014],[8899.89,12105.2,0.205624],[9139.57,12055.3,0.150557],[9214.93,12099.8,0.480391],[9319.27,11913.6,0.0596514],[9342.37,11904.9,0.054328],[9415.2,11778.3,-0.00352669],[9397.44,11762.5,-0.0013485],[9431.86,11714.9,0.00691032],[9466.21,11671.7,0.238441],[8998.35,11685.7,0.227722],[9283.56,12120.6,0.100071],[10571.9,12381.5,0.0439129],[10776.5,12367.4,-0.0427017],[10472.2,12396.2,0.0382357],[10563.1,12249.9,0.00322342],[10704.9,12220.6,0.0529785],[10720.6,12299.5,-0.0160675],[10766.6,12177.9,0.187164],[10742.6,12132.6,0.286682],[11693.5,13668.3,0.0277557],[11709.6,13685.7,0.124694],[11777.7,13744,0.000313759],[11842.5,14142.9,-0.0781279],[11922.8,13962.9,0.0194731],[11532.9,13591.3,0.289733],[11871.4,13783.3,0.0983047],[12430.8,14194.4,0.0438204],[12536.7,14213.7,-0.0616331],[12270.5,14273,0.0775156],[12348.5,14305.5,0.122203],[12384.3,14191.7,0.0870099],[12367.8,14283.4,0.0514193],[12400.9,14225.3,0.016283],[12473.5,14423.2,0.162768],[12470.7,14507.7,0.14382],[12483.1,14359.1,0.0329571],[12487.2,14441.4,0.180368],[12523.9,14267.6,0.131302],[12528.6,14516.9,-0.0210476],[12544.5,14314,0.0231943],[12552.5,14433.4,0.0766697],[12624,14389.3,0.176165],[12615.4,14420.5,0.0431366],[12643.2,14311.1,0.179505],[12647.5,14341.9,-0.0217953],[12644.2,14376.3,0.220379],[12717.9,14313.6,0.20515],[12743.1,14419.7,0.151621],[12164.9,14371,0.0378628],[12299.2,14553.2,0.0967741],[12355.2,14351.6,0.213473],[12672.1,14509.8,0.284494],[12704.3,14732.5,0.293192],[12819.4,14307.8,0.105487],[12807.6,15036,-0.0789642],[12945,14975.9,0.0728512],[12976.1,15006.5,0.188555],[12596.2,15377.4,0.110825],[12296.7,15551.6,-0.0875549],[12299.8,15698.7,0.00554466],[12435.5,15491.6,0.0706615],[12423.9,15557.8,0.27906],[12457.4,15488.1,-0.0354156],[12556.2,15558.4,0.108295],[12430.7,15838.9,0.132027],[12568.6,15867.2,0.158102],[12552.9,15918.6,0.519804],[11158.7,14503.1,0.0816536],[10815.3,14310.7,0.500065],[11113.7,14470.7,0.222565],[11158.2,14616.9,0.398827],[11361.9,14175.2,0.011282],[11396.2,14759.3,0.282906],[9250.21,15856.5,0.208893],[9070.84,15804.3,0.521759],[9114.39,15853,0.407173],[9167.55,15850.9,0.369316],[9283.98,15917.4,0.145691],[9356.41,15896.6,0.000831604],[9395.08,15974.6,0.002388],[9405.83,16017.6,-0.000534058],[9431.61,15871.8,0.011673],[9457.69,15900.6,-0.0255432],[9457.35,15965.1,0.132881],[9564.16,16057.2,0.274338],[9577.08,16021.6,0.14814],[8947.07,15511.9,0.278084],[7149.57,16298.8,0.207314],[7210.66,16526.5,0.276596],[7472.34,16296.7,0.234108],[4852.84,16134.8,0.368446],[3905.44,17443.6,-0.0299816],[3987.86,17547.1,0.190762],[7408.39,15448.2,0.233166],[14451,17788.1,0.0298386],[14539.6,17644.7,0.116901],[14493.2,17586.6,0.208889],[14582.1,17576.7,-0.0157051],[14682.2,17747.2,0.00278854],[14520.5,17299.1,0.246075],[13901.8,18612.2,0.426479],[13996.9,18741.7,0.110754],[14208.6,18780.4,-0.0621567],[13592,18668.8,-0.0299301],[13905.8,18686.1,0.00319862],[13926.3,18925,0.172192],[14057.5,18866.4,-0.00865746],[14089.9,18733.5,-0.0169353],[14116.1,18542.1,0.181694],[14137.6,18361.8,0.166693],[14246.5,18574.6,0.308231],[14522.6,20830.1,-0.0602837],[14528.6,20925.2,0.0486641],[14558.5,20719.7,0.17107],[14632.2,20867.3,-0.0199699],[14742.7,20735.2,-0.122059],[12802.1,19674.9,-0.00533295],[8363.12,18169.6,0.00701904],[8571.97,18276.6,0.341156],[8607.25,18207.3,0.204025],[8608.86,18264.6,0.064621],[8581.06,18278.7,0.631744],[8753.75,18177.2,0.105545],[8558.06,18165.3,0.121262],[10291.5,19096.9,0.42926],[10387.4,19046.4,0.589165],[10228.5,19030.9,0.317207],[10287.8,19066.3,0.143929],[10314.2,18990.5,0.448814],[10379.9,19090.6,0.259163],[10406.7,19112.5,-0.0400925],[11832.3,18459.7,-0.0340652],[9435.32,20274.4,0.0973206],[9342.49,20260.5,0.2043],[9457.98,20156.9,-0.133751],[9507.25,20268.8,0.188599],[16129.8,17290.4,0.153591],[16178.2,17256.7,0.301888],[16185,17334,-0.00142097],[16239.1,17275.1,0.109896],[16112.6,16251.9,0.0999622],[16121.9,16249.1,-0.0040741],[16578,16165.1,-0.0664663],[16607.5,16112.5,0.110858],[16672,16172.1,-0.0402813],[16303.4,15735,0.304005],[16785.4,16505.6,0.397163],[20788.1,16820.3,0.416622],[20845.1,16585.9,0.0891609],[20877.5,16972,0.37262],[20878.4,17087.3,0.00128174],[20895.8,16834.8,0.349834],[20959.4,17184.4,0.19611],[20988.3,16972.8,0.137268],[20998.7,17069,0.303288],[21035.4,16851.9,0.305897],[21079.6,16780.6,0.116899],[21252.8,16899.1,0.0011673],[20633,17020.7,0.0354195],[21145.8,16234.9,0.00105095],[21289.4,16482.3,-0.0145855],[21309.9,16246.9,0.213619],[21349.5,16202,0.0030365],[21344.7,16290.7,0.0266991],[21368.2,16140.5,0.00605011],[21438.8,16200.9,0.0075798],[21580.6,16193.1,0.0753326],[21593.1,16344.9,0.0560474],[21240.8,16538.3,0.10347],[21524.6,16022.3,0.182142],[25459.2,21160.8,0.0694485],[25498.9,21365.9,-0.0367451],[25613.9,21244.4,0.0448895],[25705.8,21340,-0.0356922],[25733.5,21163,0.119586],[25722.1,21419.3,0.0149632],[25822.2,21396.4,0.00505638],[25872.9,21350.9,0.0491714],[26830.5,23178.5,0.0276108],[27051.3,23314.6,-0.0186195],[27134.7,23270.2,0.119579],[23201.1,19931,-0.000811577],[23149.1,19962.9,0.508424],[19603.1,15313.1,-0.274492],[17885.3,14984.9,0.00121689],[17986,15148,0.400084],[18019.3,15263.2,0.694208],[18051.2,15170.4,0.0571251],[18079.2,15172.5,0.0312443],[18090.2,15293.1,0.358644],[18140.8,15352.9,0.595974],[18193.7,15170.7,0.076292],[18186.5,15330,0.312162],[18189,15372,0.0941124],[18204.1,15388.4,-0.0893631],[18266.5,15071,0.119175],[18264.1,15198.9,0.0553284],[18099.8,14875.5,0.0224056],[18258.9,15643.2,-0.0201836],[18301.2,15658.9,0.0110359],[18354.1,15484.1,0.014225],[18380.2,15566.9,0.314194],[18425.1,15571,0.364479],[19340.4,13285.1,0.167175],[19339.7,13242.4,0.213585],[19387.4,13211.4,0.143017],[19511.7,13228,0.141838],[20112.3,11710,0.200233],[20063.1,11697.4,0.194588],[20116.9,11785.8,0.0614967],[20159.9,11650.6,0.0638695],[20178.3,11463.9,0.271671],[20187.8,11607.3,0.280048],[20245.7,11640.5,0.0761185],[20276.7,11833.7,0.11784],[20490.7,8787.52,0.0651741],[20513.1,8912.04,-0.137806],[20225.3,8883.87,-0.0344963],[20537.7,8962.01,0.0738335],[20232.4,8855.94,0.447311],[21668.2,7633.11,-0.000300407],[21759.1,7625.32,-0.0153217],[20709,6734.91,-0.0971031],[20806.6,6749.17,0.194115],[20823,6582.44,0.153915],[20872.9,6817.41,0.0718651],[20887,6780.52,0.169952],[20765.6,6671.78,0.176105],[16580.8,12675.8,-0.0924435],[16694.4,12433.8,0.0426273],[16702.5,12884.4,0.116884],[16719.7,12493.5,0.0456886],[16714.3,12518.4,0.238949],[16797.9,12606.1,0.119648],[16779,12651.1,0.382784],[16782.5,12918.2,-0.026741],[16823.8,12843.9,0.351686],[16805.3,12860.1,0.437321],[16829,12891.1,0.21888],[16865,12525.3,0.0241165],[16938.2,12680.3,0.0409966],[16969.9,12579.3,0.118803],[16949.5,12732.1,0.025301],[17001.7,12656,-0.0232468],[16552.5,12785.6,-0.0194006],[16642.3,12491.5,-0.0350533],[16824.9,12811.9,0.00812721],[16840.8,12632.4,0.537098],[16880.1,12679.1,0.0840721],[16866.6,12903,-0.0228539],[16961.7,12648.3,-0.0484009],[17002.2,12611.8,-0.0325356],[17103.4,12649,-0.0481873],[16568.9,12729,0.0844593],[16634.6,12811.8,0.0889711],[3448.25,13001,0.082304],[3554.2,12525.8,0.161484],[3556.66,13113.9,0.0719643],[3555.84,13178.9,0.2489],[3560.27,13240.5,0.223429],[3572.95,13040,0.48613],[3609.58,13152.1,0.39182],[3726.3,12805.1,0.187786],[3747.38,13260.6,0.0985355],[3731.98,13276.3,0.229803],[3752.07,13264.2,0.188678],[3766.16,13275.2,-0.0131149],[3756.75,13267.9,0.0832634],[3761.44,13271.6,0.138706],[3786.46,13224.8,0.323172],[3822.2,12919.2,0.0973625],[3872.46,12971.2,0.568741],[10825.7,13440.3,0.180252],[10882.4,13514.9,0.145634],[10945.9,13509.9,-0.0908089],[11138.6,13209.2,0.0676003],[10791.6,13317.2,0.0908852],[11026.4,13520,0.0981255],[11049.1,13337.2,0.0596447],[11057.6,13412.4,0.300232],[11059.5,13512.4,0.181705],[10513.3,13230.2,0.101078],[10414.7,17224.3,0.147041],[10442.9,17259,0.357269],[10582,17455.4,0.296288],[10064.3,17293.5,0.101364],[17350.6,10284.7,0.241743],[18677.9,16822,0.191971],[18693.6,16623.6,0.13195],[18728.1,16757.1,0.429188],[18706.1,16546.2,0.133114],[18722.5,16566.8,0.29668],[18734.2,16648.3,0.0625572],[18727,16713.8,0.200382],[18724.9,16762.2,0.419495],[18777.9,16407.3,0.603441],[18768.2,16503.3,0.0921116],[18769.9,16847.6,0.169765],[18822.1,16358.7,0.0370445],[18836.4,16449.7,0.188141],[19085,16636.6,0.197205]];

BIS_fps_rescanNewObjects = TRUE;



/*"Land_i_Garage_V1_dam_F"
"Land_i_Garage_V1_F"
"Land_i_Garage_V2_dam_F"
"Land_i_Garage_V2_F"
"Land_i_Shed_Ind_F"*/

/*_villagePosPool = [];
_villageEntries = configFile >> "CfgWorlds" >> "Altis" >> "Names";
_cnt = count _villageEntries;

for [{_x = 0}, {_x < _cnt}, {_x = _x + 1}] do {
	_village = _villageEntries select _x;
	if (isClass _village) then {
		if (getText (_village >> "type") in ["NameVillage", "NameCity", "NameCityCapital"]) then {
			_villagePosPool = _villagePosPool + [getArray (_village >> "position")]
		};
	};
};

debuglog str _villagePosPool;*/

/*_garagePosPool = [];
_villagePosPool = [[3687.78,13776.1],[4116.11,11736.1],[5033.31,11245.2],[9091.81,11961.9],[10618.9,12237.3],[11701.1,13672.1],[12502,14337],[12950.1,15041.6],[12282,15732.3],[11112.6,14573.7],[9187.95,15947.8],[7062.42,16472.1],[4885.98,16171.3],[3948.77,17277.8],[7375.81,15429.5],[14479.8,17614.3],[13993,18709.4],[14612.5,20786.7],[12787,19679.3],[8625.13,18301.6],[10270.3,19036],[11786.7,18372.4],[9425.42,20284],[16207,17296.7],[16584.3,16104],[17826.5,18129.4],[19339.4,17641.6],[20885.4,16958.8],[21351.6,16361.9],[25680.5,21365.1],[26943.9,23170.7],[23199.7,19986.6],[23908.6,20144.7],[19473.3,15453.7],[18049.1,15264.1],[19336.9,13252.3],[20194.6,11660.7],[20490.2,8907.12],[21640.7,7583.93],[20769.8,6736.46],[16780.6,12604.5],[3458.95,12966.4],[10966.5,13435.3],[4560.45,21460.6],[16668.5,20487],[10410.4,17243.1],[14281.2,13469.3],[17059.7,9992.32],[18753.4,16597.1]];
_cnt = count _villagePosPool;

{
	debuglog format ["%1 of %2", _forEachIndex, _cnt];
	_pos = _x;
	_garagePool = _pos nearObjects ["Land_i_Garage_V1_dam_F", 500];
	{if (isNil {_x getVariable "tested"}) then {_x setVariable ["tested", true]; _garagePosPool = _garagePosPool + [position _x]}} forEach _garagePool;
	_garagePool = _pos nearObjects ["Land_i_Garage_V1_F", 500];
	{if (isNil {_x getVariable "tested"}) then {_x setVariable ["tested", true]; _garagePosPool = _garagePosPool + [position _x]}} forEach _garagePool;
	_garagePool = _pos nearObjects ["Land_i_Garage_V2_dam_F", 500];
	{if (isNil {_x getVariable "tested"}) then {_x setVariable ["tested", true]; _garagePosPool = _garagePosPool + [position _x]}} forEach _garagePool;
	_garagePool = _pos nearObjects ["Land_i_Garage_V2_F", 500];
	{if (isNil {_x getVariable "tested"}) then {_x setVariable ["tested", true]; _garagePosPool = _garagePosPool + [position _x]}} forEach _garagePool;
	_garagePool = _pos nearObjects ["Land_i_Shed_Ind_F", 500];
	{if (isNil {_x getVariable "tested"}) then {_x setVariable ["tested", true]; _garagePosPool = _garagePosPool + [position _x]}} forEach _garagePool;
} forEach _villagePosPool;

garagePosPool = _garagePosPool;

_garegePosPool = [[3600.54,13334.1,0.418342],[3601.27,13655.4,0.00461102],[3703.55,13362.3,0.592755],[3696.55,13409.8,0.577665],[3690.62,13718,0.25249],[3745.56,13287.9,0.132163],[3736.53,13280.2,0.147925],[3741.06,13284,0.0683327],[3750.08,13291.8,0.348058],[3745.62,13323.5,0.251697],[3731.01,13675.9,0.17119],[3754.66,13315.7,0.0906019],[3763.72,13308,0.0848103],[3759.18,13311.9,0.102081],[3750.14,13319.6,0.140862],[3769.05,13817.4,0.30899],[3780.43,13546.9,0.101624],[3802.41,13857.5,0.544609],[3867.42,13645,0.0364876],[3882.38,13399,0.0091629],[3879.42,13752.8,0.164242],[3924.07,13581.5,0.195309],[3929.92,13605.2,0.319448],[3719.95,11673.6,-0.009758],[3715.81,11761,0.215445],[3721.29,11949,0.00485229],[3777.85,11591.6,-0.106504],[3770.3,11682.7,-0.0660391],[3751.7,11882.9,0.0696507],[3846.94,11423.9,0.0854378],[3881.54,11570.3,0.0637341],[3871.09,11732.4,-0.0228424],[3941.5,11642.4,0.108885],[3990.73,11507.9,0.141983],[4007.37,11642.8,0.589748],[3997.36,11696.1,1.23679],[4075.74,11716.4,0.128113],[4059.66,11702.5,0.300327],[4057.65,11772.4,0.00507736],[4140.83,11785.8,0.320583],[4177.11,11695.5,0.255062],[4217.62,11858.5,-0.0896416],[4747.06,11120.9,-0.00346756],[4948.35,11451,0.423267],[5061.54,11183.2,0.629578],[4960.03,11394,-0.00647354],[5060.29,11356.3,0.361656],[5086.62,10822.5,0.47604],[5073.9,11079.1,0.321083],[5149.33,11114.1,0.389046],[4913.31,11127.1,0.531658],[4995.04,11058.8,0.158478],[5233.97,11529.9,0.365044],[9258.66,11898.6,-0.00502014],[8899.89,12105.2,0.205624],[9139.57,12055.3,0.150557],[9214.93,12099.8,0.480391],[9319.27,11913.6,0.0596514],[9342.37,11904.9,0.054328],[9415.2,11778.3,-0.00352669],[9397.44,11762.5,-0.0013485],[9431.86,11714.9,0.00691032],[9466.21,11671.7,0.238441],[8998.35,11685.7,0.227722],[9283.56,12120.6,0.100071],[10571.9,12381.5,0.0439129],[10776.5,12367.4,-0.0427017],[10472.2,12396.2,0.0382357],[10563.1,12249.9,0.00322342],[10704.9,12220.6,0.0529785],[10720.6,12299.5,-0.0160675],[10766.6,12177.9,0.187164],[10742.6,12132.6,0.286682],[11693.5,13668.3,0.0277557],[11709.6,13685.7,0.124694],[11777.7,13744,0.000313759],[11842.5,14142.9,-0.0781279],[11922.8,13962.9,0.0194731],[11532.9,13591.3,0.289733],[11871.4,13783.3,0.0983047],[12430.8,14194.4,0.0438204],[12536.7,14213.7,-0.0616331],[12270.5,14273,0.0775156],[12348.5,14305.5,0.122203],[12384.3,14191.7,0.0870099],[12367.8,14283.4,0.0514193],[12400.9,14225.3,0.016283],[12473.5,14423.2,0.162768],[12470.7,14507.7,0.14382],[12483.1,14359.1,0.0329571],[12487.2,14441.4,0.180368],[12523.9,14267.6,0.131302],[12528.6,14516.9,-0.0210476],[12544.5,14314,0.0231943],[12552.5,14433.4,0.0766697],[12624,14389.3,0.176165],[12615.4,14420.5,0.0431366],[12643.2,14311.1,0.179505],[12647.5,14341.9,-0.0217953],[12644.2,14376.3,0.220379],[12717.9,14313.6,0.20515],[12743.1,14419.7,0.151621],[12164.9,14371,0.0378628],[12299.2,14553.2,0.0967741],[12355.2,14351.6,0.213473],[12672.1,14509.8,0.284494],[12704.3,14732.5,0.293192],[12819.4,14307.8,0.105487],[12807.6,15036,-0.0789642],[12945,14975.9,0.0728512],[12976.1,15006.5,0.188555],[12596.2,15377.4,0.110825],[12296.7,15551.6,-0.0875549],[12299.8,15698.7,0.00554466],[12435.5,15491.6,0.0706615],[12423.9,15557.8,0.27906],[12457.4,15488.1,-0.0354156],[12556.2,15558.4,0.108295],[12430.7,15838.9,0.132027],[12568.6,15867.2,0.158102],[12552.9,15918.6,0.519804],[11158.7,14503.1,0.0816536],[10815.3,14310.7,0.500065],[11113.7,14470.7,0.222565],[11158.2,14616.9,0.398827],[11361.9,14175.2,0.011282],[11396.2,14759.3,0.282906],[9250.21,15856.5,0.208893],[9070.84,15804.3,0.521759],[9114.39,15853,0.407173],[9167.55,15850.9,0.369316],[9283.98,15917.4,0.145691],[9356.41,15896.6,0.000831604],[9395.08,15974.6,0.002388],[9405.83,16017.6,-0.000534058],[9431.61,15871.8,0.011673],[9457.69,15900.6,-0.0255432],[9457.35,15965.1,0.132881],[9564.16,16057.2,0.274338],[9577.08,16021.6,0.14814],[8947.07,15511.9,0.278084],[7149.57,16298.8,0.207314],[7210.66,16526.5,0.276596],[7472.34,16296.7,0.234108],[4852.84,16134.8,0.368446],[3905.44,17443.6,-0.0299816],[3987.86,17547.1,0.190762],[7408.39,15448.2,0.233166],[14451,17788.1,0.0298386],[14539.6,17644.7,0.116901],[14493.2,17586.6,0.208889],[14582.1,17576.7,-0.0157051],[14682.2,17747.2,0.00278854],[14520.5,17299.1,0.246075],[13901.8,18612.2,0.426479],[13996.9,18741.7,0.110754],[14208.6,18780.4,-0.0621567],[13592,18668.8,-0.0299301],[13905.8,18686.1,0.00319862],[13926.3,18925,0.172192],[14057.5,18866.4,-0.00865746],[14089.9,18733.5,-0.0169353],[14116.1,18542.1,0.181694],[14137.6,18361.8,0.166693],[14246.5,18574.6,0.308231],[14522.6,20830.1,-0.0602837],[14528.6,20925.2,0.0486641],[14558.5,20719.7,0.17107],[14632.2,20867.3,-0.0199699],[14742.7,20735.2,-0.122059],[12802.1,19674.9,-0.00533295],[8363.12,18169.6,0.00701904],[8571.97,18276.6,0.341156],[8607.25,18207.3,0.204025],[8608.86,18264.6,0.064621],[8581.06,18278.7,0.631744],[8753.75,18177.2,0.105545],[8558.06,18165.3,0.121262],[10291.5,19096.9,0.42926],[10387.4,19046.4,0.589165],[10228.5,19030.9,0.317207],[10287.8,19066.3,0.143929],[10314.2,18990.5,0.448814],[10379.9,19090.6,0.259163],[10406.7,19112.5,-0.0400925],[11832.3,18459.7,-0.0340652],[9435.32,20274.4,0.0973206],[9342.49,20260.5,0.2043],[9457.98,20156.9,-0.133751],[9507.25,20268.8,0.188599],[16129.8,17290.4,0.153591],[16178.2,17256.7,0.301888],[16185,17334,-0.00142097],[16239.1,17275.1,0.109896],[16112.6,16251.9,0.0999622],[16121.9,16249.1,-0.0040741],[16578,16165.1,-0.0664663],[16607.5,16112.5,0.110858],[16672,16172.1,-0.0402813],[16303.4,15735,0.304005],[16785.4,16505.6,0.397163],[20788.1,16820.3,0.416622],[20845.1,16585.9,0.0891609],[20877.5,16972,0.37262],[20878.4,17087.3,0.00128174],[20895.8,16834.8,0.349834],[20959.4,17184.4,0.19611],[20988.3,16972.8,0.137268],[20998.7,17069,0.303288],[21035.4,16851.9,0.305897],[21079.6,16780.6,0.116899],[21252.8,16899.1,0.0011673],[20633,17020.7,0.0354195],[21145.8,16234.9,0.00105095],[21289.4,16482.3,-0.0145855],[21309.9,16246.9,0.213619],[21349.5,16202,0.0030365],[21344.7,16290.7,0.0266991],[21368.2,16140.5,0.00605011],[21438.8,16200.9,0.0075798],[21580.6,16193.1,0.0753326],[21593.1,16344.9,0.0560474],[21240.8,16538.3,0.10347],[21524.6,16022.3,0.182142],[25459.2,21160.8,0.0694485],[25498.9,21365.9,-0.0367451],[25613.9,21244.4,0.0448895],[25705.8,21340,-0.0356922],[25733.5,21163,0.119586],[25722.1,21419.3,0.0149632],[25822.2,21396.4,0.00505638],[25872.9,21350.9,0.0491714],[26830.5,23178.5,0.0276108],[27051.3,23314.6,-0.0186195],[27134.7,23270.2,0.119579],[23201.1,19931,-0.000811577],[23149.1,19962.9,0.508424],[19603.1,15313.1,-0.274492],[17885.3,14984.9,0.00121689],[17986,15148,0.400084],[18019.3,15263.2,0.694208],[18051.2,15170.4,0.0571251],[18079.2,15172.5,0.0312443],[18090.2,15293.1,0.358644],[18140.8,15352.9,0.595974],[18193.7,15170.7,0.076292],[18186.5,15330,0.312162],[18189,15372,0.0941124],[18204.1,15388.4,-0.0893631],[18266.5,15071,0.119175],[18264.1,15198.9,0.0553284],[18099.8,14875.5,0.0224056],[18258.9,15643.2,-0.0201836],[18301.2,15658.9,0.0110359],[18354.1,15484.1,0.014225],[18380.2,15566.9,0.314194],[18425.1,15571,0.364479],[19340.4,13285.1,0.167175],[19339.7,13242.4,0.213585],[19387.4,13211.4,0.143017],[19511.7,13228,0.141838],[20112.3,11710,0.200233],[20063.1,11697.4,0.194588],[20116.9,11785.8,0.0614967],[20159.9,11650.6,0.0638695],[20178.3,11463.9,0.271671],[20187.8,11607.3,0.280048],[20245.7,11640.5,0.0761185],[20276.7,11833.7,0.11784],[20490.7,8787.52,0.0651741],[20513.1,8912.04,-0.137806],[20225.3,8883.87,-0.0344963],[20537.7,8962.01,0.0738335],[20232.4,8855.94,0.447311],[21668.2,7633.11,-0.000300407],[21759.1,7625.32,-0.0153217],[20709,6734.91,-0.0971031],[20806.6,6749.17,0.194115],[20823,6582.44,0.153915],[20872.9,6817.41,0.0718651],[20887,6780.52,0.169952],[20765.6,6671.78,0.176105],[16580.8,12675.8,-0.0924435],[16694.4,12433.8,0.0426273],[16702.5,12884.4,0.116884],[16719.7,12493.5,0.0456886],[16714.3,12518.4,0.238949],[16797.9,12606.1,0.119648],[16779,12651.1,0.382784],[16782.5,12918.2,-0.026741],[16823.8,12843.9,0.351686],[16805.3,12860.1,0.437321],[16829,12891.1,0.21888],[16865,12525.3,0.0241165],[16938.2,12680.3,0.0409966],[16969.9,12579.3,0.118803],[16949.5,12732.1,0.025301],[17001.7,12656,-0.0232468],[16552.5,12785.6,-0.0194006],[16642.3,12491.5,-0.0350533],[16824.9,12811.9,0.00812721],[16840.8,12632.4,0.537098],[16880.1,12679.1,0.0840721],[16866.6,12903,-0.0228539],[16961.7,12648.3,-0.0484009],[17002.2,12611.8,-0.0325356],[17103.4,12649,-0.0481873],[16568.9,12729,0.0844593],[16634.6,12811.8,0.0889711],[3448.25,13001,0.082304],[3554.2,12525.8,0.161484],[3556.66,13113.9,0.0719643],[3555.84,13178.9,0.2489],[3560.27,13240.5,0.223429],[3572.95,13040,0.48613],[3609.58,13152.1,0.39182],[3726.3,12805.1,0.187786],[3747.38,13260.6,0.0985355],[3731.98,13276.3,0.229803],[3752.07,13264.2,0.188678],[3766.16,13275.2,-0.0131149],[3756.75,13267.9,0.0832634],[3761.44,13271.6,0.138706],[3786.46,13224.8,0.323172],[3822.2,12919.2,0.0973625],[3872.46,12971.2,0.568741],[10825.7,13440.3,0.180252],[10882.4,13514.9,0.145634],[10945.9,13509.9,-0.0908089],[11138.6,13209.2,0.0676003],[10791.6,13317.2,0.0908852],[11026.4,13520,0.0981255],[11049.1,13337.2,0.0596447],[11057.6,13412.4,0.300232],[11059.5,13512.4,0.181705],[10513.3,13230.2,0.101078],[10414.7,17224.3,0.147041],[10442.9,17259,0.357269],[10582,17455.4,0.296288],[10064.3,17293.5,0.101364],[17350.6,10284.7,0.241743],[18677.9,16822,0.191971],[18693.6,16623.6,0.13195],[18728.1,16757.1,0.429188],[18706.1,16546.2,0.133114],[18722.5,16566.8,0.29668],[18734.2,16648.3,0.0625572],[18727,16713.8,0.200382],[18724.9,16762.2,0.419495],[18777.9,16407.3,0.603441],[18768.2,16503.3,0.0921116],[18769.9,16847.6,0.169765],[18822.1,16358.7,0.0370445],[18836.4,16449.7,0.188141],[19085,16636.6,0.197205]];
*/

// use default values for params if launched as SP (testing etc.)
if (isNil "paramsArray") then {
	paramsArray = [6, 10000]
};

if (time < 1) then {
	skipTime (paramsArray select 0);
};
