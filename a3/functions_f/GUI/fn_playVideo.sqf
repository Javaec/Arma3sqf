
/*
	Author: Karel Moricky

	Description:
	Plays in-game video.

	Parameter(s):
	_this select 0: STRING - Video path
	_this select 1 (Optional): ARRAY - Size
	_this select 2 (Optional): ARRAY - Color
	_this select 3 (Optional): STRING - Variable to skip the video

	Returns:
	True
*/

#define VIDEO_DISPLAY	(uinamespace getvariable "BIS_RscMissionScreen_video")
#define VIDEO_CONTENT	(VIDEO_DISPLAY displayctrl 1100)

_content = _this select 0;
_size = [_this, 1, [], [[]]] call BIS_fnc_param;
_color = [_this, 2, [1,1,1,1], [[]], 4] call BIS_fnc_param;
_skipVariable = [_this, 3, "BIS_fnc_playVideo_skipVideo", [""]] call BIS_fnc_param;

//--- Create display
([] call bis_fnc_rscLayer) cutrsc ["RscMissionScreen","plain"];
waituntil {!isnull (uinamespace getvariable "BIS_RscMissionScreen")};
uinamespace setvariable ["BIS_RscMissionScreen_video",uinamespace getvariable "BIS_RscMissionScreen"];

//--- Default size (full screen)
if (count _size == 0) then {
	_ratio = 16/9;
	_x = safezoneX;
	_w = safezoneW;
	_h = (safezoneW / _ratio) * (4/3);
	_y = safezoneY + (safezoneH - _h)/2;
	_size = [
		_x,
		_y,
		_w,
		_h
	];
};

//--- Default color
bis_fnc_playvideo_videoStopped = false;

VIDEO_CONTENT ctrlsettextcolor _color;
VIDEO_CONTENT ctrlsetposition _size;
VIDEO_CONTENT ctrlsettext _content;
VIDEO_CONTENT ctrlcommit 0;
VIDEO_CONTENT ctrladdeventhandler ["videoStopped","bis_fnc_playvideo_videoStopped = true; ""Video stopped"" call BIS_fnc_log"];

waituntil {
	bis_fnc_playvideo_videoStopped
	||
	(missionnamespace getvariable [_skipVariable,false])
	||
	isNull VIDEO_DISPLAY
};

bis_fnc_playvideo_videoStopped = nil;
([] call bis_fnc_rscLayer) cuttext ["","plain"];