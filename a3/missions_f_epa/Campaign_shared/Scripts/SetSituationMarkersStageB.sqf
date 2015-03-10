#define BIN2_PLAYED			!isNil "BIS_B_in2"
#define BM01_PLAYED			!isNil "BIS_B_m01"
#define BM02_PLAYED			!isNil "BIS_B_m02_2"
#define BM03_PLAYED			!isNil "BIS_B_m03"
#define BM05_PLAYED			!isNil "BIS_B_m05"
#define BM06_PLAYED			!isNil "BIS_B_m06"
#define BMOUT2_PLAYED			!isNil "BIS_B_out2"


//here we will create markers (areas, icons)
private  ["_markerRef","_s"];


switch( missionname ) do
{
	case "B_hub01":
	{
		 //["hub01:%1", "hub01" ] call BIS_fnc_LogFormat;
		_s = [] execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_for_B_hub01.sqf";
		//_s = [] execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_ORBAT_for_A_hub.sqf";
	};
	case "B_hub02":
	{
		//["hub02:%1", "hub01" ] call BIS_fnc_LogFormat;
		_s = [] execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_for_B_hub02.sqf";
		//_s = [] execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_ORBAT_for_A_hub.sqf";
	};
	case "B_hub03":
	{
		//["hub03:%1", "hub01" ] call BIS_fnc_LogFormat;
		_s = [] execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_for_B_hub03.sqf";
		//_s = [] execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\markers_ORBAT_for_A_hub.sqf";
	};
};

/*
"Missions played:" call BIS_fnc_Log;
{
	 ["%1", _x ] call BIS_fnc_LogFormat;
}
forEach [BM01_played, BM02_played, BM03_played, BM04_played, BM05_played, BMOut_played];
*/

// Change markers if necessary
// Markers are set black (empty) or green (AAF controlled) in dependence on ORBAT markers.
// ORBAT markers has its own condition of presence (see markers_ORBAT_for_A_hub.sqf)


/*
// Camp Tempest
if (!(isNil "BIS_tempestORBAT")) then {
	BIS_tempestORBAT setPos markerPos "BIS_tempest";
} else {
	"BIS_tempest" setMarkerColor "ColorBlack";
};

// Girna
if (!(isNil "BIS_villageORBAT")) then {
	BIS_villageORBAT setPos markerPos "BIS_village";
} else {
	"BIS_village" setMarkerColor "ColorBlack";
};

// Air Station Mike-26
if (!(isNil "BIS_mike26ORBAT")) then {
	BIS_mike26ORBAT setPos markerPos "BIS_mike26";
} else {
	"BIS_mike26" setMarkerColor "ColorBlack";
};

*/

//Frontlines phases
//PHASE 4
if ( BM02_PLAYED ) then { execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_b_phase_04.sqf"; execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\orbat_b_phase_04.sqf"; ["phase4:%1", true ] call BIS_fnc_LogFormat; }
else
{
	//"not in phase 4" call BIS_fnc_Log;
	//PHASE 3
	if ( BM05_PLAYED ) then { execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_b_phase_03.sqf"; execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\orbat_b_phase_03.sqf";  ["phase3:%1", true ] call BIS_fnc_LogFormat; }
	else
	{
		//"not in phase 3" call BIS_fnc_Log;
		//PHASE 2
		if ( BM06_PLAYED ) then	{ execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_b_phase_02.sqf"; execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\orbat_b_phase_02.sqf"; ["phase2:%1", true ] call BIS_fnc_LogFormat; }
		else
		{
			//"not in phase 2" call BIS_fnc_Log;
			//PHASE 1
			if ( BIN2_PLAYED ) then { execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\frontline_b_phase_01.sqf"; execVM "\A3\Missions_F_EPA\Campaign_shared\Scripts\orbat_b_phase_01.sqf";  ["phase1:%1", true ] call BIS_fnc_LogFormat; };
		};
	};
};


//{ _x setMarkerAlpha 0.25 } forEach [ "BIS_mrkUnknown01", "BIS_mrkUnknown02", "BIS_mrkUnknown03" ];
