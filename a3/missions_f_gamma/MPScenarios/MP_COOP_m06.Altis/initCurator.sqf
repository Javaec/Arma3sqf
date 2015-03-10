//--- Set placing coef
[bis_curator,[-0.020,true]] call bis_fnc_curatorSetCoefPlace;

//--- Add more points
[bis_curator,1] call bis_fnc_curatorAddPoints;

//--- Event handlers
[	
	bis_curator,
	{
		_costs = [
			"o_soldier_sl_f",		2.0,
			"o_soldier_tl_f",		2.0,
			"o_soldier_ar_f",		2.0,
			"o_soldier_gl_f",		2.0,
			"o_soldier_lat_f",		2.0,
			"o_soldier_at_f",		2.0,
			"o_soldier_aat_f",		2.0,
			"o_crew_f",			2.0,
			"o_helipilot_f",		2.0,
			"o_uav_ai",			2.0,

			"o_mrap_02_hmg_f",		3.0,
			"o_mrap_02_gmg_f",		3.0,
			"o_ugv_01_rcws_f",		3.5,
			"o_apc_wheeled_02_rcws_f",	4.0,
			"o_apc_tracked_02_cannon_f",	4.5,
			"o_mbt_02_cannon_f",		5.0
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
		_object allowCrewInImmobile true;
		_object lock true;
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

		_veh = vehicle _object;
		_veh flyinheight 100;
		clearmagazinecargoglobal _veh;
		clearweaponcargoglobal _veh;
		clearitemcargoglobal _veh;
/*
		if (_veh != _object) then {
			[_veh,30,-1,1,nil,7] call bis_fnc_moduleRespawnVehicle;
		};
*/
	}
] call bis_fnc_addScriptedEventHandler;