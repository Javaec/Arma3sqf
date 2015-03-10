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



case "a_hub_073_ambient_talk_03_ALPA_0":
	{//And_who_the_hell_is_this_Miller_guy_anyway_
	
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPB_0"]; //I dunno. Special Forces. SBS or some shit, man.
	};


case "a_hub_073_ambient_talk_03_ALPA_3":
	{//And_it_s_like____who_died_and_made_him_king_
	
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPB_1"]; //MacKinnon.
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPB_2"]; //And - to be fair to the guy - he's kept us alive this far.
	};


case "a_hub_073_ambient_talk_03_ALPA_4":
	{//Sure__you_re_right__It_s_just_that_accent__you_know__Gets_right_up_my_nose_
	
_this kbtell [_from, "a_hub_073_ambient_talk_03","a_hub_073_ambient_talk_03_ALPB_3"]; //I hear that, man, I hear that...
	};


};

// return the result
BIS_convMenu

