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



case "a_hub_350_greet_player_ALPA_0":
	{//What_s_up__Kerry_
	
_this kbtell [_from, "a_hub_350_greet_player","a_hub_350_greet_player_ALPB_0"]; //Hi, man.
	};


};

// return the result
BIS_convMenu

