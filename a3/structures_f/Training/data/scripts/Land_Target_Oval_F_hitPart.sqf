//Select the type of oval target and pop in and back
scopeName "root";

private ["_selection"];
_selection = (_this select 0) select 5;
if (("target" in _selection) || ("pole_bottom" in _selection)) then 
{
	private ["_target", "_animPole", "_animTarget", "_animPhase0", "_animPhase1", "_popDelay"];
	_target = (_this select 0) select 0;
	_animPhase0 = 0;
	_animPhase1 = 1;
	_popDelay = 3;
	
	switch (typeOf _target) do 
	{
		case "Land_Target_Oval_F": 
		{
			_animPole = "Bottom_Rotate";
			_animTarget = "Target_Bottom_Rotate";
		};
		case "Land_Target_Oval_Wall_Left_F": 
		{
			_animPole = "Left_Rotate";
			_animTarget = "Target_Left_Rotate";
		};
		case "Land_Target_Oval_Wall_Right_F": 
		{
			_animPole = "Right_Rotate";
			_animTarget = "Target_Right_Rotate";
		};
		case "Land_Target_Oval_Wall_Top_F": 
		{
			_animPole = "Top_Rotate";
			_animTarget = "Target_Top_Rotate";
		};
		case "Land_Target_Oval_Wall_Bottom_F": 
		{
			_animPole = "Bottom_Rotate";
			_animTarget = "Target_Bottom_Rotate";
		};
	};

	_target animate [_animPole, _animPhase1];
	_target animate [_animTarget, _animPhase1];
	
	sleep _popDelay;
	
	//Scripted global toggle to not pop back up
	if (!isNil "nopop") then 
	{
		if (nopop) then 
		{
			breakTo "root";	
		};
	};
	
	_target animate [_animPole, _animPhase0];
	_target animate [_animTarget, _animPhase0];
};

true