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



case "a_hub_102_skirmish_talk_timed_transport_ALPB_0":
	{//____A_Greenback_convoy__you_mean_
	
_this kbtell [_from, "a_hub_102_skirmish_talk_timed_transport","a_hub_102_skirmish_talk_timed_transport_ALPA_1"]; //No, a friendly one! Yes, idiot, a Greenback convoy.
	};


};

// return the result
BIS_convMenu

