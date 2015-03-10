//--- Event handlers
[	
	bis_curator,
	{
		_costs = [
			"o_soldier_f",			0.3,
			"o_soldier_lite_f",		0.3,
			"o_soldier_a_f",		0.3,
			"o_soldier_gl_f",		0.3,
			"o_soldier_ar_f",		0.3,
			"o_soldier_sl_f",		0.3,
			"o_soldier_tl_f",		0.3,
			"o_soldier_m_f",		0.3,
			"o_soldier_lat_f",		0.3,
			"o_soldier_at_f",		0.3,
			"o_soldier_aa_f",		0.3,
			"o_medic_f",			0.3,
			"o_soldier_repair_f",		0.3,
			"o_soldier_exp_f",		0.3,
			"o_engineer_f",			0.3,
			"o_crew_f",			0.3,
			"o_helipilot_f",		0.3,
			"o_officer_f",			0.3,
			"o_soldier_aar_f",		0.3,
			"o_soldier_aat_f",		0.3,
			"o_soldier_aaa_f",		0.3,
			"o_spotter_f",			0.4,
			"o_sniper_f",			0.55,
			"o_recon_f",			0.4,
			"o_recon_m_f",			0.3,
			"o_recon_lat_f",		0.3,
			"o_recon_medic_f",		0.3,
			"o_recon_exp_f",		0.3,
			"o_recon_jtac_f",		0.3,
			"o_recon_tl_f",			0.3,
			"o_uav_ai",			0.3,

			"o_mrap_02_hmg_f",		2.0,
			"o_mrap_02_gmg_f",		2.0,
			"o_boat_armed_01_hmg_f",	2.0,
			"o_apc_wheeled_02_rcws_f",	3.5,
			"o_apc_tracked_02_cannon_f",	3.5,
			"o_heli_attack_02_f",		6.0
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
		_object = _this select 0;
		_object allowCrewInImmobile true;
		_object unassignitem "nvgoggles";
		_object removeitem "nvgoggles";
		_object removeweapon "binocular";
		_object addPrimaryWeaponItem "acc_flashlight";
		_object setskill 0.25;
		_object allowfleeing 0;
		_object lock true;
		_veh = vehicle _object;
		if (_veh != _object) then {
			_veh flyinheight 100;
			clearmagazinecargoglobal _veh;
			clearweaponcargoglobal _veh;
			clearitemcargoglobal _veh;
			_veh addeventhandler ["fired",{(_this select 0) setvehicleammo 1;}]; //--- Unlimited vehicle ammo, remove it in the future
		};
		_object addeventhandler [
			"killed",
			{
				(_this select 0) setvehicleammo (0.3 + random 0.2);
			}
		];
	}
] call bis_fnc_addScriptedEventHandler;