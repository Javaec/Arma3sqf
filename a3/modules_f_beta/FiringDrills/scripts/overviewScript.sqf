#include "\A3\ui_f\hpp\defineCommonGrids.inc"

private["_display", "_challenge", "_challengesOverviewGroup"];
_display = _this select 0;
_challenge = _this select 1;
_challengesOverviewGroup = _display displayCtrl 2302;

//Firing Drill or Time Trial?
private ["_config", "_configRoot", "_isFD"];
_configRoot = configFile >> "CfgFiringDrills";
_config = _configRoot >> _challenge;
_isFD = true;
if ((configName _config) == "") then 
{
	_configRoot = configFile >> "CfgTimeTrials";
	_config = _configRoot >> _challenge;
	_isFD = false;
};
if ((configName _config) == "") exitWith {"No Firing Drill or Time Trial entry found for this scenario!" call BIS_fnc_error;};


//-----------------------------------------------------------------------------
//Display fixed medal times.
private ["_ctrlMedalsText"];
_ctrlMedalsText = _display ctrlCreate ["RscStructuredText", 555990, _challengesOverviewGroup];
_ctrlMedalsText ctrlSetPosition [0, 0, 10 * GUI_GRID_W, 3.5 * GUI_GRID_H + (0.5 * (safezoneH - GUI_GRID_HAbs))]; //TODO: Improve?
_ctrlMedalsText ctrlCommit 0;

//Fetch standard medal times.
private ["_timesMedals", "_timeBronze", "_timeBronzeText", "_timeSilver", "_timeSilverText", "_timeGold", "_timeGoldText"];
_timesMedals = getArray (_config >> "timesMedals");
_timeBronze = _timesMedals select 0;
_timeBronzeText = [_timeBronze, "MM:SS.MS"] call BIS_fnc_secondsToString;
_timeSilver = _timesMedals select 1;
_timeSilverText = [_timeSilver, "MM:SS.MS"] call BIS_fnc_secondsToString;
_timeGold = _timesMedals select 2;
_timeGoldText = [_timeGold, "MM:SS.MS"] call BIS_fnc_secondsToString;

//Fetch optional special time.
private ["_timeSpecial", "_timeSpecialText", "_colorSpecial", "_nameSpecial", "_iconSpecial"];
if ((configName (_config >> "timeSpecial")) != "") then 
{
	_timeSpecial = getNumber (_cfgFD >> "timeSpecial");
	_timeSpecialText = [_timeSpecial, "MM:SS.MS"] call BIS_fnc_secondsToString;
	_colorSpecial = getText (_config >> "colorSpecial");
	if (_colorSpecial == "") then {_colorSpecial = "#FFFFFF"};
	_nameSpecial = getText (_config >> "nameSpecial");
	if (_nameSpecial == "") then {_nameSpecial = "Special"};
	_iconSpecial = getText (_config >> "iconSpecial");
	if (_iconSpecial == "") then {_iconSpecial = ""};
} 
else 
{
	_timeSpecial = 0;
	_timeSpecialText = "";
	_colorSpecial = "FFFFFF";
	_nameSpecial = "";
	_iconSpecial = "";
};

//Build the final text and display it.
private ["_medalsText", "_colorsMedals", "_colorBronze", "_colorSilver", "_colorGold", "_colorText", "_iconsMedals", "_iconBronze", "_iconSilver", "_iconGold"];
_colorsMedals = getArray (_configRoot >> "colorsMedals");
_colorBronze = _colorsMedals select 0;
_colorSilver = _colorsMedals select 1;
_colorGold = _colorsMedals select 2;
_colorText = (["IGUI", "TEXT_RGB"] call BIS_fnc_displayColorGet) call BIS_fnc_colorRGBtoHTML;

_iconsMedals = getArray (_configRoot >> "iconsMedals");
_iconBronze = _iconsMedals select 0;
_iconSilver = _iconsMedals select 1;
_iconGold = _iconsMedals select 2;

