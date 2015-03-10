#include "dikCodes.h"

class Params
{
	//VARIABLE_NAME is defined by default.
	class POSITION
	{
		source = position;
		type = vector;
	};
	class OBJECT
	{
		displayName = "Attached object"; //TODO: Stringtablize.
		type = special;
		subtype = trigger;
		default = "EmptyDetector";
		canChange = false;
	};
	class A
	{
		displayName = "Axis A (width)"; //TODO: Stringtablize.
		type = number;
		default = 50;
	};
	class B
	{
		displayName = "Axis B (height)"; //TODO: Stringtablize.
		type = number;
		default = 50;
	};
	class ANGLE
	{
		source = direction;
		type = number;
		default = 0;
	};
	class RECTANGULAR
	{
		displayName = "Shape"; //TODO: Stringtablize.
		type = bool;
		subtype = (STR_DISP_ARCSENS_RECT, STR_DISP_ARCSENS_ELLIPSE);
		default = false;
	};
	class ACTIVATION_BY
	{
		displayName = "Activation by"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeSensorActivation;
		default = "NONE";
	};
	class ACTIVATION_TYPE
	{
		displayName = "Activation type"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeSensorActivationType;
		default = "PRESENT";
	};
	class REPEATING
	{
		displayName = "Repeating"; //TODO: Stringtablize.
		type = bool;
		subtype = (STR_DISP_ARCSENS_REPEAT, STR_DISP_ARCSENS_ONCE);
		default = false;
	};
	class TYPE
	{
		displayName = "Type"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeSensorType;
		default = "NONE";
	};
	class TIMEOUT_MIN
	{
		displayName = "Timeout (min)"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class TIMEOUT_MID
	{
		displayName = "Timeout (mid)"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class TIMEOUT_MAX
	{
		displayName = "Timeout (max)"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class INTERRUPTABLE
	{
		displayName = "Interruptable by"; //TODO: Stringtablize.
		type = bool;
		subtype = (STR_DISP_ARCSENS_TIMEOUT, STR_DISP_ARCSENS_COUNTDOWN);
		default = false;
	};
	class ID_STATIC
	{
		displayName = "Static ID"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class VEHICLE
	{
		source = link;
		type = vehicle;
		//subtype = noneOrSingle;
	};
	class TEXT
	{
		displayName = "Text"; //TODO: Stringtablize.
		type = text;
		default = "";
	};
	class NAME
	{
		displayName = "Name"; //TODO: Stringtablize.
		type = varname;
		default = "";
	};
	class EXP_COND
	{
		displayName = "Activation condition"; //TODO: Stringtablize.
		type = evalBool;
		default = "this";
	};
	class EXP_ACTIV
	{
		displayName = "Activation expression"; //TODO: Stringtablize.
		type = expression;
		default = "";
	};
	class EXP_DESACTIV
	{
		displayName = "Deactivation expression"; //TODO: Stringtablize.
		type = expression;
		default = "";
	};
	class AGE
	{
		displayName = "Info age"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeUnitAge;
		default = "UNKNOWN";
	};
	class EFFECT_CONDITION
	{
		displayName = "Effect condition"; //TODO: Stringtablize.
		type = evalBool;
		default = "true";
	};
/*
	class CAMERA_EFFECT
	{
		displayName = "Camera effect"; //TODO: Stringtablize.
		type = configEx;
		subtype = CfgCameraEffects.Array, name, +(|STR_CAMEFFECT_NONE), +($TERMINATE$|STR_CAMEFFECT_TERMINATE);
		default = "";
	};
	class CAMERA_EFFECT_POSITION
	{
		displayName = "Camera effect position"; //TODO: Stringtablize.
		type = enum;
		subtype = CamEffectPosition;
		default = "BACK";
	};
*/
	class SOUND_EFFECT
	{
		displayName = "Sound effect"; //TODO: Stringtablize.
		type = configEx;
		subtype = CfgSounds, name, +($NONE$|STR_SOUND_NONE);
		default = "$NONE$";
	};
	class SOUND_ENV_EFFECT
	{
		displayName = "Environ. sound effect"; //TODO: Stringtablize.
		type = configEx;
		subtype = CfgEnvSounds, name, +(|STR_SOUND_NONE);
		default = "";
	};
	class SOUND_DET_EFFECT
	{
		displayName = "Trigger sound effect"; //TODO: Stringtablize.
		type = configEx;
		subtype = CfgSFX, name, +(|STR_SOUND_NONE);
		default = "";
	};
	class VOICE_EFFECT
	{
		displayName = "Voice effect"; //TODO: Stringtablize.
		type = configEx;
		subtype = CfgSounds, name, +(|STR_SOUND_NONE);
		default = "";
	};
	class MUSIC_EFFECT
	{
		displayName = "Music effect"; //TODO: Stringtablize.
		type = configEx;
		subtype = CfgMusic, name, +($NONE$|STR_MUSIC_NONE), +($STOP$|STR_MUSIC_SILENCE);
		default = "$NONE$";
	};
	class TITLE_EFFECT_TYPE
	{
		displayName = "Title effect type"; //TODO: Stringtablize.
		type = enum;
		subtype = TitleType;
		default = "NONE";
	};
	class TITLE_EFFECT_EFFECT
	{
		displayName = "Title effect"; //TODO: Stringtablize.
		type = enum;
		subtype = TitEffectName;
		default = "PLAIN";
	};
	class TITLE_EFFECT_TITLE
	{
		displayName = "Title effect title"; //TODO: Stringtablize.
		type = text;
		default = "";
	};
	class SYNC
	{
		source = link;
		type = waypoint;
		//subtype = multiple;
	};
};

shortcutKey[] =
{
	DIK_F3,
	" (F3)"
};

create[] =
{
	"%!_this = createTrigger [%OBJECT, %POSITION];",
	"_this setTriggerArea [%A, %B, %ANGLE, %RECTANGULAR];",
	"_this triggerAttachObject %ID_STATIC;",
	"_this triggerAttachVehicle %VEHICLE;",
	"_this setTriggerActivation [%ACTIVATION_BY, %ACTIVATION_TYPE, %REPEATING];",
	"_this setTriggerType %TYPE;",
	"_this setTriggerTimeout [%TIMEOUT_MIN, %TIMEOUT_MID, %TIMEOUT_MAX, %INTERRUPTABLE];",
	"_this setTriggerText %TEXT;",
	"_this setTriggerStatements [%EXP_COND, %EXP_ACTIV, %EXP_DESACTIV];",
	"_this setTargetAge %AGE;",
	"%NAME = _this;",
	"_this setEffectCondition %EFFECT_CONDITION;",
//	"_this setCameraEffect [%CAMERA_EFFECT, %CAMERA_EFFECT_POSITION];",
	"_this setSoundEffect [%SOUND_EFFECT, %VOICE_EFFECT, %SOUND_ENV_EFFECT, %SOUND_DET_EFFECT];",
	"_this setMusicEffect %MUSIC_EFFECT;",
	"_this setTitleEffect [%TITLE_EFFECT_TYPE, %TITLE_EFFECT_EFFECT, %TITLE_EFFECT_TITLE];",
	"_this synchronizeWaypoint %SYNC;",
	"%VARIABLE_NAME = _this;"
};

destroy[] =
{
	"deleteVehicle %VARIABLE_NAME;"
};

update[] =
{
	"%VARIABLE_NAME setTriggerArea [%A, %B, %ANGLE, %RECTANGULAR];",
	"%VARIABLE_NAME triggerAttachObject %ID_STATIC;",
	"%VARIABLE_NAME triggerAttachVehicle %VEHICLE;",
	"%VARIABLE_NAME setTriggerActivation [%ACTIVATION_BY, %ACTIVATION_TYPE, %REPEATING];",
	"%VARIABLE_NAME setTriggerType %TYPE;",
	"%VARIABLE_NAME setTriggerTimeout [%TIMEOUT_MIN, %TIMEOUT_MID, %TIMEOUT_MAX, %INTERRUPTABLE];",
	"%VARIABLE_NAME setTriggerText %TEXT;",
	"%VARIABLE_NAME setTriggerStatements [%EXP_COND, %EXP_ACTIV, %EXP_DESACTIV];",
	"%VARIABLE_NAME setTargetAge %AGE;",
  "_this = %VARIABLE_NAME;",
  "%NAME = _this;", //avoid for empty %NAME
	"%VARIABLE_NAME setEffectCondition %EFFECT_CONDITION;",
//	"%VARIABLE_NAME setCameraEffect [%CAMERA_EFFECT, %CAMERA_EFFECT_POSITION];",
	"%VARIABLE_NAME setSoundEffect [%SOUND_EFFECT, %VOICE_EFFECT, %SOUND_ENV_EFFECT, %SOUND_DET_EFFECT];",
	"%VARIABLE_NAME setMusicEffect %MUSIC_EFFECT;",
	"%VARIABLE_NAME setTitleEffect [%TITLE_EFFECT_TYPE, %TITLE_EFFECT_EFFECT, %TITLE_EFFECT_TITLE];",
	"%VARIABLE_NAME synchronizeWaypoint %SYNC;"
};

updatePosition[] =
{
	"%VARIABLE_NAME setPos %POSITION;"
};

position = "position %VARIABLE_NAME";

title = "Trigger";  //TODO: Stringtablize.

//ToDo: create some 3D proxy object for in the 3D mode if necessary.
//proxy = """OFP2Test_Fur_Fridge"" createVehicle %POSITION";

drawMap[] =
{
	"{",
	"  _map drawLine [%POSITION, _map evalObjectArgument [_x, ""POSITION""], [0, 0, 1, _alpha]];",
	"}",
	"forEach %(SYNC);",
	"if (%RECTANGULAR) then",
	"{",
	"  _map drawRectangle [%POSITION, %A, %B, %ANGLE, [0.1, 0.1, 0.9, _alpha]];",
	"}",
	"else",
	"{",
	"  _map drawEllipse [%POSITION, %A, %B, %ANGLE, [0.1, 0.1, 0.9, _alpha]];",
	"};",
	"_map drawIcon [getText (configFile >> ""CfgInGameUI"" >> ""IslandMap"" >> ""iconSensor""), [0.1, 0.1, 0.9, _alpha], %POSITION, 16, 16, 0];"
};