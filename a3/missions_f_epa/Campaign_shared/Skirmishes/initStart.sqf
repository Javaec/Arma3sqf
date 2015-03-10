//create vehicle
private["_vehicle","_vehClass","_vehCustId"];

_vehicle = objNull;

_vehClass  = [BIS_PER_SKIRMISH_vehicle, 0, "", [""]] call BIS_fnc_param;
_vehCustId = [BIS_PER_SKIRMISH_vehicle, 1, "", [""]] call BIS_fnc_param;

if (_vehClass != "") then
{
	_vehicle = createVehicle [_vehClass, BIS_PER_SKIRMISH_pos, [], 0, "CAN_COLLIDE"];
	_vehicle setDir BIS_PER_SKIRMISH_dir;
	_vehicle setPos BIS_PER_SKIRMISH_pos;

	[_vehicle,_vehCustId] spawn
	{
		sleep 1;

		if ((_this select 1) != "") then
		{
			_this call BIS_fnc_camp_setupVehicle;
		};

		//setup vehicle cargo
		[_this select 0] call BIS_fnc_camp_setVehicleCargo;
	};
};

//position player
if (isNull _vehicle) then
{
	player setPos BIS_PER_SKIRMISH_pos;
	player setDir BIS_PER_SKIRMISH_dir;
}
else
{
	player moveInDriver _vehicle;
	player action ["EngineOn", _vehicle];

	if !((daytime > 7.5) && (daytime < 18.5)) then
	{
		player action ["lightOn", _vehicle];
	};
};

//create squad
private["_squad","_unit"];

_squad = [];

if ((count BIS_PER_SKIRMISH_crew > 0) && !(isNull _vehicle)) then
{
	{
		_unit = [_x,missionName,_vehicle] call BIS_fnc_camp_createSkirmishSquadUnit;

		if !(isNull _unit) then
		{
			_squad set [count _squad, _unit];
		};
	}
	forEach BIS_PER_SKIRMISH_crew;

	if (count _squad > 0) then
	{
		_squad joinSilent player;
	};
};