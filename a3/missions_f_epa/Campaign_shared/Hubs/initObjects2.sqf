scriptName "initObjects2.sqf";

//--------------------------------------------------------------------------------------------------
//
// 	BRIEFING SCENE DEBUG
//
//--------------------------------------------------------------------------------------------------
if (BIS_debugMode && BIS_showHelpers) then
{
	[] spawn
	{
		waitUntil{BIS_selectedMission != ""};

		private["_mission"];

		_mission = BIS_selectedMission;

		_helper = ["Missions",_mission,"HubBriefing","SpecialCharacters","Speaker","position"] call BIS_fnc_getCfgDataObject;
		_helper hideObject false;
	};
};