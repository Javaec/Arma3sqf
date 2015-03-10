#define DISPLAY	(uinamespace getvariable "RscE3")
#define CONTROL	(DISPLAY displayctrl _idc)

E3 = false;
setacctime 0;
showhud false;

//--- No display
if !(isclass (configfile >> "RscTitles" >> format ["RscE3_%1",missionname])) exitwith {
	["Display 'RscE3_%1' not found",missionname] call bis_fnc_halt;
};

//--- Show display
titlersc [
	format ["RscE3_%1",missionname],
	"plain"
];
cuttext ["","plain"];

for "_idc" from 2000 to 2004 do {
	_i = _idc % 4;
	CONTROL ctrlsettext format ["\hsim\Data_H\data\mrak_0%1_ca.paa",_i + 1];
	_h = safezoneH + 1 - (_i / 10);
	_w = _h * 3/4;
	_x = safezoneX - _h/2 + (random safezoneW);
	_y = safezoneY - 0.5;
	CONTROL ctrlsetposition [_x,_y,_w,_h];
	CONTROL ctrlsetfade 0.5;
	CONTROL ctrlcommit 0;
	_x = safezoneX + ((random safezoneW) * 2/3);
	CONTROL ctrlsetposition [_x,_y,_w,_h];
	CONTROL ctrlcommit 50;
};

waituntil {!isnull (finddisplay 46)};
_eh = (finddisplay 46) displayaddeventhandler ["keydown","_E3 = E3; E3 = true; if !(_E3) then {true} else {false};"];

//--- Key pressed
waituntil {E3};

(finddisplay 46) displayremoveeventhandler ["keydown",_eh];

setacctime 1;
showhud true;

_delay = 0.7;
for "_idc" from 9 to 1011 do {
	CONTROL ctrlsetfade 1;
	CONTROL ctrlcommit _delay;
};
for "_idc" from 1200 to 1211 do {
	CONTROL ctrlsetfade 1;
	CONTROL ctrlcommit _delay;
};
for "_idc" from 2000 to 2004 do {
	_pos = ctrlposition CONTROL;
	_pos set [0,safezoneW + 1];
	CONTROL ctrlsetposition _pos;
	CONTROL ctrlsetfade 1;
	CONTROL ctrlcommit (_delay * 5);
};