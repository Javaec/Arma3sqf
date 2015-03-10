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



case "showcase_supports_15_base_clear_HAW_0":
	{//Hawkeye_to_Papa_Bear__mission_complete__Enemy_forces_on_the_airbase_are_neutralized__Do_you_read__Over_
	
_this kbtell [_from, "showcase_supports_15_base_clear","showcase_supports_15_base_clear_BHQ_0"]; //Loud and clear, Hawkeye. Good job everyone - make a sweep of the AO for casualties and RTB. Papa Bear out.
	};


};

// return the result
BIS_convMenu

