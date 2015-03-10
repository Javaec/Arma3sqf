private ["_path"];
_path = gettext (configfile >> "RscGUIEditor" >> "path");
[] spawn compile preprocessfilelinenumbers (_path + "GUI_init.sqf");