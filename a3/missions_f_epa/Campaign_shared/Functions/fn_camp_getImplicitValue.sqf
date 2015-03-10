/*
	Author: Jiri Wainar

	Description:
	Returns implicit value for given variable.

	Syntax:
	[_variableName:string] call BIS_fnc_camp_getImplicitValue;
*/

private["_varName","_implicitValue","_missionName"];

_varName = [_this, 0, "", [""]] call BIS_fnc_param;
_missionName = toLower missionName;

_implicitValue = switch (toLower _varName) do
{
	case format["bis_%1",_missionName];
	case "bis_per_prevmission":
	{
		"VARIABLE_NOT_INITIALIZED"
	};

	case "bis_per_skirmish_dir";
	case "bis_per_phase";
	case "bis_per_step":
	{
		-12345
	};

	case format["bis_per_explored_%1",_missionName];
	case "bis_per_intel";
	case "bis_per_skirmish_squadpool";
	case "bis_per_skirmish_vehicle";
	case "bis_per_skirmish_pos";
	case "bis_per_skirmish_crew";
	case "bis_per_destroyedworldobjects";
	case "bis_per_missionsdone";
	case "bis_per_missionsque";
	case "bis_per_ident_main";
	case "bis_per_ident_killed";
	case "bis_per_ident_survived";
	case "bis_per_ident_return";
	case "bis_per_ident_main";
	case "bis_per_ident_freenamesvo";
	case "bis_per_ident_freenames";
	case "bis_per_pool_magazine";
	case "bis_per_pool_attachment";
	case "bis_per_pool_item";
	case "bis_per_pool_uniform";
	case "bis_per_pool_vest";
	case "bis_per_pool_backpack";
	case "bis_per_pool_headgear";
	case "bis_per_pool_goggles";
	case "bis_per_pool_weapon":
	{
		["VARIABLE_NOT_INITIALIZED"]
	};

	default
	{
		["[x] Persistent variable |%1| doesn't have an implicit value defined!",_varName] call BIS_fnc_error;

		nil
	};
};

_implicitValue