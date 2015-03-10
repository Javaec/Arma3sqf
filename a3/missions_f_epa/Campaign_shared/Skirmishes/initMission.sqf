/*--------------------------------------------------------------------------------------------------

	SYSTEM

--------------------------------------------------------------------------------------------------*/
west setFriend [resistance, 0];
resistance setFriend [west, 0];

/*--------------------------------------------------------------------------------------------------

	DEVELOPER TOGGLES

--------------------------------------------------------------------------------------------------*/

BIS_debugMode 		  = false;
BIS_showHelpers 	  = false;
BIS_phaseObjects	  = true;
BIS_hideObjects		  = true;

BIS_useLoadingScreen	  = true;

BIS_scriptNull		  = [] spawn {};
BIS_pathSystem 	  	  = "\a3\Missions_F_EPA\Campaign_shared\Skirmishes\";

//function overrides
BIS_fnc_blackOut_disabled = true;

/*--------------------------------------------------------------------------------------------------

	INIT GLOBAL VARIABLES

--------------------------------------------------------------------------------------------------*/
BIS_isCampaign	= [] call BIS_fnc_isCampaign;
BIS_is3dEditor	= !(isNull findDisplay 128);

/*--------------------------------------------------------------------------------------------------

	DEBUG

--------------------------------------------------------------------------------------------------*/
if !(profileName == "warka" || profileName == "vasek") then
{
	BIS_debugMode = false;
};

/*
if !(BIS_is3dEditor) then
{
	BIS_DebugMode = false;
};
*/

if (BIS_debugMode) then
{
	("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];
}
else
{
	BIS_showHelpers 	  = false;
	BIS_useLoadingScreen	  = true;
	BIS_hideObjects		  = true;

	BIS_fnc_blackOut_disabled = false;
};

/*--------------------------------------------------------------------------------------------------

	START LOADING SCREEN

--------------------------------------------------------------------------------------------------*/
if (BIS_useLoadingScreen) then
{
	["skirmish_missionInit"] call BIS_fnc_startLoadingScreen;
};

/*--------------------------------------------------------------------------------------------------

	SPAWN ALL VALID POIs

--------------------------------------------------------------------------------------------------*/
if (BIS_is3dEditor) then
{
	BIS_POIs = [missionName];
}
else
{
	//store all linked & valid pois
	BIS_POIs = [missionName] call BIS_fnc_camp_poiGetLinked;

	//spawn compositions
	private["_composition"];

	{
		_composition = [_x] execVM BIS_pathSystem + format["POIs\%1.sqf",_x];

		waitUntil{scriptDone _composition};

		//["[i] POI composition set: %1",_x] call BIS_fnc_logFormat;
	}
	forEach BIS_POIs;
};

/*--------------------------------------------------------------------------------------------------

	DRAW HUB TRANSITION TRIGGER MARKERS

--------------------------------------------------------------------------------------------------*/

if (BIS_DebugMode) then
{
	"BIS_HubArea" setMarkerAlpha 1;
};


/*--------------------------------------------------------------------------------------------------

	DISABLE ALREADY COMPLETED POIs

--------------------------------------------------------------------------------------------------*/
private["_poi","_status","_center","_size","_enemies"];

{
	_poi = _x;

	if (true) then
	{
		_status  = [_poi] call BIS_fnc_camp_poiGetStatus;

		//["[i][%1] _status = %2",_poi,_status] call BIS_fnc_logFormat;

		if (_status != 1) exitWith {};

		//gather some useful data for triggers
		_center	 = ["POIs",_poi,"center"] call BIS_fnc_getCfgData;
		_size 	 = ["POIs",_poi,"size"] call BIS_fnc_getCfgData;

		if (_center == "auto") then
		{
			_center = format["BIS_%1_%2",_poi,"center"];
		};

		_center	 = missionNamespace getVariable [_center,objNull];
		_enemies = (nearestObjects [_center, ["man"], _size]) - [player];

		//["[ ][%1] _center = %2",_poi,_center] call BIS_fnc_logFormat;
		//["[ ][%1] _enemies = %2",_poi,_enemies] call BIS_fnc_logFormat;

		//remove all units from POI
		{
			deleteVehicle _x;
		}
		forEach _enemies;

		//delete all unwanted objects, like cars
		{
			deleteVehicle _x;
		}
		forEach (nearestObjects [_center, ["car","east_box_base","ind_box_base","nato_box_base","sign_pointer_yellow_f","sign_arrow_large_cyan_f","sign_arrow_large_pink_f","sign_pointer_green_f","sign_pointer_blue_f","sign_arrow_large_blue_f"], _size]);

		//create "completed" marker
		[_poi] call BIS_fnc_camp_poiDrawMarker;

		BIS_POIs set [_forEachIndex,"DELETE_ME"];
	};
}
forEach BIS_POIs;

BIS_POIs = BIS_POIs - ["DELETE_ME"];

/*--------------------------------------------------------------------------------------------------

	MISSION COMPONENTS

--------------------------------------------------------------------------------------------------*/
BIS_SkirmishComponents = [];

private["_components","_script"];

_components = ["Start","Objects","Ai","Anims","DayTime","Mines","ParticleEffects","SqmCompositions","Vehicles"];

//register blackouts for all components
{
	[format["BIS_initMission_%1",_x],false] call BIS_fnc_blackOut;	//instant blackOut
}
forEach _components;


{
	_script = [] execVM BIS_pathSystem + format["init%1.sqf",_x];

	waitUntil{scriptDone _script};

	BIS_SkirmishComponents set [count BIS_SkirmishComponents,_x];

	["[i] Component initialized: %1",_x] call BIS_fnc_logFormat;

	//un-register blackout for given component
	[format["BIS_initMission_%1",_x]] call BIS_fnc_blackIn;
}
forEach _components;

["[i] All components loaded!"] call BIS_fnc_logFormat;

/*--------------------------------------------------------------------------------------------------

	INITIALIZE POIs

--------------------------------------------------------------------------------------------------*/
{
	[_x] spawn BIS_fnc_camp_poiInit;
}
forEach BIS_POIs;

/*--------------------------------------------------------------------------------------------------

	END LOADING SCREEN

--------------------------------------------------------------------------------------------------*/
if (BIS_useLoadingScreen) then
{
	["skirmish_missionInit"] call BIS_fnc_endLoadingScreen;

	if (BIS_is3dEditor) then
	{
		//endloadingscreen;

		["bis_fnc_preload"] call BIS_fnc_endLoadingScreen;
		["bis_fnc_initRespawn"] call BIS_fnc_endLoadingScreen;
	};
};