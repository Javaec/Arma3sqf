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



case "a_hub_350_greet_player_ALP_0":
	{//Hi_
	
_this kbtell [BIS_AIC, "a_hub_350_greet_player","a_hub_350_greet_player_BRA_0"]; //Hello.
	};


};

// return the result
BIS_convMenu

