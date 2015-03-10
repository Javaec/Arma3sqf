scriptName "missionOptimization.sqf";

sleep 3;

/*--------------------------------------------------------------------------------------------------

	DEFINES

--------------------------------------------------------------------------------------------------*/
#define IGNORE_OBJECTS		[BIS_inf,BIS_journalist,BIS_nikos,BIS_car,BIS_introCar,BIS_journalistHeli,BIS_air1,BIS_air2,BIS_BHQ]
#define IGNORE_CLASSES		["Logic","Land_Billboard_F","Land_HelipadCivil_F","Land_i_House_Small_03_V1_F","Land_i_Addon_02_V1_F","Land_Addon_02_V1_ruins_F","Land_Chapel_Small_V1_F","Land_Factory_Hopper_F","Land_Factory_Main_F","Land_u_Barracks_V2_F","Land_Shed_Big_F","Land_Net_Fence_Gate_F","Land_Unfinished_Building_02_ruins_F","Land_fs_feed_F","Land_fs_roof_F","Land_Slums02_4m","Land_cargo_house_slum_F","Land_LampSolar_F","Land_d_Shop_01_V1_F","Land_i_Garage_V1_dam_F","Land_u_Shop_01_V1_F","Land_i_Stone_HouseBig_V1_F","Land_Kiosk_blueking_F","Land_Cargo_Tower_V1_F","Land_House_Small_02_V1_ruins_F","Land_House_Big_02_V1_ruins_F","Land_Kiosk_gyros_F","Land_Kiosk_papers_F","Land_u_Shop_02_V1_F","Land_LampStreet_F","Land_Church_01_V1_F","Land_City_Gate_F","Land_Unfinished_Building_01_ruins_F","Land_d_Stone_HouseBig_V1_F","Land_i_Garage_V2_dam_F","Land_i_House_Small_01_V1_F","Land_d_House_Small_02_V1_F","Land_d_Stone_Shed_V1_F","Land_Slum_House02_F","Land_CarService_F","Land_i_Shop_02_V2_F","Land_i_House_Big_02_V2_F","Land_LampDecor_F","Land_Addon_01_V1_ruins_F","Land_Stone_HouseBig_V1_ruins_F","Land_i_Stone_HouseBig_V3_F","Land_i_House_Big_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V3_F","Land_u_House_Big_02_V1_F","Land_SlideCastle_F","Land_House_Small_01_V1_ruins_F","Land_Stone_Shed_V1_ruins_F","Land_u_House_Small_01_V1_F","Land_i_Stone_Shed_V2_F","Land_i_Addon_03mid_V1_F","Land_i_Addon_03_V1_F","Land_Metal_Shed_F","Land_i_House_Small_02_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_d_Stone_HouseSmall_V1_F","Land_i_House_Small_02_V3_F","Land_Slum_House01_F","Land_Slum_House03_F","Land_d_House_Small_01_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_u_Addon_01_V1_F","Land_i_Shop_01_V3_F","Land_i_House_Big_02_V1_F","Land_PowerPoleWooden_L_F","Land_i_Addon_04_V1_F","Land_i_House_Big_01_V2_F","Land_d_House_Big_01_V1_F","Land_d_House_Big_02_V1_F","Land_i_Stone_Shed_V1_F","Land_Shed_Small_F","Land_LampStreet_small_F","Land_Stone_Gate_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Garage_V2_F","Land_d_Addon_02_V1_F","Land_i_House_Small_01_V3_F","Land_u_House_Small_02_V1_F","Land_LampShabby_F","Land_i_Stone_Shed_V3_F","Land_i_Garage_V1_F","Land_u_House_Big_01_V1_F","Land_Unfinished_Building_02_F","Land_Cargo_House_V1_F","Land_Cargo_Patrol_V1_F","Land_Unfinished_Building_01_F","Land_Airport_Tower_F","Land_HighVoltageColumnWire_F","Land_HighVoltageColumn_F","Land_New_WiredFence_5m_F","Land_dp_smallFactory_F","Land_New_WiredFence_10m_Dam_F","Land_TBox_F","Land_i_House_Small_01_V2_F","Land_spp_Transformer_F","Land_New_WiredFence_10m_F","Land_u_Addon_02_V1_F","Land_runway_edgelight_blue_F","Land_LampAirport_F","Land_Airport_right_F","Land_Airport_center_F","Land_Flush_Light_green_F","Land_LampAirport_off_F","Land_LampHalogen_F","Land_Airport_left_F"]

