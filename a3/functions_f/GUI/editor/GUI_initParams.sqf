_listParams = [

	//--- Position type (sort of hack, do not change)
	[
		"GUI_param_positionType",
		["idc"],
		"GUI_fnc_elementSetPositionType",
		typename 00,
		"Class:",
		{
			GUI_positionType;
		}
	],

	//--- Text
	[
		"GUI_param_text",
		["text"],
		"GUI_fnc_elementSetText",
		typename "",
		"Text:",
		{
			gettext (_parent >> "text");
		}
	],

	//--- Position
	[
		"GUI_param_position",
		["x","y","w","h"],//"position[]",
		"GUI_fnc_elementSetPosition",
		typename [],
		"Position:",
		{
			[GUI_RMB_pos select 0,GUI_RMB_pos select 1,0.1,0.1];
		}
	],

	//--- Text color
	[
		"GUI_param_textcolor",
		["colorText"],
		"GUI_fnc_elementSetTextColor",
		typename [],
		"Text color:",
		{
			private ["_colorText"];
			_colorText = getarray (_parent >> "colorText");
			if (count _colorText != 4) then {_colorText = [-1,-1,-1,-1];};
			_colorText;
			[-1,-1,-1,-1]
		}
	],

	//--- Background color
	[
		"GUI_param_backgroundcolor",
		["colorBackground"],
		"GUI_fnc_elementSetBackgroundColor",
		typename [],
		"Background color:",
		{
			private ["_colorBackground"];
			_colorBackground = getarray (_parent >> "colorBackground");
			if (count _colorBackground != 4) then {_colorBackground = [-1,-1,-1,-1];};
			_colorBackground;
			[-1,-1,-1,-1]
		}
	],

	//--- Active color
	[
		"GUI_param_activecolor",
		["colorActive"],
		"GUI_fnc_elementSetActiveColor",
		typename [],
		"Active color:",
		{
			private ["_colorBackgroundActive"];
			_colorBackgroundActive = getarray (_parent >> "colorBackgroundActive");
			if (count _colorBackgroundActive != 4) then {_colorBackgroundActive = [-1,-1,-1,-1];};
			_colorBackgroundActive;
			[-1,-1,-1,-1]
		}
	],

	//--- Tooltip
	[
		"GUI_param_tooltip",
		["tooltip"],
		"GUI_fnc_elementSetTooltip",
		typename "",
		"Tooltip:",
		{
			gettext (_parent >> "tooltip");
		}
	],

	//--- Text size
	[
		"GUI_param_sizeEx",
		["sizeEx"],
		"GUI_fnc_elementSetSizeEx",
		typename "",
		"Text size:",
		{
			//gettext (_parent >> "sizeEx");
			"-1"
		}
	]
];


GUI_listLayersStrings = [];
GUI_listLayersFunctions = [];
GUI_listLayersTypes = [];
GUI_listLayersLabels = [];
GUI_listLayersDefaults = [];

{
	_forEachIndexMain = _forEachIndex;
	{
		switch (_forEachIndex) do {

			//--- ID
			case 0: {
				missionnamespace setvariable [_x,_forEachIndexMain];
			};

			//--- String
			case 1: {
				GUI_listLayersStrings = GUI_listLayersStrings + [_x];
			};

			//--- Function
			case 2: {
				GUI_listLayersFunctions = GUI_listLayersFunctions + [_x];
			};

			//--- Type
			case 3: {
				GUI_listLayersTypes = GUI_listLayersTypes + [_x];
			};

			//--- Label
			case 4: {
				GUI_listLayersLabels = GUI_listLayersLabels + [_x];
			};

			//--- Defaults
			case 5: {
				GUI_listLayersDefaults = GUI_listLayersDefaults + [_x];
			};

		};
	} foreach _x;
} foreach _listParams;
