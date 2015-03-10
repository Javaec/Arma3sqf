/*
	Author: Karel Moricky

	Description:
	Every time a given unit fires, bullet cam is created.

	Parameter(s):
		0: OBJECT - unit on which firing is tracked

	Returns:
	BOOL
*/

_shooter = [_this,0,objnull,[objnull]] call bis_fnc_param;

_eh = _shooter getvariable "bis_fnc_diagBulletCam_fired";
if !(isnil {_eh}) then {
	_shooter removeeventhandler ["fired",_eh];
};

_eh = _shooter addeventhandler [
	"fired",
	{
		_this spawn {
			_shooter = _this select 0;
			_bullet = _this select 6;

			if (isnil "bis_fnc_diagBulletCam_camera") then {
				bis_fnc_diagBulletCam_camera = "camera" camcreate position _bullet;
				bis_fnc_diagBulletCam_camera cameraeffect ["internal","back"];
				while {!isnull _bullet} do {
					bis_fnc_diagBulletCam_camera setpos position _bullet;
					bis_fnc_diagBulletCam_camera setdir direction _bullet;
					sleep 0.01;
				};
				bis_fnc_diagBulletCam_camera cameraeffect ["terminate","back"];
				camdestroy bis_fnc_diagBulletCam_camera;
				bis_fnc_diagBulletCam_camera = nil;
			};
		};
	}
];
_shooter setvariable ["bis_fnc_diagBulletCam_fired",_eh];

true