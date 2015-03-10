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
	class GROUP
	{
		displayName = "Group"; //TODO: Stringtablize.
		source = parent;
		type = group;
		subtype = single;
				canChange = false;
	};
	class TYPE
	{
		displayName = "Type"; //TODO: Stringtablize.
		type = special;
		subtype = unit;
		canChange = false;
	};
	class MARKER
	{
		source = link;
		type = marker;
		subtype = multiple;
	};
	class PLACEMENT
	{
		displayName = "Placement radius"; //TODO: Stringtablize.
		type = number;
		default = 0;
	};
	class SPECIAL
	{
		displayName = "Special setting"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeUnitSpecial;
		default = "CAN_COLLIDE";
	};
	class AZIMUT
	{
		source = direction;
		type = number;
		default = 0;
	};
	class NAME
	{
		displayName = "Name"; //TODO: Stringtablize.
		type = varname;
		default = "";
	};
	class HEALTH
	{
		displayName = "Health"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class AMMO
	{
		displayName = "Ammunition"; //TODO: Stringtablize.
		type = number;
		subtype = range(0, 1);
		default = 1;
	};
	class ID
	{
		source = counter;
		type = number;
		default = -1;
	};
	class AGE
	{
		displayName = "Info age"; //TODO: Stringtablize.
		type = enum;
		subtype = ArcadeUnitAge;
		default = "UNKNOWN";
	};
	class INIT
	{
		displayName = "Init expression"; //TODO: Stringtablize.
		type = expression;
		default = "";
	};
	class RANK
	{
		displayName = "Rank"; //TODO: Stringtablize.
		type = enum;
		subtype = Rank;
		default = "PRIVATE";
	};
	class SKILL
	{
		displayName = "Skill"; //TODO: Stringtablize.
		type = number;
		subtype = range(0.2, 1);
		default = 0.6;
	};
	class COMMANDER
	{
		source = link;
		type = vehicle;
		subtype = noneOrSingle;
	};
	class DRIVER
	{
		source = link;
		type = vehicle;
		subtype = noneOrSingle;
	};
	class GUNNER
	{
		source = link;
		type = vehicle;
		subtype = noneOrSingle;
	};
	class CARGO
	{
		source = link;
		type = vehicle;
		subtype = noneOrSingle;
	};
	class PLAYER
	{
		displayName = "Player"; //TODO: Stringtablize.
		type = bool;
		subtype = (STR_PLAYER, STR_PLAYER_AI);
		default = "false";
				// if no player exist, set new agent as a player
				onInit = "private [""_found""]; _found = false; {if (_map evalObjectArgument [_x, ""PLAYER""]) then {_found = true;}} forEach (_map listObjects ""UNIT""); if (!_found) then {_control_player lbSetCurSel 1}";
	};
	class PLAYABLE
	{
		displayName = "Playable"; //TODO: Stringtablize.
		type = bool;
		subtype = (STR_PLAYABLE, STR_NONPLAYABLE);
		default = "false";
	};
	class LEADER
	{
		displayName = "Leader"; //TODO: Stringtablize.
		type = bool;
		subtype = (STR_LEADER, STR_NOBODY);
		default = "false";
		//If the selected group has no leader yet, set this property to true.
		onInit = "private [""_leader""]; _leader = _map findEditorObject [""unit"", ""LEADER"", ""true"", ""GROUP"", _control_group lbData (lbCurSel _control_group)]; if (_leader == """") then {_control_leader lbSetCurSel 1};";
	};
};

shortcutKey[] =
{
	DIK_F1,
	" (F1)"
};

//"	%!_this = %TYPE createUnit [%POSITION, %MARKER, %PLACEMENT, %SPECIAL];",
//	"%VARIABLE_NAME = [%TYPE, %POSITION,%MARKER,%PLACEMENT,%SPECIAL,%AZIMUTH,%NAME,%HEALTH,%AMMO,%ID,%AGE,%INIT,%RANK,%SKILL,%COMMANDER,%DRIVER,%DRIVER,%GUNNER,%PLAYER,%LEADER] call compile preprocessfile ""scripts\unit_create.sqf"";",
// 	"%VARIABLE_NAME = [%TYPE, %POSITION,%MARKER,%PLACEMENT,%SPECIAL,%AZIMUTH,""%NAME"",%HEALTH,%AMMO,%ID,%AGE,%INIT,%RANK,%SKILL,""%COMMANDER"",""%DRIVER"",""%GUNNER"",%PLAYER,%LEADER] call compile (preprocessFile ""unit_create.sqf"");",

create[] =
{
	"%VARIABLE_NAME = objNull;",
	"%!if (%PRESENCE_CONDITION) then",
	"{",
	"	%!_this = %GROUP createUnit [%TYPE, %POSITION, %MARKER, %PLACEMENT, %SPECIAL];",
	"	%VARIABLE_NAME = _this;",
	"	_this setPos %POSITION;",
	"	_this setDir %AZIMUT;",
	"	_this setVehicleVarName ""%NAME"";",
	"	%NAME = _this;",
	"	_this setVehicleArmor %HEALTH;",
	"	_this setVehicleAmmo %AMMO;",
	"	_this setVehicleId %ID;",
	"	_this setTargetAge %AGE;",
	"	_this setUnitRank %RANK;",
	"	_this setUnitAbility %SKILL;",
	"	_this moveInCommander %COMMANDER;",
	"	_this moveInDriver %DRIVER;",
	"	_this moveInGunner %GUNNER;",
	"	_this moveInCargo %CARGO;",
	"	if (%LEADER) then {%GROUP selectLeader _this;};",
	"	if (%PLAYER) then {selectPlayer _this;};",
	"	if (%PLAYABLE) then {setPlayable _this;};",
	"	_initCodes set [count _initCodes,[_this,%INIT]];",
	"};"
};

destroy[] =
{
	"if (%PLAYER) then {selectNoPlayer;};", // deleteVehicle cannot delete the player
	"deleteVehicle %VARIABLE_NAME;"
};

update[] =
{
	"%!if (!isNull %VARIABLE_NAME) then",
	"{",
	"	%VARIABLE_NAME setPos %POSITION;",
	"	%VARIABLE_NAME setDir %AZIMUT;",
	"	%VARIABLE_NAME setVehicleVarName ""%NAME"";",
	"	_this = %VARIABLE_NAME;",
	"	%NAME = _this;", // avoid for empty %NAME
	"	%VARIABLE_NAME setVehicleArmor %HEALTH;",
	"	%VARIABLE_NAME setVehicleAmmo %AMMO;",
	"	%VARIABLE_NAME setVehicleId %ID;",
	"	%VARIABLE_NAME setTargetAge %AGE;",
	"	%VARIABLE_NAME setUnitRank %RANK;",
	"	%VARIABLE_NAME setUnitAbility %SKILL;",
	"	moveOut _this;",
	"	_this moveInCommander %COMMANDER;",
	"	_this moveInDriver %DRIVER;",
	"	_this moveInGunner %GUNNER;",
	"	_this moveInCargo %CARGO;",
	"	if (%LEADER) then {%GROUP selectLeader %VARIABLE_NAME;};",
	"	if (%PLAYER) then {selectPlayer %VARIABLE_NAME;};",
	"};"
};

//No updatePosition - proxy == object.
updatePosition[] = {};

position = "position %VARIABLE_NAME";
proxy = "%VARIABLE_NAME";

title = "Unit";	//TODO: Stringtablize.
// used as a template for the objects names
displayName = "%VARIABLE_NAME: %NAME (%TYPE)";

drawMap[] =
{
	"{",
	"	_map drawLine [%POSITION, _map evalObjectArgument [_x, ""POSITION""], [0, 1, 1, _alpha]];",
	"}",
	"forEach %(MARKER);",
	"if (not %LEADER) then",
	"{",
	"	_leader = _map findEditorObject [""unit"", ""LEADER"", ""true"", ""GROUP"", ""%GROUP""];",
	"	if (_leader != """") then",
	"	{",
	"		_map drawLine [_map evalObjectArgument [_leader, ""POSITION""], %POSITION, [0, 1, 1, _alpha]];",
	"	};",
	"};",
	"if (""%DRIVER"" != """") then",
	"{",
	"	_map drawLine [_map evalObjectArgument [""%DRIVER"", ""POSITION""], %POSITION, [1, 0, 1, _alpha]];",
	"};",
	"if (""%COMMANDER"" != """") then",
	"{",
	"	_map drawLine [_map evalObjectArgument [""%COMMANDER"", ""POSITION""], %POSITION, [1, 0, 0.5, _alpha]];",
	"};",
	"if (""%GUNNER"" != """") then",
	"{",
	"	_map drawLine [_map evalObjectArgument [""%GUNNER"", ""POSITION""], %POSITION, [0.5, 0, 1, _alpha]];",
	"};",
	"if (""%CARGO"" != """") then",
	"{",
	"	_map drawLine [_map evalObjectArgument [""%CARGO"", ""POSITION""], %POSITION, [0.5, 0, 0.5, _alpha]];",
	"};",
	"_center = _map getObjectArgument [""%GROUP"", ""CENTER""];",
	"_side = _map getObjectArgument [_center, ""SIDE""];",
	"private ""_color"";",
	"_color = (['east','west','guer','civ','','','','logic'] find _side) call bis_fnc_sideColor;",
	"_map drawIcon [getText (configFile >> ""CfgVehicles"" >> %TYPE >> ""icon""), _color, %POSITION, 24, 24, %AZIMUT];",
	"if (%PLACEMENT > 0) then",
	"{",
	"	_map drawEllipse [%POSITION, %PLACEMENT, %PLACEMENT, 0, _color];",
	"};",
	"if (%PLAYER) then",
	"{",
	"	_map drawIcon [getText (configFile >> ""CfgInGameUI"" >> ""IslandMap"" >> ""iconPlayer""), [0.7, 0.1, 0, _alpha], %POSITION, 16, 16, 0];",
	"};"
};