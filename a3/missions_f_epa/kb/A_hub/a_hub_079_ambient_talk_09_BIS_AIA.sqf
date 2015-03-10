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



case "a_hub_079_ambient_talk_09_ALPB_0":
	{//But_what_s_the_end_goal__you_know_
	
_this kbtell [_from, "a_hub_079_ambient_talk_09","a_hub_079_ambient_talk_09_ALPA_0"]; //An end goal's one thing - just not getting killed right now is fine by me.
	};


};

// return the result
BIS_convMenu

