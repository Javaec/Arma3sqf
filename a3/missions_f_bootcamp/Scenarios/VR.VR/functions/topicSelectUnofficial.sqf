BIS_VR_curMenu = 1;
_unsorted = +_this;
_batches = [];

playSound "Topic_Trigger";

while {count _unsorted > 0} do {
	_batch = [];
	_maxItems = 9; if (count _batches > 0 && count _unsorted > 9) then {_maxItems = 8};
	for [{_i = 1}, {_i <= _maxItems}, {_i = _i + 1}] do {
		if (count _unsorted > 0) then {
			_batch = _batch + [_unsorted select 0];
			_unsorted = _unsorted - [_unsorted select 0];
		};
	};
	if (count _batches > 0) then {
		_batch = _batch + ["PREV"];
	};
	if (count _unsorted > 0) then {
		_batch = _batch + ["NEXT"];
	};
	_batches = _batches + [_batch];
};

{
	_batch = _x;
	_menuID = format ["BIS_VR_commMenu_%1", _forEachIndex + 1];
	missionNamespace setVariable [_menuID, [[localize "STR_A3_VR_select_course", TRUE]]];
	{
		_entry = [];
		switch (_x) do {
			case "PREV": {_entry = ["< " + (localize "STR_usract_prev_action"), [_forEachIndex + 2], "", -5, [["expression", "_null = [] spawn {playSound 'Topic_Selection'; sleep 0.1; showCommandingMenu format ['#USER:BIS_VR_commMenu_%1', BIS_VR_curMenu - 1]; BIS_VR_curMenu = BIS_VR_curMenu - 1}"]], "1", "1", ""]};
			case "NEXT": {_entry = [(localize "STR_usract_next_action") + " >", [_forEachIndex + 2], "", -5, [["expression", "_null = [] spawn {playSound 'Topic_Selection'; sleep 0.1; showCommandingMenu format ['#USER:BIS_VR_commMenu_%1', BIS_VR_curMenu + 1]; BIS_VR_curMenu = BIS_VR_curMenu + 1}"]], "1", "1", ""]};
			default {_entry = [(_x call BIS_fnc_VR_topicInfo) select 0, [_forEachIndex + 2], "", -5, [["expression", format ["if (BIS_topic < 0) then {BIS_topic = 1000 + (BIS_topicsUnofficial find '%1')}", _x]]], "1", "1", ""]};
		};
		missionNamespace setVariable [_menuID, (missionNamespace getVariable _menuID) + [_entry]];
	} forEach _batch;
} forEach _batches;

[] spawn {
	sleep 0.1;
	showCommandingMenu "#USER:BIS_VR_commMenu_1"
};