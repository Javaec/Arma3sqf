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



case "showcase_supports_05_bravo_green_light_HAW_0":
	{//Hawkeye_to_Bravo__proceed_with_mission__over_
	
_this kbtell [_from, "showcase_supports_05_bravo_green_light","showcase_supports_05_bravo_green_light_BRA_0"]; //Copy that, Bravo on the move, out.
	};


};

// return the result
BIS_convMenu

