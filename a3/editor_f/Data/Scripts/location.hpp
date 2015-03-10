//Location object:
class Params
{
	//VARIABLE_NAME is defined by default
	class POSITION
	{
		source = position;
		type = vector;
	};
	class TYPE
	{
		displayName = "Type"; //TODO: Stringtablize.
		type = config;
		subtype = CfgLocationTypes,name;
		default = "HQ";
	};
	class A
	{
		displayName = "Axis A (width)"; //TODO: Stringtablize.
		type = number;
		default = 1;
	};
	class B
	{
		displayName = "Axis B (height)"; //TODO: Stringtablize.
    		type = number;
    		default = 1;
	};
	class ANGLE
	{
		source = direction;
		type = number;
		default = 0;
	};
	class RECTANGULAR
	{
		displayName = "Rectangular"; //TODO: Stringtablize.
		type = bool;
		default = "false";
	};
	class OBJECT
	{
		displayName = "Attached object"; //TODO: Stringtablize.
		source = link;
		type = vehicle;
		subtype = noneOrSingle;
	};
	class IMPORTANCE
	{
		displayName = "Importance"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class NAME
	{
		displayName = "Name"; //TODO: Stringtablize.
		type = varname;
		default = "";
	};
	class TEXT
	{
		displayName = "Text"; //TODO: Stringtablize.
		type = text;
		default = "";
	};
	class SIDE
	{
		displayName = "Side"; //TODO: Stringtablize.
		type = side;
	};
};

create[] =
{
	"%!_this = createLocation [%TYPE, %POSITION, %A, %B];",
	"_this setDirection %ANGLE;",
	"_this setRectangular %RECTANGULAR;",
	"_this attachObject %OBJECT;",
	"_this setImportance %IMPORTANCE;",
	"_this setName ""%NAME"";",
	"%NAME = _this;",
	"_this setText %TEXT;",
	"_this setSide %SIDE;",
	"%VARIABLE_NAME = _this;"
};

destroy[] =
{
	"_map deleteEditorObject ""%VARIABLE_NAME""; deleteLocation %VARIABLE_NAME;"
};

update[] =
{
	"%VARIABLE_NAME setType %TYPE;",
	"%VARIABLE_NAME setSize [%A, %B];",
	"%VARIABLE_NAME setDirection %ANGLE;",
	"%VARIABLE_NAME setRectangular %RECTANGULAR;",
	"_this = %VARIABLE_NAME;",
	"_this attachObject %OBJECT;",
	"%VARIABLE_NAME setImportance %IMPORTANCE;",
	"%VARIABLE_NAME setName ""%NAME"";",
	"%NAME = _this;",
	"%VARIABLE_NAME setText %TEXT;",
	"%VARIABLE_NAME setSide %SIDE;",
};

updatePosition[] =
{
	"%VARIABLE_NAME setPosition %POSITION;"
};

position = "position %VARIABLE_NAME";
displayName = "%VARIABLE_NAME: %NAME (%TYPE)";
proxy = "";

title = "Location";  //TODO: Stringtablize.

drawMap[] =
{
	"%!if (""%OBJECT"" != """") then",
	"{",
	"  _map drawLine [%POSITION, _map evalObjectArgument [""%OBJECT"", ""POSITION""], [0, 0, 0, _alpha]];",
	"};",
	"_map drawLocation %VARIABLE_NAME"
};