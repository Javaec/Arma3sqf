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



case "a_hub_091_ambient_special_01_ALPA_0":
	{//I_thought_we_were_supposed_to_be_broke__though_
	
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPB_0"]; //I don't follow, man.
	};


case "a_hub_091_ambient_special_01_ALPA_2":
	{//How_s_that_meant_to_make_any_sense_
	
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPB_1"]; //Well, it's not that simple.
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPB_2"]; //It probably costs more to ship this shit anywhere.
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPB_3"]; //Plus - you gotta admit - it's kinda dated, too. At this point, it's worth more as scrap.
_this kbtell [_from, "a_hub_091_ambient_special_01","a_hub_091_ambient_special_01_ALPB_4"]; //And we're sure as hell not about to hand it over to the Greenbacks.
	};


};

// return the result
BIS_convMenu

