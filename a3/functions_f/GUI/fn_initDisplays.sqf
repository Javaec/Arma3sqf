/*
	Author: Karel Moricky

	Description:
	Initialize GUI display functions. Executed only on the game start.

	Parameter(s):
	NOTHING

	Returns:
	BOOL
*/

{
	{
		if (getnumber (_x >> "scriptIsInternal") == 0) then { //--- Ignore internal scripts, they're recompile first time they're opened
			_scriptName = gettext (_x >> "scriptName");
			_scriptPath = gettext (_x >> "scriptPath");
			if (_scriptName == "") then {_scriptName = configname _x;};
			if (_scriptPath == "") then {_scriptName = "GUI";};

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
	} foreach (configproperties [_x,"isclass _x && {istext (_x >> 'scriptPath')}"]);
} foreach [
	configfile,
	configfile >> "RscTitles",
	configfile >> "RscIngameUI"
];
true