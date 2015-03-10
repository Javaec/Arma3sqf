_logic = _this select 0;

//--- Execute Functions
if (isnil "bis_fnc_init") then {
	_logicFnc = (group _logic) createunit ["FunctionsManager",position player,[],0,"none"];
};
waituntil {!isnil "bis_fnc_init"};

//--- Track List
_trackList = if (isnil {_logic getvariable "trackList"}) then {[]} else {_logic getvariable "trackList"};
_logic setvariable ["trackList",_trackList,true];

//--- Delay
_delay = if (isnil {_logic getvariable "delay"}) then {3} else {_logic getvariable "delay"};
_logic setvariable ["delay",_delay,true];

[_trackList,_delay] spawn bis_fnc_music;