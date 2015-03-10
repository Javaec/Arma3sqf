/*
	Author: Karel Moricky

	Description:
	Initialize ticket bleeding. Works with sector modules.
	When a side holds majority of sectors, other non-friendly sides will start losing respawn tickets (set by BIS_fnc_respawnTickets)

	"dominantSideChanged" scripted event handler (see BIS_fnc_addScriptedEventHandler) is called every time the dominant side changes.

	Parameter(s):
		0 (Optional): ARRAY of SIDEs - involved sides. Setting empty array will terminate ticket bleeding (default: all sides)
		1 (Optional): NUMBER - dominance ratio in range 0-1, i.e., how large portion of sectors must a side hold for others to start bleeding (default: 0.5)
		2 (Optional): NUMBER - how many tickets will be bled every step during full dominance (default: 3)
		3 (Optional): NUMBER - delay in seconds between every bleeding step (default: 5)

	Returns:
	BOOL
*/

if !(isserver) exitwith {"BIS_fnc_bleedTickets can run only on server" call bis_fnc_error; false};

private ["_sides","_ticketBleedRatio","_ticketBleedMax","_delay","_sidesFiltered"];
_sides = [_this,0,missionnamespace getvariable ["bis_fnc_bleedTickets_sides",[east,west,resistance]],[[]]] call bis_fnc_param;
_ticketBleedRatio = [_this,1,missionnamespace getvariable ["bis_fnc_bleedTickets_ticketBleedRatio",0.5],[0]] call bis_fnc_param;
_ticketBleedMax = [_this,2,missionnamespace getvariable ["bis_fnc_bleedTickets_ticketBleedMax",3],[0]] call bis_fnc_param;
_delay = [_this,3,5,[0]] call bis_fnc_param;

//--- Remove duplicates and elements which are not sides
_sidesFiltered = [];
{
	if (typename _x == typename sideunknown) then {
		if !(_x in _sidesFiltered) then {_sidesFiltered set [count _sidesFiltered,_x];};
	};
} foreach _sides;
bis_fnc_bleedTickets_sides = _sidesFiltered;

//--- Announce
bis_fnc_bleedTickets_enabled = count _sides > 0;
publicvariable "bis_fnc_bleedTickets_enabled";

//--- Terminate existing loop
if !(isnil "bis_fnc_bleedTickets_loop") then {terminate bis_fnc_bleedTickets_loop;};

//--- Execute bleeding loop
if (bis_fnc_bleedTickets_enabled) then {
	bis_fnc_bleedTickets_loop = [_ticketBleedRatio,_ticketBleedMax,_delay] spawn {

		_ticketBleedRatio = _this select 0;
		_ticketBleedMax = _this select 1;
		_delay = _this select 2;
		_dominantSide = sideunknown;

		while {true} do {
			_sectors = true call bis_fnc_moduleSector;
			_ticketBleedSectorLimit = count _sectors * _ticketBleedRatio;
			if (_ticketBleedSectorLimit != 0) then {
				_dominantSideOld = _dominantSide;		
				_dominantSide = sideunknown;
				_dominantSideRatio = 0;

				//--- Get sector status
				_sides = +(missionnamespace getvariable ["bis_fnc_bleedTickets_sides",[east,west,resistance,civilian]]);
				{
					_side = _x;
					_sideTickets = _side call bis_fnc_respawnTickets;
					if (_sideTickets < 0) then {
						_sides set [_foreachindex,sideunknown]; //--- Remove sides without tickets
					} else {
						_sideSectorsCount = _side call bis_fnc_moduleSector;
						if(_sideSectorsCount > _ticketBleedSectorLimit) then {
							_dominantSide = _side;
							_dominantSideRatio = (_sideSectorsCount - _ticketBleedSectorLimit) / _ticketBleedSectorLimit;
						};
					};
				} foreach _sides;
				_sides = _sides - [sideunknown];

				//--- Tickets bleeding
				_sectorTicketBleedRatio = -_ticketBleedMax * _dominantSideRatio;
				if (_sectorTicketBleedRatio != 0) then {
					{
						_side = _x;
						if (_side != _dominantSide && _dominantSide != sideunknown) then {
							[_side,floor _sectorTicketBleedRatio] call bis_fnc_respawnTickets;
						};
					} foreach _sides;
				};

				//--- Call custom code when the dominance changes
				if (_dominantSide != _dominantSideOld) then {
					[missionnamespace,"dominantSideChanged",[_dominantSide,_dominantSideOld,_sides]] spawn bis_fnc_callScriptedEventHandler;
				};
			};

			_time = time + _delay;
			waituntil {time > _time};
		};
	};
};
true