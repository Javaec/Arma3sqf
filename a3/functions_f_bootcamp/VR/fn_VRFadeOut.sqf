/*
	Author: Josef Zemanek

	Description:
	Fade Out effect for VR.

	Parameter(s):
		NONE

	Returns:
	Nothing
*/

hintSilent "";
showCommandingMenu "";
BIS_hideHint = TRUE;
titleCut ["", "BLACK OUT", 1];
titleRsc ["RscStatic","PLAIN"];
if (isNil "BIS_fnc_VR_topicInfo") then {
	playSound "Simulation_Restart";
} else {
	if (count _this == 0) then {
		playSound "Simulation_Restart"
	} else {
		if (_this select 0 == "death") then {playSound "Simulation_Fatal"};
		if (_this select 0 == "done") then {playSound "Topic_Done"};
	};
};