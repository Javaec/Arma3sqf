#include "dikCodes.h"

class Params
{
	//VARIABLE_NAME is defined by default.
	class POSITION
	{
		source = position;
		type = vector;
	};
	class PRESENCE_CONDITION
	{
		displayName = "Presence condition"; //TODO: Stringtablize.
		type = condition;
		default = "true";
	};
	class TYPE
	{
		displayName = "Type"; //TODO: Stringtablize.
		type = special;
		subtype = vehicle;
		canChange = false;
	};
	class MARKER
	{
		source = link;
		type = marker;
		//subtype = multiple; (default)
	};
	class PLACEMENT
	{
		displayName = "Placement radius"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class SPECIAL
	{
		displayName = "Special setting"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeUnitSpecial;
		default = "CAN_COLLIDE";
	};
	class AZIMUT
	{
		source = direction;
		type = number;
		default = 0;
	};
	class NAME
	{
		displayName = "Name"; //TODO: Stringtablize.
		type = varname;
		default = "";
	};
	class HEALTH
	{
		displayName = "Health"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class FUEL
	{
		displayName = "Fuel"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class AMMO
	{
		displayName = "Ammunition"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class ID
	{
		source = counter;
		type = number;
		default = -1;
	};
	class AGE
	{
		displayName = "Info age"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeUnitAge;
		default = "UNKNOWN";
	};
	class LOCK
	{
		displayName = "Lock status"; //TODO: Stringtablize.
		type = enum;
		subtype = LockState;
		default = "DEFAULT";
	};
	class INIT
	{
		displayName = "Init expression"; //TODO: Stringtablize.
		type = expression;
		default = "";
	};
	class PARENT
	{
		displayName = "Parent"; //TODO: Stringtablize.
		source = parent;
		type = team;
		subtype = noneOrSingle;
		shortcutKey = DIK_LSHIFT;
	};
	class COLOR
	{
		type = text;
		hidden = true;
		default = "[0.5, 0.5, 0]";
	};
};

shortcutKey[] =
{
	DIK_F5,
	" (F5)"
};

create[] =
{
	"%VARIABLE_NAME = objNull;",
	"%!if (%PRESENCE_CONDITION) then",
	"{",
	"	_this = createVehicle [%TYPE, %POSITION, %MARKER, %PLACEMENT, %SPECIAL];",
	"	%VARIABLE_NAME = _this;",
	"	_this setDir %AZIMUT;",
	"	_this setVehicleVarName ""%NAME"";",
	"	%NAME = _this;",
	"	_this setVehicleArmor %HEALTH;",
	"	_this setFuel %FUEL;",
	"	_this setVehicleAmmo %AMMO;",
	"	_this setVehicleId %ID;",
	"	_this setTargetAge %AGE;",
	"	_this setVehicleLock %LOCK;",
	"	_this setPos %POSITION;",
	"	_initCodes set [count _initCodes,[_this,%INIT]];",
	"};"
};

destroy[] =
{
	"_map deleteEditorObject ""%VARIABLE_NAME"";"
};

update[] =
{
	"%!if (!isNull %VARIABLE_NAME) then",
	"{",
	"	%VARIABLE_NAME setDir %AZIMUT;",
	"	%VARIABLE_NAME setVehicleVarName ""%NAME"";",
  	"	_this = %VARIABLE_NAME;",
	"	%NAME = _this;",
	"	%VARIABLE_NAME setVehicleArmor %HEALTH;",
	"	%VARIABLE_NAME setFuel %FUEL;",
	"	%VARIABLE_NAME setVehicleAmmo %AMMO;",
	"	%VARIABLE_NAME setVehicleId %ID;",
	"	%VARIABLE_NAME setTargetAge %AGE;",
	"	%VARIABLE_NAME setVehicleLock %LOCK;",
	"	%VARIABLE_NAME setPos %POSITION;",
	"};"
};

//No updatePosition - proxy == object.
updatePosition[] = {"true"};

position = "position %VARIABLE_NAME";
proxy = "%VARIABLE_NAME";

title = "Vehicle";  //TODO: Stringtablize.
// used as a template for the objects names
displayName = "%VARIABLE_NAME: %NAME (%TYPE)";

drawMap[] =
{
	"_position = _map evalObjectArgument [""%VARIABLE_NAME"",""POSITION""];",
	"_azimut = _map evalObjectArgument [""%VARIABLE_NAME"",""AZIMUT""];",
	"{",
	"	_map drawLine [_position, _map evalObjectArgument [_x, ""POSITION""], [0, 1, 1, _alpha]];",
	"}",
	"forEach %(MARKER);",
	"_color = 4 call bis_fnc_sideColor;",
	"_color set [3,_alpha];",
	"_map drawIcon [getText (configFile >> ""CfgVehicles"" >> %TYPE >> ""icon""), _color, _position, 24, 24, _azimut];",
	"if (%PLACEMENT > 0) then",
	"{",
	"	_map drawEllipse [_position, %PLACEMENT, %PLACEMENT, 0, [0.5, 0.5, 0, _alpha]];",
	"};",
	"if (""%PARENT"" != """") then",
	"{",
	"	_map drawLine [_map evalObjectArgument [""%PARENT"", ""POSITION""], _position, [0, 1, 1, 1]];",
	"};"
};