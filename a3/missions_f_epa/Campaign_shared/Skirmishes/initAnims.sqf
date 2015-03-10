/*--------------------------------------------------------------------------------------------------

	HANDLE AMBIENT ANIMATIONS

--------------------------------------------------------------------------------------------------*/

private["_units","_params","_placement","_animset","_hasWeapon"];

_units = allMissionObjects "Man";

{
	_params = [_x] + (_x getVariable ["BIS_ambientAnim",[]]);

	if (count _params > 1) then
	{
		_params call BIS_fnc_ambientAnimCombat;
	};

	_animset = _x getVariable ["BIS_fnc_ambientAnim__animset",""];

	if (_animset != "") then
	{
		_hasWeapon = !((_animset call BIS_fnc_ambientAnimGetParams) select 5);

		if (_hasWeapon && primaryWeapon _x == "") then
		{
			["[!] Unit [%1] playing ambient animation set [%2] is missing a weapon!",_x,_animset] call BIS_fnc_logFormat;

			_x addWeapon "arifle_mx_f";
			_x selectWeapon "arifle_mx_f";
		};
	};
}
forEach _units;