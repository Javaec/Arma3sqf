/*
	Training: Flank
*/

// Defines
#define STAGE_ID		"infantry"
#define TASK_ID			"BIS_infantry_challenge_9"

//Parameters
private ["_action", "_parameters"];
_action		= [_this, 0, "", [""]] call BIS_fnc_param;
_parameters	= [_this, 1, []] call BIS_fnc_param;

switch (toLower _action) do {
	case (toLower "initialize") : {
		
	};

	case (toLower "terminate") : {
		
	};

	case (toLower "terminateAndClear") : {
		
	};
	
	case (toLower "update") : {
		
	};
	
	case (toLower "conditionSucceed") : {
		false;
	};

	case (toLower "conditionFail") : {
		false;
	};

	case (toLower "conditionCancel") : {
		false;
	};
	
	case (toLower "conditionSkip") : {
		true;
	};
	
	case (toLower "onSucceed") : {
		
	};

	case (toLower "onFail") : {
		
	};

	case (toLower "onCancel") : {
		
	};
};
