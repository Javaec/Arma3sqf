/*
	Author: Karel Moricky

	Description:
	Load newsfeed

	Parameter(s):
	_this select 0: DISPLAY - display where newsfeed with idc 1101 is

	Returns:
	BOOL - true when online
*/

if !(uinamespace getvariable ["BIS_fnc_guiNewsfeed_disable",false]) then {

	private ["_display", "_build", "_isDemo", "_newsOnline", "_newsOffline", "_ctrlHTML", "_htmlLoaded"];
	_display = [_this, 0, findDisplay 0, [displayNull]] call BIS_fnc_param;

	//Determine which version of the game is running
	_build = "";
	_isDemo = getNumber (configFile >> "isDemo");

	if (_isDemo == 1) then 
	{
		switch (productVersion select 1) do 
		{
			case "Arma3": {_build = "beta";};
		};
	} 
	else 
	{
		if ((configName (configFile >> "CfgPatches" >> "A3_Missions_F_EPC")) != "") then 
		{	
			_build = "main";
		} 
		else 
		{
			_build = "trial";
		};
	};

	_newsOnline = "http://www.bistudio.com/newsfeed/arma3_news.php?build=" + _build + "&language=" + language;
	_newsOffline = "a3\Ui_f\data\news.html";

	//Load the correct HTML into the control
	_ctrlHTML = _display displayCtrl 1004;
	_ctrlHTML htmlLoad _newsOnline;

	//Offline back-up
	_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;
	if (!_htmlLoaded) then {
		_ctrlHTML htmlLoad _newsOffline;
		uinamespace setvariable ["BIS_fnc_guiNewsfeed_disable",true];
	};

	_htmlLoaded
} else {
	false
};