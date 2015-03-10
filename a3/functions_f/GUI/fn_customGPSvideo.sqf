
/*
	Author: Karel Moricky

	Description:
	Plays in-game video in GPS frame.

	Parameter(s):
	_this select 0: STRING - Video

	Returns:
	True
*/

#define GPS_DISPLAY	(uinamespace getvariable "BIS_RscMissionScreen_customGPSvideo")
#define GPS_CONTENT	(GPS_DISPLAY displayctrl 1100)
#define GPS_FRAME	(GPS_DISPLAY displayctrl 1101)

_this spawn {

	_content = _this select 0;
	_sizeCoef = if (count _this > 1) then {_this select 1} else {1};

	([] call bis_fnc_rscLayer) cutrsc ["RscMissionScreen","plain"];
	waituntil {!isnull (uinamespace getvariable "BIS_RscMissionScreen")};
	uinamespace setvariable ["BIS_RscMissionScreen_customGPSvideo",uinamespace getvariable "BIS_RscMissionScreen"];

	_contentConfig = configfile >> "RscMiniMap" >> "controlsBackground" >> "CA_MiniMap";
	_contentX = getnumber (_contentConfig >> "x");
	_contentY = getnumber (_contentConfig >> "y");
	_contentW = getnumber (_contentConfig >> "w");
	//_contentH = getnumber (_contentConfig >> "h");
	_contentH = _contentW * (10/16) * (4/3); //--- Aspect ration fix

	_frameConfig = configfile >> "RscMiniMap" >> "controls" >> "CA_MinimapFrame";
	_frameX = getnumber (_frameConfig >> "x");
	_frameY = getnumber (_frameConfig >> "y");
	_frameW = getnumber (_frameConfig >> "w");
	_frameH = getnumber (_frameConfig >> "h");
	_frame = if (isnil "BIS_fnc_customGPS_Params") then {

		//--- Default
		gettext (_frameConfig >> "text");
	} else {

		//--- Modified by BIS_fnc_customGPS
		_params = BIS_fnc_customGPS_Params;
		if (count _params > 1) then {
			_dX = _params select 1;
			_contentX = _contentX + _dX;
			_frameX = _frameX + _dX;
		};
		if (count _params > 2) then {
			_dY = _params select 2;
			_contentY = _contentY + _dY;
			_frameY = _frameY + _dY;
		};
		_params select 0;
	};

	_posContent = [
		_contentX,
		_contentY,
		_contentW * _sizeCoef,
		_contentH * _sizeCoef
	];
	_posFrame = [
		_frameX,
		_frameY,
		_frameW,
		_frameH
	];

	//--- Set
	bis_fnc_customGPSvideo_videoStopped = false;

	GPS_CONTENT ctrladdeventhandler ["videoStopped","bis_fnc_customGPSvideo_videoStopped = true;"];
	GPS_CONTENT ctrlsetposition _posContent;
	GPS_CONTENT ctrlsettext _content;
	GPS_CONTENT ctrlcommit 0;

	GPS_FRAME ctrlsetposition _posFrame;
	GPS_FRAME ctrlsettext _frame;
	GPS_FRAME ctrlcommit 0;

	waituntil {bis_fnc_customGPSvideo_videoStopped};
	bis_fnc_customGPSvideo_videoStopped = nil;
	([] call bis_fnc_rscLayer) cuttext ["","plain"];
};