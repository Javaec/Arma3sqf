/*
	Author: Zozo
	
	Description:
	Earthquake simulation - now just camera shake and sound
	
	Parameter(s):
	_this select 0:	INT - intensity {1,2,3,4}	
	
	Returns:
	NONE
	
*/
private ["_magnitude", "_power", "_duration", "_frequency", "_offset", "_compensation", "_eqsound", "_fatiguedefault", "_fatigue"];
_magnitude = [_this, 0, 2, [0]] call BIS_fnc_param;   
_power = 0.3;
_duration = 20;
_frequency = 100;  
_offset = 1;
_eqsound = "Earthquake_01";
_compensation = 0;
_fatigue = 0.2; 
if( isNil "BIS_fnc_earthquake_inprogress" ) then {BIS_fnc_earthquake_inprogress = false; };

waitUntil{ !BIS_fnc_earthquake_inprogress };
_fatiguedefault = getFatigue player;

switch( _magnitude ) do
{
	case 1: 
	{
		_power = 0.5;
		_duration = 13;
		_compensation = 4;
		_frequency = 200;
		_eqsound = "Earthquake_01";
		_fatigue = 0.4; 
	};
	case 2: 
	{
		_power = 0.8;
		_duration = 20;
		_compensation = 8.5;
		_frequency = 50; 
		_eqsound = "Earthquake_02";
		_fatigue = 0.6;
	};
	case 3: 
	{
		_power = 1.5;
		_duration = 20;
		_compensation = 7;
		_frequency = 40;	
		_eqsound = "Earthquake_03";
		_fatigue = 0.8;	
	};
	case 4: 
	{
		_power = 2.1;
		_duration = 20;
		_compensation = 6;
		_frequency = 30;
		_eqsound = "Earthquake_04";
		_fatigue = 1;		
	};
	default { [ "EarthQuake: number not defined, using default shake" ] call BIS_fnc_Log; }
};	
enableCamShake true;
BIS_fnc_earthquake_inprogress = true;
playsound _eqsound;
"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust [_power/2];
"DynamicBlur" ppEffectCommit _offset;
Sleep _offset;
"DynamicBlur" ppEffectAdjust [0];
"DynamicBlur" ppEffectCommit (_duration - _compensation);
player setFatigue _fatigue;
addCamShake [_power, _duration, _frequency];

_t = time;
Sleep ( _duration - _compensation );
player setFatigue _fatiguedefault;
Sleep 3;
BIS_fnc_earthquake_inprogress = false;



