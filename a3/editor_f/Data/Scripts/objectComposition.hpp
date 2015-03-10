#include "dikCodes.h"

class Params
{
	//VARIABLE_NAME is defined by default.
	class POSITION
	{
		source = position;
		type = vector;
	};
	class ANGLE
	{
		source = direction;
		type = number;
		default = 0;
	};
	class SIDE
	{
		displayName = "Side"; //TODO: Stringtablize.
		type = side;
		default = west;
		onInit = "private [""_handle""]; _handle = [""SIDE"", ""onInit"", [_control_SIDE, _control_FACTION]] execVM ""A3\editor_f\data\scripts\objectComposition.sqf""";
		onChanged = "private [""_handle""]; _handle = [""SIDE"", ""onChanged"", [_control_SIDE, _control_FACTION]] execVM ""A3\editor_f\data\scripts\objectComposition.sqf""";
	};
	class FACTION
	{
		displayName = "Faction"; //TODO: Stringtablize.
		type = config;
		onChanged = "private [""_handle""]; _handle = [""FACTION"", ""onChanged"", [_control_FACTION, _control_TYPE]] execVM ""A3\editor_f\data\scripts\objectComposition.sqf""";
	};
	class TYPE
	{
		displayName = "Type"; //TODO: Stringtablize.
		type = config;
	};
	//TODO: Add 5 tags, randomizer value?
};

create[] =
{
	"%VARIABLE_NAME = [%POSITION, %ANGLE, %TYPE] call BIS_fnc_objectsMapper;"
};

destroy[] =
{
	"{",
	"	deleteVehicle _x;",
	"}",
	"forEach %VARIABLE_NAME;"
};

update[] =
{
	"{",
	"	deleteVehicle _x;",
	"}",
	"forEach %VARIABLE_NAME;",
	"%VARIABLE_NAME = [%POSITION, %ANGLE, %TYPE] call BIS_fnc_objectsMapper;"
};

updatePosition[] =
{
	"{",
	"	deleteVehicle _x;",
	"}",
	"forEach %VARIABLE_NAME;",
	"%VARIABLE_NAME = [%POSITION, %ANGLE, %TYPE] call BIS_fnc_objectsMapper;"
};

proxy = """Editor_Proxy_Composition"" createVehicle [%POSITION select 0, %POSITION select 1, 0]";

title = "Object Composition"; //TODO: Stringtablize.
// used as a template for the objects names
displayName = "%VARIABLE_NAME (%TYPE)";

drawMap[] =
{
	"_map drawIcon [""A3\editor_f\data\object_composition_ca.paa"", [0, 0, 0, 1], %POSITION, 40, 40, %ANGLE, %TYPE, false];"
};