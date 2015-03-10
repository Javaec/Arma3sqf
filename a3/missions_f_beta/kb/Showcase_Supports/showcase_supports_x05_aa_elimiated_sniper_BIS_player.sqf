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



case "showcase_supports_x05_aa_elimiated_sniper_BHQ_0":
	{//Say_again__Hawkeye__task_executed_with_no_mortar_support__Over_
	
_this kbtell [_from, "showcase_supports_x05_aa_elimiated_sniper","showcase_supports_x05_aa_elimiated_sniper_HAW_1"]; //Affirmative, sir. I saw an opportunity. I took it.
	};


case "showcase_supports_x05_aa_elimiated_sniper_BHQ_1":
	{//Copy_that__We_appreciate_your_confidence_Sergeant__but_make_sure_you_support_the_assault_properly__Mortar_support_is_still_available_
	
_this kbtell [_from, "showcase_supports_x05_aa_elimiated_sniper","showcase_supports_x05_aa_elimiated_sniper_HAW_2"]; //Aknowledged, Papa Bear.
	};


};

// return the result
BIS_convMenu

