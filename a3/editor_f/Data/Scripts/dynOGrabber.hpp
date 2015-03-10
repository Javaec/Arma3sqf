#include "dikCodes.h"

class Params
{
	//VARIABLE_NAME is defined by default.
	class POSITION
	{
		source = position;
		type = vector;
	};
	class SIZE
	{
		displayName = "Size"; //TODO: Stringtablize.
		type = number;
		default = 20;
	};
};

create[] =
{
	"[%POSITION, %SIZE] call BIS_fnc_objectsGrabber;"
};

destroy[] =
{

};

update[] = {};
updatePosition[] = {};

title = "DynO Grabber"; //TODO: Stringtablize.
// used as a template for the objects names
displayName = "DynO Grabber"; //TODO: Stringtablize.

drawMap[] =
{
	"_map drawRectangle [%POSITION, %SIZE, %SIZE, 0, [0, 0, 1, 0.5], """"];", 
	"_map drawIcon [""\A3\Ui_f\data\Map\Markers\Military\dot_CA"", [0, 0, 1, 0.5], %POSITION, 30, 30, 0, """", true];"
};