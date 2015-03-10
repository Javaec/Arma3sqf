#include "dikCodes.h"

// TODO: enable change of order

class Params
{
	//VARIABLE_NAME is defined by default.
	class POSITION
	{
		source = position;
		type = vector;
	};
	class PLACEMENT
	{
    //displayName = $STR_DISP_ARCWP_PLACE;
    displayName = "Placement radius"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class GROUP
	{
    //displayName = $STR_MAP_GROUP;
    displayName = "Group"; //TODO: Stringtablize.
		source = parent;
		type = group;
		subtype = single;
    canChange = false;
	};
/*
	class PREVIOUS
	{
		source = link;
		type = waypoint;
		subtype = noneOrSingle;
	};
*/
	class TYPE
	{
    //displayName = $STR_DISP_ARCWP_TYPE;
    displayName = "Type"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeWaypointType;
		default = "MOVE";
	};
	class VEHICLE
	{
		source = link;
		type = vehicle;
		subtype = noneOrSingle;
	};
	class ID_STATIC
	{
		displayName = "Static ID"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class HOUSE_POS
	{
    //displayName = $STR_DISP_ARCWP_HOUSEPOS;
    displayName = "Position in house"; //TODO: Stringtablize.
		type = number;
		default = -1;
	};
	class COMBAT_MODE
	{
		displayName = "Combat mode"; //TODO: Stringtablize.
		type = enum;
		subtype = Semaphore;
		default = "NO CHANGE";
	};
	class FORMATION
	{
		displayName = "Formation"; //TODO: Stringtablize.
		type = enum;
		subtype = Formation;
		default = "NO CHANGE";
	};
	class SPEED
	{
		displayName = "Speed"; //TODO: Stringtablize.
		type = enum;
		subtype = SpeedMode;
		default = "UNCHANGED";
	};
	class COMBAT
	{
		displayName = "Behaviour"; //TODO: Stringtablize.
		type = enum;
		subtype = CombatMode;
		default = "UNCHANGED";
	};
	class DESCRIPTION
	{
		displayName = "Description"; //TODO: Stringtablize.
		type = text;
		default = "";
	};
	class EXP_COND
	{
		displayName = "Activation condition"; //TODO: Stringtablize.
		type = evalBool;
		default = "true";
	};
	class EXP_ACTIV
	{
		displayName = "Activation expression"; //TODO: Stringtablize.
		type = expression;
		default = "";
	};
	class SCRIPT
	{
		displayName = "Script"; //TODO: Stringtablize.
		type = text;
		default = "";
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
	class SHOW
	{
		displayName = "Show"; //TODO: Stringtablize.
		type = enum;
		subtype = AWPShow;
		default = "EASY";
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
	DIK_F4,
	" (F4)"
};

create[] =
{
	"%!_this = %GROUP addWaypoint [%POSITION, %PLACEMENT];",
	"_this setWaypointType %TYPE;",
	"_this waypointAttachVehicle %VEHICLE;",
	"_this waypointAttachObject %ID_STATIC;",
	"_this setWaypointHousePosition %HOUSE_POS;",
	"_this setWaypointCombatMode %COMBAT_MODE;",
	"_this setWaypointFormation %FORMATION;",
	"_this setWaypointSpeed %SPEED;",
	"_this setWaypointBehaviour %COMBAT;",
	"_this setWaypointDescription %DESCRIPTION;",
	"_this setWaypointStatements [%EXP_COND, %EXP_ACTIV];",
	"_this setWaypointScript %SCRIPT;",
	"_this setWaypointTimeout [%TIMEOUT_MIN, %TIMEOUT_MID, %TIMEOUT_MAX];",
	"_this showWaypoint %SHOW;",
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
	"deleteWaypoint %VARIABLE_NAME;"
};

update[] =
{
  "_this = %VARIABLE_NAME;",
	"_this setWaypointType %TYPE;",
	"_this waypointAttachVehicle %VEHICLE;",
	"_this waypointAttachObject %ID_STATIC;",
	"_this setWaypointHousePosition %HOUSE_POS;",
	"_this setWaypointCombatMode %COMBAT_MODE;",
	"_this setWaypointFormation %FORMATION;",
	"_this setWaypointSpeed %SPEED;",
	"_this setWaypointBehaviour %COMBAT;",
	"_this setWaypointDescription %DESCRIPTION;",
	"_this setWaypointStatements [%EXP_COND, %EXP_ACTIV];",
	"_this setWaypointScript %SCRIPT;",
	"_this setWaypointTimeout [%TIMEOUT_MIN, %TIMEOUT_MID, %TIMEOUT_MAX];",
	"_this showWaypoint %SHOW;",
	"_this setEffectCondition %EFFECT_CONDITION;",
//	"_this setCameraEffect [%CAMERA_EFFECT, %CAMERA_EFFECT_POSITION];",
	"_this setSoundEffect [%SOUND_EFFECT, %VOICE_EFFECT, %SOUND_ENV_EFFECT, %SOUND_DET_EFFECT];",
	"_this setMusicEffect %MUSIC_EFFECT;",
	"_this setTitleEffect [%TITLE_EFFECT_TYPE, %TITLE_EFFECT_EFFECT, %TITLE_EFFECT_TITLE];",
	"_this synchronizeWaypoint %SYNC;"
};

updatePosition[] =
{
	"%VARIABLE_NAME setWaypointPosition [%POSITION, %PLACEMENT];"
};

title = "Waypoint";  //TODO: Stringtablize.

position = "waypointPosition %VARIABLE_NAME";

//ToDo: create some 3D proxy object for in the 3D mode if necessary.
//proxy = """OFP2Test_Fur_Ball"" createVehicle %POSITION";

drawMap[] =
{
	"{",
	"  _map drawLine [%POSITION, _map evalObjectArgument [_x, ""POSITION""], [0, 0, 1, _alpha]];",
	"}",
	"forEach %(SYNC);",
	"_map drawIcon [getText (configFile >> ""RscMapControl"" >> ""waypoint"" >> ""icon""), [0, 0, 0, _alpha], %POSITION, 24, 24, 0];",
	"if (%VARIABLE_NAME select 1 != 1) then",
	"{",
	"  _map drawArrow [waypointPosition [%GROUP, (%VARIABLE_NAME select 1) - 1], %POSITION, [0, 0, 0, _alpha]];",
	"}",
	"else",
	"{",
  	"  private [""_leader""];",
	"  _leader = _map findEditorObject [""unit"", ""LEADER"", ""true"", ""GROUP"", ""%GROUP""];",
 	"  if (_leader != """") then",
  	"  {",
	"    _map drawArrow [_map evalObjectArgument [_leader, ""POSITION""], %POSITION, [0, 0, 0, _alpha]];",
  	"  }",
  	"  else ",
  	"  {",
  	     //No leader was found, so select the first other member of the group; to prevent a strange line from [0, 0].
  	"    private [""_member""];",
  	"    _member = _map findEditorObject [""unit"", ""GROUP"", ""%GROUP""];",
  	"    if (_member != """") then ",
  	"    {", 
  	"      _map drawArrow [_map evalObjectArgument [_member, ""POSITION""], %POSITION, [0, 0, 0, _alpha]];",
  	"    };",
  	"  };", 
	"};",
	"if (%PLACEMENT > 0) then",
	"{",
	"  _map drawEllipse [%POSITION, %PLACEMENT, %PLACEMENT, 0, [0, 0, 0, _alpha]];",
	"};"
};