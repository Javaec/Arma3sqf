private ["_missionName","_worldName","_endName","_missionConfig","_missionPath","_dbAdd"];

startloadingscreen [""];

if (isnil "hsim_isCampaign") then {"Variable 'hsim_isCampaign' not set." call bis_fnc_halt;};
if (!hsim_isCampaign) then {"Cannot start missions from non-campaign environment." call bis_fnc_error;};

_missionName = [_this,0,"",[""]] call bis_fnc_param;
_worldName = [_this,1,worldname,[""]] call bis_fnc_param;
_endName = _missionName;

//--- Recognize type
_missionConfig = campaignconfigfile >> "Campaign" >> "Missions" >> _missionName;
if (isclass _missionConfig) then {

	//--- Campaign mission
	_worldName = gettext (_missionConfig >> "terrain");
	if (_worldName == "") then {["Value 'terrain' for '%1' not set",_missionName] call bis_fnc_halt;};
	_missionName call bis_fnc_heliportMission;
	_missionConfig = _missionName;

} else {

	//--- Procedural mission
	private ["_missionNameProcedural"];
	_missionConfig = configfile >> "cfgbase" >> _worldname >> "Missions" >> _missionName;

	_missionNameProcedural = [hsim_heliportDB,[_worldName,"templateProcedural"]] call bis_fnc_dbValueReturn;
	if (isnil "_missionNameProcedural") then {["Value 'templateProcedural' for '%1' not set",_worldName] call bis_fnc_halt;};
	_missionName call bis_fnc_heliportMission;
	_endName = _missionNameProcedural;
};

//--- Save into DB
_dbAdd = [hsim_heliportDB,["MissionsPending",_missionName,"config"],_missionConfig] call BIS_fnc_dbValueSet;
_dbAdd = [hsim_heliportDB,["MissionsPending",_missionName,"world"],_worldName] call BIS_fnc_dbValueSet;

//--- Set reward coeficient
//[] call bis_fnc_heliportMissionReward;

//--- Register, save and start
[] call BIS_fnc_heliportDBSave;
33 cuttext ["","plain"]; //false call bis_fnc_heliportMoneyDisplay;
endloadingscreen;
endmission (_endName);