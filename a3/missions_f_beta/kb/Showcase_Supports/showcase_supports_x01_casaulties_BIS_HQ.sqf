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



case "showcase_supports_x01_casaulties_HAW_0":
	{//It_s_bad____we_re_getting_our_asses_handed_to_us__sir__Please_advise__over_
	
_this kbtell [_from, "showcase_supports_x01_casaulties","showcase_supports_x01_casaulties_BHQ_1"]; //Goddamnit, Sergeant, you had the upper hand here - this was not supposed to happen! Everyone, fall back to point Gamma and await evac. Papa Bear out.
	};


};

// return the result
BIS_convMenu

