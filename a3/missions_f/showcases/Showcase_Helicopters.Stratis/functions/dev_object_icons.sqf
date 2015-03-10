//--------------------------------------------------------------------------------------------------
// RUN ONLY ONCE SAFE-CHECK
//--------------------------------------------------------------------------------------------------
if !(isNil{BIS_RunOnce_ObjectIcons}) exitwith {};

BIS_RunOnce_ObjectIcons = true;

//--------------------------------------------------------------------------------------------------
// CORE OBJECT ICON FUNCTIONS
//--------------------------------------------------------------------------------------------------
#define ICON_FIXED_OFFSET	4.3
#define TOPHALF_ICONS		["GrpIcon_Default","GrpIcon_Selected"]

//make sure we have at least 1 game logic center
createCenter civilian;

//enable group icons
setGroupIconsVisible[false,true];

/*
ACR UI orange [0.863,0.584,0,1]
ACR UI green [0.4,0.6745,0.2784,1]
ACR UI red [0.706,0.0745,0.0196,1]
*/

//OBJECT call BIS_objectIconInit;
//[OBJECT,PLACEMENT,YOFFSET,LABEL,ICON,COLOR] call BIS_objectIconInit;
BIS_objectIconInit =
{
	private["_target","_color","_grp","_placement","_offset","_label","_icon","_color","_holder","_scale","_holderPosASL","_iconAdjustment"];

	if (typeName _this != "ARRAY") then
	{
		_this = [_this];
	};

	_target 	= [_this, 0, nil] call BIS_fnc_param;
	_placement	= [_this, 1, "CENTER"] call BIS_fnc_param;
	_offset		= [_this, 2, 0] call BIS_fnc_param;
	_label		= [_this, 3, ""] call BIS_fnc_param;
	_icon		= [_this, 4, "GrpIcon_Default"] call BIS_fnc_param;
	_color		= [_this, 5, [1,1,1,0]] call BIS_fnc_param;
	_scale		= [_this, 6, 1.0] call BIS_fnc_param;

	//adjust icon placement on 2d screen according to the icon type
	//icons centered in the texture get no adjustment: [0,0]
	//icons placed in the top half of the texture need vertical adjustment: [0,-0.11]
	if (_icon in TOPHALF_ICONS) then
	{
		_iconAdjustment = [0,-0.11];
	}
	else
	{
		_iconAdjustment = [0,0];
	};

	_iconAdjustment	= [_this, 7, [0,-0.11]] call BIS_fnc_param;

	//if alpha is not defined, set it to 0
	if (count _color == 3) then
	{
		_color = _color + [0];
	};

	//store the placement
	_target setVariable ["placement_anchor",_placement];
	_target setVariable ["placement_adjust",_offset];

	//get the height offset
	_offset = _target call BIS_objectIconCalcOffset;

	_grp = createGroup civilian;
	_holder = _grp createUnit [typeOf player,[10,10,10],[],0,"CAN_COLLIDE"];

	//_holderPosASL = [getPosASL _target, - ICON_FIXED_OFFSET + _offset] call BIS_offsetPosVert;

	//_holder setPosASL _holderPosASL;
	_holder enableSimulation false;
	_holder setvariable ["bis_noccoreconversations",true];
	_holder hideObject true;

	/*
	["_target",_target] call BIS_debugLog;
	["_grp",_grp] call BIS_debugLog;
	["_holder",_holder] call BIS_debugLog;
	["_placement",_placement] call BIS_debugLog;
	["_offset",_offset] call BIS_debugLog;
	["_label",_label] call BIS_debugLog;
	["_icon",_icon] call BIS_debugLog;
	["_color",_color] call BIS_debugLog;
	*/

	_grp addGroupIcon [_icon,_iconAdjustment];
	_grp setGroupIconParams [_color,_label,_scale,true];

	_target setVariable ["icon",_grp];
	_target setVariable ["holder",_holder];
	_target setVariable ["offset",_offset];
	_target setVariable ["icon_state","hidden"];

	//attach icon to object
	_holder attachTo [_target,[0,0,- ICON_FIXED_OFFSET + _offset]];
};

