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



case "a_hub_075_ambient_talk_05_ALPB_0":
	{//Maybe_we_should_have_seen_it_coming__you_know_
	
_this kbtell [_from, "a_hub_075_ambient_talk_05","a_hub_075_ambient_talk_05_ALPA_0"]; //What do you mean?
	};


case "a_hub_075_ambient_talk_05_ALPB_2":
	{//Civil_war_s_one_thing___that_was_just___I_dunno_
	
_this kbtell [_from, "a_hub_075_ambient_talk_05","a_hub_075_ambient_talk_05_ALPA_1"]; //Well, everything's so lethal. So 'on target'. You know?
	};


case "a_hub_075_ambient_talk_05_ALPB_3":
	{//Yeah__I_get_it__man_
	
_this kbtell [_from, "a_hub_075_ambient_talk_05","a_hub_075_ambient_talk_05_ALPA_2"]; //Makes me wonder how much longer we can actually hold out.
	};


};

// return the result
BIS_convMenu

