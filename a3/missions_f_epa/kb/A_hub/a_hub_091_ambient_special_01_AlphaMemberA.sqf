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



case "a_hub_091_ambient_special_01_ALPB_0":
	{//I_don_t_follow__man_
	
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPA_1"]; //I mean... the military - we're staring down the barrel of a conflict in the Pacific - and we're junking our vehicles?
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPA_2"]; //How's that meant to make any sense?
	};


case "a_hub_091_ambient_special_01_ALPB_4":
	{//And_we_re_sure_as_hell_not_about_to_hand_it_over_to_the_Greenbacks_
	
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPA_3"]; //True.
	};


};

// return the result
BIS_convMenu

