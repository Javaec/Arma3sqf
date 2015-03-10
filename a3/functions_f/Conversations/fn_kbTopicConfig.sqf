private ["_mission","_topicName","_cfgTopic"];

_mission = _this select 0;
_topicName  = _this select 1;

_cfgTopic = configfile >> "CfgSentences" >> _mission >> _topicName;
if !(isclass _cfgTopic) then {_cfgTopic = campaignconfigfile >> "CfgSentences" >> _mission >> _topicName};
if !(isclass _cfgTopic) then {_cfgTopic = missionconfigfile >> "CfgSentences" >> _mission >> _topicName};
if !(isclass _cfgTopic) exitwith {

	//--- Error
	if (_topicName != "") then {
		if (isclass (configfile >> "CfgSentences" >> _mission)) then {
			["Topic '%1' not found in '%2'",_topicName,_mission] call bis_fnc_error;
		} else {
			["Class '%1' not found in CfgSentences",_mission] call bis_fnc_error;
		};
	};
	nil
};

_cfgTopic