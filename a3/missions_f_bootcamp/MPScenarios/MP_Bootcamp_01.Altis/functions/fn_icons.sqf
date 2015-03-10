// Defines
#define VARIABLE_INITIALIZED 		"BIS_bootcamp_icons_initialized"
#define VARIABLE_ICONS 			"BIS_bootcamp_icons_container"
#define VARIABLE_ICONS_SPECIAL 		"BIS_bootcamp_icons_container_special"
#define VARIABLE_ICONS_SPECIAL_FLAG	"BIS_bootcamp_icons_container_special_flag"
#define VARIABLE_DRAW_3D 		"BIS_bootcamp_icons_draw3D"
#define VARIABLE_KEY_DOWN 		"BIS_bootcamp_icons_key_down"
#define VARIABLE_KEY_UP 		"BIS_bootcamp_icons_key_up"
#define VARIABLE_SHOW_SPECIAL_ICONS	"BIS_bootcamp_icons_show_special"
#define KEY_SHOW_SPECIAL_ICONS		20
#define INDEX_ID			0

// Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters 	= [_this, 1, [], [[]]] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		disableSerialization;
		
		// Do not allow multiple executions
		if (!isNil { missionNamespace getVariable VARIABLE_INITIALIZED }) then {
			["terminate"] call BIS_fnc_icons;
		};
		
		// Add draw 3D event handler
		private "_draw3D";
		_draw3D = addMissionEventHandler ["draw3D", { ["draw3D"] call BIS_fnc_icons; }];
		
		// Main display
		private "_display";
		_display = findDisplay 46;
		
		// Make sure we have a valid display, otherwise delay the adding of the event handlers
		if (isNull _display) then {
			// Wait for display and then add event handlers
			[] spawn {
				waitUntil { !isNull (findDisplay 46); };
				["displayAddEventHandlers", [findDisplay 46]] call BIS_fnc_icons;
			};
		} else {
			// Add event handlers
			["displayAddEventHandlers", [_display]] call BIS_fnc_icons;
		};
		
		// Initialize variables
		missionNamespace setVariable [VARIABLE_INITIALIZED, true];
		missionNamespace setVariable [VARIABLE_ICONS, []];
		missionNamespace setVariable [VARIABLE_DRAW_3D, _draw3D];
		missionNamespace setVariable [VARIABLE_KEY_DOWN, -1];
		missionNamespace setVariable [VARIABLE_KEY_UP, -1];
	};
	
	case (toLower "terminate") : {
		disableSerialization;
		
		// Remove draw 3D event handler
		removeMissionEventHandler ["draw3D", missionNamespace getVariable VARIABLE_DRAW_3D];
		
		// Main display
		private "_display";
		_display = findDisplay 46;
		
		// Remove event handlers
		_display displayRemoveEventHandler ["KeyDown", missionNamespace getVariable VARIABLE_KEY_DOWN];
		_display displayRemoveEventHandler ["KeyUp", missionNamespace getVariable VARIABLE_KEY_UP];
		
		// Reset variables
		missionNamespace setVariable [VARIABLE_INITIALIZED, nil];
		missionNamespace setVariable [VARIABLE_ICONS, nil];
		missionNamespace setVariable [VARIABLE_DRAW_3D, nil];
		missionNamespace setVariable [VARIABLE_KEY_DOWN, nil];
		missionNamespace setVariable [VARIABLE_KEY_UP, nil];
	};
	
	case (toLower "displayAddEventHandlers") : {
		disableSerialization;
		
		// Parameters
		private ["_display"];
		_display = [_parameters, 0, displayNull, [displayNull]] call BIS_fnc_param;
		
		// Keyboard event handlers
		private ["_keyDown", "_keyUp"];
		_keyDown 	= _display displayAddEventHandler ["KeyDown", { ["keyDown", _this] call BIS_fnc_icons; }];
		_keyUp 		= _display displayAddEventHandler ["KeyUp", { ["keyUp", _this] call BIS_fnc_icons; }];
		
		// Store handlers
		missionNamespace setVariable [VARIABLE_KEY_DOWN, _keyDown];
		missionNamespace setVariable [VARIABLE_KEY_UP, _keyUp];
	};
	
	case (toLower "getIcons") : {
		// Return
		missionNamespace getVariable [VARIABLE_ICONS, []];
	};
	
	case (toLower "setIcons") : {
		// Store
		missionNamespace setVariable [VARIABLE_ICONS, _parameters];
	};
	
	case (toLower "addIcon") : {
		// Parameters
		private ["_id", "_position", "_observer", "_radius", "_isSpecial", "_intersect", "_rotate", "_rotationRate", "_params"];
		_id		= [_parameters, 0, "", [""]] call BIS_fnc_param;
		_position	= [_parameters, 1, objNull, [objNull, []]] call BIS_fnc_param;
		_observer	= [_parameters, 2, objNull, [objNull, []]] call BIS_fnc_param;
		_radius		= [_parameters, 3, 100, [0]] call BIS_fnc_param;
		_isSpecial	= [_parameters, 4, false, [true]] call BIS_fnc_param;
		_intersect	= [_parameters, 5, "nothing", [""]] call BIS_fnc_param;
		_rotate		= [_parameters, 6, false, [true]] call BIS_fnc_param;
		_rotationRate	= [_parameters, 7, 1, [0]] call BIS_fnc_param;
		_params		= [_parameters, 8, [], [[]]] call BIS_fnc_param;
		
		// Icon drawing properties
		private ["_texture", "_color", "_position", "_width", "_height", "_angle", "_text", "_shadow", "_textSize", "_font"];
		_texture 	= [_params, 0, "", [""]] call BIS_fnc_param;
		_color 		= [_params, 1, [1,1,1,1], [[]]] call BIS_fnc_param;
		//_position	= [_params, 2, [0,0,0], [[]]] call BIS_fnc_param;
		_width		= [_params, 3, 1, [0]] call BIS_fnc_param;
		_height		= [_params, 4, 1, [0]] call BIS_fnc_param;
		_angle		= [_params, 5, 0, [0]] call BIS_fnc_param;
		_text		= [_params, 6, "", [""]] call BIS_fnc_param;
		_shadow		= [_params, 7, true, [true]] call BIS_fnc_param;
		_textSize	= [_params, 8, 0.05, [0]] call BIS_fnc_param;
		_font		= [_params, 9, "PuristaMedium", [""]] call BIS_fnc_param;
		
		// Get icons
		private "_icons";
		_icons = ["getIcons"] call BIS_fnc_icons;
		
		// Add
		_icons set [count _icons, [_id, _position, _observer, _radius, _isSpecial, _intersect, _rotate, _rotationRate, [_texture, _color, _position, _width, _height, _angle, _text, _shadow, _textSize, _font]]];
		
		// Store
		["setIcons", _icons] call BIS_fnc_icons;
	};
	
	case (toLower "removeIcon") : {
		// Parameters
		private ["_id"];
		_id = [_parameters, 0, "", [""]] call BIS_fnc_param;
		
		// Get all the icons
		private "_icons";
		_icons = ["getIcons"] call BIS_fnc_icons;
		
		// The icon index within the container
		private "_index";
		_index = -1;
		
		// Go through list and see if we find matching id
		{
			if (_x select INDEX_ID == _id) exitWith {
				_index = _forEachIndex;
			};
		} forEach _icons;
		
		// Did we found a matching icon
		if (_index != -1) then {
			// Replace content within container
			_icons set [_index, "DeletePlease"];
			
			// Remove
			_icons = _icons - ["DeletePlease"];
			
			// Update container
			["setIcons", _icons] call BIS_fnc_icons;
		};
	};
	
	case (toLower "draw3D") : {
		// Get all the icons
		private "_icons";
		_icons = ["getIcons"] call BIS_fnc_icons;
		
		// Go through all icons and send to draw
		{
			["drawIcon", _x] call BIS_fnc_icons;
		} forEach _icons;
	};
	
	case (toLower "drawIcon") : {
		if (_parameters select 4) then {
			if (!isNil { missionNamespace getVariable VARIABLE_SHOW_SPECIAL_ICONS }) then {
				drawIcon3D (_parameters select 8);
			};
		} else {
			drawIcon3D (_parameters select 8);
		};
	};
	
	case (toLower "keyDown") : {
		// Parameters
		private ["_key"];
		_key = [_parameters, 1, -1, [0]] call BIS_fnc_param;
		
		if (_key == KEY_SHOW_SPECIAL_ICONS && isNil { missionNamespace getVariable VARIABLE_SHOW_SPECIAL_ICONS }) then {
			// Flag
			missionNamespace setVariable [VARIABLE_SHOW_SPECIAL_ICONS, true];
		};
		
		false;
	};
	
	case (toLower "keyUp") : {
		// Parameters
		private ["_key"];
		_key = [_parameters, 1, -1, [0]] call BIS_fnc_param;
		
		if (_key == KEY_SHOW_SPECIAL_ICONS && !isNil { missionNamespace getVariable VARIABLE_SHOW_SPECIAL_ICONS }) then {
			// Reset flag
			missionNamespace setVariable [VARIABLE_SHOW_SPECIAL_ICONS, nil];
		};
		
		false;
	};
	
	case default {
		["Invalid action: %1", _action] call BIS_fnc_error;
	};
};
