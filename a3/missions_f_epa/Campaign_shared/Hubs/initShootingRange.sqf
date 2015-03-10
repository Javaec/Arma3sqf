scriptName "initShootingRange.sqf";

/*--------------------------------------------------------------------------------------------------

	SHOOTING RANGE

	Handles:
	--------
	* ambient shooting range, soldiers firing at targets
	* tbd: shooting range mechanics for player

--------------------------------------------------------------------------------------------------*/

//_anim = _stance call BIS_ShootingRange_getStanceAnim;
BIS_ShootingRange_getStanceAnim =
{
	private["_anim"];

	//get animation from the stance
	switch (_this) do
	{
		case "UP":
		{
			_anim = "HubShootingRangeStand_shoot";
		};
		case "MIDDLE":
		{
			_anim = "HubShootingRangeKneel_shoot";
		};
		case "DOWN":
		{
			_anim = "HubShootingRangeProne_shoot";
		};

		default
		{
			_anim = "HubShootingRangeStand_shoot";
		};
	};

	_anim
};

BIS_ShootingRange_getStanceAnimA3 =
{
	private["_anim"];

	//get animation from the stance
	switch (_this) do
	{
		case "UP":
		{
			_anim = "AmovPercMstpSrasWrflDnon";
		};
		case "MIDDLE":
		{
			_anim = "AmovPknlMstpSrasWrflDnon";
		};
		case "DOWN":
		{
			_anim = "AmovPpneMstpSrasWrflDnon";
		};

		default
		{
			_anim = "AmovPercMstpSrasWrflDnon";
		};
	};

	_anim
};

//_ambientPool = _stance call BIS_ShootingRange_getAmbientPool;
BIS_ShootingRange_getAmbientPool =
{
	private["_ambientPool"];

	switch (_this) do
	{
		case "UP":
		{
			_ambientPool = ["hub_shootingrange_stand_move1","hub_shootingrange_stand_move2","hub_shootingrange_stand_move3","hub_shootingrange_stand_move4"];
		};
		case "MIDDLE":
		{
			_ambientPool = ["hub_shootingrange_kneel_move1","hub_shootingrange_kneel_move2","hub_shootingrange_kneel_move3"];
		};
		case "DOWN":
		{
			_ambientPool = ["hub_shootingrange_prone_move1","hub_shootingrange_prone_move2","hub_shootingrange_prone_move3"];
		};

		default
		{
			_ambientPool = ["hub_shootingrange_stand_move1","hub_shootingrange_stand_move2","hub_shootingrange_stand_move3","hub_shootingrange_stand_move4"];
		};
	};

	_ambientPool
};

/*
DEFAULT A3 FIRING ANIMS
AmovPknlMstpSrasWrflDnon
AmovPpneMstpSrasWrflDnon
AmovPercMstpSrasWrflDnon

KNEEL > ERECTED
AmovPknlMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon

ERECTED > KNEEL
AmovPercMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon
*/


BIS_ShootingRange_AmbientFire_init =
{
	private["_i","_cfgData","_position","_soldier","_target","_dir","_id"];
	private["_stances","_soldierClass","_group","_presence"];

	for "_i" from 0 to 9 do
	{
	if (true) then
	{
		_id  = format["_%1",_i];
		_cfgData = ["Hubs",missionName,"ShootingRange","Positions",_id] call BIS_fnc_getCfgData;

		if (isNil "_cfgData") exitWith {};					//exit if no more data are defined
		if (count _cfgData == 0) exitWith {};					//exit if data array is empty

		_position = missionNamespace getVariable [format["BIS_SR_ShootingPos%1",_i],objNull];
		_target   = missionNamespace getVariable [format["BIS_SR_Target%1",_i],objNull];

		if ((isNull _position) || (isNull _target)) exitWith {};

		//get the type of the tweak that will be applied to the building
		_stances	= _cfgData;
		_soldierClass 	= ["B_G_Soldier_F","B_G_Soldier_F","B_G_Soldier_A_F","B_G_Soldier_M_F"] call BIS_fnc_selectRandom;
		_presence	= 0.5;

		if (random 1 > _presence) exitWith {};

		//create the soldier
		_group = createGroup west;
		_soldier = _group createUnit [_soldierClass, getPos _position, [], 0, "NONE"];

		//disable Ai
		{_soldier disableAI _x} forEach ["MOVE", "TARGET", "AUTOTARGET", "FSM","ANIM"];
		_soldier setBehaviour "COMBAT";

		//setup soldier towards the target
		_dir = [_position,_target] call BIS_fnc_dirTo;
		_soldier setDir _dir;
		_soldier setPosASL getPosASL _position;

		//make soldier to auto-fire
		[_soldier,_target,_stances] spawn BIS_ShootingRange_AmbientFire_exec;
	};
	};
};

