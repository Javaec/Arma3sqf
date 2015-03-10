scriptName "initFF.sqf";

/*--------------------------------------------------------------------------------------------------

	FRIENDLY-FIRE INITIALIZATION

	Global variables:
	-----------------
	* BIS_FFDetected

--------------------------------------------------------------------------------------------------*/

if (isNil "BIS_FFDetected") then
{
	BIS_FFDetected = false;
};

BIS_friendlyFire =
{
	scriptName "initFF.sqf: BIS_friendlyFire";

	private["_source","_victim","_eh"];

	_victim = _this select 0;
	_source = _this select 1;

	if (!BIS_FFDetected) then
	{
		if (_source in [vehicle player, player]) then
		{
			BIS_FFDetected = true;

			sleep 3;

			["FriendlyFire",false] call BIS_fnc_endMission;
		};
	};
};

{_x addEventHandler ["HandleDamage", {[_this select 0,_this select 3] spawn BIS_friendlyFire; _this select 2}]} forEach (allUnits - [player]);
{_x addEventHandler ["Killed", {[_this select 0,_this select 1] spawn BIS_friendlyFire}]} forEach (allUnits - [player]);