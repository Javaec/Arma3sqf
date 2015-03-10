disableSerialization;

uiNamespace setVariable ["BIS_interruptDisplay", _this select 0];

private ["_controlRevert"];
_controlRevert = (_this select 0) displayCtrl 119; //Hijack restart button to do a quick restart

//Handle various phases of a FD differently
switch (missionNamespace getVariable ["BIS_FD_phase", 0]) do 
{
	case 0: 
	{
		//Drill has not been triggered even once - use default behavior
	};
	
	case 1: 
	{
		//Still selecting rules - disable
		_controlRevert ctrlSetTooltip (localize "STR_A3_FIRING_DRILLS_UI_RESTART");
		_controlRevert ctrlEnable false;
	};
	
	case 2: 
	{
		//Restart the drill
		_controlRevert ctrlSetTooltip (localize "STR_A3_FIRING_DRILLS_UI_RESTART");
		_controlRevert ctrlEnable true;
		_controlRevert ctrlSetEventHandler ["buttonClick", "(uiNamespace getVariable ""BIS_interruptDisplay"") closeDisplay 2; BIS_FD_restart = true; true"];
	};
};

true