if (isNil "RscDiaryTaskMarkers_showTooltip") then
{
	RscDiaryTaskMarkers_showTooltip = false;
};
if (isNil "RscDiaryTaskMarkers_mouseOverMarker") then
{
	RscDiaryTaskMarkers_mouseOverMarker = taskNull;
};
if (isNil "RscDiaryTaskMarkers_selectedTaskID") then
{
	RscDiaryTaskMarkers_selectedTaskID = -1;
};
if (isNil "RscDiaryTaskMarkers_menu0Selected") then
{
	RscDiaryTaskMarkers_menu0Selected = "";
};

#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

#define PX_W  				(1 / (getResolution select 2))
#define PX_H  				(1 / (getResolution select 3))
#define DRAWFIX				1/1.37

//real sizes in px
#define MARKER_SIZE			36
#define MARKER_SIZE_HOVER		44
#define MARKER_SIZE_SELECTED		32
#define MARKER_SIZE_SELECTED_HOVER	40

//marker settings
#define ICON_SCALE			0.77778
#define ICON_COLOR			[1,1,1,1]
#define ICON_COLOR_ASSIGNED		[1,0.7,0,1]

#define BACKGROUND_SCALE		1
#define BACKGROUND_COLOR		[0,0,0,1]
#define BACKGROUND_COLOR_HOVER		[0.35,0.0,0.05,1]


private["_map","_customData"];

_map = _this select 0;
_customData = player getVariable ["BIS_fnc_setTaskLocal_customData",[]];

if (count _customData == 0) exitWith {};

private["_task","_data","_typeTex","_currentTask","_mouseOver","_mouseOverTaskMarker","_mouseOverTaskTooltip","_taskID"];

_currentTask = currentTask player;

//detect mouseover
_mouseOver = ctrlMapMouseOver _map;

switch (true) do
{
	//mouse is within the tooltip
	case RscDiaryTaskMarkers_showTooltip:
	{
		_mouseOverTaskMarker = taskNull;
		_mouseOverTaskTooltip = RscDiaryTaskMarkers_mouseOverMarker;
	};
	//mouse in on the task marker
	case (count _mouseOver == 2 && {_mouseOver select 0 == "task"}):
	{
		_mouseOverTaskMarker = _mouseOver select 1;
		_mouseOverTaskTooltip = taskNull;

		RscDiaryTaskMarkers_mouseOverMarker = _mouseOverTaskMarker;
	};
	//mouse is outside
	default
	{
		_mouseOverTaskMarker = taskNull;
		_mouseOverTaskTooltip = taskNull;
	};
};

//stop if cannot find custom data for task marker and tooltip
if ((_customData find _mouseOverTaskMarker) + (_customData find _mouseOverTaskTooltip) == -2) then
{
	_mouseOverTaskMarker = taskNull;
	_mouseOverTaskTooltip = taskNull;
};


private["_backgroundColor","_iconColor","_backgroundSize","_iconSize","_markerSize"];

for "_i" from 0 to (count _customData - 2) step 2 do
{
	_task = _customData select _i;
	_data = _customData select (_i + 1);

	if (!isNull _task && {count _data > 1}) then
	{
		_typeTex = _data select 0;
		_taskID = _data select 1;
		_pos = taskDestination _task;

		//["[i] _task: %1",_task] call bis_fnc_logFormat;
		//["[i] _typeTex: %1",_typeTex] call bis_fnc_logFormat;

		//draw and colorize background
		switch (_task) do
		{
			case _mouseOverTaskMarker:
			{
				_markerSize = MARKER_SIZE_HOVER;
				_backgroundColor = BACKGROUND_COLOR_HOVER;
			};
			case _mouseOverTaskTooltip:
			{
				_markerSize = MARKER_SIZE_HOVER;
				_backgroundColor = BACKGROUND_COLOR;
			};
			default
			{
				_markerSize = MARKER_SIZE;
				_backgroundColor = BACKGROUND_COLOR;
			};
		};

		//selected tasks have inversed background & icon colors
		if (RscDiaryTaskMarkers_menu0Selected == "Tasks" && {_taskID == RscDiaryTaskMarkers_selectedTaskID}) then
		{
			_backgroundSize = _markerSize * BACKGROUND_SCALE;
			_map drawIcon ["#(argb,8,8,3)color(1,1,1,1)", BACKGROUND_COLOR, _pos, _backgroundSize * DRAWFIX, _backgroundSize * DRAWFIX, 0];

			if (_task != _currentTask) then
			{
				_backgroundColor = ICON_COLOR;
			}
			else
			{
				_backgroundColor = ICON_COLOR_ASSIGNED;
			};

			//make the background smaller so the layer beneath is visible and creates the border
			if (_task == _mouseOverTaskMarker || {_task == _mouseOverTaskTooltip}) then
			{
				_backgroundSize = MARKER_SIZE_SELECTED_HOVER * BACKGROUND_SCALE;
			}
			else
			{
				_backgroundSize = MARKER_SIZE_SELECTED * BACKGROUND_SCALE;
			};
		}
		else
		{
			_backgroundSize = _markerSize * BACKGROUND_SCALE;
		};

		_map drawIcon ["#(argb,8,8,3)color(1,1,1,1)", _backgroundColor, _pos, _backgroundSize * DRAWFIX, _backgroundSize * DRAWFIX, 0];


		//draw and colorize icon
		if (_task == _currentTask) then
		{
			_iconColor = ICON_COLOR_ASSIGNED;
		}
		else
		{

			_iconColor = ICON_COLOR;
		};

		//selected tasks have inversed background & icon colors
		if (RscDiaryTaskMarkers_menu0Selected == "Tasks" && {_taskID == RscDiaryTaskMarkers_selectedTaskID}) then
		{
			_iconColor = BACKGROUND_COLOR;
		};

		_iconSize = _markerSize * ICON_SCALE;
		_map drawIcon [_typeTex, _iconColor, _pos, _iconSize * DRAWFIX, _iconSize * DRAWFIX, 0];
	};
};

