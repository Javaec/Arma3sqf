
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:	
 *	description:	play animations recieved as parameter on group 	
 *	author:		
 *	paramater:	group and animation arrays	
 *	return value:	true if all animation started 	
 * 
 ******************************************************************************/     
private["_allParticipants", "_animations", "_whatAnimation", "_animCount", "_next", "_timeout", "_t", "_mode"];
_allParticipants 	= _this select 0;			//who play animations on
_animations 		= _this select 1;			//array of animations
if(count _this >= 2) then {_timeout = _this select 2;};		//how long to wait if anybody stuck
if(count _this >= 3) then {_mode = _this select 3;};		//switchmove = nothing | playmove = 1 
if(isNil"_timeout") then {_timeout = 10;};			//set default timeout
if(isNil"_mode") then {_mode = 0;};				//set default mode
//debuglog str (count _this);
//debuglog str (_mode);
_next 			= 0;
_whatAnimation		= "";
_animCount 		= (count _animations);
if(!isNil"BIS_debugModules") then
{
	DEBUGLOG "SetAnimationsForGroup: =========SetAnimationsForGroup=============";
	textLogFormat ["SetAnimationsForGroup: %1 (nil = switchmove | 0 = playmove)", _mode];
	textLogFormat ["SetAnimationsForGroup: %1", str _allParticipants];
	DEBUGLOG "SetAnimationsForGroup: ============================================";
};

{
	_whatAnimation = (_animations select (_next mod (_animCount)));
	if(_mode == 0) then
	{
		_nic = [objNull, _x, rPLAYMOVENOW, _whatAnimation] call RE;
	}else
	{
		_nic = [objNull, _x, rSWITCHMOVE, _whatAnimation] call RE;
	};
	if(!isNil"BIS_debugModules") then
	{
		textLogFormat["sceneSetAnimationsFrGroup.sqf: %3| %1 | %2",(animationState (_x)), _whatAnimation, _x];
	};
	_next = _next + 1;
	//Sleep 0.01;
}forEach _allParticipants;

_t = time;
WaitUntil{((animationState (_allParticipants select (_next - 1))) == _whatAnimation) || (time > (_t + _timeout))};
if(time > (_t + _timeout)) then
{	
	if(!isNil"BIS_debugModules") then
	{
		textLogFormat["sceneSetAnimationsFrGroup.sqf: DONE but timeout: %3| %1 | %2",(animationState (_allParticipants select (_next - 1))), _whatAnimation, (_allParticipants select (_next - 1))];
	};
}
else
{	
	if(!isNil"BIS_debugModules") then
	{
		textLogFormat["sceneSetAnimationsFrGroup.sqf: DONE: %3| %1 | %2",(animationState (_allParticipants select (_next - 1))), _whatAnimation, (_allParticipants select (_next - 1))];
	};
};

TRUE;
