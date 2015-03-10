#include "dikCodes.h"

class Params
{
	class POSITION
	{
		displayName = "VECTOR";
		type = vector;
		source = position;
	};
	class CONDITION
	{
		displayName = "CONDITION";
		type = condition;
	};
	class SPECIAL
	{
		displayName = "SPECIAL";
		type = special;
		subType = trigger;
	};
	class NUMBER
	{
		displayName = "NUMBER";
		type = number;
		default = 10;
		subtype = range(0,1);
	};
	class ENUM
	{
		displayName = "ENUM";
		type = enum;
		subType = Rank;
	};
	class VARNAME
	{
		displayName = "VARNAME";
		type = varname;
	};
	class TEXT
	{
		displayName = "TEXT";
		type = text;
	};
	class BOOL
	{
		displayName = "BOOL";
		type = bool;
	};
	class CONFIG
	{
		displayName = "CONFIG";
		type = config;
		subtype = CfgPostProcessTemplates,displayName;
		default = Default;
	};
	class CONFIGEX
	{
		displayName = "CONFIGEX";
		type = configex;
		subtype = CfgSounds, name, +($NONE$|STR_SOUND_NONE);
		default = $NONE$;
	};
	class VEHICLE
	{
		//displayName = "MARKER";
		type = vehicle;
		source = link;
		shortcutKey = DIK_B;
	};
	class CODE
	{
		displayName = "CODE";
		type = code;
	};
	class EXPRESSION
	{
		displayName = "EXPRESSION";
		type = expression;
	};
	class TEAM
	{
		displayName = "TEAM";
		type = team;
	};
	class GROUP
	{
		displayName = "GROUP";
		source = parent;
		type = group;
		subtype = single;
	};
	class EVALBOOL
	{
		displayName = "EVALBOOL";
		type = evalBool;
	};
	class PICTURE
	{
		displayName = "PICTURE";
		type = picture;
		default = "#(argb,8,8,3)color(1,0,1,1)";
	};
	class SIDE
	{
		displayName = "SIDE";
		type = side;
	};
	class CENTER
	{
		displayName = "CENTER";
		type = center;
		source = parent;
	};
	class BUTTON
	{
		displayName = "BUTTON";
		type = button;
	};
};

shortcutKey[] =
{
};

create[] =
{
	"%VARIABLE_NAME = createvehicle ['b_soldier_f',%POSITION,[],0,'none'];",
	"_POSITION = '%POSITION';",
	"_CONDITION = '%CONDITION';",
	"_SPECIAL = %SPECIAL;",
	"_NUMBER = %NUMBER;",
	"_ENUM = %ENUM;",
	"_VARNAME = '%VARNAME';",
	"_TEXT = %TEXT;",
	"_BOOL = %BOOL;",
	"_CONFIG = %CONFIG;",
	"_CONFIGEX = %CONFIGEX;",
	"_VEHICLE = '%VEHICLE';",
	"_CODE = %CODE;",
	"_EXPRESSION = %EXPRESSION;",
	"_TEAM = '%TEAM';",
	"_GROUP = '%GROUP';",
	"_EVALBOOL = %EVALBOOL;",
	"_PICTURE = %PICTURE;",
	"_SIDE = %SIDE;",
	"_CENTER = %CENTER;",
	"_BUTTON = '%BUTTON';",

	"['create ---------------------'] call bis_fnc_log;",
	"['_this',_this] call bis_fnc_log;",
	"['_map',_map] call bis_fnc_log;",
	"['_control_BOOL',_control_BOOL] call bis_fnc_log;",
	"['_control_title_BOOL',_control_title_BOOL] call bis_fnc_log;",
	"['_pos',_pos] call bis_fnc_log;",
	"['_alt',_alt] call bis_fnc_log;",
	"['_shift',_shift] call bis_fnc_log;",
	"['_scale',_scale] call bis_fnc_log;",
	"['_alpha',_alpha] call bis_fnc_log;",
	"['_selected',_selected] call bis_fnc_log;",
	"['_new',_new] call bis_fnc_log;",
	"['_loading',_loading] call bis_fnc_log;",
	"['_paste',_paste] call bis_fnc_log;",
	"['_overlay',_overlay] call bis_fnc_log;",
	"['_rotate',_rotate] call bis_fnc_log;",
	"['_raising',_raising] call bis_fnc_log;",
	"['_raiseBy',_raiseBy] call bis_fnc_log;",
	"['_offset',_offset] call bis_fnc_log;",
	"['_camera',_camera] call bis_fnc_log;",
	"['_realtime',_realtime] call bis_fnc_log;"
};

destroy[] =
{
	"deleteVehicle %VARIABLE_NAME;"
};

update[] =
{
};

updatePosition[] = {"true"};

position = "position %VARIABLE_NAME";
proxy = "%VARIABLE_NAME";

title = "Test";
displayName = "%VARIABLE_NAME";

drawMap[] =
{
	"_map drawIcon ['#(argb,8,8,3)color(1,0,1,1)', [1,1,1,_alpha], %POSITION, 16, 16, 0];"
};
