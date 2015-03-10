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



case "a_hub_104_skirmish_talk_lost_gear_ALPA_0":
	{//Yeah__we_had_to_leave_a_whole_bunch_of_gear_out_the_way_
	
_this kbtell [_from, "a_hub_104_skirmish_talk_lost_gear","a_hub_104_skirmish_talk_lost_gear_ALPB_0"]; //Hey, man, no one blames you guys for that. Don't sweat it.
	};


};

// return the result
BIS_convMenu

