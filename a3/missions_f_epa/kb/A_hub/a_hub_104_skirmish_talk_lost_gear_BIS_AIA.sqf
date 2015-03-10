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



case "a_hub_104_skirmish_talk_lost_gear_ALPB_0":
	{//Hey__man__no_one_blames_you_guys_for_that__Don_t_sweat_it_
	
_this kbtell [_from, "a_hub_104_skirmish_talk_lost_gear","a_hub_104_skirmish_talk_lost_gear_ALPA_1"]; //I know, just - when we're so low on resources - seems like a damn waste.
	};


};

// return the result
BIS_convMenu

