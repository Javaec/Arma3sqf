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



case "a_hub_100_skirmish_talk_crashed_helicopter_ALPA_0":
	{//Apparently_someone_managed_to_get_off_a_lucky_shot_on_one_of_their_choppers_
	
_this kbtell [_from, "a_hub_100_skirmish_talk_crashed_helicopter","a_hub_100_skirmish_talk_crashed_helicopter_ALPB_0"]; //Oh, yeah?
	};


case "a_hub_100_skirmish_talk_crashed_helicopter_ALPA_1":
	{//Yeah__hit_the_deck_somewhere_to_up_north_
	
_this kbtell [_from, "a_hub_100_skirmish_talk_crashed_helicopter","a_hub_100_skirmish_talk_crashed_helicopter_ALPB_1"]; //Right.. wonder if the wreck's still intact.
	};


};

// return the result
BIS_convMenu

