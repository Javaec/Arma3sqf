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



case "b_m01_x30_frinileavewarning_STA_0":
	{//Omega__where_the_hell_are_you__We_need_you_back_at_the_outpost_now__Over_
	
_this kbtell [_from, "b_m01_x30_frinileavewarning","b_m01_x30_frinileavewarning_KER_0"]; //I got it - we're on the way. Out.
	};


};

// return the result
BIS_convMenu

