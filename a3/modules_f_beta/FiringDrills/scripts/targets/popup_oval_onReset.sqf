private ["_target", "_animPole", "_animTarget"];
_target = _this select 0;

switch (typeOf _target) do 
{
	case "Land_Target_Oval_NoPop_F": 
	{
		_animPole = "Bottom_Rotate";
		_animTarget = "Target_Bottom_Rotate";
	};
	case "Land_Target_Oval_Wall_Left_NoPop_F": 
	{
		_animPole = "Left_Rotate";
		_animTarget = "Target_Left_Rotate";
	};
	case "Land_Target_Oval_Wall_Right_NoPop_F": 
	{
		_animPole = "Right_Rotate";
		_animTarget = "Target_Right_Rotate";
	};
	case "Land_Target_Oval_Wall_Top_NoPop_F": 
	{
		_animPole = "Top_Rotate";
		_animTarget = "Target_Top_Rotate";
	};
	case "Land_Target_Oval_Wall_Bottom_NoPop_F": 
	{
		_animPole = "Bottom_Rotate";
		_animTarget = "Target_Bottom_Rotate";
	};
};

_target animate [_animPole, 1];
_target animate [_animTarget, 1];

true