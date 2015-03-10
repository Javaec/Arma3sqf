/*
	Author: Karel Moricky

	Description:
	Set conversation priority. Conversations with priority not in the list won't be played

	Parameter(s):
	_this:
		ARRAY - List of priorities. Empty array will just return current value.
		NUMBER
			>0 - add priority to already existing list
			<0 - remove priority from already existing list
			Priority 0 cannot be tempered with

	Returns:
	ARRAY - List of priorities
*/

private ["_priority","_priorityCurrent","_priorityVar"];

_priority = [[_this],0,[],[[],0]] call bis_fnc_param;
_priorityVar = _fnc_scriptName + "_value";

//--- ERROR: No functions logic
if (isnil "bis_functions_mainscope") exitwith {"BIS_functions_mainscope not found" call bis_fnc_error; -1};

//--- Default value
if (isnil {bis_functions_mainscope getvariable _priorityVar}) then {
	bis_functions_mainscope setvariable [_priorityVar,[0,1,5,10]]; //--- ToDo: Revert default back to 0
};

//--- Add/Remove, not set
if (typename _priority == typename 0) then {
	if (_priority > 0) then {
		//--- Add
		_priority = [bis_functions_mainscope,_priorityVar,[_priority],true,true] call bis_fnc_variablespaceadd;
	} else {
		//--- Remove
		_priority = [bis_functions_mainscope,_priorityVar,[-_priority],true] call bis_fnc_variablespaceremove;
	};
};

//--- Return only
if (count _priority > 0) then {

	//--- Set new value
	bis_functions_mainscope setvariable [_priorityVar,_priority];
	_priority
} else {

	//--- Just return
	bis_functions_mainscope getvariable _priorityVar
};
