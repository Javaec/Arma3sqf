class Params
{
  //VARIABLE_NAME is defined by default.
  class ADDON
  {
    type = text;
    subtype = multiple;
  };
};

create[] =
{
  "%!activateAddons %ADDON;",
  "initAmbientLife;",
  "[] call (uinamespace getvariable 'bis_fnc_recompile');",
  "'bis_functions_mainscope' call (uinamespace getvariable ['bis_fnc_endLoadingScreen',{}]);",
  "_initCodes = [];"
};

update[] =
{
  "%!activateAddons %ADDON;"
};

updatePosition[] = {};
destroy[] = {};

title = "Prefix";  //TODO: Stringtablize.
// used as a template for the objects names
displayName = "Prefix"; //TODO: Stringtablize.