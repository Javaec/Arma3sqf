scriptName "initAnims.sqf";

//get all units that should play ambient anims
private["_units","_regUnits"];

_units = (allMissionObjects "Man") - [BIS_inf];
_units = _units - BIS_FullStart_regUnits;
_units = _units - BIS_HubIntro_regUnits;

{
	if (count (_x getVariable ["BIS_ambientAnim",[]]) == 0) then
	{
		_units set [_forEachIndex, objNull];
	};
}
forEach _units; _units = _units - [objNull];

_regUnits = BIS_FullStart_regUnits - BIS_HubIntro_regUnits + BIS_HubIntro_regUnits;


//store to globals
BIS_Anims_regUnits =+ _regUnits;
BIS_Anims_units    =+ _units;

//apply the ambient animations to all units
BIS_Anims_setupUnits =
{
	private["_params","_placement","_animset","_hasWeapon","_weapon"];

	{
		if (true) then
		{
			_params = _x getVariable ["BIS_ambientAnim",[]];

			if (count _params == 0) exitWith {};

			//["[!] Ambient animations assigned to unit [%1]:%2.",_x,_params] call BIS_fnc_logFormat;

			_params = [_x] + _params;

			_params call BIS_fnc_ambientAnim;

			_animset = _x getVariable ["BIS_fnc_ambientAnim__animset",""];

			if (_animset != "") then
			{
				_hasWeapon = !((_animset call BIS_fnc_ambientAnimGetParams) select 5);

				if (_hasWeapon && primaryWeapon _x == "") then
				{
					["[!] Unit [%1] playing ambient animation set [%2] is missing a weapon!",_x,_animset] call BIS_fnc_logFormat;

					_weapon = _x getVariable ["BIS_fnc_ambientAnim__weapon","arifle_mx_f"];

					_x addWeapon _weapon;
					_x selectWeapon _weapon;
				};
			};
		};
	}
	forEach BIS_Anims_units;

	BIS_Anims_completed = true;
};

//check for intro briefing & if not, execute the anims
private["_introBriefing"];

_introBriefing = ["Hubs",missionName,"IntroBriefing","active"] call BIS_fnc_getCfgDataBool;

if !(_introBriefing) then
{
	[] call BIS_Anims_setupUnits;
};