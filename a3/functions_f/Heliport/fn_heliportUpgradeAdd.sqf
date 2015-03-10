private ["_path","_category","_item","_cfgCategory","_upgrade","_config","_positionSlot"];
_path = "Upgrades";
_category =	[_this,0,"",[""]] call bis_fnc_param;
_item =		[_this,1,"",[""]] call bis_fnc_param;
_cfgCategory =	[_this,2,configfile,[configfile]] call bis_fnc_param;
_upgrade = [];

_config = [hsim_heliportDB,[worldname,_path,_category,_item,"config"]] call BIS_fnc_dbValueReturn;
_positionSlot = [hsim_heliportDB,[worldname,_path,_category,_item,"position"]] call BIS_fnc_dbValueReturn;
if (!isnil "_config" && !isnil "_positionSlot") then {
	private ["_position","_direction","_heliportLogic","_logic","_composition","_upgrade","_listHelislots"];

	//--- Remove
	_hide = [_config,"hide"] call bis_fnc_heliportCondition;
	if (call compile _hide) exitwith {
		[hsim_heliportDB,[worldname,_path,_category,_item]] call BIS_fnc_dbClassRemove;
		[]
	};

	_position = [hsim_heliportDB,[worldname,"UpgradePositions",_positionSlot,"position"]] call BIS_fnc_dbValueReturn;
	_direction = [hsim_heliportDB,[worldname,"UpgradePositions",_positionSlot,"direction"]] call BIS_fnc_dbValueReturn;

	if (!isnil "_position" && !isnil "_direction") then {

		_heliportLogic = missionnamespace getvariable worldname;
		_listHelislots = [];

		_logic = missionnamespace getvariable _positionSlot;
		if (isnil "_logic") then {
			_logic = group (bis_functions_mainscope) createunit ["HeliportLogicUpgrade",_position,[],0,"none"];
			_logic setpos _position;
			_logic setdir _direction;
		};
		missionnamespace setvariable ["hsim_" + configname _config,_logic];
		_logic setvariable ["category",[_category] call bis_fnc_dbClassId];
		_logic setvariable ["item",[_item] call bis_fnc_dbClassId];

		_upgrade = _logic getvariable "hsim_upgrade";
		if (!isnil "_upgrade") then {
			{
				deletevehicle _x;
			} foreach _upgrade;
		};

		//--- Delete helicopters (serves as referring points for parked helicopters)
		_composition = gettext (_config >> "composition");
		_upgrade = [_position,_direction,_composition] call BIS_fnc_ObjectsMapper;
		{
			if (_x iskindof "helicopter") then {
				private ["_position","_direction","_listHelislotsAdd"];
				_position = getposasl _x;
				_direction = direction _x;
				_listHelislotsAdd = [_logic,_position,_direction];
				if !(call compile ([_cfgCategory,"show"] call bis_fnc_heliportCondition)) then {
					_listHelislotsAdd = _listHelislotsAdd + [objnull];
				};
				_listHelislots = _listHelislots + [_listHelislotsAdd];
				deletevehicle _x;
				_upgrade set [_foreachindex,-1];
			};

			//--- Lock everything in non-helicopter missions
			if (missionname != worldname) then {
				_x lock true;
			};
		} foreach _upgrade;
		_upgrade = _upgrade - [-1];
		_logic setvariable ["hsim_upgrade",_upgrade];

		//--- Add to category list
		[_heliportLogic,[_category] call bis_fnc_dbClassId,[_upgrade]] call bis_fnc_variablespaceadd;

		//--- Add to helislots list
		if (count _listHelislots > 0) then {
			[_heliportLogic,"Helislots",_listHelislots] call bis_fnc_variablespaceadd;
		};
	};
};

_upgrade