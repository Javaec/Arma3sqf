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



case "a_hub_092_ambient_special_02_ALP_1":
	{//They_can_t_even_afford_to_defend_their_pointless_little_islands_any_more_
	
_this kbtell [_from, "a_hub_092_ambient_special_02","a_hub_092_ambient_special_02_CHA_1"]; //So why do we get stuck with them?
	};


};

// return the result
BIS_convMenu