#define FRAGILE_OBJECTS		[BIS_bodyGuard1,BIS_bodyGuard2,BIS_athiraTable,BIS_AthiraTableNotebook,BIS_AthiraTableFiles,BIS_AthiraTablePhone]
#define FRAGILE_CLASSES		["C_Boat_Civil_01_F","B_Truck_01_fuel_F","B_Truck_01_covered_F","B_Truck_01_transport_F","Land_BarGate_F","Land_Billboard_F"]
#define FRAGILE_ANIMS		["SIT_HIGH1","REPAIR_VEH_PRONE"]

/*--------------------------------------------------------------------------------------------------

	GLOBALS

--------------------------------------------------------------------------------------------------*/
BIS_vehicles = [BIS_aCarCheckpoint1,BIS_aCarCheckpoint3,BIS_aCarCheckpoint4,BIS_aCarAthira1,BIS_aCarAthira2,BIS_aCarAthira3];
BIS_protectedClasses = [];	//classes that cannot be deleted

BIS_diagFPS = false;

/*--------------------------------------------------------------------------------------------------

 	FUNCTIONS

--------------------------------------------------------------------------------------------------*/

//detach ambient units in the array
BIS_detachUnits =
{
	private["_animSet","_logic","_dir","_pos","_allowedAnims"];

	_allowedAnims =
	[
		"STAND_U1","STAND_U2","STAND_U3",
		"STAND","STAND1","STAND2",
		"WATCH","WATCH1","WATCH2",
		"GUARD"
	];

	{
		_animSet = _x getVariable ["BIS_fnc_ambientAnim__animset",""];

		if (true) then
		{
			if (_animSet == "") exitWith {};

			if !(_animSet in _allowedAnims) exitWith {};

			waitUntil
			{
				_logic = _x getVariable ["BIS_fnc_ambientAnim__logic",objNull];

				!(isNull _logic) && (_x getVariable ["BIS_fnc_ambientAnim__attached",false])
			};

			//if (isNull _logic) exitWith {};

			_dir = getDir _logic;
			_pos = getPosASL _logic;

			detach _x;
			_x setVariable ["BIS_fnc_ambientAnim__attached",nil];
			_x setVariable ["BIS_fnc_ambientAnim__logic",nil];
			deleteVehicle _logic;

			_x setPosASL _pos;
			_x setDir _dir;
		};
	}
	forEach _this;
};

/*--------------------------------------------------------------------------------------------------

 	GATHER DATA

--------------------------------------------------------------------------------------------------*/
private["_masterData","_masterUnits","_masterObjects","_masterFragile","_center","_radius","_trigger","_fragile","_index","_units","_objects","_allUnits","_allObjects","_allFragile","_dataUnits","_dataObjects","_anim","_object","_unit","_marker"];

_masterData = [];
_masterUnits = [];
_masterObjects = [];
_masterFragile = [];

private["_on","_off","_activate","_deactivate"];

_on 		= [];		//all activated areas
_off 	 	= [];		//all de-activated areas
_activate  	= [];		//areas to activate
_deactivate 	= [];		//areas to de-activate

_allUnits	= [];
_allObjects	= [];
_allFragile	= [];