//[_target:object] call BIS_objectIconDestroy;
BIS_objectIconDestroy =
{
	private["_target","_holder","_group"];

	_target = [_this, 0, nil] call BIS_fnc_param;

	if isNil{_target} exitWith {};

	_group = _target getVariable ["icon",nil];
	_holder = _target getVariable ["holder",nil];

	if !isNil{_holder} then {
		deleteVehicle _holder;
	};

	if !isNil{_group} then {
		deleteGroup _group;
	};

	_target setVariable ["icon",nil];
	_target setVariable ["holder",nil];
};

BIS_objectIconShow =
{
	if (isNil {_this}) exitWith
	{
		//["[BIS_objectIconShow]","target not initialized!"] call BIS_debugLog;
	};

	if (isNil {_this getVariable "icon"}) exitWith
	{
		//["[BIS_objectIconShow]","icon not initialized!"] call BIS_debugLog;
	};

	//stop if already showing
	if (_this getVariable "icon_state" == "showing" || _this getVariable "icon_state" == "shown") exitWith
	{
		//["[BIS_objectIconShow]","icon already shown or showing!"] call BIS_debugLog;
	};

	//["Showing an icon!"] call BIS_debugLog;

	//set the status
	_this setVariable ["icon_state","showing"];

	private["_icon","_alpha","_i","_params"];
	private["_color","_text","_scale","_visible"];

	_icon = _this getVariable "icon";

	//[color,text,scale,visible]
	_params = getGroupIconParams _icon;
	_color 		= _params select 0;
	_text 		= _params select 1;
	_scale 		= _params select 2;
	_visible 	= true;

	_r = _color select 0;
	_g = _color select 1;
	_b = _color select 2;
	_a = _color select 3;

	_this call BIS_objectIconUpdateOffset;
	_this call BIS_objectIconUpdatePos;

	//update offset for humanoid targets
	_this spawn
	{
		scriptName "devObjectIcons_showIcon";

		if !(_this isKindOf "man") exitWith {};

		while{(_this getVariable ["icon_state","showing"]) != "hidden"} do
		{
			sleep 0.25;

			_this call BIS_objectIconUpdateOffset;
		};
	};

	//update position
	/*
	_this spawn
	{
		while{(_this getVariable ["icon_state","showing"]) != "hidden"} do
		{
			sleep 0.01;

			_this call BIS_objectIconUpdatePos;
		};
	};
	*/

	sleep 0.1;

	while{(_a < 1) && (_this getVariable "icon_state" == "showing")} do {

		_a = _a + 0.2;

		if(_a > 1) then {_a = 1};

		_color = [_r,_g,_b,_a];

		//["---------------------------------"] call BIS_debugLog;
		//["_color",_color] call BIS_debugLog;
		//["_text",_text] call BIS_debugLog;
		//["_scale",_scale] call BIS_debugLog;
		//["_visible",_visible] call BIS_debugLog;
		//["---------------------------------"] call BIS_debugLog;

		//update text param during fade-in
		_text = (getGroupIconParams _icon) select 1;
		_icon setGroupIconParams [_color,_text,_scale,_visible];

		sleep 0.03;
	};

	//["Icon is shown!"] call BIS_debugLog;

	//set final state
	if (_this getVariable "icon_state" == "showing") then {
		_this setVariable ["icon_state","shown"];
	};
};

