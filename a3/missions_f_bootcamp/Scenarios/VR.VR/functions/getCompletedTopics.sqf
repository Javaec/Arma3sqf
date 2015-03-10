_filter = _this;

_topics = [];

switch (_filter) do {
	case "all": {_topics = BIS_topics + BIS_topicsUnofficial};
	case "official": {_topics = BIS_topics};
	case "unofficial": {_topics = BIS_topicsUnofficial};
	default {_topics = BIS_topics + BIS_topicsUnofficial};
};

_progress = profileNamespace getVariable "BIS_VR_courseProgression";

_ret = [];

{
	_topic = _x;
	_done = TRUE;
	_stagesCnt = count ((_topic call BIS_fnc_VR_topicInfo) select 1);
	for [{_i = 1}, {_i <= _stagesCnt}, {_i = _i + 1}] do {
		_stageID = format ["%1_%2", _topic, _i];
		if !(_stageID in _progress) exitWith {_done = FALSE};
	};
	if (_done) then {_ret = _ret + [_topic]};
} forEach _topics;

_ret;