_medalsText = "";
_medalsText = _medalsText + "<t color='" + _colorBronze  + "'><img image='" + _iconBronze + "' /> " + _timeBronzeText + "</t><br />";
_medalsText = _medalsText + "<t color='" + _colorSilver  + "'><img image='" + _iconSilver + "' /> " + _timeSilverText + "</t><br />";
_medalsText = _medalsText + "<t color='" + _colorGold  + "'><img image='" + _iconGold + "' /> " + _timeGoldText + "</t>";
if (BIS_FD_timeSpecial != -1) then 
{
	_medalsText = _medalsText + "<br /><t color='" + _colorSpecial  + "'><img image='" + _iconSpecial + "' /> " + _nameSpecial + ": " + _timeSpecialText + "</t>";
};

_ctrlMedalsText ctrlSetStructuredText (parseText _medalsText);
_ctrlMedalsText ctrlSetTooltip (localize "STR_A3_FIRING_DRILLS_TOOLTIP_MEDALS");


//-----------------------------------------------------------------------------
//Display Competitive statistics.
//Display Competitive icon.
private ["_ctrlCompetitiveIcon"];
_ctrlCompetitiveIcon = _display ctrlCreate ["RscStructuredText", 555991, _challengesOverviewGroup]; //TODO: use RscPicture?
_ctrlCompetitiveIcon ctrlSetPosition [10 * GUI_GRID_W, 0, 21.5 * GUI_GRID_W, 3.5 * GUI_GRID_H]; //TODO: Improve?
_ctrlCompetitiveIcon ctrlCommit 0;
_ctrlCompetitiveIcon ctrlSetStructuredText (parseText "<img image='A3\Modules_F_Beta\data\FiringDrills\competitive_ca' size='2' />");
_ctrlCompetitiveIcon ctrlSetTooltip (localize "STR_A3_FIRING_DRILLS_TOOLTIP_COMPETITIVE_RESULTS");

//Display Competitive text.
private ["_ctrlCompetitiveText", "_competitiveStats", "_timePrevious", "_timePreviousText"];
_ctrlCompetitiveText = _display ctrlCreate ["RscStructuredText", 555992, _challengesOverviewGroup];
_ctrlCompetitiveText ctrlSetPosition [13 * GUI_GRID_W, 0, 21.5 * GUI_GRID_W, 3.5 * GUI_GRID_H]; //TODO: Improve?
_ctrlCompetitiveText ctrlCommit 0;

//TODO: If we ever support multiple CoFs / trials per scenario, this will not work
if (_isFD) then 
{
	_competitiveStats = profileNamespace getVariable [_challenge + "_0_1", [-1, -1]]; 
} 
else 
{
	_competitiveStats = profileNamespace getVariable [_challenge + "_0_0", [-1, -1]];
};

_timePrevious = _competitiveStats select 0;
if (_timePrevious != -1) then 
{
	_timePreviousText = [_timePrevious, "MM:SS.MS"] call BIS_fnc_secondsToString;
	
	private ["_color", "_icon"];
	if (_timePrevious <= _timeSpecial) then 
	{
		_color = _colorSpecial;
		_icon = _iconSpecial;
	} 
	else 
	{	
		if (_timePrevious <= _timeGold) then 
		{
			_color = _colorGold;
			_icon = _iconGold;
		} 
		else 
		{
			if (_timePrevious <= _timeSilver) then 
			{
				_color = _colorSilver;
				_icon = _iconSilver;
			} 
			else 
			{
				if (_timePrevious <= _timeBronze) then 
				{
					_color = _colorBronze;
					_icon = _iconBronze;
				} 
				else 
				{
					_color = _colorText;
					_icon = "A3\Modules_F_Beta\data\FiringDrills\medal_none_ca";
				};
			};
		};
	};

	_timePreviousText = "<t color='" + _color + "'><img image='" + _icon + "' /> " + _timePreviousText + "</t>";
} 
else 
{
	_timePreviousText = "<img image='A3\Modules_F_Beta\data\FiringDrills\medal_none_ca' /> --:--.---";
};

