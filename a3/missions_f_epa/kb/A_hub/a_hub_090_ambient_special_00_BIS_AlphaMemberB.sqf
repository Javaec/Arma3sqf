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



case "a_hub_090_ambient_special_00_ALPA_0":
	{//Wait__what_s_the_assignment_today_
	
_this kbtell [_from, "a_hub_090_ambient_special_00","a_hub_090_ambient_special_00_ALPB_0"]; //Just the same shit as yesterday, man. Vehicle tear-down.
	};


case "a_hub_090_ambient_special_00_ALPA_1":
	{//What__we_re_on_that_for_the_whole_week_
	
_this kbtell [_from, "a_hub_090_ambient_special_00","a_hub_090_ambient_special_00_ALPB_1"]; //Yup. At least until the contractors get here, we're the junkyard dogs.
	};


};

// return the result
BIS_convMenu

