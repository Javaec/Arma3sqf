// collect reactions to BIS_convMenu _this _from _topic _sentenceid
BIS_convMenu = [];

//debug
if (!isNil "BIS_DEBUG_DIALOG") then
{
	if (_sentenceId!="") then
	{
  debugLog format["DIAL SQF _sentenceId %1 _this %2 _from %3 _topic %4",_sentenceId,_this,_from,_topic];
  };
};

switch (_sentenceId) do
{



case "a_hub_079_ambient_talk_09_ALPA_0":
	{//An_end_goal_s_one_thing___just_not_getting_killed_right_now_is_fine_by_me_
	
_this kbtell [_from, "a_hub_079_ambient_talk_09","a_hub_079_ambient_talk_09_ALPB_1"]; //Sure, man, but - without full NATO support - just feels like we're just pissing into the wind.
	};


};

// return the result
BIS_convMenu

