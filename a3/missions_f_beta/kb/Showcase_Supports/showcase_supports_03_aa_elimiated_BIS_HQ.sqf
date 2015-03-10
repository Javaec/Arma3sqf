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



case "showcase_supports_03_aa_elimiated_HAW_0":
	{//Papa_Bear__Hawkeye__be_advised__AA_teams_neutralised__over_
	
_this kbtell [_from, "showcase_supports_03_aa_elimiated","showcase_supports_03_aa_elimiated_BHQ_0"]; //Acknowledged, Hawkeye, continue with the operation. Out.
	};


};

// return the result
BIS_convMenu

