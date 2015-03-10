case "BIS_intro": {

	sleep 3;
	if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",0],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",0],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",0],true],"SIDE"] spawn bis_fnc_kbTell;};
};

case "BIS_waveFirstDone": {
	if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",1],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",1],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",1],true],"SIDE"] spawn bis_fnc_kbTell;};
};

case "BIS_waveHalfDone": {
	if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",2],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",2],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",2],true],"SIDE"] spawn bis_fnc_kbTell;};
};

case "BIS_heliStandby": {
	switch (_this select 1) do {
		case west: {		if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",3],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case east: {		if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",3],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case resistance: {	if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",3],true],"SIDE"] spawn bis_fnc_kbTell;};};
	};
};

case "BIS_heliCall": {
	_winners = _this select 1;
	_losers = _this select 2;
	_enoughCargoPositions = _this select 3;

	switch (true) do {
		case (west in _winners):	{if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",4],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case (east in _winners):	{if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",4],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case (resistance in _winners):	{if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",4],true],"SIDE"] spawn bis_fnc_kbTell;};};
	};
	switch (true) do {
		case (west in _losers):		{if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",5],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case (east in _losers):		{if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",5],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case (resistance in _losers):	{if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",5],true],"SIDE"] spawn bis_fnc_kbTell;};};
	};
	if !(_enoughCargoPositions) then {
		if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",6],true],"SIDE"] spawn bis_fnc_kbTell;};
		if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",6],true],"SIDE"] spawn bis_fnc_kbTell;};
		if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",6],true],"SIDE"] spawn bis_fnc_kbTell;};
	};
};

case "BIS_heliLand": {
	if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",7],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",7],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",7],true],"SIDE"] spawn bis_fnc_kbTell;};
};

case "BIS_heliLoaded": {
};

case "BIS_heliDestroyed": {
	if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",8],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",8],true],"SIDE"] spawn bis_fnc_kbTell;};
	if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",8],true],"SIDE"] spawn bis_fnc_kbTell;};
};

case "BIS_evac": {
	_w = if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",9],true],"SIDE"] spawn bis_fnc_kbTell} else {[] spawn {}};
	_e = if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",9],true],"SIDE"] spawn bis_fnc_kbTell} else {[] spawn {}};
	_r = if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",9],true],"SIDE"] spawn bis_fnc_kbTell} else {[] spawn {}};
	waituntil {scriptdone _w && scriptdone _e && scriptdone _r};
};

case "BIS_tie": {
	_w = if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",10],true],"SIDE"] spawn bis_fnc_kbTell;} else {[] spawn {}};
	_e = if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",10],true],"SIDE"] spawn bis_fnc_kbTell;} else {[] spawn {}};
	_r = if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",10],true],"SIDE"] spawn bis_fnc_kbTell;} else {[] spawn {}};
	waituntil {scriptdone _w && scriptdone _e && scriptdone _r};
};

case "BIS_lost": {
};

case "BIS_inBase": {
	switch (_this select 1) do {
		case blufor: {		if !(isnull BIS_HQ_WEST) then {["01_BLUFOR","MPType_Defense",[["BHQ",11],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case opfor: {		if !(isnull BIS_HQ_EAST) then {["02_OPFOR","MPType_Defense",[["BHQ",11],true],"SIDE"] spawn bis_fnc_kbTell;};};
		case independent: {	if !(isnull BIS_HQ_GUER) then {["03_Resistance","MPType_Defense",[["BHQ",11],true],"SIDE"] spawn bis_fnc_kbTell;};};
	};
};