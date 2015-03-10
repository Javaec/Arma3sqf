/*
	Author: Karel Moricky

	Description:
	Disable parts of the main menu during public presentation.
	Press Ctrl+Shift+U to toggle the lock.
*/

disableSerialization;
private ["_display"];
_display = findDisplay 0;

switch (_this select 0) do 
{
	case "disable": 
	{
		private ["_enable"];
		_enable = !(profileNamespace getVariable ["BIS_fnc_initExpo_lock", false]);
		{
			private ["_ctrl"];
			_ctrl = _display displayCtrl _x;
			_ctrl ctrlEnable (_enable && ((ctrlFade _ctrl) == 0));
		} 
		foreach 
		[
			101,	//--- Campaigns
			//103,	//--- Scenarios
			105,	//--- Multiplayer
			106,	//--- Exit
			301,	//--- Video Options
			302,	//--- Audio Options
			307,	//--- Game Options
			1001,	//--- Profile Options
			140,	//--- Expansions
			104	//--- All MIssions
		];
	};
	case "keydown": 
	{
		private ["_params", "_key", "_shift", "_ctrl"];
		_params = _this select 1;
		_key = _params select 1;
		_shift = _params select 2;
		_ctrl = _params select 3;
		
		if ((_key == 22) && _shift && _ctrl) then 
		{
			profileNamespace setVariable ["BIS_fnc_initExpo_lock", !(profileNamespace getVariable ["BIS_fnc_initExpo_lock", false])];
			saveProfileNamespace;
		};
	};
	default 
	{
		_display displaySetEventhandler ["mousemoving", "['disable'] call BIS_fnc_initExpo;"];
		_display displaySetEventhandler ["mouseholding", "['disable'] call BIS_fnc_initExpo;"];
		_display displaySetEventhandler ["keydown", "['keydown', _this] call BIS_fnc_initExpo;"];
		profileNamespace setVariable ["BIS_fnc_initExpo_lock", true];
		saveProfileNamespace;
	};
};