//["[i] _mouseOverTaskMarker: %1 | _mouseOverTaskTooltip: %2",_mouseOverTaskMarker,_mouseOverTaskTooltip] call BIS_fnc_logFormat;

private["_ctrlTooltip","_mapCoords","_tooltipCoords"];

//get tooltip
_ctrlTooltip = (findDisplay 12) displayCtrl IDC_TASKTOOLTIP;

switch (true) do
{
	case !isNull _mouseOverTaskMarker:
	{
		RscDiaryTaskMarkers_hideTooltipTime = nil;

		private["_ctrlTitle","_ctrlSubtitle"];

		_mapCoords = _map ctrlMapWorldToScreen (taskDestination _mouseOverTaskMarker);
		_tooltipCoords = [(_mapCoords select 0) + (PX_W * MARKER_SIZE_HOVER/2) - (PX_W * 6),(_mapCoords select 1) - (PX_H * MARKER_SIZE_HOVER/2)];

		//reposition tooltip
		_ctrlTooltip ctrlSetPosition _tooltipCoords;

		//update title
		_ctrlTitle = (findDisplay 12) displayCtrl IDC_TASKTOOLTIP_TITLE;
		_ctrlTitle ctrlSetText toUpper((taskDescription _mouseOverTaskMarker) select 1);

		//update subtitle
		_ctrlSubtitle = (findDisplay 12) displayCtrl IDC_TASKTOOLTIP_SUBTITLE;
		if (taskState _mouseOverTaskMarker == "Assigned") then
		{
			_ctrlSubtitle ctrlSetText "ASSIGNED";
			_ctrlSubtitle ctrlSetTextColor ICON_COLOR_ASSIGNED;
		}
		else
		{
			_ctrlSubtitle ctrlSetText "UNASSIGNED";
			_ctrlSubtitle ctrlSetTextColor ICON_COLOR;
		};

		//set background color
		_ctrlBackground = (findDisplay 12) displayCtrl IDC_TASKTOOLTIP_BACKGROUND;
		_ctrlBackground ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";
		_ctrlBackground ctrlSetTextColor BACKGROUND_COLOR;

		//show tooltip
		_ctrlTooltip ctrlCommit 0;
		_ctrlTooltip ctrlShow true;
	};
	case !isNull _mouseOverTaskTooltip:
	{
		RscDiaryTaskMarkers_hideTooltipTime = nil;

		private["_ctrlTitle","_ctrlSubtitle","_ctrlBackground"];

		_mapCoords = _map ctrlMapWorldToScreen (taskDestination _mouseOverTaskTooltip);
		_tooltipCoords = [(_mapCoords select 0) + (PX_W * MARKER_SIZE_HOVER/2) - (PX_W * 6),(_mapCoords select 1) - (PX_H * MARKER_SIZE_HOVER/2)];

		//reposition tooltip
		_ctrlTooltip ctrlSetPosition _tooltipCoords;

		//update title
		_ctrlTitle = (findDisplay 12) displayCtrl IDC_TASKTOOLTIP_TITLE;
		_ctrlTitle ctrlSetText toUpper((taskDescription _mouseOverTaskTooltip) select 1);

		//update subtitle
		_ctrlSubtitle = (findDisplay 12) displayCtrl IDC_TASKTOOLTIP_SUBTITLE;
		if (taskState _mouseOverTaskTooltip == "Assigned") then
		{
			_ctrlSubtitle ctrlSetText "UNASSIGN";
			_ctrlSubtitle ctrlSetTextColor ICON_COLOR;
		}
		else
		{
			_ctrlSubtitle ctrlSetText "ASSIGN TO ME";
			_ctrlSubtitle ctrlSetTextColor ICON_COLOR_ASSIGNED;
		};

		//set background color
		_ctrlBackground = (findDisplay 12) displayCtrl IDC_TASKTOOLTIP_BACKGROUND;
		_ctrlBackground ctrlSetText "#(argb,8,8,3)color(1,1,1,1)";
		_ctrlBackground ctrlSetTextColor BACKGROUND_COLOR_HOVER;


		//show tooltip
		_ctrlTooltip ctrlCommit 0;
		_ctrlTooltip ctrlShow true;
	};
	default
	{
		if (ctrlShown _ctrlTooltip) then
		{
			if (isNil "RscDiaryTaskMarkers_hideTooltipTime") then
			{
				RscDiaryTaskMarkers_hideTooltipTime = time + 0.001;
			}
			else
			{
				if (time > RscDiaryTaskMarkers_hideTooltipTime) then
				{
					//hide tooltip
					_ctrlTooltip ctrlShow false;
				};
			};
		};
	};
};