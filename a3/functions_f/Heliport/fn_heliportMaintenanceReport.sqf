/*
	Author: Joris-Jan van 't Land

	Description:
	Show a maintenance report for a specific helicopter

	Parameter(s):
	_this: helicopter (Object)

	Returns:
	Bool
*/

if (_this getVariable ["HSim_maintenanceReports", true]) then 
{
	private ["_hps", "_displayNames", "_damages", "_inspections", "_hint"];
	_hps = _this getVariable "HSim_hitpoints";
	_displayNames = _this getVariable "HSim_hitpointNames";
	_damages = _this getVariable "HSim_hitpointDamages";
	_inspections = _this getVariable "HSim_hitpointInspections";

	//--- Get helicopter name
	_heliConfig = configfile >> "cfgvehicles" >> typeof _this;
	_heliItem = _this getvariable "BIS_item";
	if !(isnil "_heliItem") then {
		_heliConfig = [hsim_heliportDB,_heliItem + ["config"],_heliConfig] call bis_fnc_dbValueReturn;
	};
	_displayName = _heliConfig call bis_fnc_displayname;

	//--- Hint header
	_hint = "<t align='left'><t size='1.5'>" + _displayName + "</t>";
	_hint = _hint + "<img image='hsim\UI_H\data\tutorial\lines\thin.paa' size='0.38' align='center' /><br />";

	if (({!(_x in [-1, 2])} count _inspections) == 0) then 
	{
		_hint = _hint + localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_FineCondition";
	} 
	else 
	{
		{
			private ["_found"];
			_found = _inspections select _forEachIndex;
			if (!(_found in [-1, 2])) then 
			{
				if (_found == 0) then 
				{
					_hint = _hint + "<img image='hsim\UI_H\data\icons\checkbox\empty.paa' /> " + localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_UnknownProblem" + "<br />";
				} 
				else 
				{
					//TODO: show what can be quick-fixed and what cannot be
					private ["_damage", "_damageDesc", "_color"];
					_damage = _damages select _forEachIndex;
					_damageDesc = "";
					if (_damage < 0.33) then 
					{
						_damageDesc = localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_DamageMinor";
						_color = "#aaa005";
					} 
					else 
					{
						if (_damage < 0.66) then 
						{
							_damageDesc = localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_DamageProblematic";
							_color = "#d94403";
						} 
						else 
						{
							_damageDesc = localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_DamageSevere";
							_color = "#820000";
						};
					};
				
					//TODO: move list to CfgInspection definitions?
				
					_hint = if (_x in ["HitPitotTube", "HitStaticPort"]) then {
						_icon = "<img image='hsim\UI_H\data\icons\checkbox\active.paa' /> ";
						_hint + _icon + ((_displayNames select _forEachIndex) + ": <t color='" + _color + "'>" + _damageDesc + " (" + localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_QuickFix" + ")" + "</t>");
					} else {
						_icon = "<img image='hsim\UI_H\data\icons\checkbox\ok.paa' /> ";
						_hint + _icon + ((_displayNames select _forEachIndex) + ": <t color='" + _color + "'>" + _damageDesc + "</t>");
					};
					
					_hint = _hint + "<br />";
				};
			};
		} forEach _hps;
	};

	//--- Maintenace cost (only on heliport)
	if (!isnil "BIS_fnc_heliportInitDone") then {
		_cost = _this call bis_fnc_heliportMaintenanceCost;
		if (_cost > 0) then {
			_hint = _hint + "<img image='hsim\UI_H\data\tutorial\lines\thin.paa' size='0.38' align='center' />";
			_hint = _hint + "<br />" + localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_RepairCost";
			_hint = _hint + "<t size='1.5' align='right'>$" + str _cost + "</t><br />";
			_hint = _hint + "<t color='#99ffffff'>" + "(" + localize "STR_HSIM_BIS_fnc_heliportMaintenanceReport_Identify" + ")" + "</t>";
		};

//localize "STR_HSIM_BIS_fnc_heliportMenuHeli_NoMaintenance"
	};

	_hint = _hint + "</t>";
	hintSilent (parseText _hint);
};

true