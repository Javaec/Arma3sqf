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



case "showcase_supports_10_echo_green_light_HAW_0":
	{//Echo__this_is_Hawkeye__Commence_your_assault__over_
	
_this kbtell [_from, "showcase_supports_10_echo_green_light","showcase_supports_10_echo_green_light_ECH_0"]; //Wilco, Hawkeye, that's why we're here. ETA: 2 mikes. out.
	};


};

// return the result
BIS_convMenu

