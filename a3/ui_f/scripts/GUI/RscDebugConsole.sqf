#include "\A3\ui_f\hpp\defineResincl.inc"
#include "\A3\ui_f\hpp\defineResinclDesign.inc"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

disableserialization;

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

_allowDebugConsole = if (isnil "_allowDebugConsole") then {false} else {_allowDebugConsole};
_enableDebugConsole = ["DebugConsole",getnumber (missionconfigfile >> "enableDebugConsole")] call bis_fnc_getParamValue;

if (
	//--- Editor
	(((uinamespace getvariable "gui_displays") find (finddisplay 26) in [0,1]) && !ismultiplayer)
	||
	//--- In mission with enableDebugConsole entry set to 1 (only for host/admin)
	{(_enableDebugConsole == 1 && (isserver || serverCommandAvailable "#shutdown"))}
	||
	//--- In mission with enableDebugConsole entry set to 2 (for everyone)
	{(_enableDebugConsole == 2)}
	||
	//--- Allowed by script
	{_allowDebugConsole}
	//||
	//--- Dev version
	//cheatsEnabled
) then {

	switch _mode do {

		case "onLoad": {

			_display = _params select 0;

			_ctrlLink = _display displayctrl IDC_RSCDEBUGCONSOLE_LINK;
			_ctrlLink htmlLoad "a3\ui_f\data\html\RscDebugConsole.html";

			//--- Set focus to expression field
			_ctrlExpression = _display displayctrl IDC_RSCDEBUGCONSOLE_EXPRESSION;
			_ctrlExpression ctrlsettext (profilenamespace getvariable ["RscDebugConsole_expression",""]);
			ctrlsetfocus _ctrlExpression;

			_ctrlExecuteLocal = _display displayctrl IDC_OK;
			_ctrlExecuteLocal ctrladdeventhandler ["buttonclick","with uinamespace do {['executeButton',[_this, 0],'RscDisplayDebugPublic'] call RscDisplayDebugPublic_script};"];

			_ctrlExecuteGlobal = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONEXECUTEALL;
			_ctrlExecuteGlobal ctrladdeventhandler ["buttonclick","with uinamespace do {['executeButton',[_this, 1],'RscDisplayDebugPublic'] call RscDisplayDebugPublic_script};"];

			_ctrlExecuteServer = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONEXECUTESERVER;
			_ctrlExecuteServer ctrladdeventhandler ["buttonclick","with uinamespace do {['executeButton',[_this, 2],'RscDisplayDebugPublic'] call RscDisplayDebugPublic_script};"];

			_ctrlCodePerformance = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONCODEPERFORMANCE;
			_ctrlCodePerformance ctrladdeventhandler ["buttonclick","with uinamespace do {['executeButton',[_this, 3],'RscDisplayDebugPublic'] call RscDisplayDebugPublic_script};"];

			if !(ismultiplayer) then {
				_ctrlExecuteGlobal ctrlenable false;
				_ctrlExecuteServer ctrlenable false;
			};

			//--- Process watch fields
			RscDebugConsole_watchSave = [true,true,true,true];
			_display displayaddeventhandler ["mousemoving","with uinamespace do {['watchFields',_this,'RscDisplayDebugPublic'] call RscDisplayDebugPublic_script};"];
			_display displayaddeventhandler ["mouseholding","with uinamespace do {['watchFields',_this,'RscDisplayDebugPublic'] call RscDisplayDebugPublic_script};"];

			//--- Load last values of watch fields
			{
				_input = _display displayctrl _x;
				_input ctrlsettext (profilenamespace getvariable ["RscDebugConsole_watch" + str(_foreachindex + 1),""]);
			} foreach [
				IDC_RSCDEBUGCONSOLE_WATCHINPUT1,
				IDC_RSCDEBUGCONSOLE_WATCHINPUT2,
				IDC_RSCDEBUGCONSOLE_WATCHINPUT3,
				IDC_RSCDEBUGCONSOLE_WATCHINPUT4
			];


			//--- External buttons
			_ctrlSpectatorCamera = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONSPECTATORCAMERA;
			_ctrlSpectatorCamera ctrladdeventhandler ["buttonclick","if (isnil {RscSpectator_camera}) then {RscSpectator_allowFreeCam = true; cutrsc ['RscSpectator','plain'];} else {cuttext ['','plain']};"];

			_ctrlSplendidCamera = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONSPLENDIDCAMERA;
			_ctrlSplendidCamera ctrladdeventhandler ["buttonclick","[] spawn (uinamespace getvariable 'bis_fnc_camera');"];

			_ctrlConfig = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONCONFIG;
			_ctrlConfig ctrladdeventhandler ["buttonclick","[ctrlparent (_this select 0)] spawn (uinamespace getvariable 'bis_fnc_configViewer');"];

			_ctrlFunctions = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONFUNCTIONS;
			_ctrlFunctions ctrladdeventhandler ["buttonclick","[ctrlparent (_this select 0)] spawn (uinamespace getvariable 'bis_fnc_help');"];

			_ctrlAnimations = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONANIMATIONS;
			_ctrlAnimations ctrladdeventhandler ["buttonclick","[] spawn (uinamespace getvariable 'bis_fnc_animViewer');"];

			_ctrlGUI = _display displayctrl IDC_RSCDEBUGCONSOLE_BUTTONGUI;
			_ctrlGUI ctrladdeventhandler ["buttonclick","[] spawn bis_fnc_guiEditor;"];

			//--- Simulation is not running
			_splendidCameraOpened = if !(isnil "BIS_fnc_camera_display") then {!(isnull BIS_fnc_camera_display)} else {false};
			if (
				isnull ([] call (uinamespace getvariable "BIS_fnc_displayMission"))
				||
				_splendidCameraOpened
			) then {
				{
					(_display displayctrl _x) ctrlenable false;
				} foreach [
					IDC_RSCDEBUGCONSOLE_BUTTONSPECTATORCAMERA,
					IDC_RSCDEBUGCONSOLE_BUTTONSPLENDIDCAMERA,
					IDC_RSCDEBUGCONSOLE_BUTTONANIMATIONS,
					IDC_RSCDEBUGCONSOLE_BUTTONGUI
				];
			};
		};

		//--- Execute buttons
		case "executeButton":
		{
			_args = _params select 0;
			_mode = _params select 1;
			_display = ctrlparent (_args select 0);
			_input = _display displayctrl IDC_RSCDEBUGCONSOLE_EXPRESSION;
			_inputValue = "";
			with missionnamespace do {
				_input = ctrltext _input;
				_inputCode = compile _input;

				switch _mode do {
					//--- Local
					case 0: {call _inputCode;};
					//--- Global
					case 1: {[[[],_inputCode],"bis_fnc_call",true,false] call bis_fnc_mp;};
					//--- Server
					case 2: {[[[],_inputCode],"bis_fnc_call",false,false] call bis_fnc_mp;};
					//--- Performance
					case 3: {[_input,nil,nil,_display] call bis_fnc_codePerformance};
				};
			};
			true
		};

		case "watchFields":
		{
			_display = _params select 0;
			{
				_input = _display displayctrl (_x select 0);
				_output = _display displayctrl (_x select 1);
				_outputBackground = _display displayctrl (_x select 2);
				_backgroundColor = [0,0,0,0.7];
				_save = true;

				_inputValue = ctrltext _input;
				if (_inputValue != "") then {
					_timeStart = diag_ticktime;
					with missionnamespace do {
						_inputValue = if !(isnil {call compile _inputValue}) then {
							_timeStart = diag_ticktime;
							call compile _inputValue;
						} else {
							nil
						};
					};
					//--- Show warnign whn code is taking too long; also disable saving the value
					if (diag_ticktime - _timeStart > 0.003) then {
						_save = false;
						_backgroundColor = [0.5,0.25,0,0.7];
					};
					_inputValue = if !(isnil {_inputValue}) then {str _inputValue} else {""};
				};

				_output ctrlsettext _inputValue;

				_outputBackground ctrlsetbackgroundcolor _backgroundColor;
				_outputBackground ctrlcommit 0;
				RscDebugConsole_watchSave set [_foreachindex,_save];
			} foreach [
				[IDC_RSCDEBUGCONSOLE_WATCHINPUT1,IDC_RSCDEBUGCONSOLE_WATCHOUTPUT1,IDC_RSCDEBUGCONSOLE_WATCHOUTPUTBACKGROUND1],
				[IDC_RSCDEBUGCONSOLE_WATCHINPUT2,IDC_RSCDEBUGCONSOLE_WATCHOUTPUT2,IDC_RSCDEBUGCONSOLE_WATCHOUTPUTBACKGROUND2],
				[IDC_RSCDEBUGCONSOLE_WATCHINPUT3,IDC_RSCDEBUGCONSOLE_WATCHOUTPUT3,IDC_RSCDEBUGCONSOLE_WATCHOUTPUTBACKGROUND3],
				[IDC_RSCDEBUGCONSOLE_WATCHINPUT4,IDC_RSCDEBUGCONSOLE_WATCHOUTPUT4,IDC_RSCDEBUGCONSOLE_WATCHOUTPUTBACKGROUND4]
			];
		};

		case "onUnload": {
			_display = _params select 0;

			//--- Remember last values
			_ctrlExpression = _display displayctrl IDC_RSCDEBUGCONSOLE_EXPRESSION;
			profilenamespace setvariable ["RscDebugConsole_expression",ctrltext _ctrlExpression];

			{
				_input = _display displayctrl _x;
				_inputValue = if (RscDebugConsole_watchSave select _foreachindex) then {ctrltext _input} else {""};
				profilenamespace setvariable ["RscDebugConsole_watch" + str(_foreachindex + 1),_inputValue];
			} foreach [
				IDC_RSCDEBUGCONSOLE_WATCHINPUT1,
				IDC_RSCDEBUGCONSOLE_WATCHINPUT2,
				IDC_RSCDEBUGCONSOLE_WATCHINPUT3,
				IDC_RSCDEBUGCONSOLE_WATCHINPUT4
			];
			saveprofilenamespace;

			//--- Cleanup
			RscDebugConsole_watchSave = nil;
		};
	};
} else {
	switch _mode do {

		case "onLoad": {

			//--- Hdie and deactivate the console
			_ctrlConsole = _display displayctrl IDC_RSCDEBUGCONSOLE_RSCDEBUGCONSOLE;
			_ctrlConsole ctrlshow false;
			_ctrlConsole ctrlenable false;
		};
	};
};