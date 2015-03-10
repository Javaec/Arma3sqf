/*
	Author: Karel Moricky, modified by Thomas Ryan

	Description:
	Moves camera borders.

	Parameter(s):
		_this select 0: NUMBER - Mode (0 - in, 1 - out)
		_this select 1: NUMBER - Duration in seconds (default - 1.5)
		_this select 2: BOOL - Play sound (default - true)
		_this select 3: BOOL - lock 1st person view (default - false)

	Returns:
	Nothing
*/

private ["_mode","_duration","_sound"];

_mode 	  = [_this,0,0,[0]] call BIS_fnc_param;
_duration = [_this,1,1.5,[0]] call BIS_fnc_param;
_sound    = [_this,2,true,[true]] call BIS_fnc_param;

BIS_fnc_cinemaBorder_lockview 	= [_this,3,false,[false]] call BIS_fnc_param;		//unfortunately it must be global variable because it is used in eventhandler
BIS_fnc_cinemaBorder_shown 	= [true,false] select _mode;

[_mode,_duration,_sound] spawn
{
	disableSerialization;

	private ["_mode","_duration","_sound"];

	_mode 	  = _this select 0;
	_duration = _this select 1;
	_sound    = _this select 2;

	waitUntil { !isNull ( [] call BIS_fnc_DisplayMission ) };

	private "_DisableGameElements";
	_DisableGameElements =
	{
		private ["_handler", "_displaynumber"];
		_displaynumber = [] call BIS_fnc_DisplayMission;

		// Remove eventhandler if it exists (only happens when restarting)
		if (!(isNil {uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler"})) then {
			_displaynumber displayRemoveEventHandler ["KeyDown", uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler"];
			uiNamespace setVariable ["BIS_fnc_cinemaBorder_keyHandler", nil];
		};

		//if action is found in the _actions array or SHIFT/ALT/CTRL was pressed then ignore it (bypass it)
		_handler = _displaynumber displayAddEventHandler
		[
			"KeyDown",
			"
				private ['_actions', '_nrofactions', '_returnvalue', '_actionKeys', '_shift', '_alt', '_ctrl' ];
				_shift = _this select 2;
    				_ctrl = _this select 3;
    				_alt = _this select 4;
				_returnvalue = _false;
				_actions = [ 'showmap', 'TimeDec', 'TimeInc', 'Gear', 'Throw', 'Fire', 'ReloadMagazine', 'SwitchWeapon', 'Diary', 'MoveLeft', 'MoveRight', 'MoveForward', 'MoveFastForward', 'MoveBack', 'MoveSlowForward', 'ZoomInToggle', 'ZoomOutToggle', 'ZoomIn', 'ZoomOut', 'BuldZoomIn', 'TurnLeft', 'TurnRight' ];

				if( BIS_fnc_cinemaBorder_lockview ) then
				{
					_actions = _actions + ['PersonView'];
				};

				_actionKeys = [];
				{
					_actionkeys = _actionkeys + actionKeys _x;
				} forEach _actions;

				if( (_this select 1) in _actionKeys || (_shift || _ctrl || _alt) ) then { _returnvalue = true };
				_returnvalue
			"
		];

		uiNamespace setVariable ["BIS_fnc_cinemaBorder_keyHandler", _handler];

		private "_m";
		(findDisplay 129) closeDisplay 2;	//close tasks if opened
		(findDisplay 602) closeDisplay 2;	//close inventory if opened
		_m = openmap [false, false];		//close map if opened
		showCompass false;			//disallow other elements
		showGPS false;
		showRadio false;
		showWatch false;
		showPad false;
		[false] call bis_fnc_showUnitInfo;	//weapon info may overlap
	};

	private "_EnableGameElements";
	_EnableGameElements =
	{
		private [ "_displaynumber" ];
		_displaynumber = [] call BIS_fnc_DisplayMission;
		if (!(isNil {uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler"})) then
		{
			_displaynumber displayRemoveEventHandler [ "keydown", uiNamespace getVariable "BIS_fnc_cinemaBorder_keyHandler" ];
			uiNamespace setVariable ["BIS_fnc_cinemaBorder_keyHandler", nil];
		};
		showCompass true;			//allow other elements
		showGPS true;
		showRadio true;
		showWatch true;
		showPad true;
		[true] call bis_fnc_showUnitInfo;
	};

	switch (_mode) do {
		// In
		case 0: {
			"BIS_fnc_cinemaBorder_disabledSave" call BIS_fnc_disableSaving;
			
			// Hotfix for disabling the restart/load button
			BIS_fnc_cinemaBorder_loadingDisabled = true;
			
			call _DisableGameElements;
			//if wanted - switch player into the 1st person
			
			("BIS_fnc_cinemaBorder" call BIS_fnc_rscLayer) cutRsc ["RscCinemaBorder", "PLAIN"];
			
			private ["_borderDialog", "_borderTop", "_borderBottom", "_height"];
			_borderDialog = uiNamespace getVariable "RscCinemaBorder";
			_borderTop = _borderDialog displayCtrl 100001;
			_borderBottom = _borderDialog displayCtrl 100002;
			_height = 0.125 * safeZoneH;
			_offset = 0.1;
			
			if( BIS_fnc_cinemaBorder_lockview ) then
			{
				player switchCamera "INTERNAL";
			};
			setAccTime 1;

			showHUD false;

			if (_sound) then {
				if (isClass (configFile >> "CfgSounds" >> "border_in")) then {
					playSound "border_in";
				};
			};

			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _height - _offset, safeZoneW + 2 * _offset, _height + _offset];
			_borderTop ctrlCommit 0;
			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _offset,safeZoneW + 2 * _offset, _height + _offset];
			_borderTop ctrlCommit _duration;

			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH, safeZoneW + 2 * _offset, _height + _offset];
			_borderBottom ctrlCommit 0;
			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH - _height, safeZoneW + 2 * _offset, _height + _offset];
			_borderBottom ctrlCommit _duration;

			sleep _duration;

			showCinemaBorder true;
		};

		// Out
		case 1: {
			call _EnableGameElements;
			
			("BIS_fnc_cinemaBorder" call BIS_fnc_rscLayer) cutRsc ["RscCinemaBorder", "PLAIN"];
			
			private ["_borderDialog", "_borderTop", "_borderBottom", "_height"];
			_borderDialog = uiNamespace getVariable "RscCinemaBorder";
			_borderTop = _borderDialog displayCtrl 100001;
			_borderBottom = _borderDialog displayCtrl 100002;
			_height = 0.125 * safeZoneH;
			_offset = 0.1;
			
			if (_sound) then {
				if (isClass (configFile >> "CfgSounds" >> "border_out")) then {
					playSound "border_out";
				};
			};

			showCinemaBorder false;

			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _offset, safeZoneW + 2 * _offset, _height + _offset];
			_borderTop ctrlCommit 0;
			_borderTop ctrlSetPosition [safeZoneX - _offset, safeZoneY - _height - _offset, safeZoneW + 2 * _offset, _height + _offset];
			_borderTop ctrlCommit _duration;

			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH - _height, safeZoneW + 2 * _offset, _height + _offset];
			_borderBottom ctrlCommit 0;
			_borderBottom ctrlSetPosition [safeZoneX - _offset, safeZoneY + safeZoneH, safeZoneW + 2 * _offset, _height + _offset];
			_borderBottom ctrlCommit _duration;

			sleep _duration;

			("BIS_fnc_cinemaBorder" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

			"BIS_fnc_cinemaBorder_disabledSave" call BIS_fnc_enableSaving;
			
			// Hotfix for disabling the restart/load button
			BIS_fnc_cinemaBorder_loadingDisabled = false;
			
			showHUD true;
		};
	};
};