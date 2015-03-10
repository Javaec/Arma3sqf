/*
	Author: Joris-Jan van 't Land

	Description:
	Enable / disable maintenance mode for a specific helicopter

	Parameter(s):
	_this select 0: mode (Scalar)
		-1: reset
		 0: on
		 1: off
	_this select 1: helicopter (Object)
	_this select 2: show reports (Bool)
	_this select 3 (optional): available hitpoints (Array)

	Returns:
	Bool
*/

private ["_mode", "_heli", "_showReports"];
_mode = [_this, 0, 0, [0]] call BIS_fnc_Param;
_heli = [_this, 1, objNull, [objNull]] call BIS_fnc_Param;
_showReports = [_this, 2, true, [false]] call BIS_fnc_Param;

//WLIB removed - dependancy needs to be removed
//[] call BIS_fnc_initWlib;

#include "\A3\functions_f\wlib\_shared\formatting.hpp"

if (_mode == 0) then
{
	if (!(_heli getVariable ["HSim_maintenanceMode", false])) then
	{
		//Enable maintenance mode
		_heli setVariable ["HSim_maintenanceMode", true];

		_heli setVariable ["HSim_maintenanceReports", _showReports];

		//Go through damage components and store
		private ["_hps", "_displayNames", "_damages", "_inspections", "_compartments", "_obstructionCodes", "_ids", "_idHPs", "_totalVisuals", "_hydraulicsCheck", "_batteriesCheck"];

		_hps = [_this, 3, (_heli call BIS_fnc_helicopterGetHitpoints), [[]]] call BIS_fnc_Param;
		_displayNames = [];
		_damages = [];
		_inspections = [];
		_compartments = [];
		_obstructionCodes = [];
		_ids = [];
		_idHPs = [];
		_totalVisuals = 0;
		_hydraulicsCheck = false; //TODO: also provide feedback in case they're fine?
		_batteriesCheck = false; //TODO: also provide feedback in case they're fine?

		//See how long the helicopter was not inspected and how long it was not used in a contract
		private ["_curTurn", "_lastTurnMaintained", "_turnsNotMaintained", "_lastTurnUsed", "_turnsNotUsed", "_turnsIgnored"];
		_curTurn = call BIS_fnc_heliportTurn;
		if (isNil "_curTurn") then {_curTurn = -1}; //TODO: remove when function fixed to not return nil
		_lastTurnUsed = _heli call BIS_fnc_heliportHeliHistory;
		_lastTurnMaintained = -1; //TODO: implement
		_turnsNotUsed = -1;
		_turnsNotMaintained = -1;
		_turnsIgnored = -1;
		if (_curTurn != -1) then
		{
			if (_lastTurnMaintained != -1) then
			{
				_turnsNotMaintained = _curTurn - _lastTurnMaintained;
			}
			else
			{
				_turnsNotMaintained = _curTurn;
			};

			if (_lastTurnUsed != -1) then
			{
				_turnsNotUsed = _curTurn - _lastTurnUsed;
			}
			else
			{
				_turnsNotUsed = _curTurn;
			};

			_turnsIgnored = _turnsNotMaintained min _turnsNotUsed;
		};

		private ["_wearChance", "_obstructChance"];
		if (_turnsIgnored == -1) then {_wearChance = 0.1; _obstructChance = 0.1} else
		{
			_wearChance = (([[0, 20], _turnsIgnored, [0, 0.4]] call BIS_fnc_linearConversion) min 0.4) max 0;
			_obstructChance = (([[0, 20], _turnsNotUsed, [0.1, 0.4]] call BIS_fnc_linearConversion) min 0.4) max 0.1;
		};
		if (_heli getVariable ["HSim_maintenanceForceObstructions", false]) then {_obstructChance = 1};

		private ["_cfgInspection"];
		_cfgInspection = configFile >> "CfgVehicles" >> (typeOf _heli) >> "Inspection";

		//Retrieve and initialize compartment accessable states
		for "_i" from 0 to (getNumber (_cfgInspection >> "compartments")) do
		{
			_compartments set [_i, if (_i == 0) then {true} else {false}];
		};

		for "_i" from 0 to ((count _hps) - 1) do
		{
			private ["_hp", "_hpCfg", "_displayName", "_damage", "_found"];
			_hp = _hps select _i;
			_hpCfg = _cfgInspection >> "Hitpoints" >> _hp;
			_displayName = getText (_hpCfg >> "displayName");
			_displayNames set [_i, _displayName];
			_damage = _heli getHitPointDamage _hp;

			//Randomly add damage to components not affected by stress damage
			//TODO: Base on how long helicopters have not been used and have not been maintained
			if ((getNumber (_hpCfg >> "randomWear")) == 1) then
			{
				if ((random 1) < _wearChance) then
				{
					//TODO: never exceed a certain max. damage for randomized wear?
					_damage = _damage + (0.05 + (random 0.1));
					_heli setHitPointDamage [_hp, _damage];

				};
			};

			_damages set [_i, _damage];

			_found = -1;
			if ((getNumber (_hpCfg >> "inspectable")) == 1) then
			{
				private ["_visuals", "_compartment", "_radius", "_radiusView"];
				_visuals = getArray (_hpCfg >> "visuals");
				_compartment = getNumber (_hpCfg >> "compartment");
				_radius = getNumber (_hpCfg >> "radius");
				if (_radius == 0) then {_radius = 2.5;};
				_radiusView = getNumber (_hpCfg >> "radiusView");
				if (_radiusView == 0) then {_radiusView = 0.1;};

				switch _hp do
				{
					case "HitBatteries":
					{
						if (_damage > 0) then {_batteriesCheck = true};
					};
					case "HitHydraulics":
					{
						if (_damage > 0) then {_hydraulicsCheck = true};
					};
				};

				if (_damage != 0) then
				{
					_found = 0;
				};

				//Add inspection actions for all components
				//Some components have more than 1 inspection point
				private ["_j"];
				_j = 1;
				while {true} do
				{
					private ["_mp", "_pos"];
					_mp = "Inspect_" + _hp + (str _j);
					_pos = _heli selectionPosition _mp;
					if ((_pos distance [0, 0, 0]) < 0.001) exitWith {};

					//Spawn visual damage indicators
					if ((_damage != 0) && (_totalVisuals < 5) && ((count _visuals) > 0) && ((random 1) > 0.5)) then
					{
						private ["_obj"];
						_pos = _heli modelToWorld _pos;
						_pos = [(_pos select 0) - (0.5 - (random 1)), (_pos select 1) - (0.5 - (random 1)), 0];
						_obj = (_visuals call BIS_fnc_selectRandom) createVehicle _pos;
						_obj setPos _pos;
						_obj setDir (random 360);
						_totalVisuals = _totalVisuals + 1;
					};

					//TODO: update action texts once possible for quick-fix
					//TODO: move to global script file
					//TODO: Radii per HP in config?
					private ["_text", "_cond", "_id"];
					_text = (localize "STR_HSIM_fn_heliportMaintenance.sqf_0") + " " + _displayName;

					//Test compartment conditions if necessary
					_cond = "";
					if (_compartment != 0) then
					{
						_cond = format ["(_target getVariable 'HSim_compartments') select %1", _compartment];
					};

					_id = _heli addAction
					[
						_text, "hsim\air_h\data\scripts\inspection\inspection.sqf", [_hp, _i], 10, true, false, "", _cond, _mp,
						_radius, _radiusView, 1+8, 0,
						INSPECTION_ICON("look_0"),
						_text
					];

					//We need to store the IDs for detection later on
					_ids set [count _ids, _id];
					_idHPs set [count _idHPs, _hp];

					_j = _j + 1;
				};
			};
			_inspections set [_i, _found];
		};

		//Randomly trigger obstructions defined in config
		//Base chance on not having used / maintained helicopter long time
		private ["_cfgObstructions", "_obstructIDs"];
		_cfgObstructions = _cfgInspection >> "Obstructions";
		_obstructIDs = [];

		for "_i" from 1 to (count _cfgObstructions) do
		{
			private ["_mp", "_obstruction"];
			_mp = "Inspect_Obstruction" + (str _i);
			_obstruction = _cfgObstructions select (_i - 1);

			if ((random 1) < _obstructChance) then
			{
				private ["_visual", "_cond", "_id"];
				_visual = ((getArray (_obstruction >> "visuals")) call BIS_fnc_selectRandom) createVehicle [100, 100, 100];
				_visual setDir (random 360);
				_visual attachTo [_heli, _heli selectionPosition _mp];

				//Store Code to execute upon next use of the helicopter in its variable space
				private ["_code"];
				_code =
				{
					waitUntil {((throttleRTD _this) select 0) > 0};

					_this setHitPointDamage ["HitEngine", (_this getHitPointDamage "HitEngine") + 0.2];

					//TODO: Small fire effect
					//[_this, 10, 1, false, true] spawn BIS_Effects_Burn; - needs correct position
				};

				_obstructionCodes set [_i - 1, _code];

				private ["_radius", "_radiusView"];
				_radius = getNumber (_obstruction >> "radius");
				if (_radius == 0) then {_radius = 2.5;};
				_radiusView = getNumber (_obstruction >> "radiusView");
				if (_radiusView == 0) then {_radiusView = 0.1;};

				//Add inspection action
				_cond = format ["(_target getVariable 'HSim_compartments') select %1", getNumber (_obstruction >> "compartment")];
				_id = _heli addAction
				[
					localize "STR_HSIM_fn_heliportMaintenance.sqf_1", "hsim\air_h\data\scripts\inspection\obstruction.sqf", [_i, _obstruction, _visual], 15, true, false, "", _cond, _mp,
					_radius, _radiusView, 1+8, 0,
					INSPECTION_ICON("hand"),
					localize "STR_HSIM_fn_heliportMaintenance.sqf_2"
				];
				_obstructIDs set [_i - 1, _id];
			}
			else
			{
				_obstructionCodes set [_i - 1, {}];
				_obstructIDs set [_i - 1, -1];
			};
		};
		_heli setVariable ["HSim_obstructionIDs", _obstructIDs];

		_heli setVariable ["HSim_hitpoints", _hps];
		_heli setVariable ["HSim_hitpointNames", _displayNames];
		_heli setVariable ["HSim_hitpointDamages", _damages];
		_heli setVariable ["HSim_hitpointInspections", _inspections];
		_heli setVariable ["HSim_compartments", _compartments];
		_heli setVariable ["HSim_obstructionCodes", _obstructionCodes];
		_heli setVariable ["HSim_actionIDs", _ids];
		_heli setVariable ["HSim_actionIDHitpoints", _idHPs];

		//Add panel open / close actions
		private ["_cfgPanels", "_panelIDs"];
		_cfgPanels = _cfgInspection >> "Panels";
		_panelIDs = [];

		for "_i" from 1 to (count _cfgPanels) do
		{
			private ["_mp", "_anim", "_panel", "_id"];
			_mp = "Inspect_Panel" + (str _i);
			_anim = _mp + "_1";
			_panel = _cfgPanels select (_i - 1);

			private ["_radius", "_radiusView"];
			_radius = getNumber (_panel >> "radius");
			if (_radius == 0) then {_radius = 2.5;};
			_radiusView = getNumber (_panel >> "radiusView");
			if (_radiusView == 0) then {_radiusView = 0.1;};

			_id = _heli addAction
			[
				localize "STR_HSIM_fn_heliportMaintenance.sqf_5", "hsim\air_h\data\scripts\inspection\panel.sqf", [true, _i, _panel], 15, true, false, "", "((_target animationPhase '" + _anim + "') == 0)", _mp,
				_radius, _radiusView, 1+8, 0,
				"<t align='center'><img image='hsim\ui_h\data\ui_action_open_ca' size='1.5' shadow='true' /></t>",
				localize "STR_HSIM_fn_heliportMaintenance.sqf_7"
			];
			_panelIDs set [count _panelIDs, _id];
			_id = _heli addAction
			[
				localize "STR_HSIM_fn_heliportMaintenance.sqf_9", "hsim\air_h\data\scripts\inspection\panel.sqf", [false, _i, _panel], 13, true, false, "", "((_target animationPhase '" + _anim + "') > 0)", _mp,
				_radius, _radiusView, 1+8, 0,
				"<t align='center'><img image='hsim\ui_h\data\ui_action_close_ca' size='1.5' shadow='true' /></t>",
				localize "STR_HSIM_fn_heliportMaintenance.sqf_11"
			];
			_panelIDs set [count _panelIDs, _id];
		};
		_heli setVariable ["HSim_panelIDs", _panelIDs];

		//Start detecting looking at actions + how long for
		//TODO: works, but not clean: multiple helicopters?
		HSim_inspectTimeStart = -1;
		HSim_inspectID = -1;
		private ["_funcSelectedActionChanged"];
		_funcSelectedActionChanged =
		{
			if ((_this select 2) == 71) then
			{
				private ["_target"];
				_target = _this select 1;

				if (!(isNull _target)) then
				{
					HSim_inspectID = _this select 3;
					HSim_inspectTimeStart = time;

					private ["_hps", "_hp", "_indexHP"];
					_hps = _target getVariable "HSim_actionIDHitpoints";
					if ((count _hps) >= HSim_inspectID) then
					{
						_hp = _hps select HSim_inspectID;
						_indexHP = (_target getVariable "HSim_hitpoints") find _hp;
					}
					else
					{
						_indexHP = -1;
					};

					//Only for inspection actions
					if ((HSim_inspectID != -1) && (_indexHP != -1)) then
					{
						if (((_target getVariable "HSim_hitpointInspections") select _indexHP) < 1) then
						{
							_target spawn
							{
								private ["_target"];
								_target = _this;

								private ["_completed"];
								HSim_inspectHelicopter = _target;
								_completed = [HSim_inspectID, {HSim_inspectTimeStart != -1}] call BIS_PlayIconAnim_VisualInspect;

								if (_completed) then
								{
									//If long enough, mark as found
									if (HSim_inspectID != -1) then
									{
										private ["_hps", "_hp", "_indexHP"];
										_hps = _target getVariable "HSim_actionIDHitpoints";
										_hp = _hps select HSim_inspectID;
										_indexHP = (_target getVariable "HSim_hitpoints") find _hp;

										//Only when not already found
										if (((_target getVariable "HSim_hitpointInspections") select _indexHP) == 0) then
										{
											(_target getVariable "HSim_hitpointInspections") set [_indexHP, 1];
										}
										else
										{
											(_target getVariable "HSim_hitpointInspections") set [_indexHP, 2];
										};

										//Show resulting icon
										private ["_result"];
										_result = false;
										if (((_target getVariable "HSim_hitpointDamages") select _indexHP) > 0) then {
											_result = true;

											//--- Fix the component
											_target sethitpointdamage [_hp,0];
										};

										[HSim_inspectID, _result] call BIS_PlayIconAnim_ShowResult;

										//Update also other actions for the same HP
										{
											if (_hp == _x) then
											{
												[(_target getVariable "HSim_actionIDs") select _forEachIndex, _result] spawn BIS_PlayIconAnim_ShowResult;
											};
										} forEach _hps;

										//Show updated report
										_target call BIS_fnc_heliportMaintenanceReport;
									};
								};
							};
						};
					}
					else
					{
						HSim_inspectTimeStart = -1;
					};
				}
				else
				{
					HSim_inspectTimeStart = -1;
				};
			}
			else
			{
				HSim_inspectTimeStart = -1;
			};
		};

		//Add EH only once
		if ((isNil "HSim_maintenanceEH") && !(missionNamespace getVariable ["HSim_Tutorial", false])) then {HSim_maintenanceEH = player addEventHandler ["selectedActionChanged", _funcSelectedActionChanged]};

		//Start detecting using flight controls
		//Mark hydraulics damage as found
		//TODO: Only when batteries are on?
		if (_hydraulicsCheck) then
		{
			_heli spawn
			{
				while {(_this getVariable ["HSim_maintenanceMode", false]) && (alive _this)} do
				{
					waitUntil {((vehicle player) == _this) || !(alive _this) || !(_this getVariable ["HSim_maintenanceMode", false])}; //TODO: only (co-)pilot?
					if (!(alive _this) || !(_this getVariable ["HSim_maintenanceMode", false])) exitWith {};

					private ["_inputDetected", "_inputs"];
					_inputDetected = 0;
					_inputs = ["heliLeft", "heliRight", "heliCyclicLeft", "heliCyclicRight", "heliCyclicForward", "heliCyclicBack", "HeliRudderLeft", "HeliRudderRight"];
					//TODO: use actual collective pos instead of action because axis is always active at 0?
					//HeliCollectiveRaiseCont
					//HeliCollectiveLowerCont
					//HeliCollectiveRaise
					//HeliCollectiveLower

					while {(_inputDetected < 30) && ((vehicle player) == _this) && (alive _this) && (_this getVariable ["HSim_maintenanceMode", false])} do
					{
						if (({(inputAction _x) > 0.1} count _inputs) > 0) then {_inputDetected = _inputDetected + 1};

						sleep 0.1;
					};

					if (_inputDetected >= 30) exitWith
					{
						private ["_index"];
						_index = (_this getVariable "HSim_hitpoints") find "HitHydraulics";
						(_this getVariable "HSim_hitpointInspections") set [_index, 1];
						_this call BIS_fnc_heliportMaintenanceReport;
					};
				};
			};
		};

		//Start detecting batteries on
		//Mark batteries damage as found
		if (_batteriesCheck) then
		{
			_heli spawn
			{
				while {(_this getVariable ["HSim_maintenanceMode", false]) && (alive _this)} do
				{
					waitUntil {(((vehicle player) == _this) && (isBatteryOnRTD _this)) || !(alive _this) || !(_this getVariable ["HSim_maintenanceMode", false])}; //TODO: only (co-)pilot?

					if ((alive _this) && (_this getVariable ["HSim_maintenanceMode", false])) exitWith
					{
						private ["_index"];
						_index = (_this getVariable "HSim_hitpoints") find "HitBatteries";
						(_this getVariable "HSim_hitpointInspections") set [_index, 1];
						_this call BIS_fnc_heliportMaintenanceReport;
					};
				};
			};
		};

		//System to show maintenance report when appropriate
		_heli spawn
		{
			sleep 4; //Prevent showing during init

			_disMin = sizeof typeof _this;
			while {(_this getVariable ["HSim_maintenanceMode", false]) && (alive _this)} do
			{
				if (_this getVariable ["HSim_maintenanceReports", false]) then {hintsilent "";};

				waitUntil {
					(
						((player distance _this) < _disMin)
						&&
						((cursorTarget == _this) || (player in _this))
					)
					||
					!(alive _this)
					||
					!(_this getVariable ["HSim_maintenanceMode", false])
				};
				if (!(alive _this) || !(_this getVariable ["HSim_maintenanceMode", false])) exitWith {};

				_this call BIS_fnc_heliportMaintenanceReport;

				sleep 2; //TODO: base on time last shown by any trigger?
			};
		};
	};
}
else
{
	if (_mode > 0) then {
		//Disable maintenance mode
		//Stop detection systems
			_heli setVariable ["HSim_maintenanceMode", false];
		HSim_inspectTimeStart = -1;

		//Remove all actions
		private ["_ids"];
		_ids = (_heli getVariable ["HSim_actionIDs", []]) + (_heli getVariable ["HSim_obstructionIDs", []]) + (_heli getVariable ["HSim_panelIDs", []]);

		{
			_heli removeAction _x;
		} forEach _ids;
	} else {

		//--- Reset the maintenance mode
		_damages = _heli getvariable "HSim_hitpointDamages";
		_hitpoints = _heli getvariable "HSim_actionIDHitpoints";
		if !(isnil "_damages") then {
			{
				_damages set [_foreachindex,0];
				_heli sethitpointdamage [_x,0];
[_heli,_x] call bis_fnc_log;
			} foreach _hitpoints;
		};

		_inspections = _heli getvariable "HSim_hitpointInspections";
		if !(isnil "_inspections") then {
			{
				_inspections set [_foreachindex,-1];
			} foreach _inspections;
		};

		hint "";
	};
};

true
