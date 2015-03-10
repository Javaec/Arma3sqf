_vehicle_1 = objNull;
if (true) then
{
  _this = createVehicle ["B_MRAP_01_F", [3885.1541, 3565.8303, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_1 = _this;
  _this setPos [3885.1541, 3565.8303, -3.0517578e-005];
};

_vehicle_3 = objNull;
if (true) then
{
  _this = createVehicle ["B_MRAP_01_F", [3893.8552, 3559.1387, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_3 = _this;
  _this setDir 77.242676;
  _this setPos [3893.8552, 3559.1387, -1.5258789e-005];
};

_vehicle_8 = objNull;
if (true) then
{
  _this = createVehicle ["B_Mortar_01_F", [3898.636, 3567.47, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_8 = _this;
  _this setDir 53.05772;
  _this setPos [3898.636, 3567.47, -1.5258789e-005];
};

_vehicle_11 = objNull;
if (true) then
{
  _this = createVehicle ["B_Mortar_01_F", [3890.1104, 3567.438, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_11 = _this;
  _this setDir 53.05772;
  _this setPos [3890.1104, 3567.438, 1.5258789e-005];
};

_vehicle_13 = objNull;
if (true) then
{
  _this = createVehicle ["Box_NATO_Grenades_F", [3898.749, 3569.6301], [], 0, "CAN_COLLIDE"];
  _vehicle_13 = _this;
  _this setPos [3898.749, 3569.6301];
};

_vehicle_15 = objNull;
if (true) then
{
  _this = createVehicle ["Box_NATO_Grenades_F", [3890.3467, 3569.7134, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_15 = _this;
  _this setDir -24.966595;
  _this setPos [3890.3467, 3569.7134, 4.5776367e-005];
};

_vehicle_20 = objNull;
if (true) then
{
  _this = createVehicle ["Box_NATO_Grenades_F", [3886.7964, 3567.6191], [], 0, "CAN_COLLIDE"];
  _vehicle_20 = _this;
  _this setDir -77.3526;
  _this setPos [3886.7964, 3567.6191];
};
/*
_vehicle_21 = objNull;
if (true) then
{
  _this = createVehicle ["B_supplyCrate_F", [3885.8059, 3561.6301], [], 0, "CAN_COLLIDE"];
  _vehicle_21 = _this;
  _this setPos [3885.8059, 3561.6301];
};

_vehicle_23 = objNull;
if (true) then
{
  _this = createVehicle ["B_supplyCrate_F", [3886.2297, 3560.1079, -0.001739339], [], 0, "CAN_COLLIDE"];
  _vehicle_23 = _this;
  _this setDir 14.133396;
  _this setPos [3886.2297, 3560.1079, -0.001739339];
};
*/
_vehicle_26 = objNull;
if (true) then
{
  _this = createVehicle ["Box_NATO_Grenades_F", [3887.6819, 3567.1021, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_26 = _this;
  _this setDir -24.966595;
  _this setPos [3887.6819, 3567.1021, -3.0517578e-005];
};

_vehicle_29 = objNull;
if (true) then
{
  _this = createVehicle ["Box_NATO_Wps_F", [3897.8352, 3569.9277, -0.00012207031], [], 0, "CAN_COLLIDE"];
  _vehicle_29 = _this;
  _this setDir 11.625407;
  _this setPos [3897.8352, 3569.9277, -0.00012207031];
};

_vehicle_30 = objNull;
if (true) then
{
  _this = createVehicle ["Box_NATO_Ammo_F", [3900.2739, 3565.9106, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_30 = _this;
  _this setPos [3900.2739, 3565.9106, 1.5258789e-005];
};

_vehicle_41 = objNull;
if (true) then
{
  _this = createVehicle ["Land_CanisterPlastic_F", [3892.1589, 3560.2793], [], 0, "CAN_COLLIDE"];
  _vehicle_41 = _this;
  _this setPos [3892.1589, 3560.2793];
};

_vehicle_42 = objNull;
if (true) then
{
  _this = createVehicle ["Land_BarrelEmpty_F", [3891.5688, 3560.3645, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_42 = _this;
  _this setPos [3891.5688, 3560.3645, -6.1035156e-005];
};

//--------------------------------------------------------------------------------------------------

//mortars temp. replaced: IG_Mortar_01_F <-> B_Mortar_01_F
Bis_Mortar1 = _vehicle_8;
Bis_Mortar2 = _vehicle_11;

Bis_GrpMortars = createGroup west;

{
	[_x, Bis_GrpMortars] call Bis_fnc_spawnCrew;
	_x setBehaviour "CARELESS";
}
forEach [Bis_Mortar1, Bis_Mortar2];

Bis_AmmoBoxes = nearestObjects [Bis_Mortars, ["Box_NATO_Grenades_F","Box_NATO_Grenades_F","Box_NATO_Wps_F","Box_NATO_Ammo_F"], 20];

Bis_ChainExplosionTriggered = false;

//do the chain explosion
Bis_createChainExplosion =
{
	if (Bis_ChainExplosionTriggered) exitWith
	{
		["ANOTHER EXPLOSION TERMINATED!"] call Bis_debugLog;
	};

	Bis_ChainExplosionTriggered = true;

	//remove handlers from all ammo boxes
	{
		_x removeAllEventHandlers "handledamage";
	}
	forEach Bis_AmmoBoxes;

	private["_unit","_damage"];

	_unit 	= _this select 0;
	_damage = _this select 2;

	["EXPLOSION TRIGGERED!"] call Bis_debugLog;

	[_unit,"HelicopterExploSmall"] call Bis_createExplosion;

	_unit setDamage 1;

	sleep 0.8;

	{
		if (_forEachIndex % 2 == 0) then
		{
			[_x,"HelicopterExploSmall"] call Bis_createExplosion;

			_x setDamage 1;

			sleep 0.8;
		};
	}
	forEach (Bis_AmmoBoxes - [_unit]);
};

//add event handler to ammo boxes
{
	_x addEventHandler ["handledamage",
	{
		if ((_this select 3) == (vehicle player)) then
		{
			_this spawn Bis_createChainExplosion;
		};

		_damage
	}];
}
forEach Bis_AmmoBoxes;