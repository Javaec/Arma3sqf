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



case "showcase_supports_01_sitrep_BRA_0":
	{//Bravo_here__awaiting_signal_
	
_this kbtell [BIS_HQ, "showcase_supports_01_sitrep","showcase_supports_01_sitrep_HAW_0"]; //This is Hawkeye - in position above the airbase - eyes on target.
	};


case "showcase_supports_01_sitrep_BHQ_2":
	{//And__be_advised__ETA_on_the_shells_is_40_seconds_from_request_acknowledgement__About_the_same_for_the_gunship__too__Be_sure_to_factor_this_in_for_any_moving_targets_
	
_this kbtell [_from, "showcase_supports_01_sitrep","showcase_supports_01_sitrep_HAW_1"]; //Roger that.
	};


};

// return the result
BIS_convMenu

