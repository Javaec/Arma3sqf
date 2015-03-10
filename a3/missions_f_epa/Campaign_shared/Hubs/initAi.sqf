scriptName "initAi.sqf";

/*--------------------------------------------------------------------------------------------------

	AI INITIALIZATION & TWEAKS

	* Creates walking bots on hubs.

	Global variables:
	-----------------
	* BIS_DebugMode

--------------------------------------------------------------------------------------------------*/

if (isNil "BIS_DebugMode") then
{
	BIS_DebugMode = false;
};

/*--------------------------------------------------------------------------------------------------

	CREATE WALKING BOTS

--------------------------------------------------------------------------------------------------*/
private["_stage"];

_stage = ["stage"] call BIS_fnc_getCfgData;

BIS_Ai_walkingBots = if (_stage == "A") then
{
	[nil,["B_Soldier_F"],BIS_showHelpers] call BIS_fnc_camp_createWalkingBots;
}
else
{
	[nil,["B_G_Soldier_F","B_G_Soldier_lite_F"],BIS_showHelpers] call BIS_fnc_camp_createWalkingBots;
};

/*--------------------------------------------------------------------------------------------------

	DO OTHER TWEAKS

--------------------------------------------------------------------------------------------------*/

{
	//remove unwanted items
	_x unassignItem "NVGoggles"; /*removeAllItems _x;*/
}
forEach allUnits;

/*--------------------------------------------------------------------------------------------------

	DO SOME RANDOMIZATION ON THE GENERIC UNITS

--------------------------------------------------------------------------------------------------*/
private["_unit","_uniforms","_helmets","_vests","_uniform","_helmet","_vest"];

_uniforms =
[
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_Guerilla3_2"
];

_helmets =
[
	"H_Booniehat_khk",
	"H_Bandanna_khk",
	"H_Cap_oli",
	"",
	""
];



_vests =
[
	"V_TacVest_blk",
	"V_BandollierB_blk"
];

{
	_unit = _x;

	if (true) then
	{
		if ({typeOf _unit == _x} count ["B_G_Soldier_F","B_G_Soldier_lite_F"] == 0) exitWith {};

		if (vehicleVarName _unit != "") exitWith {};

		_helmet  = _helmets call BIS_fnc_selectRandom;
		_uniform = _uniforms call BIS_fnc_selectRandom;

		if (_uniform == "U_BG_Guerilla3_1" || _uniform == "U_BG_Guerilla3_2") then
		{
			_vest = "";
		}
		else
		{
			_vest = _vests call BIS_fnc_selectRandom;
		};

		//["[RandomGear] Unit [%1] | Uniform [%2] | Vest [%3] | Headgear [%4]",typeOf _x,_uniform,_vest,_helmet] call BIS_fnc_logFormat;

		_unit forceAddUniform _uniform;

		if (_vest != "") then
		{
			_unit addVest _vest;;
		}
		else
		{
			removeVest _unit;
		};

		if (_helmet != "") then
		{
			_unit addHeadgear _helmet;
		}
		else
		{
			removeHeadgear _unit;
		};
	};
}
forEach allUnits;