{
	_marker	  = _x select 0;
	_marker setMarkerAlpha 0;

	_center   = getMarkerPos _marker;
	_radius   = (getMarkerSize _marker) select 0;
	_trigger  = _radius + (_x select 1);
	_index	  = _forEachIndex;

	_units    = _center nearObjects ["CAManBase",_radius];

	_fragile  = [];

	{
		_fragile = _fragile + (_center nearObjects [_x,_radius]);
	}
	forEach FRAGILE_CLASSES;

	_objects  = _center nearObjects ["All",_radius]; _objects = _objects - _units - _fragile;

	//process units
	{
		if (true) then
		{
			if ((_x in IGNORE_OBJECTS) || (typeOf _x in IGNORE_CLASSES)) exitWith
			{
				_units set [_forEachIndex, objNull];
			};

			_anim = _x getVariable ["BIS_fnc_ambientAnim__animset",""];

			if (_anim == "") exitWith
			{
				_units set [_forEachIndex, objNull];
			};

			if ((_anim in FRAGILE_ANIMS) || (_x in FRAGILE_OBJECTS) || (typeOf _x in FRAGILE_CLASSES)) exitWith
			{
				_units set [_forEachIndex, objNull];
				_fragile set [count _fragile, _x];
			};
		};
	}
	forEach _units; _units = _units - [objNull] - _allUnits; _allUnits = _allUnits + _units;

	//put all units into separate groups
	private["_side","_group"];

	{
		_group = group _x;
		_side  = side _x;

		if (count units _group > 1 && _side == west) then
		{
			_group = createGroup _side;
			[_x] join _group;
		};
	}
	forEach _units;

	_dataUnits = [];

	{
		_anim = _x getVariable ["BIS_fnc_ambientAnim__animset",""];

		_dataUnits set [_forEachIndex, [typeOf _x,getPosASL _x,getDir _x,_anim]]
	}
	forEach _units;

	//process objects
	{
		_object = _x;

		if (true) then
		{
			if ((_x in IGNORE_OBJECTS) || (typeOf _x in IGNORE_CLASSES) || (_x isKindOf "Helper_Base_F")) exitWith
			{
				_objects set [_forEachIndex, objNull];
			};

			if ((_x in FRAGILE_OBJECTS) || (typeOf _x in FRAGILE_CLASSES)) exitWith
			{
				_objects set [_forEachIndex, objNull];
				_fragile set [count _fragile, _x];
			};

			if (({_object isKindOf _x} count ["Tank","Car","Air"] > 0) && ((locked _object < 2) || (count crew _x > 0))) exitWith
			{
				_objects set [_forEachIndex, objNull];

				if !(_x in BIS_vehicles) then
				{
					BIS_vehicles set [count BIS_vehicles, _x];
				};
			};
		};
	}
	forEach _objects;_objects = _objects - [objNull] - _allObjects; _allObjects = _allObjects + _objects;

	_dataObjects = [];

	{
		_dataObjects set [_forEachIndex, [typeOf _x,getPosASL _x,getDir _x,damage _x,locked _x,fuel _x]]
	}
	forEach _objects;


	_fragile = _fragile - _allFragile; _allFragile = _allFragile + _fragile;


	//collect data
	_masterData set [_index,[_center,_trigger,_dataUnits,_dataObjects]];
	_masterUnits set [_index,_units];
	_masterObjects set [_index,_objects];
	_masterFragile set [_index,_fragile];


	//mark area as active; starting with all areas active
	_on set [count _on,_forEachIndex];
}
forEach
[
	["BIS_MrkAirfield",500],
	["BIS_MrkCheckpoint",300],
	["BIS_MrkAccident",300],
	["BIS_MrkAthira",350]
];


BIS_masterData     = _masterData;
BIS_masterUnits    = _masterUnits;
BIS_masterObjects  = _masterObjects;
BIS_masterFragile  = _masterFragile;

