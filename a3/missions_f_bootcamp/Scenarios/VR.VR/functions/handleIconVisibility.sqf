while {BIS_topic < 0} do {
	_size = (getGroupIconParams _this) select 2;
	_color = (getGroupIconParams _this) select 0;
	_text = _this getVariable "BIS_iconText";
	waitUntil {(!visibleMap && cos (([player, leader _this] call BIS_fnc_dirTo) - direction player) <= 0.73) || BIS_topic >= 0};
	if (BIS_topic < 0) then {
		_this setGroupIconParams [_color, _text, 1, FALSE];
	};
	waitUntil {cos (([player, leader _this] call BIS_fnc_dirTo) - direction player) > 0.73 || BIS_topic >= 0 || visibleMap};
	if (BIS_topic < 0) then {
		_this setGroupIconParams [_color, _text, _size, TRUE];
	};
};