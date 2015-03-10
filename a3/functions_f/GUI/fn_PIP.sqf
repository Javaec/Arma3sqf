/*
	Author: Karel Moricky, modified by Thomas Ryan

	Description:
	Displays Picture in Picture
	When empty array [] is passed as argument, current camera is terminated

	Parameter(s):
	_this select 0: STRING - render target
	_this select 1: OBJECT or ARRAY - camera or camera params in format [position,target]
	_this select 2: OBJECT - helicopter to which action is added (to memory point "action_screen1")
	_this select 3 (Optional): BOOL - true to replace existing PIP on same target (default: true)

	Returns:
	OBJECT - camera
*/
private ["_cameraParams","_renderTarget","_guiPos","_index","_camera"];

#define DISPLAY_CLASS	"RscPIP"
#define DISPLAY_VAR	"BIS_fnc_PIP_RscPIP"
#define DISPLAY 	(uinamespace getvariable DISPLAY_VAR)
#define CONTROL		(DISPLAY displayctrl _idc)

_actionParams = [_this,3,true,[[],true]] call bis_fnc_param;
if (typename _actionParams == typename []) then {

	_showIGUI = [_actionParams,0,-1,[0]] call bis_fnc_paramIn;
	_renderTarget = [_actionParams,1,"",[""]] call bis_fnc_paramIn;

	/////////////////////////////////////////////////////////////////////////////////////////////////
	//--- Action
	_heli = _this select 0;
	if (_showIGUI > 0) then {

		//--- On
		([] call bis_fnc_rscLayer) cuttext ["","plain"];
		if (!isnil {DISPLAY}) then {
			waituntil {isnull DISPLAY};
		};

		([] call bis_fnc_rscLayer) cutRsc [DISPLAY_CLASS,"plain",0,false];
		waituntil {!isnil {uinamespace getvariable (DISPLAY_CLASS)}};
		uinamespace setvariable [DISPLAY_VAR,uinamespace getvariable (DISPLAY_CLASS)];

		_idc = 2300;
		_pos = ctrlposition CONTROL;
		_pos set [3,(_pos select 2)];

		CONTROL ctrlsettext format ["#(argb,256,256,1)r2t(%1,1.0)",_rendertarget];
		CONTROL ctrlsettextcolor [1,1,1,1];
		//CONTROL ctrlsetposition _pos;
		CONTROL ctrlcommit 0;

		profilenamespace setvariable ["BIS_fnc_PIP_IGUI",true];

	} else {

		//--- Off
		([] call bis_fnc_rscLayer) cuttext ["","plain"];
		profilenamespace setvariable ["BIS_fnc_PIP_IGUI",false];
	};
	saveprofilenamespace;

} else {

/////////////////////////////////////////////////////////////////////////////////////////////////////////
	_rendertarget =	[_this,0,"rendertarget0",[""]] call bis_fnc_param;
	_input =	[[_this],0,[_rendertarget]] call bis_fnc_paramIn;

	//--- Force terminate
	if (count _input <= 1) exitwith {
		([] call bis_fnc_rscLayer) cuttext ["","plain"];
		_params = missionnamespace getvariable (_fnc_scriptName + _renderTarget);
		if !(isnil "_params") then {
			_heli = _params select 0;
			_camera = _params select 1;
			_actions = _params select 2;
			
			removeMissionEventHandler ["Loaded", _actions select 2];

			_camera cameraeffect ["terminate","back"];
			camdestroy _camera;

			missionnamespace setvariable [_fnc_scriptName + _renderTarget,nil];
		};
		objnull
	};

	/////////////////////////////////////////////////////////////////////////////////////////////////
	//--- Init
	_cameraParams =	[_this,1,objnull,[[],objnull]] call bis_fnc_param;
	_heli =	[_this,2,objnull,[objnull]] call bis_fnc_param;
	_replace =  [_this,3,true,[true]] call bis_fnc_param;
	_currentTarget = missionnamespace getvariable (_fnc_scriptName + _renderTarget);

	//--- PIP exists - terminte this script
	if (!isnil "_currentTarget" && !_replace) exitwith {
		["'%1' already taken.",_rendertarget] call bis_fnc_logFormat;
	};

	//--- Terminate current PIP
	if !(isnil "_currentTarget") then {
		[_rendertarget] call BIS_fnc_PIP;
	};

	//--- Add actions to switch IGUI PIP on
	_actions = if !(isnull _heli) then {
		//--- Show IGUI PIP after load
		_index = addmissioneventhandler [
			"loaded",
			compile format [
				"
					private ['_IGUI'];
					_IGUI = profilenamespace getvariable ['BIS_fnc_PIP_IGUI',true];
					_IGUI = _IGUI && isPipEnabled;
					if (_IGUI) then {
						[_heli,_heli,-1,[1,'%1']] call bis_fnc_pip;
					};
				",
				_rendertarget
			]
		];

		//--- Display now
		_IGUI = profilenamespace getvariable ["BIS_fnc_PIP_IGUI",true];
		profilenamespace setvariable ["BIS_fnc_PIP_IGUI",_IGUI];
		_IGUI = _IGUI && isPipEnabled;
		saveprofilenamespace;
		if (_IGUI) then {
			[objnull,objnull,-1,[1,_rendertarget]] call bis_fnc_pip;
		};

		//[_action_ON,_action_OFF,_index]
		[nil, nil, _index]
	} else {
		[]
	};

	_camera = if (typename _cameraParams == typename []) then {

		//--- Create a new camera
		private ["_cameraPos","_cameraTarget","_camera"];
		_cameraPos = [_cameraParams,0,objnull,[[],objnull]] call bis_fnc_paramIn;
		_cameraTarget = [_cameraParams,1,objnull,[[],objnull]] call bis_fnc_paramIn;

		if (typename _cameraPos == typename objnull) then {
			_cameraPos = [_cameraPos,[0,0,-2]];
		};

		_camera = "camera" camcreate position cameraon;
		if (typename (_cameraPos select 0) == typename objnull) then {
			_camera attachto _cameraPos;
		} else {
			_camera campreparepos _cameraPos;
		};
		_camera campreparetarget _cameraTarget;
		_camera camcommitprepared 0;
		missionnamespace setvariable [_fnc_scriptName + _renderTarget,[_heli,_camera,_actions]];
		_camera
	} else {

		//--- Use an existing camera
		missionnamespace setvariable [_fnc_scriptName + _renderTarget,[_heli,objnull,_actions]];
		_cameraParams
	};

	_camera cameraeffect ["internal","back",_rendertarget];
	_camera

};