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



case "a_hub_077_ambient_talk_07_ALPB_1":
	{//Well__you_know__there_s_a_difference_between_that_and_war_
	
_this kbtell [_from, "a_hub_077_ambient_talk_07","a_hub_077_ambient_talk_07_ALPA_2"]; //True. Sometimes all you need is one loose trigger for a flashpoint, though...
	};


};

// return the result
BIS_convMenu

