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



case "showcase_supports_x05_aa_elimiated_sniper_HAW_0":
	{//Papa_Bear__Hawkeye__be_advised__AA_teams_neutralised__over_
	
_this kbtell [_from, "showcase_supports_x05_aa_elimiated_sniper","showcase_supports_x05_aa_elimiated_sniper_BHQ_0"]; //Say again, Hawkeye, task executed with no mortar support? Over.
	};


case "showcase_supports_x05_aa_elimiated_sniper_HAW_1":
	{//Affirmative__sir__I_saw_an_opportunity__I_took_it_
	
_this kbtell [_from, "showcase_supports_x05_aa_elimiated_sniper","showcase_supports_x05_aa_elimiated_sniper_BHQ_1"]; //Copy that. We appreciate your confidence Sergeant, but make sure you support the assault properly. Mortar support is still available.
	};


};

// return the result
BIS_convMenu

