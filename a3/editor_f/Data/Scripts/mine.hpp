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
		subtype = mine;
		canChange = false;
	};
	class MARKER
	{
		source = link;
		type = marker;
	};
	class PLACEMENT
	{
		displayName = "Placement radius"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
};

shortcutKey[] =
{
	DIK_F8,
	" (F8)"
};

create[] =
{
	"%VARIABLE_NAME = objNull;",
	"%!if (%PRESENCE_CONDITION) then",
	"{",
	"  %VARIABLE_NAME = createMine [%TYPE, %POSITION, %MARKER, %PLACEMENT];",
	"};"
};

destroy[] =
{
  "deleteVehicle %VARIABLE_NAME;"
};

//No update nor updatePosition.
update[] = {};
updatePosition[] = {};

title = "Mine"; //TODO: Stringtablize.

position = "position %VARIABLE_NAME";
proxy = "%VARIABLE_NAME";