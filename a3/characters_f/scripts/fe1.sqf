/*

 Coordination between members of squad - gestures and voice
 by Vilem

*/

//textLogFormat ["COOR_ fe1.sqf %1",_this];


if (isnil ("coordCoverMovement")) exitWith {false};
if (!coordCoverMovement) exitWith {false};


sleep random 1;

/*
_p0 = _this select 0;
_p1 = _this select 1;
_p2 = _this select 2;
_p3 = _this select 3;

player globalChat format["%1 %2 %3 %4",_p0,_p1,_p2,_p3];
*/

/* do less often
_random = floor (random 10);
if (_random < 8) exitWith{0};
*/


_sentence = "";
_gesture = "";


_random = floor (random 6);

switch (_random) do 
{
	case 0: 
	{
		_sentence = "SayCovering";
	};

	case 1: 
	{
		_sentence = "SayYougo";
		_gesture = "GestureGo";
	};
	
	case 2:	
	{
		_sentence = "SayIwillcover";
	};
	
	case 3:
	{
		_sentence = "SayMove";
	};
	
	case 4:
	{
		_sentence = "SayMovefast";
	};
	
	case 5:
	{
		_sentence = "SayRun";
	};
	
  	
	default
	{
		_sentence = "SayGo";
		_gesture = "GestureGo";
	};
};

_unit = _this select 0;


_playerGrp = group player;
_unitGrp = group _unit;




//if (_unitGrp != _playerGrp) exitWith{false};
	if ((side player) != (side _unit)) exitWith{false};
//if ((count units _unitGrp) > 4) exitWith{false};


if (_unit distance player < 20) then 
{
	_unit globalChat format["%1 Cover reached.",_unit];
  _unit kbTell[player,"core",_sentence];	
  _unit playAction _gesture;
};

if (_unit distance player > 20) then 
{
	_random = floor (random 10);
	if (_random < 9) exitWith{0};

	_unit globalChat "Radio - Cover reached.";
  _unit kbTell[player,"core",_sentence];	
  _unit playAction _gesture;
};

