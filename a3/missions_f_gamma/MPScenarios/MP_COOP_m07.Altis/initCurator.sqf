//--- Set placing coef
[bis_curator,[-0.020,true]] call bis_fnc_curatorSetCoefPlace;

//--- Add more points
[bis_curator,1] call bis_fnc_curatorAddPoints;

//--- Event handlers
[	
	bis_curator,
	{
		_costs = [
			"b_soldier_sl_f",		1.5,
			"b_soldier_tl_f",		1.5,
			"b_soldier_ar_f",		1.5,
			"b_soldier_gl_f",		1.5,
			"b_soldier_lat_f",		1.5,
			"b_soldier_at_f",		1.5,
			"b_soldier_aat_f",		1.5,
			"b_crew_f",			1.5,
			"b_helipilot_f",		1.5,
			"b_uav_ai",			1.5,

			"b_mrap_01_hmg_f",		2.5,
			"b_mrap_01_gmg_f",		2.5,
			"b_apc_wheeled_01_cannon_f",	4.0,
			"b_ugv_01_f",			4.0,
			"b_apc_tracked_01_rcws_f",	5.0,
			"b_mbt_01_cannon_f",		6.0,
			"b_heli_attack_01_f",		7.0
		];

		_class = _this select 0;
		_index = _costs find _class;
		if (_index >= 0) then {
			[_costs select (_index + 1),true]
		} else {
			[0,false];
		};
	}
] call bis_fnc_onCuratorObjectRegistered;

[
	bis_curator,
	"curatorObjectPlaced",
	{
		private "_object";
		_object = _this select 0;
		_object unassignitem "nvgoggles";
		_object removeitem "nvgoggles";
		_object removeweapon "binocular";
		_object addPrimaryWeaponItem "acc_flashlight";
		_object setskill 0.25;
		_object addeventhandler [
			"killed",
			{
				(_this select 0) setvehicleammo (0.3 + random 0.2);
			}
		];
		
		private ["_vehicle"];
		_vehicle = vehicle _object;
		_vehicle flyinheight 100;
		_vehicle allowCrewInImmobile true;
		_vehicle lock true;
		clearmagazinecargoglobal _vehicle;
		clearweaponcargoglobal _vehicle;
		clearitemcargoglobal _vehicle;
	}
] call bis_fnc_addScriptedEventHandler;