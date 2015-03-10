#include "dikCodes.h"

class Params
{
	//VARIABLE_NAME is defined by default.
	class CENTER
	{
		displayName = "Center"; //TODO: Stringtablize.
		source = parent;
		type = center;
		subtype = single;
    canChange = false;
	};
};

shortcutKey[] =
{
	DIK_F2,
	" (F2)"
};

create[] =
{
	"%VARIABLE_NAME = createGroup %CENTER;"
};

destroy[] =
{
	"deleteGroup %VARIABLE_NAME;"
};

update[] = {};
updatePosition[] = {};

title = "Group"; //TODO: Stringtablize.