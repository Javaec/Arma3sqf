/*
	Author: Karel Moricky

	Description:
	Adjust number of respawn tickets. When player dies, the number is automatically decreased by 1;
	When number of tickets reaches 0, player's respawn is disabled.

	Parameter(s):
		0:
			NAMESPACE, SIDE, GROUP or OBJECT - tickets space (e.g., it's possible to define two different ticket numbers for each side)
			BOOL - true to return number of tickets in all spaces (used for returning value only, won't set anything)
			ARRAY - return losing space from the passed list (elements can be of type NAMESPACE, SIDE, GROUP or OBJECT)
		1: NUMBER - by how much will the ticket count be adjusted
		2 (Optional): BOOL - true to autodetect tickets space. First param have to be an object. Used for modifying player's current tickets.

	Returns:
		NUMBER - remaining tickets after adjustment (-1 when no tickets were defined yet)
		ARRAY - when array was used as an argument, returned value is [<losingSpace>,<tickets>]
*/

private ["_varName","_varTotal","_input"];
_varName = "BIS_fnc_respawnTickets_value";
_varTotal = _varName + "total";

if (typename _this != typename []) then {_this = [_this];};
_input = [_this,0,objnull,[objnull,[],missionnamespace,sideunknown,grpnull,objnull,true]] call bis_fnc_param;

//--- On respawn
if (count _this > 3) exitwith {
	private ["_unit"];
	_unit = _input;
	if (!isnull _unit && !isplayer _unit) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error; 0};

	private ["_respawnDelay"];
	_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

	if !(alive _unit) then {
		private ["_deathTime","_respawnDisabled","_tickets"];
		_deathTime = time;
		_respawnDisabled = false;

		//--- Decrease number of tickets (only when simulation is enabled, which is not the case in forced respawn)
		if (simulationenabled _unit) then {
			[_unit,-1,true] call bis_fnc_respawnTickets;
		};

		//--- Death
		while {!alive player && !isnull player} do {
			_tickets = [_unit,0,true] call bis_fnc_respawnTickets;
			if (_tickets == 0) then {
				if !(_respawnDisabled) then {
					_respawnDisabled = true;
					setplayerrespawntime 1e10;
				};
			} else {
				if (_respawnDisabled) then {
					_respawnDisabled = false;
					setplayerrespawntime ((_respawnDelay - (time - _deathTime)) max 1);
				};
			};
			sleep 1;
		};
	} else {
		//--- Respawn
/*
		_oldUnit = [_this,1,0,[objnull,0]] call bis_fnc_param;
		if !(isnull _oldUnit) then {
			[_unit,-1,true] call bis_fnc_respawnTickets;
		};
*/

		setplayerrespawntime _respawnDelay;
	};
};

switch (typename _input) do {
	case (typename missionnamespace);
	case (typename sideunknown);
	case (typename grpnull);
	case (typename objnull);
	case (typename true): {
		//private ["_respawnTemplates"];
		//_respawnTemplates = getarray (missionconfigfile >> "respawnTemplates");
		//if ({_x == "Tickets"} count _respawnTemplates == 0) exitwith {"""Tickets"" respawn template not used in the mission, cannot use respawn tickets." call bis_fnc_error; 0};

		private ["_target","_value","_autodetect","_tickets"];

		_target = _input;
		_value = round ([_this,1,0,[0]] call bis_fnc_param);
		_autodetect = [_this,2,false,[false]] call bis_fnc_param;

		if (typename _target == typename true) exitwith {
			missionnamespace getvariable [_varTotal,-1]
		};

		if (_autodetect) exitwith {
			_target = [_this,0,player,[objnull,true]] call bis_fnc_param;
			_target = switch true do {
				case !(isnil {_target getvariable _varName}): {_target};
				case !(isnil {(group _target) getvariable _varName}): {group _target};
				case !(isnil {missionnamespace getvariable (_varName + str (_target call bis_fnc_objectSide))}): {_target call bis_fnc_objectSide};
				case !(isnil {missionnamespace getvariable (_varName)}): {missionnamespace};
				default {false};
			};
			if (typename _target == typename false) exitwith {
				//"No respawn tickets defined, use BIS_fnc_respawnTickets to add some." call bis_fnc_error;
				-1
			};
			[_target,_value] call bis_fnc_respawnTickets;
		};

		//--- Update the tickets count
		_tickets = -1;
		switch (typename _target) do {
			case (typename missionnamespace);
			case (typename sideunknown): {
				if (typename _target == typename sideunknown) then {_varName = _varName + str _target; _target = missionnamespace;};
				_tickets = _target getvariable [_varName,-1];
				if (_value != 0) then {
					_tickets = _tickets max 0;
					_tickets = (_tickets + _value) max 0;
					_target setvariable [_varName,_tickets];
					publicvariable _varName;
				};
			};
			case (typename grpnull);
			case (typename objnull): {
				_tickets = _target getvariable [_varName,-1];
				if (_value != 0) then {
					_tickets = _tickets max 0;
					_tickets = (_tickets + _value) max 0;
					_target setvariable [_varName,_tickets,true];
				};
			};
		};

		//--- Update total tickets count (used for measuring whether there are any tickets left at all)
		if (_value != 0) then {
			private ["_ticketsTotal"];
			_ticketsTotal = missionnamespace getvariable [_varTotal,0];
			_ticketsTotal = (_ticketsTotal + _value) max 0;
			_ticketsTotal = missionnamespace setvariable [_varTotal,_ticketsTotal];
			publicvariable _varTotal;

			//--- Tickets exhaused - trigger a scripted event
			if (_tickets == 0) then {
				[[missionnamespace,"respawnTicketsExhausted",[_target]],"bis_fnc_callscriptedeventhandler",false] call bis_fnc_mp;
			};
		};

		_tickets
	};
	case (typename []): {
		private ["_minTickets","_target"];
		_minTickets = 1e10;
		_target = sideunknown;
		{
			private ["_tickets"];
			_tickets = _x call bis_fnc_respawnTickets;
			if (_tickets < _minTickets && _tickets >= 0) then {
				_target = _x;
				_minTickets = _tickets;
			};
		} foreach _input;
		if (_target == sideunknown) then {_minTickets = -1;};
		[_target,_minTickets]
	};
};