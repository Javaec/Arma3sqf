private ["_topic","_actor","_id"];

_actor =	[_this,0,"",[""]] call bis_fnc_param;
_id =		[_this,1,-1,[0]] call bis_fnc_param;
_topic =	if (!isnil "_topicName") then {_topicName} else {""};
_topic =	[_this,2,_topic,[""]] call bis_fnc_param;
_mission =	if (!isnil "_mission") then {_mission} else {""};
_mission =	[_this,3,_mission,[""]] call bis_fnc_param;

_topic = _topic + "_" + _actor;
if (_id >= 0) then {_topic = _mission + "_" + _topic + "_" + str _id};
tolower _topic