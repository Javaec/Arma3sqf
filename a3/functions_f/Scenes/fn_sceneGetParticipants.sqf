
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:		sceneGetParticipants
 *	description:	gets members of group who is in range (_MAXDISTANCE) 
 *	author:		zozo
 *	parameters:	described bellow	
 *	return value:	array of units in range
 *	  
 ******************************************************************************/ 
private["_memberOfGroup","_MAXDISTANCE","_sceneParticipants"];

_memberOfGroup = _this select 0;		//units of group
_MAXDISTANCE = _this select 1;			//distance to catch it

if(isNil("_memberOfGroup")) then {_memberOfGroup = player};
if(isNil("_MAXDISTANCE")) then {_MAXDISTANCE = 30};

_sceneParticipants = [];

{
	if((_x distance _memberOfGroup) < _MAXDISTANCE) then 
	{
		_sceneParticipants = _sceneParticipants + [_x];
	} 
} forEach (units group _memberOfGroup);

DEBUGLOG str _sceneParticipants;
_sceneParticipants;
