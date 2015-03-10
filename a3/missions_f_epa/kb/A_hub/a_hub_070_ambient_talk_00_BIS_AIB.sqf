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



case "a_hub_070_ambient_talk_00_ALPA_0":
	{//Christ__Where_the_hell_are_our_reinforcements_
	
_this kbtell [_from, "a_hub_070_ambient_talk_00","a_hub_070_ambient_talk_00_ALPB_0"]; //Your guess is as good as mine, man...
	};


};

// return the result
BIS_convMenu

