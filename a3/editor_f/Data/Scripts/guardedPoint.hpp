#include "dikCodes.h"

class Params
{
	//VARIABLE_NAME is defined by default.
	class POSITION
	{
		source = position;
		type = vector;
	};
	class SIDE
	{
		displayName = "Side"; //TODO: Stringtablize.
		type = side;
		canChange = false;
	};
	class ID_STATIC
	{
		displayName = "Static ID"; //TODO: Stringtablize.
		type = number;
		default = -1;
		canChange = false;
	};
	class VEHICLE
	{
		source = link;
		type = vehicle;
		subtype = noneOrSingle;
		default = objNull;
	};
};

shortcutKey[] =
{
	DIK_F11,
	" (F11)"
};

//Current implementation of guarded points doesn't enable deletion or updates.
create[] =
{
	"%!createGuardedPoint [%SIDE, %POSITION, %ID_STATIC, %VEHICLE];"
};

destroy[] = {};
update[] = {};
updatePosition[] = {};

title = "Guarded Point"; //TODO: Stringtablize.