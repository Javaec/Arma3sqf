_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {
	_pos = position _logic;
	_class = call compile (_logic getvariable "Path");
	_parent = call compile (_logic getvariable "Parent");
	_tags = _logic getvariable ["Tags",""];
	_tiers = (call compile (_logic getvariable "Tiers")) call bis_fnc_parsenumber;

	if (isnil "_class") then {_class = configfile;};
	if (isnil "_parent") then {_parent = _class;};
	if (isnil "_tiers") then {_tiers = -1;};

	_class = [_class,0,configfile,[configfile]] call bis_fnc_paramIn;
	_parent = [_parent,0,configfile,[configfile]] call bis_fnc_paramIn;
	_tags = call compile ("[" + _tags + "]");

	_logic setvariable ["data",[_pos,_class,_parent,_tags,_tiers]];

	//--- No Strategic Map connected - display in the main map
	if ({typeof _x == "ModuleStrategicMapInit_F"} count (synchronizedobjects _logic) == 0) then {

		_classParams = _class call bis_fnc_ORBATGetGroupParams;
		_text = _classParams select ("text" call bis_fnc_ORBATGetGroupParams);
		_texture = _classParams select ("texture" call bis_fnc_ORBATGetGroupParams);
		_size = _classParams select ("size" call bis_fnc_ORBATGetGroupParams);
		_sizeTexture = _classParams select ("sizeTexture" call bis_fnc_ORBATGetGroupParams);
		_textureSize = _classParams select ("textureSize" call bis_fnc_ORBATGetGroupParams);
		_color = _classParams select ("color" call bis_fnc_ORBATGetGroupParams);
		_iconSize = sqrt (_size + 1) * 26;

		//--- Assign the icon to a group
		if (count _units > 0) then {
			private ["_grp"];
			_grp = group (_units select 0);
			if !(isnull _grp) then {
				_grp setgroupid [_text];
				_pos = [_grp];
			};
		};

		_iconParams = [_texture,_color,_pos,_iconSize * _textureSize,_iconSize * _textureSize,0,"",false];
		_sizeIconParams = if (_size >= 0) then {[_sizetexture,_color,_pos,_iconSize,_iconSize,0,"",false]} else {[]};

		//--- Register icons
		_drawIcon = missionnamespace getvariable ["BIS_fnc_moduleStrategicMapORBAT_drawIcon",[]];
		_drawIcon set [count _drawIcon,[_class,[_parent,_tags,_tiers],_iconParams,_classParams,_sizeIconParams]];
		missionnamespace setvariable ["BIS_fnc_moduleStrategicMapORBAT_drawIcon",_drawIcon];

		//--- Register ORBAT viewer on click event
		_ORBATonClick = missionnamespace getvariable ["BIS_fnc_moduleStrategicMapORBAT_ORBATonClick",[]];
		_ORBATonClick set [count _ORBATonClick,_class];
		_ORBATonClick set [
			count _ORBATonClick,
			{
				disableserialization;
				[_this select 0,1,BIS_fnc_moduleStrategicMapORBAT_display select 0,BIS_fnc_moduleStrategicMapORBAT_drawIcon] spawn bis_fnc_strategicMapAnimate;
				true
			}
		];
		missionnamespace setvariable ["BIS_fnc_moduleStrategicMapORBAT_ORBATonClick",_ORBATonClick];
		BIS_fnc_moduleStrategicMapORBAT_mouseClickDisable = false;

		//--- Initialize UI event handlers
		if (isnil {BIS_fnc_moduleStrategicMapORBAT_draw}) then {
			disableserialization;

			BIS_fnc_moduleStrategicMapORBAT_draw = {
				_control = _this select 0;
				_mousePos = missionnamespace getvariable ["BIS_fnc_moduleStrategicMapORBAT_mousePos",[0,0]];
				_drawIcon = missionnamespace getvariable ["BIS_fnc_moduleStrategicMapORBAT_drawIcon",[]];
				_overlay = missionnamespace getvariable ["BIS_fnc_ORBATAddGroupOverlay_groups",[]];
				_selected = [];
				{
					scriptname "BIS_fnc_moduleStrategicMapORBAT_draw";
					_class = _x select 0;
					_iconParams = +(_x select 2);
					_classParams = +(_x select 3);
					_sizeIconParams = +(_x select 4);

					_pos = _iconParams select 2;
					if (count _pos == 1) then {
						_pos = visibleposition leader (_pos select 0);
						_iconParams set [2,_pos];
						_sizeIconParams set [2,_pos];
					};

					_mapPos = _control ctrlmapworldtoscreen _pos;
					_iconSize = _iconParams select 3;
					_isSelected = ((_mapPos distance _mousePos) / _iconSize) < 0.0007;
					if (_isSelected) then {
						_iconSize = _iconSize * 1.2;
						_iconParams set [3,_iconSize];
						_iconParams set [4,_iconSize];
						_selected = _x;
					};
					_control drawicon _iconParams;

					//--- Draw size texture
					if (count _sizeIconParams > 0) then {
						if (_isSelected) then {
							_sizeIconSize = (_sizeIconParams select 3) * 1.2;
							_sizeIconParams set [3,_sizeIconSize];
							_sizeIconParams set [4,_sizeIconSize];
						};
						_control drawIcon _sizeIconParams;
					};

					//--- Draw custom textures
					_classID = _overlay find _class;
					if (_classID >= 0) then {
						_classOverlay = _overlay select (_classID + 1);
						_iconColor = _iconParams select 1;
						{
							if (typename _x == typename []) then {
								_xTexture = _x select 0;
								_xColor = +(_x select 1);
								_xWidth = _x select 2;
								_xHeight = _x select 3;
								_xAngle = _x select 4;
								_xText = _x select 5;
								_xShadow = _x select 6;

								//--- Read dynamic params passed as code
								if (typename _xColor == typename {}) then {
									_xColor = call _xColor;
									_xColor = [_xColor,0,[1,1,1,1],[[]]] call bis_fnc_paramIn;
								};
								if (typename _xWidth == typename {}) then {
									_xWidth = call _xWidth;
									_xWidth = [_xWidth,0,1,[1]] call bis_fnc_paramIn;
								};
								if (typename _xHeight == typename {}) then {
									_xHeight = call _xHeight;
									_xHeight = [_xHeight,0,1,[1]] call bis_fnc_paramIn;
								};
								if (typename _xAngle == typename {}) then {
									_xAngle = call _xAngle;
									_xAngle = [_xAngle,0,0,[0]] call bis_fnc_paramIn;
								};

								_xColor set [3,(_xColor select 3) * (_iconColor select 3)];

								//--- Convert size to coeficients of original icon size
								_xWidth = _xWidth * _iconSize;
								_xHeight = _xHeight * _iconSize;

								//--- Draw
								_control drawicon [_xTexture,_xColor,[_pos select 0,_pos select 1],_xWidth,_xHeight,_xAngle,_xText,_xShadow];
							};
						} foreach _classOverlay;
					};
				} foreach _drawIcon;


				if (count _selected > 0 && !BIS_fnc_moduleStrategicMapORBAT_mouseClickDisable) then {
					_class = _selected select 0;
					_classParams = _selected select 3;
					[_classParams,ctrlparent _control,_mousePos] call bis_fnc_ORBATTooltip;
					_control ctrlMapCursor ["Track","HC_overFriendly"];
				} else {
					[[],ctrlparent _control] call bis_fnc_ORBATTooltip;
					_control ctrlMapCursor ["Track","Track"];
				};
				BIS_fnc_moduleStrategicMapORBAT_selected = _selected;
			};
			BIS_fnc_moduleStrategicMapORBAT_mouse = {
				BIS_fnc_moduleStrategicMapORBAT_mousePos = [_this select 1,_this select 2];
			};

			//--- Add event handlers
			_fnc_addHandlers = {
				{
					_x spawn {
						disableserialization;
						waituntil {!isnull (finddisplay _this displayctrl 51)};
						_control = finddisplay _this displayctrl 51;
						_control ctrladdeventhandler ["draw","_this call BIS_fnc_moduleStrategicMapORBAT_draw;"];
						_control ctrladdeventhandler ["mousemoving","_this call BIS_fnc_moduleStrategicMapORBAT_mouse;"];
						_control ctrladdeventhandler ["mouseholding","_this call BIS_fnc_moduleStrategicMapORBAT_mouse;"];
						_control ctrladdeventhandler ["mousebuttonclick","['BIS_fnc_moduleStrategicMapORBAT',_this] spawn BIS_fnc_strategicMapMouseButtonClick;"];
					};
				} foreach [
					getnumber (configfile >> "RscDisplayMainMap" >> "idd"),
					getnumber (configfile >> "RscDisplayGetReady" >> "idd"),
					getnumber (configfile >> "RscDisplayClientGetReady" >> "idd"),
					getnumber (configfile >> "RscDisplayServerGetReady" >> "idd")
				];
			};

			[] spawn _fnc_addHandlers;
			addmissioneventhandler ["loaded",_fnc_addHandlers];
		};
	};
};