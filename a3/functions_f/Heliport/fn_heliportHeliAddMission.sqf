private ["_forceDefault","_heliPlayer","_cfgHeli","_heliClass","_heliClassDefault","_listHelipads","_helipad","_helipadPosition","_helipadPath","_position","_direction","_heli"];

//--- Default helicopter not defined
if (count _this == 0) exitwith {"Default mission helicopter not defined." call bis_fnc_error; objnull};

//--- Default helicopter forced
if (!isnil "hsim_heliForced") exitwith {hsim_heli = hsim_heliForced; hsim_heli};

//--- Select random helipad
_position = position player;
_direction = direction player;
_helipadRandom = [_this,1,true,[true]] call bis_fnc_param;
_forceDefault = [_this,2,false,[false]] call bis_fnc_param;

if (_helipadRandom) then {
	_listHelipads = [hsim_heliportDB,[worldname,"upgrades","helipads"]] call BIS_fnc_dbClassList;
	if (count _listHelipads == 0) exitwith {"No helipads detected. Make sure at least one of heliport compositions has helicopter model in it." call bis_fnc_halt; objnull};
	_helipad = _listHelipads call bis_fnc_selectrandom;
	_helipadPosition = [hsim_heliportDB,[worldname,"upgrades","helipads",_helipad,"position"]] call BIS_fnc_dbValueReturn;
	if (isnil "_helipadPosition") exitwith {["Helipad '%1' not found.",_helipadPosition] call bis_fnc_halt; objnull};

	//--- Get helipad data
	_helipadPath = [worldname,"upgradepositions",_helipadPosition];
	_position = [hsim_heliportDB,_helipadPath + ["position"]] call BIS_fnc_dbValueReturn;
	_direction = [hsim_heliportDB,_helipadPath + ["direction"]] call BIS_fnc_dbValueReturn;
};
if (isnil "_position") exitwith {["Position for '%1' not found.",_helipadPosition] call bis_fnc_halt; objnull};
if (isnil "_direction") exitwith {["Direction for '%1' not found.",_helipadPosition] call bis_fnc_halt; objnull};

//--- Default helicopter already exist
if (!isnil "hsim_heli") exitwith {
	if (!isengineon hsim_heli && hsim_heli iskindof "helicopter") then {
		hsim_heli setdir _direction;
		hsim_heli setpos _position;
		_player = if (!isnil "hsim_player") then {hsim_player} else {objnull};
		if (vehicle player == player && player != (missionnamespace getvariable ["hsim_playerForced",objnull])) then {
			_player setpos [
				(_position select 0),
				(_position select 1) - 5,
				(_position select 2)
			];
		};
	};
	hsim_heli
};

//--- Read player's helicopter
_heliPlayer = if (_forceDefault) then {
	""
} else {
	[hsim_heliportDB,[worldname,"Staff","Pilots","player","helicopter"]] call BIS_fnc_dbValueReturn;
};

//--- Default settings
_defLocked = 0;
_defFuel = 1;
_defDamage = 0;

_setComponents = if (_heliPlayer == "" || ([] call bis_fnc_heliportTurn) == 0) then {

	//--- No heli assigned - use mission default
	_heliClass = _this select 0;
	false

} else {

	//--- Delete default (if object)
	_heliDefault = _this select 0;
	if (typename _heliDefault == typename objnull) then {

		//--- Copy helicopter settings
		_defLocked = locked _heliDefault;
		_defFuel = fuel _heliDefault;
		_defDamage = damage _heliDefault;

		deletevehicle _heliDefault;
	};

	//--- Read helicopter config
	_cfgHeli = [hsim_heliportDB,[worldname,"helicopters",_heliPlayer,"config"]] call BIS_fnc_dbValueReturn;
	if (isnil "_cfgHeli") exitwith {["Helicopter '%1' not found.",_heliPlayer] call bis_fnc_error; _heliClass = "";};
	_heliClass = gettext (_cfgHeli >> "vehicle");
	true
};

//--- Default helicopter is an object
if (typename _heliClass == typename objnull) exitwith {
	hsim_heli = _heliClass;
	hsim_heli setdir _direction;
	hsim_heli setpos _position;
	hsim_heli setvelocity [0,0,0];
	player moveindriver hsim_heli;
	hsim_heli setpos position hsim_heli;
	hsim_heli
};

if (isnil "_heliClass") exitwith {"Helicopter class not defined." call bis_fnc_halt; objnull};
if (_heliClass == "") exitwith {
	["No default helicopter found.
<br />To fix it, you can:
<br />- Synchronize (F5) empty helicopter to heliport module
<br />- Name any helicopter 'hsim_heli' to force it's use
<br />- Name any helicopter 'hsim_heliForced' to force it's use and disable teleporting to helipad
	",nil,[0,0,1,0.5]] call bis_fnc_halt;
	objnull
};
if (!isclass (configfile >> "cfgvehicles" >> _heliClass)) exitwith {"Helicopter class doesn not exist in CfgVehicles" call bis_fnc_halt; objnull};

//--- Create helicopter
//_heli = createvehicle [_heliClass,_position,[],0,"none"];
_heli = [_heliClass,_heliPlayer,nil,nil,_setComponents] call bis_fnc_heliportHeliInit;
_heli setdir _direction;
_heli setpos _position;

waituntil {!isnull _heli};
player moveindriver _heli;
_heli setpos position _heli;

//--- Apply default settings
_heli lock _defLocked;
_heli setfuel _defFuel;
_heli setdamage _defDamage;

//--- Set helicopter components
if (_heliPlayer != "") then {
	//[_heli,_heliPlayer] call bis_fnc_heliportHeliInit;

	//--- Save variable name
	missionnamespace setvariable [_heliPlayer,_heli];

	//--- Apply damage
	[true,_heliPlayer] call bis_fnc_heliportHeliDamage;
};

//--- Store mission into helicopter's history
[
	hsim_heliportDB,
	[worldname,"helicopters",_heliPlayer,"missionHistory",str ([] call BIS_fnc_heliportTurn)],
	hsim_heliportMission
] call BIS_fnc_dbValueSet;
[
	hsim_heliportDB,
	[worldname,"helicopters",_heliPlayer,"missionHistory","lastTurn"],
	[] call BIS_fnc_heliportTurn
] call BIS_fnc_dbValueSet;


hsim_heli = _heli;
hsim_heli