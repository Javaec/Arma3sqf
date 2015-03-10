/*
	Author: Karel Moricky

	Description:
	Start automatic loading screen upon mission start.
	On client, it will finish only when server is finished.

	Parameter(s):
	None

	Returns:
	BOOL
*/

["----- Initializing scripts in %1 -----",missionname] call bis_fnc_logFormat;
"bis_fnc_preload" call (uinamespace getvariable ["bis_fnc_startLoadingScreen",{}]);
progressloadingscreen 1;

[diag_ticktime] spawn {
	disableserialization;
	_timeOut = diag_ticktime + 20;
	waituntil {
		//startloadingscreen [""];
		uisleep 0.01;
		(
			count (missionnamespace getvariable ["BIS_fnc_startLoadingScreen_ids",[]]) <= 1 //--- All remaining loading screens finished
			&&
			missionnamespace getvariable ["bis_fnc_init",false]
			&&
			(
				call (missionnamespace getvariable ["BIS_fnc_preload_server",{isserver}]) //--- Server loading finished
				||
				diag_ticktime > _timeOut //--- Safety net
			)
		)
		||
		getClientState == "LOGGED IN" //--- Server lost
		||
		diag_ticktime > _timeOut //--- Safety net LINUX SERVER
	};
	uisleep 0.2; //--- Wait and give other system chance to start their loading screens
	"bis_fnc_preload" call (uinamespace getvariable ["bis_fnc_endLoadingScreen",{}]);

	//--- Server loading finished - tell clients they can finish as well
	if (isnil "BIS_fnc_preload_server") then {BIS_fnc_preload_server = compilefinal "true";};
	if (isserver) then {
		publicvariable "BIS_fnc_preload_server";
	};

	_fnc_scriptname = "BIS_fnc_preload";
	["----- Scripts initialized at %1 ms -----",(diag_ticktime - (_this select 0)) * 1000] call bis_fnc_logFormat;

	bis_fnc_preload_init = true;
};
true