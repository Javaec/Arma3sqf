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



case "showcase_supports_x01_casaulties_BHQ_0":
	{//Hawkeye__what_s_the_situation__We_ve_lost_contact_with_most_of_the_teams__over_
	
_this kbtell [_from, "showcase_supports_x01_casaulties","showcase_supports_x01_casaulties_HAW_0"]; //It's bad... we're getting our asses handed to us, sir. Please advise, over.
	};


};

// return the result
BIS_convMenu

