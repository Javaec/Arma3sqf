/*
	Author: Karel Moricky

	Description:
	Plays cockpit animation.

	Parameter(s):
	_this select 0: OBJECT - Unit
	_this select 1: STRING - Animation description

	Returns:
	STRING - animation name
*/

private ["_unit","_anim","_animName","_type"];
_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_anim = [_this,1,"",[""]] call bis_fnc_param;
_animName = "";

//--- Helicopter type
_type = _unit call bis_fnc_helicopterType;
if (_type >= 0) then {

	//--- Helicopter seat
	private ["_seat"];
	_seat = _unit call bis_fnc_helicopterSeat;
	if (_seat >= 0) then {

		//--- Role
		private ["_role","_seatName","_animsDirectional","_dirName","_typeName","_moves","_cfgAnim"];
		_role = assignedvehiclerole _unit;
		_seatName = "";

		if ((_role select 0) in ["Driver","Turret"]) then {
			_roleId = [_role,1,[0]] call bis_fnc_paramIn;
			if ((_roleId select 0) == 0) then {
				_seatName = (
					[
						["Pilot","CoPilot"],
						["Pilot","CoPilot"],
						["_L","_R"]
					] select _type
				) select _seat;
			};
		};

		//--- Anim params
		_animsDirectional = [
			"greet",
			"look",
			"point",
			"thumbDown",
			"thumbUp"
		];
		_dirName = if ({_anim == _x} count _animsDirectional > 0) then {
			private ["_target","_targetPos","_dirTo"];
			_target = [_this,2,position _unit] call bis_fnc_param;
			_targetPos = _target call bis_fnc_position;

			_dirto = ([_unit,_targetPos] call bis_fnc_relativedirto) - (direction vehicle _unit);
			_dirto = floor (((_dirto + 45 + 360) % 360) / 90);

			[
				"Front",
				"Right",
				"",
				"Left"
			] select _dirto
		} else {
			""
		};

		//--- Compose anim name
		_typeName = ["Little","","HeavyPilot"] select _type;
		_animName = format ["chopper%1%2_%3%4_H",_typeName,_seatName,_anim,_dirName];

		//--- Check if anim exists
		_moves = gettext(configfile >> "cfgvehicles" >> typeof _unit >> "moves");
		_cfgAnim = configfile >> _moves >> "states" >> _animName;
		if (isclass _cfgAnim) then {

			//--- Play
			_unit switchmove _animName;
			_unit disableai "target";
			_unit disableai "autotarget";
		} else {
			if (_dirName != "") then {
				["Animation '%1' not found in %2",_animName,_moves] call bis_fnc_error;
			};
		};
	};
};

_animName