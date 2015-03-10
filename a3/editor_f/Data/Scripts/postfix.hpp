class Params
{
	//VARIABLE_NAME is defined by default.
};

create[] =
{
  "{",
  "	this = _x select 0;",
  "	[] call compile (_x select 1);",
  "} foreach _initCodes;",
  "runInitScript;",
  "finishMissionInit;"
};

update[] =
{
  "runInitScript;",
  "finishMissionInit;"
};

updatePosition[] = {};
destroy[] = {};

title = "Postfix"; //TODO: Stringtablize.
// used as a template for the objects names
displayName = "Postfix"; //TODO: Stringtablize.