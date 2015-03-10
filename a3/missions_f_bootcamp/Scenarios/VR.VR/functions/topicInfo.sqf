// ---------- grab topic info (title, stages, functions)

private ["_this", "_topicTitle", "_stagesInfo", "_stagesCnt", "_i", "_stageTitle", "_stageFunction", "_icon", "_locks", "_prio"];

_topicTitle = getText (configFile >> "CfgVRCourses" >> _this >> "title");
_icon = getText (configFile >> "CfgVRCourses" >> _this >> "icon");
_locks = getArray (configFile >> "CfgVRCourses" >> _this >> "locks");
_prio = getNumber (configFile >> "CfgVRCourses" >> _this >> "priority");

_stagesInfo = [];

_stagesCnt = count (configFile >> "CfgVRCourses" >> _this >> "Stages");

for [{_i = 0}, {_i < _stagesCnt}, {_i = _i + 1}] do {
	_stageTitle = getText (((configFile >> "CfgVRCourses" >> _this >> "Stages") select _i) >> "title");
	_stageFunction = call compile getText (((configFile >> "CfgVRCourses" >> _this >> "Stages") select _i) >> "function");
	_stagesInfo = _stagesInfo + [[_stageTitle, _stageFunction]];
};

[_topicTitle, _stagesInfo, _icon, _locks, _prio];