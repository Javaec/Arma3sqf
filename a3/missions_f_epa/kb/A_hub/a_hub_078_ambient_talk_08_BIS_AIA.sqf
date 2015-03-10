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



case "a_hub_078_ambient_talk_08_ALPB_0":
	{//Like_a_colony_or_some_shit_
	
_this kbtell [_from, "a_hub_078_ambient_talk_08","a_hub_078_ambient_talk_08_ALPA_1"]; //Yeah.
	};


};

// return the result
BIS_convMenu