/*--------------------------------------------------------------------------------------------------

 	(DE-)ACTIVATE MOVABLE CARS ACCORDING TO DISTANCE

--------------------------------------------------------------------------------------------------*/
BIS_vehicles spawn
{
	private["_vehicle","_vehicles"];

	_vehicles = _this;

	while {count _vehicles > 0} do
	{
		{
			sleep 0.5;

			_vehicle = _x;

			if (true) then
			{
				if (isNull _vehicle) exitWith {};

				//disable
				if (((player distance _vehicle) > 650) && (simulationEnabled _vehicle)) exitWith
				{
					//["Vehicle [%1] disabled!",_vehicle] call BIS_fnc_logFormat;

					{(driver _vehicle) disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

					_vehicle enableSimulation false;
					_vehicle hideObject true;
				};

				//enable
				if (((player distance _vehicle) < 600) && !(simulationEnabled _vehicle)) exitWith
				{
					//["Vehicle [%1] enabled!",_vehicle] call BIS_fnc_logFormat;

					{(driver _vehicle) enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

					_vehicle enableSimulation true;
					_vehicle hideObject false;
				};
			};
		}
		forEach _vehicles;

		_vehicles = _vehicles - [objNull];
	};
};


/*--------------------------------------------------------------------------------------------------

 	(DE-)ACTIVATE COMPOSITIONS

--------------------------------------------------------------------------------------------------*/
BIS_deactivateArea =
{
	private["_objects","_units","_logic","_t","_startTime"];

	_startTime = time;

	/*
	["[i][%1] ----------------------------------------------------------------------------------",_this] call BIS_fnc_logFormat;
	["[i][%1] De-activation of area started.",_this] call BIS_fnc_logFormat;
	["[i][%1] %3 fragile: %2",_this,BIS_masterFragile select _this,count (BIS_masterFragile select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 units: %2",_this,BIS_masterUnits select _this,count (BIS_masterUnits select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 objects: %2",_this,BIS_masterObjects select _this,count (BIS_masterObjects select _this)] call BIS_fnc_logFormat;
	*/

	//process fragile objects ------------------------------------------------------------------
	_objects = BIS_masterFragile select _this;

	{
		if !(isNull _x) then
		{
			_x enableSimulation false;
			_x hideObject true;
		}
		else
		{
			["[x] A fragile object is NULL!"] call BIS_fnc_logFormat;
		};
	}
	forEach _objects; _objects = _objects - [objNull];

	//process units ----------------------------------------------------------------------------
	_units = BIS_masterUnits select _this;

	{
		_logic = _x getVariable ["BIS_fnc_ambientAnim__logic",objNull];

		deleteVehicle _x;

		if !(isNull _logic) then
		{
			deleteVehicle _logic;
		};

		_t = time + 1;

		waitUntil
		{
			(time > _t) || (isNull _x)
		};

		if !(isNull _x) then
		{
			["[x] Could NOT delete unit of class: %1",typeOf _x] call BIS_fnc_logFormat;

			BIS_protectedClasses = BIS_protectedClasses - [typeOf _x] + [typeOf _x];
		};
	}
	forEach _units;

	_units = _units - [objNull];

	if (count _units > 0) then
	{
		["[x] Cannot delete %2 units: %1",_units,count _units] call BIS_fnc_logFormat;
	};

	BIS_masterUnits set [_this,_units];

	//proces objects ---------------------------------------------------------------------------
	_objects = BIS_masterObjects select _this;

	{
		deleteVehicle _x;

		_t = time + 1;

		waitUntil
		{
			(time > _t) || (isNull _x)
		};


		if !(isNull _x) then
		{
			["[x] Could NOT delete object of class: %1",typeOf _x] call BIS_fnc_logFormat;

			BIS_protectedClasses = BIS_protectedClasses - [typeOf _x] + [typeOf _x];
		};
	}
	forEach _objects;

	_objects = _objects - [objNull];

	if (count _objects > 0) then
	{
		["[x] Cannot delete %2 objects: %1",_objects,count _objects] call BIS_fnc_logFormat;
	};

	//delete all empty groups
	{
		deleteGroup _x;
	}
	forEach allGroups;

	BIS_masterObjects set [_this,_objects];

	/*
	["[i][%1] De-activation of area ended (took %2ms).",_this,time - _startTime] call BIS_fnc_logFormat;
	["[i][%1] %3 fragile: %2",_this,BIS_masterFragile select _this,count (BIS_masterFragile select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 units: %2",_this,BIS_masterUnits select _this,count (BIS_masterUnits select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 objects: %2",_this,BIS_masterObjects select _this,count (BIS_masterObjects select _this)] call BIS_fnc_logFormat;
	["[i][%1] ----------------------------------------------------------------------------------",_this] call BIS_fnc_logFormat;
	*/
};

BIS_activateArea =
{
	private["_class","_asl","_dir","_damage","_locked","_fuel","_startTime"];

	_startTime = time;

	/*
	["[i][%1] ----------------------------------------------------------------------------------",_this] call BIS_fnc_logFormat;
	["[i][%1] Activation of area started.",_this] call BIS_fnc_logFormat;
	["[i][%1] %3 fragile: %2",_this,BIS_masterFragile select _this,count (BIS_masterFragile select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 units: %2",_this,BIS_masterUnits select _this,count (BIS_masterUnits select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 objects: %2",_this,BIS_masterObjects select _this,count (BIS_masterObjects select _this)] call BIS_fnc_logFormat;
	*/

	//process fragile objects ------------------------------------------------------------------
	private["_objects"];

	_objects = BIS_masterFragile select _this;

	{
		if !(isNull _x) then
		{
			_x enableSimulation true;
			_x hideObject false;
		}
		else
		{
			["[x] A fragile object is NULL!"] call BIS_fnc_logFormat;
		};
	}
	forEach _objects; _objects = _objects - [objNull];


	//process objects --------------------------------------------------------------------------
	private["_objectsData","_objects","_object"];

	_objects = [];
	_objectsData = (BIS_masterData select _this) select 3;

	{
		_class   = _x select 0;
		_asl     = _x select 1;
		_dir     = _x select 2;
		_damage  = _x select 3;
		_locked	 = _x select 4;
		_fuel	 = _x select 5;

		_object = createVehicle [_class, [30,30,30], [], 0, "NONE"];

		_object setPosASL _asl;
		_object setDir _dir;
		_object setDamage _damage;
		_object lock _locked;
		_object setFuel _fuel;

		_objects set [count _objects,_object];

		sleep 0.01;

		//diag fps
		/*
		if (BIS_diagFPS) then
		{
			sleep 0.5;
			["[x][%1] %2",(round(diag_fps * 100))/100,typeOf _object] call BIS_fnc_logFormat;
		};
		*/
	}
	forEach _objectsData;

	BIS_masterObjects set [_this,_objects];

	//process units ----------------------------------------------------------------------------
	private["_unitsData","_units","_group","_unit"];

	_units = [];
	_unitsData = (BIS_masterData select _this) select 2;

	{
		_class = _x select 0;
		_asl   = _x select 1;
		_dir   = _x select 2;
		_anim  = _x select 3;

		_group = createGroup west;
		_unit  = _group createUnit [_class,[30,30,30],[],0,"NONE"];

		_unit setPosASL _asl;
		_unit setDir _dir;

		[_unit,_anim] call BIS_fnc_ambientAnim;

		_units set [count _units,_unit];

		sleep 0.01;

		[_unit] call BIS_detachUnits;
		_unit addEventHandler ["Killed", {[_this select 0,_this select 1] spawn BIS_friendlyFire}];

		//diag fps
		/*
		if (BIS_diagFPS) then
		{
			sleep 0.5;
			["[!][%1] %2",(round(diag_fps * 100))/100,typeOf _unit] call BIS_fnc_logFormat;
		};
		*/
	}
	forEach _unitsData;

	BIS_masterUnits set [_this,_units];

	/*
	["[i][%1] Activation of area ended (took %2ms).",_this,time - _startTime] call BIS_fnc_logFormat;
	["[i][%1] %3 fragile: %2",_this,BIS_masterFragile select _this,count (BIS_masterFragile select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 units: %2",_this,BIS_masterUnits select _this,count (BIS_masterUnits select _this)] call BIS_fnc_logFormat;
	["[i][%1] %3 objects: %2",_this,BIS_masterObjects select _this,count (BIS_masterObjects select _this)] call BIS_fnc_logFormat;
	["[i][%1] ----------------------------------------------------------------------------------",_this] call BIS_fnc_logFormat;
	*/
};

(BIS_masterUnits select 0) call BIS_detachUnits;

while {true} do
{
	_activate  	= [];		//areas to activate
	_deactivate 	= [];		//areas to de-activate

	{
		_center  = _x select 0;
		_radius  = _x select 1;		//radius of the trigger, not the composition

		if (player distance _center < _radius) then
		{
			_activate   = _activate + [_forEachIndex];
		}
		else
		{
			_deactivate = _deactivate + [_forEachIndex];
		};
	}
	forEach _masterData;

	_activate   =+ _activate - _on;
	_deactivate =+ _deactivate - _off;

	if (count _deactivate > 0) then
	{
		{
			_x call BIS_deactivateArea;
		}
		forEach _deactivate;
	};

	if (count _activate > 0) then
	{
		{
			_x call BIS_activateArea;
		}
		forEach _activate;
	};

	_on =+ _on + _activate - _deactivate;
	_off =+ _off + _deactivate - _activate;

	sleep 1;
};