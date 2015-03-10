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



case "a_hub_093_ambient_special_03_ALP_1":
	{//The_economy_s_been_in_the_tank_for_a_decade___at_least_
	
_this kbtell [_from, "a_hub_093_ambient_special_03","a_hub_093_ambient_special_03_CHA_1"]; //Yeah, but CSAT? How'd we ever let that happen, you know?
	};


};

// return the result
BIS_convMenu

