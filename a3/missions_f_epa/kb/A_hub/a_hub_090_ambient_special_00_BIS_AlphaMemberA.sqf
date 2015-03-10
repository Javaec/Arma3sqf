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



case "a_hub_090_ambient_special_00_ALPB_0":
	{//Just_the_same_shit_as_yesterday__man__Vehicle_tear_down_
	
_this kbtell [_from, "a_hub_090_ambient_special_00","a_hub_090_ambient_special_00_ALPA_1"]; //What, we're on that for the whole week?
	};


case "a_hub_090_ambient_special_00_ALPB_1":
	{//Yup__At_least_until_the_contractors_get_here__we_re_the_junkyard_dogs_
	
_this kbtell [_from, "a_hub_090_ambient_special_00","a_hub_090_ambient_special_00_ALPA_2"]; //...I literally cannot wait to get off this fucking rock.
	};


};

// return the result
BIS_convMenu

