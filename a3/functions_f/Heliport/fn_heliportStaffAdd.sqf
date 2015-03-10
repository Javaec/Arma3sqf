private ["_path","_category","_item","_config","_priceDuration"];

_path = "Staff";
_category = 	[_this,0,"",[""]] call bis_fnc_param;
_item = 	[_this,1,"",[""]] call bis_fnc_param;

_config = [hsim_heliportDB,[worldname,_path,_category,_item,"config"]] call BIS_fnc_dbValueReturn;
_priceDuration = [hsim_heliportDB,[worldname,_path,_category,_item,"priceduration"]] call BIS_fnc_dbValueReturn;

if (!isnil "_config" && !isnil "_priceDuration") then {

	//--- Remove
	_hide = [_config,"hide"] call bis_fnc_heliportCondition;
	if (call compile _hide) exitwith {
		[hsim_heliportDB,[worldname,_path,_category,_item]] call BIS_fnc_dbClassRemove;
		objnull
	};

	//--- Create new one
	private ["_vehicle","_init","_isPlayer","_turn","_unit","_initArray","_initParts","_initPartsTamp","_dot","_extension"];
	_vehicle = gettext (_config >> "vehicle");
	_init = gettext (_config >> "init");
	_isPlayer = getnumber (_config >> "player");
	_turn = call BIS_fnc_heliportTurn;

	if (
		//--- Staff contract exceeded
		_turn >= _priceDuration
		&&
		//--- Negative value means staff is slave owned forever
		_priceDuration >= 0
		&&
		//--- Staff management only on heliport
		missionname == worldname
	) then {

		//--- Expired TODO
		[hsim_heliportDB,[worldname,_path,_category,_item]] call BIS_fnc_dbClassRemove;
		debuglog ["Log::::::::::::::::EXPIRED",_item,_priceDuration,_turn];
		objnull
	} else {
		private ["_unit","_unitName"];

		_unitName = "hsim_" + configname _config;
		_unit = if (!isnil {missionnamespace getvariable _unitname}) then {

			//--- Already exists - return unit
			missionnamespace getvariable _unitname
		} else {

			//--- Create
			if (_isPlayer == 1 && !isnull player) then {
				player
			} else {
				private ["_grpSide","_grp"];
				_grpSide = if (isnull player) then {createcenter civilian; civilian} else {side player};
				_grp = creategroup _grpSide;
				_grp createunit [_vehicle,[99,99,0],[],0,"none"];
			};
		};
		if (_isPlayer == 1 && isnull player) then {selectplayer _unit};
		missionnamespace setvariable [_unitName,_unit];
		_unit setvariable ["config",_config];

		if (_init != "") then {
			private ["_initArray","_initParts","_initPartsTemp","_dot","_extension","_cfgIdentity","_unitFlow"];

			//--- Recognize file
			_initArray = toarray _init;
			_initParts = [];
			_initPartsTemp = [];
			_dot = toarray "." select 0;
			{
				if (_x == _dot || _forEachIndex == (count _initArray - 1)) then {
					_initPartsTemp = _initPartsTemp + [_x] - [_dot];
					_initParts = _initParts + [tostring _initPartsTemp];
					_initPartsTemp = [];
				} else {
					_initPartsTemp = _initPartsTemp + [_x];
				};
			} foreach _initArray;

			//--- Execute staff FSM
			_extension = tolower (_initParts select (count _initParts - 1));
			_unitFlow = switch _extension do {
				case "fsm": { //--- FSM
					_unit execfsm _init;
				};
				case "sqf": { //--- SQF
					_unit call compile preprocessfilelinenumbers _init;
				};
				default { //--- Global variable
					_unit call (missionnamespace getvariable _init);
				};
			};
			_unit setvariable ["bis_unitFlow",_unitFlow];

			/* General identity loading now in bis_fnc_heliportInit
			//--- Assign identity
			_cfgIdentity = configfile >> "cfgIdentities" >> _unitName;
			if (isclass _cfgIdentity) then {
				_unit setidentity _unitName;
			};
			*/
		};

		//--- Disable taking damage on heliport
		if (missionname == worldname && _isPlayer < 1) then {
			_unit allowdamage false;
		};

		_unit
	};
} else {
	if (!isnil {missionnamespace getvariable _unitname}) then {missionnamespace getvariable _unitname} else {objnull};
};