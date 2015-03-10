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



case "showcase_supports_01_sitrep_ECH_0":
	{//Echo_Team__in_position_
	
_this kbtell [BIS_player, "showcase_supports_01_sitrep","showcase_supports_01_sitrep_BRA_0"]; //Bravo here, awaiting signal.
	};


};

// return the result
BIS_convMenu

