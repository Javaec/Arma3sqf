/*
	Author: Karel Moricky

	Description:
	Shake mission notification.
	When one is already shown, queue the new request and display it afterwards.
	Uses templates defined in CfgNotifications.

	Parameter(s):
	_this select 0 (Optional): STRING - template from CfgNotifications
	_this select 1 (Optional): ARRAY - arguments passed to the template

	Returns:
	BOOL
*/

//--- Don't show the notification on the misison start
if (time < 1) exitwith {};

private ["_template","_args","_cfgDefault","_cfgTemplate","_cfgTitle","_cfgIconPicture","_cfgIconText","_cfgDescription","_cfgColor","_cfgDuration","_cfgPriority","_cfgDifficulty","_cfgSound","_cfgSoundClose","_cfgSoundRadio","_title","_iconPicture","_iconText","_description","_color","_duration","_priority","_difficulty","_sound","_soundClose","_soundRadio","_data","_difficultyEnabled"];
_template = [_this,0,"Default",[""]] call bis_fnc_param;
_args = [_this,1,[],[[]]] call bis_fnc_param;

//--- Load notification params
_cfgDefault = configfile >> "CfgNotifications" >> "Default";
_cfgTemplate = [["CfgNotifications",_template],_cfgDefault] call bis_fnc_loadClass;

if (_cfgTemplate == _cfgDefault) then {["Template '%1' not found in CfgNotifications.",_template] call bis_fnc_error;};

_cfgTitle =		[_cfgDefault,_cfgTemplate] select (istext (_cfgTemplate >> "title"));
_cfgIconPicture =	[_cfgDefault,_cfgTemplate] select (istext (_cfgTemplate >> "iconPicture"));
_cfgIconText =		[_cfgDefault,_cfgTemplate] select (istext (_cfgTemplate >> "iconText"));
_cfgDescription =	[_cfgDefault,_cfgTemplate] select (istext (_cfgTemplate >> "description"));
_cfgColor =		[_cfgDefault,_cfgTemplate] select (isarray (_cfgTemplate >> "color"));
_cfgColorIconPicture =	[_cfgDefault,_cfgTemplate] select (isarray (_cfgTemplate >> "colorIconPicture"));
_cfgColorIconText =	[_cfgDefault,_cfgTemplate] select (isarray (_cfgTemplate >> "colorIconText"));
_cfgDuration =		[_cfgDefault,_cfgTemplate] select (isnumber (_cfgTemplate >> "duration"));
_cfgPriority =		[_cfgDefault,_cfgTemplate] select (isnumber (_cfgTemplate >> "priority"));
_cfgDifficulty =	[_cfgDefault,_cfgTemplate] select (isarray (_cfgTemplate >> "difficulty"));
_cfgSound =		[_cfgDefault,_cfgTemplate] select (istext (_cfgTemplate >> "sound"));
_cfgSoundClose =	[_cfgDefault,_cfgTemplate] select (istext (_cfgTemplate >> "soundClose"));
_cfgSoundRadio =	[_cfgDefault,_cfgTemplate] select (istext (_cfgTemplate >> "soundRadio"));

_title =		gettext (_cfgTitle >> "title");
_iconPicture =		gettext (_cfgIconPicture >> "iconPicture");
_iconText =		gettext (_cfgIconText >> "iconText");
_description =		gettext (_cfgDescription >> "description");
_color =		(_cfgColor >> "color") call bis_fnc_colorCOnfigToRGBA;
_colorIconText =	(_cfgColorIconText >> "colorIconText") call bis_fnc_colorConfigToRGBA;
_colorIconPicture =	(_cfgColorIconPicture >> "colorIconPicture") call bis_fnc_colorConfigToRGBA;
_duration =		getnumber (_cfgDuration >> "duration");
_priority =		getnumber (_cfgPriority >> "priority");
_difficulty =		getarray (_cfgDifficulty >> "difficulty");
_sound =		gettext (_cfgSound >> "sound");
_soundClose =		gettext (_cfgSoundClose >> "soundClose");
_soundRadio =		gettext (_cfgSoundRadio >> "soundRadio");

if !(isarray (_cfgTemplate >> "colorIconText")) then {_colorIconText = _color;};
if !(isarray (_cfgTemplate >> "colorIconPicture")) then {_colorIconPicture = _color;};

_data = [_title,_iconPicture,_iconText,_description,_color,_colorIconPicture,_colorIconText,_duration,_priority,_args,_sound,_soundClose,_soundRadio];

//--- Check if all required defficulties are enabled
_difficultyEnabled = true;
{
	_difficultyEnabled = _difficultyEnabled && (difficultyenabled _x);
} foreach _difficulty;

if (_difficultyEnabled) then {
	private ["_queue","_queuePriority","_process","_processDone"];

	//--- Add to the queue
	_queue = missionnamespace getvariable ["BIS_fnc_showNotification_queue",[]];
	_queue resize (_priority max (count _queue));
	if (isnil {_queue select _priority}) then {_queue set [_priority,[]];};
	_queuePriority = _queue select _priority;
	_queuePriority set [count _queuePriority,_data];
	missionnamespace setvariable ["BIS_fnc_showNotification_queue",_queue];

	//--- Increase the counter
	["BIS_fnc_showNotification_counter",+1] call bis_fnc_counter;

	//--- Process the queue
	_process = missionnamespace getvariable ["BIS_fnc_showNotification_process",true];
	_processDone = if (typename _process == typename true) then {true} else {scriptdone _process};
	if (_processDone) then {
		_process = [] spawn {
			scriptname "BIS_fnc_showNotification: queue";
			_queue = missionnamespace getvariable ["BIS_fnc_showNotification_queue",[]];
			_layers = [
				("RscNotification_1" call bis_fnc_rscLayer),
				("RscNotification_2" call bis_fnc_rscLayer)
			];
			_layerID = 0;
			while {count _queue > 0} do {
				_queueID = count _queue - 1;
				_queuePriority = _queue select _queueID;
				if !(isnil {_queuePriority}) then {
					if (count _queuePriority > 0) then {
						_dataID = count _queuePriority - 1;
						_data = +(_queuePriority select _dataID);
						if (count _data > 0 && (alive player || ismultiplayer)) then {
							_duration = _data select 7;

							//--- Show
							missionnamespace setvariable ["RscNotification_data",_data];
							(_layers select _layerID) cutrsc ["RscNotification","plain"];
							_layerID = (_layerID + 1) % 2;	
							["BIS_fnc_showNotification_counter",-1] call bis_fnc_counter;

							sleep _duration;
							_queuePriority set [_dataID,[]];
						} else {
							_queuePriority resize _dataID;
						};
					};
					if (count _queuePriority == 0) then {
						_queue resize _queueID;
					};
				} else {
					if (_queueID == count _queue - 1) then {_queue resize _queueID;};
				};
			};
		};
		missionnamespace setvariable ["BIS_fnc_showNotification_process",_process];
	};
};
true