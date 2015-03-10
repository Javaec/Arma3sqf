disableserialization;

//--- Close all displays
([] call bis_fnc_displayMission) createdisplay "RscDisplayNone";

//--- Override camera
_cam = "camera" camcreate position cameraon;
_cam cameraeffect ["terminate","back"];
camdestroy _cam;