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



case "a_hub_092_ambient_special_02_CHA_0":
	{//If_it_s_their_goddamn_problem__where_the_hell_are_they_
	
_this kbtell [_from, "a_hub_092_ambient_special_02","a_hub_092_ambient_special_02_ALP_0"]; //The Brits are broke, man. Everyone knows it.
_this kbtell [_from, "a_hub_092_ambient_special_02","a_hub_092_ambient_special_02_ALP_1"]; //They can't even afford to defend their pointless little islands any more.
	};


case "a_hub_092_ambient_special_02_CHA_1":
	{//So_why_do_we_get_stuck_with_them_
	
_this kbtell [_from, "a_hub_092_ambient_special_02","a_hub_092_ambient_special_02_ALP_2"]; //Why d'you think we're shipping out? We did our time. We kept our peace.
_this kbtell [_from, "a_hub_092_ambient_special_02","a_hub_092_ambient_special_02_ALP_3"]; //Now we get to go play with the big boys in the Pacific.
	};


};

// return the result
BIS_convMenu

