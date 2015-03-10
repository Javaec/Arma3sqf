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



case "a_hub_093_ambient_special_03_CHA_0":
	{//How_did_things_get_this_fucked__anyway_
	
_this kbtell [_from, "a_hub_093_ambient_special_03","a_hub_093_ambient_special_03_ALP_0"]; //C'mon, it's hardly like it's a surprise.
_this kbtell [_from, "a_hub_093_ambient_special_03","a_hub_093_ambient_special_03_ALP_1"]; //The economy's been in the tank for a decade - at least.
	};


case "a_hub_093_ambient_special_03_CHA_1":
	{//Yeah__but_CSAT__How_d_we_ever_let_that_happen__you_know_
	
_this kbtell [_from, "a_hub_093_ambient_special_03","a_hub_093_ambient_special_03_ALP_2"]; //Not our call any more.
_this kbtell [_from, "a_hub_093_ambient_special_03","a_hub_093_ambient_special_03_ALP_3"]; //They got jobs. Growth. Influence. Fucking... China, man.
	};


};

// return the result
BIS_convMenu

