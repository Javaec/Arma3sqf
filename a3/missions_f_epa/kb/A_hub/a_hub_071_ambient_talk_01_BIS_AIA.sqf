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



case "a_hub_071_ambient_talk_01_ALPB_0":
	{//Oh__yeah_
	
_this kbtell [_from, "a_hub_071_ambient_talk_01","a_hub_071_ambient_talk_01_ALPA_1"]; //Yeah - comms were fucked, though - could barely make out the messages.
	};


};

// return the result
BIS_convMenu

