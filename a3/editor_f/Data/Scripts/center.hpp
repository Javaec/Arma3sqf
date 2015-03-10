#include "dikCodes.h"

//For now, center has no position.
class Params
{
	//VARIABLE_NAME is defined by default.
	class SIDE
	{
		displayName = "Side"; //TODO: Stringtablize.
		type = side;
		canChange = false;
	};
	class FRIEND_EAST
	{
		displayName = "Friend state OPFOR"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class FRIEND_WEST
	{
		displayName = "Friend state BLUFOR"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class FRIEND_RESISTANCE
	{
		displayName = "Friend state Independent"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class FRIEND_CIVILIAN
	{
		displayName = "Friend state Civilian"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
};

shortcutKey[] =
{
	DIK_F10,
	" (F10)"
};

create[] =
{
	"%!_this = createCenter %SIDE;",
	"_this setFriend [east, %FRIEND_EAST];",
	"_this setFriend [west, %FRIEND_WEST];",
	"_this setFriend [resistance, %FRIEND_RESISTANCE];",
	"_this setFriend [civilian, %FRIEND_CIVILIAN];",
	"%VARIABLE_NAME = _this;"
};

destroy[] =
{
	"deleteCenter %SIDE;"
};

update[] =
{
	"%VARIABLE_NAME setFriend [east, %FRIEND_EAST];",
	"%VARIABLE_NAME setFriend [west, %FRIEND_WEST];",
	"%VARIABLE_NAME setFriend [resistance, %FRIEND_RESISTANCE];",
	"%VARIABLE_NAME setFriend [civilian, %FRIEND_CIVILIAN];"
};

updatePosition[] = {};

title = "Center"; //TODO: Stringtablize.
// used as a template for the objects names
displayName = "Center %SIDE"; //TODO: Stringtablize.