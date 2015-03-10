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



case "a_hub_080_ambient_talk_10_ALPA_0":
	{//I_dunno____I_just_hope_Captain_Miller_knows_what_the_hell_he_s_doing_
	
_this kbtell [_from, "a_hub_080_ambient_talk_10","a_hub_080_ambient_talk_10_ALPB_0"]; //We don't really have much other choice right now.
	};


};

// return the result
BIS_convMenu