private ["_timeBest", "_timeBestText"];
_timeBest = _competitiveStats select 1;
if (_timeBest != -1) then 
{
	_timeBestText = [_timeBest, "MM:SS.MS"] call BIS_fnc_secondsToString;
	
	private ["_color", "_icon"];
	if (_timeBest <= _timeSpecial) then 
	{
		_color = _colorSpecial;
		_icon = _iconSpecial;
	} 
	else 
	{	
		if (_timeBest <= _timeGold) then 
		{
			_color = _colorGold;
			_icon = _iconGold;
		} 
		else 
		{
			if (_timeBest <= _timeSilver) then 
			{
				_color = _colorSilver;
				_icon = _iconSilver;
			} 
			else 
			{
				if (_timeBest <= _timeBronze) then 
				{
					_color = _colorBronze;
					_icon = _iconBronze;
				} 
				else 
				{
					_color = _colorText;
					_icon = "A3\Modules_F_Beta\data\FiringDrills\medal_none_ca";
				};
			};
		};
	};

	_timeBestText = "<t color='" + _color + "'><img image='" + _icon + "' /> " + _timeBestText + "</t>";
} 
else 
{
	_timeBestText = "<img image='A3\Modules_F_Beta\data\FiringDrills\medal_none_ca' /> --:--.---";
};

_ctrlCompetitiveText ctrlSetStructuredText (parseText ((localize "STR_A3_FIRING_DRILLS_HINT_TIME_BEST") + " " + _timeBestText + "<br /><t size='0.8'>" + (localize "STR_A3_FIRING_DRILLS_HINT_TIME_PREVIOUS") + " " + _timePreviousText + "</t>"));
_ctrlCompetitiveText ctrlSetTooltip (localize "STR_A3_FIRING_DRILLS_TOOLTIP_COMPETITIVE_RESULTS");



//-----------------------------------------------------------------------------
//Display Training statistics.
if (_isFD) then 
{
	//Display Training icon.
	private ["_ctrlTrainingIcon"];
	_ctrlTrainingIcon = _display ctrlCreate ["RscStructuredText", 555993, _challengesOverviewGroup]; //TODO: use RscPicture?
	_ctrlTrainingIcon ctrlSetPosition [10 * GUI_GRID_W, 3 * GUI_GRID_H, 21.5 * GUI_GRID_W, 3.5 * GUI_GRID_H]; //TODO: Improve?
	_ctrlTrainingIcon ctrlCommit 0;
	_ctrlTrainingIcon ctrlSetStructuredText (parseText "<img image='A3\Modules_F_Beta\data\FiringDrills\training_ca' size='2' />");
	_ctrlTrainingIcon ctrlSetTooltip (localize "STR_A3_FIRING_DRILLS_TOOLTIP_TRAINING_RESULTS");

	//Display Training text.
	private ["_ctrlTrainingText", "_trainingStats", "_timePrevious", "_timePreviousText"];
	_ctrlTrainingText = _display ctrlCreate ["RscStructuredText", 555994, _challengesOverviewGroup];
	_ctrlTrainingText ctrlSetPosition [13 * GUI_GRID_W, 3 * GUI_GRID_H, 21.5 * GUI_GRID_W, 3.5 * GUI_GRID_H]; //TODO: Improve?
	_ctrlTrainingText ctrlCommit 0;

	//TODO: If we ever support multiple CoFs / trials per scenario, this will not work
	_trainingStats = profileNamespace getVariable [_challenge + "_0_0", [-1, -1]]; 

	_timePrevious = _trainingStats select 0;
	if (_timePrevious != -1) then 
	{
		_timePreviousText = [_timePrevious, "MM:SS.MS"] call BIS_fnc_secondsToString;
	} 
	else 
	{
		_timePreviousText = "--:--.---";
	};

	private ["_timeBest", "_timeBestText"];
	_timeBest = _trainingStats select 1;
	if (_timeBest != -1) then 
	{
		_timeBestText = [_timeBest, "MM:SS.MS"] call BIS_fnc_secondsToString;
	} 
	else 
	{
		_timeBestText = "--:--.---";
	};

	_ctrlTrainingText ctrlSetStructuredText (parseText ((localize "STR_A3_FIRING_DRILLS_HINT_TIME_BEST") + " " + _timeBestText + "<br /><t size='0.8'>" + (localize "STR_A3_FIRING_DRILLS_HINT_TIME_PREVIOUS") + " " + _timePreviousText + "</t>"));
	_ctrlTrainingText ctrlSetTooltip (localize "STR_A3_FIRING_DRILLS_TOOLTIP_TRAINING_RESULTS");
};

true