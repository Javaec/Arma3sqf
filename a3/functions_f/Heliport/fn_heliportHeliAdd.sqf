private ["_path","_item","_logicHeliport","_config"];
_path = "Helicopters";
_item = [_this,0,"",[""]] call bis_fnc_param;

_logicHeliport = missionnamespace getvariable worldname;

_config = [hsim_heliportDB,[worldname,_path,_item,"config"]] call BIS_fnc_dbValueReturn;
if (!isnil "_config") then {

	//--- Continue only when helicopter doesn't exist yet
	if (isnil {missionnamespace getvariable (configname _config)}) then {
		private ["_show","_enable"];

		//--- Remove
		_hide = [_config,"hide"] call bis_fnc_heliportCondition;
		if (call compile _hide) exitwith {
			[hsim_heliportDB,[worldname,_path,_item]] call BIS_fnc_dbClassRemove;
			objnull
		};

		_show = [_config,"show"] call bis_fnc_heliportCondition;
		_enable = [_config,"enable"] call bis_fnc_heliportCondition;

		if (call compile _show && call compile _enable) then {
			private ["_vehicle","_logic","_position","_direction","_heli"];

			_vehicle = gettext (_config >> "vehicle");
			if (!isclass (configfile >> "cfgvehicles" >> _vehicle)) exitwith {
				["Vehicle type '%1' does not exist.",_vehicle] call bis_fnc_error;
				objnull
			};

			//--- Is helicopter mission specific?
			_isMissionSpecific = getnumber (_config >> "missionSpecific") == 1;
			//typename ([_config,"show",true,true] call bis_fnc_heliportCondition) == typename configfile;

			//--- Create helicopter on free helispot
			_listHelislots = -1 call bis_fnc_heliportHelislots;
			{
				if (
					(!_isMissionSpecific && count _x == 3)
					||
					(_isMissionSpecific && objnull in _x)
				) exitwith {
					_logic = _x select 0;
					_position = _x select 1;
					_direction = _x select 2;

					_heli = createvehicle [_vehicle,[99,99,0],[],0,"none"];
					_heli setdir _direction;
					_heli setposasl _position;
					_heli setvelocity [0,0,-1];
					_heli setfuel 0;
					player reveal _heli;
					missionnamespace setvariable [configname _config,_heli];
					[_heli,_item] call bis_fnc_heliportHeliInit;

					//--- Lock helicopter in non-helicopter missions
					if (missionname != worldname) then {
						_heli lock true;
					};

					_x set [3,_heli];
				};
			} foreach _listHelislots;
			_logicHeliport setvariable ["Helislots",_listHelislots];

			//--- Apply damage
			[true,configname _config] call bis_fnc_heliportHeliDamage;

			//--- Execute maintenance (only on heliport)
			if (missionname == worldname) then {
				[0,_heli,true] call bis_fnc_heliportMaintenance;
			};		

			_heli
		} else {

			//--- Remove helicopter
			_config = [hsim_heliportDB,[worldname,_path,_item]] call BIS_fnc_dbClassRemove;
			["Helicopter '%1' removed.",_item] call bis_fnc_logFormat;
		};
	};
} else {
	["Config for '%1' not found.",_item] call bis_fnc_error;
	objnull
};