/*

 Coordination between members of squad - gestures and voice
 by Vilem

*/

//textLogFormat ["COOR_ fe2.sqf %1",_this];

if (isnil ("coordCoverMovement")) exitWith {false};
if (!coordCoverMovement) exitWith {false};

sleep random 1;

/* do less often
_random = floor (random 10);
if (_random < 8) exitWith{0};
*/



_sentence = "";
_gesture = "";


_random = floor (random 4);
switch (_random) do 
{//choose what to say / gesture
	case 0: 
	{
		_sentence = "SayCoverme";
	};

	case 1: 
	{
		_sentence = "SayAdvancing";		
	};
	
	case 2:
	{
		_sentence = "SayIgo";
	};
	default
	{		
		_sentence = "SayMoving";
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
	_unit globalChat format["%1 Running.",_unit];
  _unit kbTell[player,"core",_sentence];	
  _unit playAction _gesture;
};

if (_unit distance player > 20) then 
{
	_random = floor (random 10);
	if (_random < 9) exitWith{0};

	_unit globalChat "Radio - Running.";
  _unit kbTell[player,"core",_sentence];	
  _unit playAction _gesture;
};
