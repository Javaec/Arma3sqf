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



case "a_hub_071_ambient_talk_01_ALPA_0":
	{//Well__I_heard_it_all_kicked_off_up_at_Kamino_
	
_this kbtell [_from, "a_hub_071_ambient_talk_01","a_hub_071_ambient_talk_01_ALPB_0"]; //Oh, yeah?
	};


case "a_hub_071_ambient_talk_01_ALPA_1":
	{//Yeah___comms_were_fucked__though___could_barely_make_out_the_messages_
	
_this kbtell [_from, "a_hub_071_ambient_talk_01","a_hub_071_ambient_talk_01_ALPB_1"]; //Right, I heard that. It was a mess. Fuckin' Greenbacks, man...
	};


};

// return the result
BIS_convMenu

