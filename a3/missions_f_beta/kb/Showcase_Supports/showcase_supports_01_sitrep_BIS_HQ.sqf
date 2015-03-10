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



case "showcase_supports_01_sitrep_HAW_0":
	{//This_is_Hawkeye___in_position_above_the_airbase___eyes_on_target_
	
_this kbtell [_from, "showcase_supports_01_sitrep","showcase_supports_01_sitrep_BHQ_1"]; //Copy that, Hawkeye, CAS and mortar teams are on standby.
_this kbtell [_from, "showcase_supports_01_sitrep","showcase_supports_01_sitrep_BHQ_2"]; //And, be advised, ETA on the shells is 40 seconds from request acknowledgement. About the same for the gunship, too. Be sure to factor this in for any moving targets.
	};


case "showcase_supports_01_sitrep_HAW_1":
	{//Roger_that_
	
_this kbtell [_from, "showcase_supports_01_sitrep","showcase_supports_01_sitrep_BHQ_3"]; //Ok. Proceed with the operation. Good luck. Papa Bear out.
	};


};

// return the result
BIS_convMenu

