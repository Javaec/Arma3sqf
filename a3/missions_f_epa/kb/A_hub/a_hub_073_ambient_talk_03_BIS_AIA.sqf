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



case "a_hub_073_ambient_talk_03_ALPB_0":
	{//I_dunno__Special_Forces__SBS_or_some_shit__man_
	
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPA_1"]; //Yeah, I mean sure, 'CTRG'. Whatever the fuck that means.
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPA_2"]; //For all I know, he's the royal fucking janitor.
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPA_3"]; //And it's like... who died and made him king?
	};


case "a_hub_073_ambient_talk_03_ALPB_2":
	{//And___to_be_fair_to_the_guy___he_s_kept_us_alive_this_far_
	
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPA_4"]; //Sure, you're right. It's just that accent, you know? Gets right up my nose.
	};


};

// return the result
BIS_convMenu

