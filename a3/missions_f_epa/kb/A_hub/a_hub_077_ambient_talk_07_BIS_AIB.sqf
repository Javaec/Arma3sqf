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



case "a_hub_077_ambient_talk_07_ALPA_1":
	{//Us_pulling_out__CSAT_at_their_back__Europe__fucking____nowhere_
	
_this kbtell [_from, "a_hub_077_ambient_talk_07","a_hub_077_ambient_talk_07_ALPB_0"]; //Yeah, they've been a giant pain in the ass for months, man, but...
_this kbtell [_from, "a_hub_077_ambient_talk_07","a_hub_077_ambient_talk_07_ALPB_1"]; //Well, you know, there's a difference between that and war.
	};


case "a_hub_077_ambient_talk_07_ALPA_2":
	{//True__Sometimes_all_you_need_is_one_loose_trigger_for_a_flashpoint__though___
	
_this kbtell [_from, "a_hub_077_ambient_talk_07","a_hub_077_ambient_talk_07_ALPB_2"]; //Yeah. Maybe this whole thing's one big misunderstanding.
	};


};

// return the result
BIS_convMenu