BIS_objectIconHide = {
	if (isNil {_this}) exitWith {
		//["[BIS_objectIconHide]","target not initialized!"] call BIS_debugLog;
	};

	if (isNil {_this getVariable "icon"}) exitWith {
		//["[BIS_objectIconHide]","icon not initialized!"] call BIS_debugLog;
	};

	//stop if already hidden or hiding
	if (_this getVariable "icon_state" == "hidden" || _this getVariable "icon_state" == "hiding") exitWith {
		//["[BIS_objectIconHide]","icon already hidden or hiding!"] call BIS_debugLog;
	};

	//["Hiding an icon!"] call BIS_debugLog;

	//set the status
	_this setVariable ["icon_state","hiding"];

	private["_icon","_alpha","_i","_params"];
	private["_color","_text","_scale","_visible"];

	_icon = _this getVariable "icon";

	//[color,text,scale,visible]
	_params = getGroupIconParams _icon;
	_color 		= _params select 0;
	_text 		= _params select 1;
	_scale 		= _params select 2;
	//_visible 	= _params select 3;
	_visible = true;

	_r = _color select 0;
	_g = _color select 1;
	_b = _color select 2;
	_a = _color select 3;

	while{(_a > 0)  && (_this getVariable "icon_state" == "hiding")} do {

		_a = _a - 0.2;

		if(_a < 0) then {_a = 0};

		_color = [_r,_g,_b,_a];

		//["---------------------------------"] call BIS_debugLog;
		//["_color",_color] call BIS_debugLog;
		//["_text",_text] call BIS_debugLog;
		//["_scale",_scale] call BIS_debugLog;
		//["_visible",_visible] call BIS_debugLog;
		//["---------------------------------"] call BIS_debugLog;

		//update text param during fade-out
		_text = (getGroupIconParams _icon) select 1;

		_icon setGroupIconParams [_color,_text,_scale,_visible];

		sleep 0.03;
	};

	//set final state
	if (_this getVariable "icon_state" == "hiding") then {
		_this setVariable ["icon_state","hidden"];
		_icon setGroupIconParams [_color,_text,_scale,false];
	};
};

//cursorTarget call BIS_objectIconUpdatePos
BIS_objectIconUpdatePos = {
	private ["_target","_holder","_offset","_posASL"];

	_target = _this;

	_holder = _target getVariable "holder";
	_offset = _target getVariable "offset";

	_posASL = [getPosASL _target, - ICON_FIXED_OFFSET + _offset] call BIS_offsetPosVert;

	_holder setPosASL _posASL;
};

//updates icon offset for humanoid targets
BIS_objectIconUpdateOffset = {
	if !(_this iskindOf "man") exitWith {};

	//get the height offset
	_offset = _this call BIS_objectIconCalcOffset;

	//and store it
	_this setVariable ["offset",_offset];
};

//calculates icon offset according to the anchor, adjustment and type of object
BIS_objectIconCalcOffset = {
	private["_anchor","_adjust","_height","_offset"];

	_anchor = _this getVariable ["placement_anchor","CENTER"];
	_adjust = _this getVariable ["placement_adjust",0.0];

	//find height of the icon target
	if !(_this iskindOf "man") then
	{
		_height = (boundingBox _this select 1) select 2;
	}
	else
	{
		private["_anim","_stance"];

		//adjust offset according to icon target stance
		_anim = (animationState _this) call BIS_animType;

		if (count _anim >= 1) then
		{
			_stance = (_anim select 1) select 1;
		}
		else
		{
			_stance = "***";
		};

		switch (_stance) do
		{
			case "Kneel":
			{
				_height = 0.75;
			};
			case "Crouch":
			{
				_height = 0.75;
			};
			case "Sit":
			{
				_height = 0.75;
			};
			case "Prone":
			{
				_height = 0.3;
			};

			default
			{
				_height = 1.65;
			};
		};
	};

	//calculate offset from the placement anchor and adjustment and target height
	switch (_anchor) do
	{
		case "CENTER":
		{
			_offset = _adjust + (_height/2);
		};
		case "TOP":
		{
			_offset = _adjust + _height;
		};
		case "BOTTOM":
		{
			_offset = _adjust;
		};
		default
		{
			_offset = _adjust + (_height/2);
		};
	};

	_offset
};

BIS_objectIconUpdateText = {
	private["_target","_text","_params","_icon"];

	_target = _this select 0;
	_text = _this select 1;

	_icon = _target getVariable "icon";

	_params = getGroupIconParams _icon;
	_icon setGroupIconParams [_params select 0,_text,_params select 2,_params select 3];
};