BIS_ShootingRange_AmbientFire_exec =
{
	scriptName "initShootingRange.sqf: BIS_ShootingRange_AmbientFire_exec";

	private["_soldier","_target","_stances","_stance","_anim","_mode","_i","_t","_ambientPool","_ambientSelected","_ambientPrev"];

	_soldier = _this select 0;
	_target  = _this select 1;
	_stances = _this select 2;

	_mode	 = "Single";
	_stance	 = "";
	_anim 	 = "";

	//ambient "in-between" animation
	_ambientSelected = "";
	_ambientPrev	 = "";

	_soldier setVariable ["BIS_AnimDone",""];

	//add animation event handler
	_soldier addEventHandler
	[
		"AnimDone",
		{
			(_this select 0) setVariable ["BIS_AnimDone",_this select 1];
		}
	];

	//temp solution
	_stance	= _stances call BIS_fnc_selectRandom;
	_anim = _stance call BIS_ShootingRange_getStanceAnim;
	_soldier switchMove _anim;

	_t = time + (random 30) + 30;

	waitUntil
	{
		sleep 0.5;

		((player distance _soldier) < 30) || (_t < time)
	};

	while {true} do
	{
		//re-set soldiers facing direction
		_dir = [_soldier,_target] call BIS_fnc_dirTo;
		_soldier setDir _dir;

		//["[%1] Playing shooting animation: %2",_soldier,_anim] call BIS_fnc_logFormat;

		if (_mode == "Single") then
		{
			for "_i" from 1 to 5 do
			{
				_soldier setVehicleAmmo 1;
				_soldier doTarget _target;

				_soldier forceWeaponFire [primaryWeapon _soldier, _mode];

				sleep (1 + (random 2));
			};
		}
		else
		{
			for "_i" from 1 to 3 do
			{
				_soldier setVehicleAmmo 1;
				_soldier doTarget _target;

				_soldier forceWeaponFire [primaryWeapon _soldier, _mode];

				sleep (3 + (random 2));
			};
		};

		_t = time + 30;

		waitUntil
		{
			sleep 0.5;

			((player distance _soldier) < 20) || (_t < time)
		};

		//get all possible ambient animations
		_ambientPool = _stance call BIS_ShootingRange_getAmbientPool;

		//play some ambient animation, but not the last one
		_ambientSelected = (_ambientPool - [_ambientPrev]) call BIS_fnc_selectRandom;
		_ambientPrev 	 = _ambientSelected;

		//["[%1] Playing ambient animation: %2",_soldier,_ambientSelected] call BIS_fnc_logFormat;

		_soldier switchMove _ambientSelected;

		waitUntil
		{
			sleep 0.1;

			(_soldier getVariable ["BIS_AnimDone",""]) == _ambientSelected
		};

		//["[%1] Ambient animation finished: %2",_soldier,_ambientSelected] call BIS_fnc_logFormat;

		if (random 1 < 0.6) then
		{
			reload _soldier;
			sleep 5.5;
		};

		_soldier switchMove _anim;

		//update stance
		if ((random 1 < 0.6) && (count _stances > 1)) then
		{
			_stance	= (_stances-[_stance]) call BIS_fnc_selectRandom;

			if !(_stance in ["UP","MIDDLE","DOWN"]) then
			{
				_stance = "UP";
			};

			//set unit stance
			_soldier setUnitPos _stance;

			//get stance (basic) animation
			_anim = _stance call BIS_ShootingRange_getStanceAnim;

			//play intrepolation into different stance
			_soldier playMoveNow _anim;

			sleep 3;
		};
	};
};

[] call BIS_ShootingRange_AmbientFire_init;