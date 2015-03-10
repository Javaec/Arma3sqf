/*
	Author: Karel Moricky

	Description:
	Initialize GUI display and run its script (already compiled by BIS_fnc_initDisplays)

	Parameter(s):
		0: STRING - mode, can be "onLoad" or "onUnload"
		1: ARRAY - params passed from "onLoad" or "onUnload" event handler, contains only DISPLAY
		2: STRING - display class
		3: STRING - script path from CfgScriptPaths

	Returns:
	NOTHING
*/

private ["_mode","_params","_class"];

with uinamespace do {
	_mode = [_this,0,"",[""]] call bis_fnc_param;
	_params = [_this,1,[]] call bis_fnc_param;
	_class = [_this,2,"",[""]] call bis_fnc_param;
	_path = [_this,3,"default",[""]] call bis_fnc_param;

	_varDisplays = _path + "_displays";
	_varClasses = _path + "_classes";

	//--- Check color settings (when nil, set default values)
	if (_path == "GUI") then {["GUI","BCG_RGB"] call bis_fnc_displayColorGet;};

	//--- Register/unregister display
	_display = _params select 0;
	switch _mode do {
		case "onLoad": {
			_displays = uinamespace getvariable [_varDisplays,[]];
			_classes = uinamespace getvariable [_varClasses,[]];

			//--- Remove null displays
			{
				if (isnull _x) then {
					_displays set [_foreachindex,displaynull];
					_classes set [_foreachindex,""];
				};
			} foreach _displays;
			_displays = _displays - [displaynull];
			_classes = _classes - [""];
			_classes resize (count _displays);

			//--- Register current display
			_display = _params select 0;
			_displays set [count _displays,_display];
			_classes set [count _classes,_class];

			if (_path == "GUI") then {
				if (isnil "BIS_initGame") then {
					if ({ctrlidd _x >= 0} count _displays > 1) then {
						BIS_initGame = true;
					};
				};
			};

			//--- Store variables
			uinamespace setvariable [_varDisplays,_displays];
			uinamespace setvariable [_varClasses,_classes];
			uinamespace setVariable [_class, _params select 0];

			//--- Effects
			[_display,_class] call bis_fnc_guiEffectTiles;

		};
		case "onUnload": {
			if (_path == "GUI") then {
				_displays = uinamespace getvariable [_varDisplays,[]];
				if (count _displays == 2) then {
					(_displays select 0) call bis_fnc_guiNewsfeed;
				};
			};
		};
	};

	//--- Recompile in the internal version
	if (cheatsenabled) then {
		_scriptName = _class;
		_scriptPath = _path;
		uinamespace setvariable [
			_scriptName + "_script",
			compileFinal (
				format [
					"scriptname '%1'; _fnc_scriptName = '%1';",
					_scriptName
				]
				+ 
				preprocessfilelinenumbers format ["%1%2.sqf",gettext (configfile >> "cfgScriptPaths" >> _scriptPath),_scriptName]
			)
		];
	};

	//--- Call script
	if (!cheatsEnabled || (cheatsEnabled && !(uinamespace getvariable ["BIS_disableUIscripts",false]))) then {
		[_mode,_params,_class] call (uinamespace getvariable (_class + "_script"));
	};
};