//[cursorTarget,"acr_overlayicon_inspecting_4"] call BIS_objectIconUpdateIcon;
BIS_objectIconUpdateIcon = {
	private["_target","_newGfx","_icon"];

	_target = _this select 0;
	_newGfx = _this select 1;

	_icon = _target getVariable "icon";

	_icon setGroupIcon [1,_newGfx];
};

BIS_objectIconUpdateColor = {
	private["_target","_color","_params","_icon","_alpha"];

	_target = _this select 0;
	_color = _this select 1;

	_icon = _target getVariable "icon";
	_params = getGroupIconParams _icon;

	_alpha = (_params select 0) select 3;
	_color = _color + [_alpha];

	_icon setGroupIconParams [_color,_params select 1,_params select 2,_params select 3];
};

//--------------------------------------------------------------------------------------------------
// APPLICATION OF OBJECT ICONS
//--------------------------------------------------------------------------------------------------
//shows object icon over 1 of the defined objects
//object closest to the screen center is choosed
BIS_keyObject_engine = {
	if (isNil "BIS_KeyObjects") then
	{
		BIS_KeyObjects = [];
	};

	BIS_KeyObjectThread = [] spawn
	{
		scriptName "devObjectIcons_engine";

		private["_locations","_selectedLoc","_screen","_previousLoc","_temp"];

		_previousLoc = objNull;
		_selectedLoc = objNull;

		while {true} do
		{
			//pickup the locations array
			_locations = BIS_KeyObjects;

			if (count _locations == 0) then
			{
				BIS_KeyObject = objNull;

				if !(isNull _previousLoc) then
				{
					_previousLoc call BIS_objectIconHide;
					_previousLoc = objNull;
				};

				//["No key objects defined!"] call BIS_debugLog;

				waitUntil
				{
					//pickup the locations array
					_locations = BIS_KeyObjects;

					//wait until we have at least 1 location
					count _locations > 0
				};
			};

			//filter-out objects that do not meet "show when" requirement
			_temp = [];

			{
				_showCond = _x getVariable ["show_cond",{true}];

				if (call _showCond) then
				{
					_temp = _temp + [_x];
				};
			}
			forEach _locations;

			_locations = _temp;


			//find objects on screen & store their screen-center distance
			_temp = [];

			{
				_screen = worldToScreen (getPosATL _x);

				//location is on-screen
				if (count _screen == 2) then
				{
					_screen = _screen + [0];
					_distance = _screen distance [0.5,0.5,0];

					if (_distance < 0.5) then
					{
						_x setVariable ["screencenter_distance",_distance];

						_temp = _temp + [_x];
					};
				};
			}
			forEach _locations;

			_locations = _temp;

			//sort locations by their screen-center distance; ascending
			_locations = [_locations,{_x getVariable ["screencenter_distance",1e9]},"ASCEND"] call BIS_sortObjectsBy;

			//pick 1st location that is not obstructed by terrain and is in LOS
			private["_playerAnim","_playerStance","_playerHeight","_startPosASL","_endObj","_endPosASL","_startPos","_endPos","_losOffset","_losObjects","_ignored","_terrainIntersect"];

			//adjust start-pos offset according to player stance
			_playerAnim = (animationState player) call BIS_fnc_animType;
			_playerStance = (_playerAnim select 1) select 1;

			switch (_playerStance) do
			{
				case "Kneel":
				{
					_playerHeight = 1.0;
				};
				case "Crouch":
				{
					_playerHeight = 1.0;
				};
				case "Prone":
				{
					_playerHeight = 0.4;
				};

				default
				{
					_playerHeight = 1.8;
				};
			};

			_startPosASL = getPosASL player;
			_startPosASL = [_startPosASL, _playerHeight] call BIS_offsetPosVert;

			_startPos = getPos player;
			_startPos = [_startPos, _playerHeight] call BIS_offsetPosVert;

			_selectedLoc = objNull;

			{
				_endObj = _x;

				_losOffset = _endObj getVariable ["los_offset",1.8];

				_endPosASL = getPosASL _endObj;
				_endPosASL = [_endPosASL, _losOffset] call BIS_offsetPosVert;

				_endPos = getPos _endObj;
				_endPos = [_endPos, _losOffset] call BIS_offsetPosVert;

				//check for terrain intersect
				_terrainIntersect = terrainIntersect [_startPos, _endPos];

				if !(_terrainIntersect) then
				{
					//find all intersecting objects
					_losObjects = lineIntersectsWith[_startPosASL,_endPosASL,objNull,objNull,true];

					//remove ignored objects
					_ignored = [_endObj,_endObj getVariable ["linked_object", objNull]] + (_endObj getVariable ["linked_objects", []]);
					_losObjects = _losObjects - _ignored;

					//remove too narrow objects (like street lamps)
					private["_boundingBox"];

					{
						_boundingBox = (boundingBox _x) select 1;

						if (((_boundingBox select 0) < 1.1) && ((_boundingBox select 1) < 1.1)) then
						{
							_losObjects set [_forEachIndex, objNull];
						};
					}
					forEach _losObjects;

					_losObjects = _losObjects - [objNull];

					//remove blacklisted objects
					private["_class","_blacklist"];

					_blacklist = ["WeaponHolder"];

					{
						_class = typeOf _x;

						if (_class in _blacklist) then
						{
							_losObjects set [_forEachIndex, objNull];
						};
					}
					forEach _losObjects;

					_losObjects = _losObjects - [objNull];

					//["L-O-S collision",_losObjects] call BIS_debugLog;

					if (count _losObjects == 0) then
					{
						_selectedLoc = _endObj;
					};
				};

				if !(isNull _selectedLoc) exitWith {};
			}
			forEach _locations;

			/*
			["-------------"] call BIS_debugLog;
			["_previousLoc",_previousLoc] call BIS_debugLog;
			["_selectedLoc",_selectedLoc] call BIS_debugLog;
			["-------------"] call BIS_debugLog;
			*/

			//store the current selected location / key object in global variable
			//to allow accessing it from outside
			Bis_KeyObject = _selectedLoc;

			if !(isNull _selectedLoc) then
			{
				//key location changed
				if (_previousLoc != _selectedLoc) then
				{
					_previousLoc call BIS_objectIconHide;
					_selectedLoc call BIS_objectIconShow;

					_previousLoc = _selectedLoc;
				}
				else
				{
					//["Key object remain same",_selectedLoc] call BIS_debugLog;
				};
			}
			else
			{
				//["No key objects on-screen!"] call BIS_debugLog;

				//no key location on screen
				if !(isNull _previousLoc) then
				{
					_previousLoc call BIS_objectIconHide;
					_previousLoc = objNull;
				};
			};

			sleep 0.25;
		};
	};
};

BIS_keyObject_addObjects = {
	if (isNil "BIS_KeyObjects") then
	{
		BIS_KeyObjects = [];
	};

	BIS_KeyObjects = BIS_KeyObjects - _this;
	BIS_KeyObjects = BIS_KeyObjects + _this;
};

BIS_keyObject_removeObjects = {
	if (isNil "BIS_KeyObjects") then
	{
		BIS_KeyObjects = [];
	};

	BIS_KeyObjects = BIS_KeyObjects - _this;
};

BIS_keyObject_setObjects = {

	BIS_KeyObjects = _this;
};

BIS_keyObject_setRemoveTrigger = {
	if (isNil "BIS_KeyObjects") then
	{
		BIS_KeyObjects = [];
	};

	_this spawn
	{
		scriptName "devObjectIcons_setRemoveTrigger";

		private["_object","_condition"];

		_object 	= [_this,0,objNull] call BIS_fnc_param;
		_condition	= [_this,1,{false}] call BIS_fnc_param;

		waitUntil{(call _condition) || !(_object in BIS_KeyObjects)};

		if (_object in BIS_KeyObjects) then
		{
			[_object] call BIS_keyObject_removeObjects;
		};
	};
};