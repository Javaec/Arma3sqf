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



case "a_hub_103_skirmish_talk_firefight_ALPA_0":
	{//Shit__Our_guys_okay_
	
_this kbtell [_from, "a_hub_103_skirmish_talk_firefight","a_hub_103_skirmish_talk_firefight_ALPB_1"]; //That's the thing. Not one of ours. At least, not anyone accounted for.
	};


};

// return the result
BIS_convMenu

