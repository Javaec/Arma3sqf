private ["_path","_heliport","_code"];

_path =		[_this,0,"",[""]] call bis_fnc_param;
_heliport =	[_this,1,worldname,[""]] call bis_fnc_param;
_code =		[_this,2,{},[{}]] call bis_fnc_param;

switch _path do {

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//--- Missions
	case "Missions": {
		if (isnil "BIS_heliportMissions") then {BIS_heliportMissions = [];};
		if (isnil "BIS_heliportMissionsAvailable") then {BIS_heliportMissionsAvailable = [];};
		if (isnil "BIS_heliportMissionStates") then {BIS_heliportMissionStates = [];};
		_missionsCompleted = [];
		_index = 0;
		{
			private ["_config"];
			_config = _x;
			for "_i" from 0 to (count _config - 1) do {
				private ["_item"];
				_item = _config select _i;
				if (isclass _item) then {
					private ["_forced","_show","_enable","_heliport","_templateProcedural"];
					_forced = getnumber (_item >> "forced");
					_show = compile ([_item,"show"] call bis_fnc_heliportCondition);
					_enable = compile ([_item,"enable"] call bis_fnc_heliportCondition);
					_heliport = gettext (_item >> "terrain");
					_templateProcedural = getnumber (_item >> "templateProcedural");
					_repeat = getnumber (_item >> "repeat");
					_isheliport = getnumber (_item >> "heliport");
					_required = [_item] call BIS_fnc_heliportMissionRequired;

					if (_templateProcedural == 0) then {
						if (_forced == 1 && call _show && call _enable) then {
							[_path,[_heliport,_path,configname _item],[configname _item]] call bis_fnc_heliportDBAdd;
						};
					} else {
						//--- Register procedural mission template
						[hsim_heliportDB,[_heliport,"templateProcedural"],configname _item] call bis_fnc_dbValueSet;
					};

					//--- Procedural missions has no terrain set - replace by current one
					if (_heliport == "") then {_heliport = worldname;};

					//--- Sort into lists
					_itemName = configname _item;
					_completed = [hsim_heliportDB,[_heliport,"Missions",_itemName]] call BIS_fnc_dbClassCheck;

					_status = if (
						_completed //--- Mission was already completed
						//&&
						//_repeat == 0 //--- Repeatable missions can never be completed
						&&
						_isheliport == 0 //--- Not a heliport
					) then {
						_turn = [hsim_heliportDB,[_heliport,"Missions",_itemName,"turn"],0] call BIS_fnc_dbValueReturn;

						//--- Add to list of completed (group missions with same turn into same array)
						_missionsCompleted resize ((_turn + 1) max (count _missionsCompleted));
						_missionArray = _missionsCompleted select _turn;
						if (isnil "_missionArray") then {_missionArray = [];};
						_missionArray set [count _missionArray,_itemName];
						_missionsCompleted set [_turn,_missionArray];

						1
					} else {
						if (
							(_required select 0) //--- Required missions completed
							&&
							call _show //--- Is shown in menu
							&&
							_templateProcedural == 0 //--- Not a procedural template
							&&
							_isheliport == 0 //--- Not a heliport
						) then {
							BIS_heliportMissionsAvailable set [count BIS_heliportMissionsAvailable,_itemName];
							0
						} else {
							-1
						};
					};
					BIS_heliportMissions set [count BIS_heliportMissions,_itemName];
					BIS_heliportMissionStates set [count BIS_heliportMissionStates,_status];

					//--- Save global status
					if (_isHeliport == 0 && _templateProcedural == 0) then {
						missionnamespace setvariable [_itemName,_status];
					};
				};
			};
		} foreach [

			//--- Campaign missions
			campaignconfigfile >> "campaign" >> "missions",

			//--- Procedural missions
			configfile >> "cfgbase" >> _heliport >> "missions"
		];

		//--- Remove arrays and nil items
		if (isnil "BIS_heliportMissionsCompleted") then {
			BIS_heliportMissionsCompleted = [];
			{
				if !(isnil "_x") then {
					BIS_heliportMissionsCompleted = BIS_heliportMissionsCompleted + _x;
				};
			} foreach _missionsCompleted;
		};
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//--- Helicopters
	case "Helicopters": {
		private ["_config"];
		_config = configfile >> "cfgbase" >> _heliport >> _path;
		for "_i" from 0 to (count _config - 1) do {
			private ["_item"];
			_item = _config select _i;

			if (isclass _item) then {
				private ["_itemName","_forced","_show","_hide","_enable"];
				_itemName = configname _item;

				_forced = getnumber (_item >> "forced");
				_show = [_item,"show"] call bis_fnc_heliportCondition;
				_hide = [_item,"hide"] call bis_fnc_heliportCondition;
				_enable = [_item,"enable"] call bis_fnc_heliportCondition;

				if (_forced == 1 && call compile _show && !call compile _hide && call compile _enable) then {
					private ["_dbAdd"];
					_dbAdd = [
						_path,
						[_heliport,_path,_itemName],
						[_item]
					] call BIS_fnc_heliportDBAdd;
					call _fnc_addText;
				};
			};
		};
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//--- Helicopters Upgrades
	case "Helicopters_U": {
		private ["_cfgHelicopters"];
		_path = "Helicopters";
		_cfgHelicopters = [_this,3,[hsim_heliportDB,[_heliport,_path]] call BIS_fnc_dbClassList,[[]]] call bis_fnc_param;
		{
			private ["_helicopter","_config","_configHeli"];
			_helicopter = _x;
			_configHeli = [hsim_heliportDB,[_heliport,_path,_helicopter,"config"]] call BIS_fnc_dbValueReturn;
			_config = _configHeli;

			for "_c" from 0 to (count _configHeli - 1) do {
				private ["_category"];
				_category = _configHeli select _c;

				if (isclass _category) then {
					private ["_categoryName"];
					_categoryName = configname _category;
					for "_i" from 0 to (count _category - 1) do {
						private ["_item"];
						_item = _category select _i;

						if (isclass _item) then {
							private ["_itemName","_forced","_show","_enable"];
							_itemName = configname _item;

							_forced = getnumber (_item >> "forced");
							_show = [_item,"show"] call bis_fnc_heliportCondition;
							_hide = [_item,"hide"] call bis_fnc_heliportCondition;
							_enable = [_item,"enable"] call bis_fnc_heliportCondition;

							if (_forced == 1 && call compile _show && !call compile _hide && call compile _enable) then {
								private ["_dbAdd"];
								_dbAdd = [
									_path + "_U",
									[_heliport,_path,_helicopter,_categoryName,_itemName],
									[_item]
								] call BIS_fnc_heliportDBAdd;
								call _fnc_addText;
							};	
						};
					};
				};
			};
		} foreach _cfgHelicopters;
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//--- Staff
	case "Staff": {
		private ["_config"];
		_config = configfile >> "cfgbase" >> _heliport >> _path;
		for "_c" from 0 to (count _config - 1) do {
			private ["_category"];
			_category = _config select _c;

			if (isclass _category) then {
				private ["_categoryName"];
				_categoryName = configname _category;
				for "_i" from 0 to (count _category - 1) do {
					private ["_item"];
					_item = _category select _i;

					if (isclass _item) then {
						private ["_itemName","_forced","_show","_enable","_priceDuration"];
						_itemName = configname _item;

						_forced = getnumber (_item >> "forced");
						_show = [_item,"show"] call bis_fnc_heliportCondition;
						_hide = [_item,"hide"] call bis_fnc_heliportCondition;
						_enable = [_item,"enable"] call bis_fnc_heliportCondition;
						_priceDuration = getnumber (_item >> "priceDuration");

						if (_priceDuration >= 0) then {_priceDuration = _priceDuration + call BIS_fnc_heliportTurn};

						if (_forced == 1 && call compile _show && !call compile _hide && call compile _enable) then {
							private ["_dbAdd"];
							_dbAdd = [
								_path,
								[_heliport,_path,_categoryName,_itemName],
								[_item,_priceDuration]
							] call BIS_fnc_heliportDBAdd;
							call _fnc_addText;
						};
					};
				};
			};
		};
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//--- Heliport Upgrades
	case "Upgrades": {
		private ["_config"];

		_config = configfile >> "cfgbase" >> _heliport >> _path;
		for "_c" from 0 to (count _config - 1) do {
			private ["_category"];
			_category = _config select _c;

			if (isclass _category) then {
				private ["_categoryName"];
				_categoryName = configname _category;
				for "_i" from 0 to (count _category - 1) do {
					private ["_item"];
					_item = _category select _i;

					if (isclass _item) then {
						private ["_itemName","_forced","_show","_enable","_positions","_listUpgradePositions","_position"];
						_itemName = configname _item;

						_forced = getnumber (_item >> "forced");
						_show = [_item,"show"] call bis_fnc_heliportCondition;
						_hide = [_item,"hide"] call bis_fnc_heliportCondition;
						_enable = [_item,"enable"] call bis_fnc_heliportCondition;

						_positions = getarray (_item >> "positions");

						//--- Find free slot
						_listUpgradePositions = _heliport call BIS_fnc_heliportUpgradePositions;
						_position = "";
						{
							if !(_x in _listUpgradePositions) exitwith {_position = _x};
						} foreach _positions;

						if (_forced == 1 && call compile _show && !call compile _hide && call compile _enable && _position != "") then {
							private ["_dbAdd"];
							_dbAdd = [
								_path,
								[_heliport,_path,_categoryName,_itemName],
								[_item,_position]
							] call BIS_fnc_heliportDBAdd;
							call _fnc_addText;
						};
					};
				};
			};
		};
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//--- EVERYTHING!
	default {
		private ["_listHeliport","_listHints","_fnc_addText","_logicHeliport"];

		_listHeliports = [] call BIS_fnc_heliportGetHeliports;
		_listHint = [];
		_fnc_addText = {
			if (_dbAdd) then {
				_silent = getnumber (_item >> "silent");
				if (_silent == 0) then {
					_listHint set [count _listHint,[_item,_config]];
				};
			};
		};
		{
			["Missions",_x,_fnc_addText] call bis_fnc_heliportAddForced; //--- Initialize completed missions first
			["Missions",_x,_fnc_addText] call bis_fnc_heliportAddForced;

			["Helicopters",_x,_fnc_addText] call bis_fnc_heliportAddForced;
			["Helicopters_U",_x,_fnc_addText] call bis_fnc_heliportAddForced;
			["Staff",_x,_fnc_addText] call bis_fnc_heliportAddForced;
			["Upgrades",_x,_fnc_addText] call bis_fnc_heliportAddForced;

			[_x,true] call bis_fnc_heliportHeliAssign;
		} foreach _listHeliports;

		_logicHeliport = missionnamespace getvariable worldname;
		_logicHeliport setvariable ["heliportHint",_listHint];
	};
};


