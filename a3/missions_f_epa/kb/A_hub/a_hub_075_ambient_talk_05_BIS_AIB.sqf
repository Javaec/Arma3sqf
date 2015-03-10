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



case "a_hub_075_ambient_talk_05_ALPA_0":
	{//What_do_you_mean_
	
_this kbtell [_from, "a_hub_075_ambient_talk_05","a_hub_075_ambient_talk_05_ALPB_1"]; //Fucking... Greenbacks, man, butchering half their own population during the conflict?
_this kbtell [_from, "a_hub_075_ambient_talk_05","a_hub_075_ambient_talk_05_ALPB_2"]; //Civil war's one thing - that was just - I dunno.
	};


case "a_hub_075_ambient_talk_05_ALPA_1":
	{//Well__everything_s_so_lethal__So__on_target___You_know_
	
_this kbtell [_from, "a_hub_075_ambient_talk_05","a_hub_075_ambient_talk_05_ALPB_3"]; //Yeah, I get it, man.
	};


};

// return the result
BIS_convMenu

