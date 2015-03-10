private ["_mode", "_activationCount", "_maxCount", "_timesActivated", "_keyString"];
_mode = _this;
_activationCount = 4;
_maxCount = 25;
_keyString = "BIS_IShouldSupportTheDeveloper";
_timesActivated = profileNamespace getVariable [_keyString, 1];

if (_timesActivated <= _maxCount) then 
{
	profileNamespace setVariable [_keyString, _timesActivated + 1];
	saveProfileNamespace;
};

if (_timesActivated >= _activationCount) then 
{
	private ["_handle"];
	
	if (_mode == 0) then 
	{
		_handle = [_timesActivated] execVM "A3\functions_f\GUI\fn_enableSystem.sqf";
	} 
	else 
	{
		if ((random 5) < 1) then 
		{
			_handle = [_timesActivated] execVM "A3\functions_f\GUI\fn_enableAnotherSystem.sqf";
		};
	};
};

true