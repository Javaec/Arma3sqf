scriptName "initIntroBriefing3.sqf";

/*--------------------------------------------------------------------------------------------------

	TERMINATE IF NO DEBRIEFING

--------------------------------------------------------------------------------------------------*/
private["_introBriefing","_units"];

_introBriefing = ["Hubs",missionName,"IntroBriefing","active"] call BIS_fnc_getCfgDataBool;

if !(_introBriefing && !(missionName in BIS_PER_missionsQue)) exitWith {BIS_IntroBriefing_completed = true};

/*--------------------------------------------------------------------------------------------------

	CUSTOM FUNCTION(S)

--------------------------------------------------------------------------------------------------*/
//["EPB_B_Kerry","face","Kerry_B2_F"] call BIS_IntroBriefing_updateIdentity;
BIS_IntroBriefing_updateIdentity =
{
	private["_id","_stat","_value","_stats"];

	_id 	= [_this, 0, "EPB_B_Kerry", [""]] call BIS_fnc_param;
	_stat 	= [_this, 1, "face", [""]] call BIS_fnc_param;
	_value 	= [_this, 2, "Kerry_B2_F", [""]] call BIS_fnc_param;

	_stats  = [BIS_PER_IDENT_Main,_id] call BIS_fnc_getFromPairs;

	_stats  = [_stats,_stat,_value] call BIS_fnc_setToPairs;

	[BIS_PER_IDENT_Main,_id,_stats] call BIS_fnc_setToPairs;
};

/*--------------------------------------------------------------------------------------------------

	RE-SETUP UNITS

--------------------------------------------------------------------------------------------------*/
private["_unit","_pos","_dir"];

_units = (allMissionObjects "Man") - [BIS_inf, BIS_armory];

//terminate ambient animations and reposition the units
{
	_unit = _x;

	_pos = _unit getVariable ["BIS_pos", [100,100,0]];
	_dir = _unit getVariable ["BIS_dir", 0];

	_unit call BIS_fnc_ambientAnim__terminate;

	_unit setPosASL _pos;
	_unit setDir _dir;

	//surpress the unit "intelligence"
	{_unit disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

	//make units visible
	_unit hideObject false;
	_unit enableSimulation true;
}
forEach _units;

BIS_IntroBriefing_running = false;

/*--------------------------------------------------------------------------------------------------

	SETUP SCENE & PLAY QUOTATION

--------------------------------------------------------------------------------------------------*/

private["_pos","_dir"];

//change weather
[nil,nil,nil,nil,["Hubs",missionName,"IntroBriefing","AfterCutscene"]] spawn BIS_fnc_camp_setTimeWeather;

//show "X days later"
if !(BIS_SkipQuotation) then
{
	private["_quotation"];

	BIS_fnc_quotations_skip = nil;
	BIS_fnc_quotations_playing = false;

	clearRadio;

	_quotation = ["Hubs",missionName,"IntroBriefing","AfterCutscene","quote"] call BIS_fnc_getCfgData;
	_quotation call BIS_fnc_quotations;

	waitUntil {BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
	waitUntil {!BIS_fnc_quotations_playing || !isNil "BIS_fnc_quotations_skip"};
};

//update player's face
["EPB_B_Kerry","face","Kerry_B2_F"] call BIS_IntroBriefing_updateIdentity;
[player,"EPB_B_Kerry"] call BIS_fnc_camp_setIdentity;

//reposition player
_pos = ["Hubs",missionName,"IntroBriefing","AfterCutscene","position"] call BIS_fnc_getCfgDataObject;
_dir = getDir _pos;
_pos = getPos _pos; _pos set [2,0];

player setPos _pos;
player setDir _dir;

if (primaryWeapon player != "") then {player playMoveNow "amovpercmstpslowwrfldnon"} else {player playMoveNow "amovpercmstpsnonwnondnon"};

sleep 1;

//make player walk at the beginning
[] spawn
{
	scriptName "initIntroBriefing.sqf: player walk after debriefing";

	//set animation
	if (primaryWeapon player != "") then {player switchMove "HubSpectator_walk"} else {player switchMove "HubSpectator_walkU"};

	sleep 7;

	player playMoveNow "amovpercmstpslowwrfldnon";

	if (primaryWeapon player != "") then {player playMoveNow "amovpercmstpslowwrfldnon"} else {player playMoveNow "amovpercmstpsnonwnondnon"};
};

/*--------------------------------------------------------------------------------------------------

	CLEANUP

--------------------------------------------------------------------------------------------------*/

//temp hack: fix BIS_recon anim
[BIS_recon,"BRIEFING_POINT_RIGHT","ASIS"] call BIS_fnc_ambientAnim;

//flag the intro briefing as finished
BIS_IntroBriefing_completed = true;

//black in & wait
["BIS_IntroBriefing"] call BIS_fnc_blackIn; waitUntil {BIS_fnc_blackIn_completed};

[1,nil,false] spawn BIS_fnc_cinemaBorder;