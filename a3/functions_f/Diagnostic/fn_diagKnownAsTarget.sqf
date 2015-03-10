/*
	File: fn_diagKnownAsTarget.sqf
	Author: Joris-Jan van 't Land

	Description:
	Visualize and profile which units know about one specific unit and how much they do.
	Calling function again stops diagnostics.
	
	Parameter(s):
	_this select 0: profile unit (Object) [default player]
	_this select 1: radius (Scalar - meters) [default 1000m]
	
	Returns:
	-
*/

if (missionNamespace getVariable ["BIS_fnc_diagKnownAsTarget_running", false]) then 
{
	"Diagnostics terminated." call BIS_fnc_log;

	BIS_fnc_diagKnownAsTarget_terminate = true;
	
	(((uiNamespace getVariable "gui_displays") select 3) displayCtrl 51) ctrlRemoveAllEventHandlers "draw";
} 
else 
{
	"Diagnostics started." call BIS_fnc_log;

	missionNamespace setVariable ["BIS_fnc_diagKnownAsTarget_running", true];
	BIS_fnc_diagKnownAsTarget_terminate = false;

	BIS_fnc_diagKnownAsTarget_unit = [_this, 0, player, [objNull]] call BIS_fnc_param;
	BIS_fnc_diagKnownAsTarget_radius = [_this, 1, 1000, [0]] call BIS_fnc_param;

	("Visualizing entities with knowledge of: " + (str BIS_fnc_diagKnownAsTarget_unit)) call BIS_fnc_log;
	
	BIS_fnc_diagKnownTargets_colorWest = west call BIS_fnc_sideColor;
	BIS_fnc_diagKnownTargets_colorEast = east call BIS_fnc_sideColor;
	BIS_fnc_diagKnownTargets_colorResistance = resistance call BIS_fnc_sideColor;
	BIS_fnc_diagKnownTargets_colorUnknown = sideUnknown call BIS_fnc_sideColor;
	
	[] spawn 
	{
		(((uiNamespace getVariable "gui_displays") select 3) displayCtrl 51) ctrlRemoveAllEventHandlers "draw";
		private ["_draw"];
		_draw = 
		"
			{
				if (((_x knowsAbout BIS_fnc_diagKnownAsTarget_unit) > 0) && ((typeOf _x) != 'Logic')) then 
				{
					private ['_targetData', '_targets'];
					_targetData = [];
					_targets = _x nearTargets BIS_fnc_diagKnownAsTarget_radius;
					
					for '_i' from 0 to ((count _targets) - 1) do 
					{
						if (((_targets select _i) select 4) == BIS_fnc_diagKnownAsTarget_unit) exitWith {_targetData = _targets select _i;};
					};
					
					if ((count _targetData) > 0) then 
					{
						private ['_side', '_color', '_alpha', '_size'];
						_side = side _x;
						_color = [1, 1, 1];
						switch _side do 
						{
							case west: {_color = BIS_fnc_diagKnownTargets_colorWest;};
							case east: {_color = BIS_fnc_diagKnownTargets_colorEast;};
							case resistance: {_color = BIS_fnc_diagKnownTargets_colorResistance;};
							case sideUnknown: {_color = BIS_fnc_diagKnownTargets_colorUnknown;};
						};
						_color resize 3;
						
						_alpha = (([[0, 5], _targetData select 5, [0.2, 0.9]] call BIS_fnc_linearConversion) min 0.9) max 0.2;
						
						_size = (([[0, 20], _targetData select 3, [0.1, 5]] call BIS_fnc_linearConversion) min 5) max 0.1;
						
						(_this select 0) drawRectangle [position _x, 1, 1, direction _x, _color + [0.9], '#(argb,8,8,3)color(1,1,1,1)'];
						(_this select 0) drawEllipse [_targetData select 0, _size, _size, direction BIS_fnc_diagKnownAsTarget_unit, _color + [_alpha], ''];
						(_this select 0) drawArrow [position _x, _targetData select 0, _color + [0.9]];
					};
				};
			} forEach allUnits;
		";
		(((uiNamespace getVariable "gui_displays") select 3) displayCtrl 51) ctrlSetEventHandler ["draw", _draw];
		
		setGroupIconsVisible [false, true]; //Using HC icons until 3D drawing of primitives is supported
		
		private ["_groups", "_logics", "_units"];
		_groups = [];
		_logics = [];
		_units = [];
		
		while {(alive BIS_fnc_diagKnownAsTarget_unit) && !BIS_fnc_diagKnownAsTarget_terminate} do 
		{
			{
				private ["_unitIndex"];
				_unitIndex = _units find _x;

				if (((_x knowsAbout BIS_fnc_diagKnownAsTarget_unit) > 0) && ((typeOf _x) != "Logic")) then 
				{
					private ["_targetData", "_targets"];
					_targetData = [];
					_targets = _x nearTargets BIS_fnc_diagKnownAsTarget_radius;
					
					for "_i" from 0 to ((count _targets) - 1) do 
					{
						if (((_targets select _i) select 4) == BIS_fnc_diagKnownAsTarget_unit) exitWith {_targetData = _targets select _i;};
					};
					
					if ((count _targetData) > 0) then 
					{
						private ["_grp", "_logic"];
						if (_unitIndex == -1) then 
						{			
							_grp = createGroup civilian;
							_groups set [count _groups, _grp];
						
							_logic = _grp createUnit ["Logic", [10, 10, 10], [], 0, "NONE"];
							_logic enableSimulation false;
							_logic hideObject true;
							_logics set [count _logics, _logic];
							
							_grp addGroupIcon ["hc_selectedEnemy", [0, 0]];
							
							_units set [count _units, _x];
						} 
						else 
						{
							_grp = _groups select _unitIndex;
							_logic = _logics select _unitIndex;
						};
						
						_logic setPos (position _x);
						[_logic, -2.3] call BIS_fnc_setHeight;			
					
						private ["_side", "_color", "_alpha", "_size"];
						_side = side _x;
						_color = [1, 1, 1];
						switch _side do 
						{
							case west: {_color = BIS_fnc_diagKnownTargets_colorWest;};
							case east: {_color = BIS_fnc_diagKnownTargets_colorEast;};
							case resistance: {_color = BIS_fnc_diagKnownTargets_colorResistance;};
							case sideUnknown: {_color = BIS_fnc_diagKnownTargets_colorUnknown;};
						};
						_color resize 3;
						
						_alpha = (([[0, 5], _targetData select 5, [0.2, 1]] call BIS_fnc_linearConversion) min 1) max 0.2;
						
						_size = (([[0, 20], _targetData select 3, [0.1, 2]] call BIS_fnc_linearConversion) min 2) max 0.1;
						
						_grp setGroupIconParams [_color + [_alpha], _targetData select 1, _size, true];
					};
				};
			} forEach allUnits;
			
			{
				if ((_x knowsAbout BIS_fnc_diagKnownAsTarget_unit) <= 0) then 
				{
					_units set [_forEachIndex, objNull];

					deleteVehicle (_logics select _forEachIndex);
					_logics set [_forEachIndex, -1];
					deleteGroup (_groups select _forEachIndex);
					_groups set [_forEachIndex, -1];
				};
			} forEach _units;
			
			_units = _units - [objNull];
			_groups = _groups - [-1];
			_logics = _logics - [-1];
			
			sleep 0.001;
		};
		
		{
			{
				deleteVehicle _x;
			} forEach (units _x);
			
			deleteGroup _x;
		} forEach _groups;
		
		BIS_fnc_diagKnownAsTarget_terminate = nil;
		missionNamespace setVariable ["BIS_fnc_diagKnownAsTarget_running", false];
	};
};

true