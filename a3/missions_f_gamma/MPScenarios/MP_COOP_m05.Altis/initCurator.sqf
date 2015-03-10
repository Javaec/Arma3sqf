//On object registered
[	
	bis_curator,
	{
		_costs = [
			"b_soldier_f",			0.3,
			"b_soldier_lite_f",		0.3,
			"b_soldier_a_f",		0.3,
			"b_soldier_gl_f",		0.3,
			"b_soldier_ar_f",		0.3,
			"b_soldier_sl_f",		0.3,
			"b_soldier_tl_f",		0.3,
			"b_soldier_m_f",		0.3,
			"b_soldier_lat_f",		0.3,
			"b_soldier_at_f",		0.3,
			"b_soldier_aa_f",		0.3,
			"b_medic_f",			0.3,
			"b_soldier_repair_f",		0.3,
			"b_soldier_exp_f",		0.3,
			"b_engineer_f",			0.3,
			"b_crew_f",			0.3,
			"b_helipilot_f",		0.3,
			"b_officer_f",			0.3,
			"b_soldier_aar_f",		0.3,
			"b_soldier_aat_f",		0.3,
			"b_soldier_aaa_f",		0.3,
			"b_recon_m_f",			0.3,
			"b_recon_lat_f",		0.3,
			"b_recon_medic_f",		0.3,
			"b_recon_exp_f",		0.3,
			"b_recon_jtac_f",		0.3,
			"b_recon_tl_f",			0.3,
			"b_spotter_f",			0.75,
			"b_recon_f",			0.75,
			"b_sniper_f",			0.85,
			"b_uav_ai",			1.0,
			"b_mrap_01_hmg_f",		2.0,
			"b_mrap_01_gmg_f",		2.0,
			"b_apc_wheeled_01_cannon_f",	3.0,
			"b_apc_tracked_01_rcws_f",	4.0,
			"b_mbt_01_cannon_f",		5.0
		];

		_class = _this select 0;
		_index = _costs find _class;
		if (_index >= 0) then {[_costs select (_index + 1),true]} else {[0,false];};
	}
] call bis_fnc_onCuratorObjectRegistered;

//On object placed
[
    bis_curator,
    "curatorObjectPlaced",
    {
	//Params
	private ["_unit", "_vehicle"];
        _unit 		= _this select 0;
	_vehicle	= vehicle _unit;
	
	//Unit properties
	_unit setskill 0.25;
	_unit allowfleeing 0;
	_unit unassignItem "NVGoggles";
	_unit removeItem "NVGoggles";
	_unit removeWeapon "Binocular";
	_unit unassignItem "acc_pointer_IR";
	_unit removePrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit assignItem "acc_flashlight";
	
	//Remove optics from unit
	{
		private "_type";
		_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
		
		if (_type == 201) then {
			_unit removePrimaryWeaponItem _x;
		};
	} forEach primaryWeaponItems _unit;
	
	//Check if it's night
	private ["_hour", "_isNight"];
	_hour 		= date select 3; 
	_isNight	= if (_hour > 19 || _hour < 6) then { true } else { false };
	
	//Force flashlight if night
	if (_isNight) then {
		_unit enableGunLights "ForceOn";
	};
	
	//Vehicle lock and allow when damaged
	if !(_vehicle iskindOf "Man") then {
		_vehicle lock true;
		_vehicle allowCrewInImmobile true;
	};
	
	//Vehicle fly height
	if (_vehicle iskindOf "Air") then {
		_vehicle flyInHeight 100;
	};
    }
] call bis_fnc_addScriptedEventHandler;
