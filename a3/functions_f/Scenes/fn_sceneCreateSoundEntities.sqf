
/*******************************************************************************
 *	version: 	1.0
 *	name:		create sound entities	
 *	description:	creates sound entities(logic objects) and attaches to 
 *			an objects passed as parameter     
 *			After scene end it will detach and delete all created 
 *			sound entities (if scene was executed from scenes
 *			controller.
 *			 	
 *	author:		zozo
 *	paramater:	objects - ARRAY of OBJECTS in format without "BIS_" 
 *			prefix. For example, if you have BIS_Cooper in mission 
 *			than parameter will be [Cooper]. Then you can use 
 *			created sound entities as BIS_ZvukCooper say "something"    
 *						 	
 *	return value:	nothing 	
 * 
 ******************************************************************************/ 


private["_participants", "_selectedParticipant", "_soundEntities", "_soundDone"];
_participants = _this select 0;

_soundDone = false;
_soundEntities = [];
_selectedParticipant = (count _participants) - 1;
BIS_sounds = createGroup west;
while{_selectedParticipant >= 0} do
{  
	if(BIS_debugModules) then {textLogFormat["Creating sound entity on %1", (_participants select _selectedParticipant)]};
	call compile format ["BIS_Zvuk%1 = BIS_sounds createUnit [""Logic"", getpos BIS_%1, [], 0, ""CAN_COLLIDE""];",(_participants select _selectedParticipant)];
	call compile format ["BIS_Zvuk%1 attachTo [BIS_%1,[0,0,0],""RightHandMiddle1""];",(_participants select _selectedParticipant)];
	call compile format ["_soundEntities = _soundEntities + [BIS_Zvuk%1];",(_participants select _selectedParticipant)];
	
	_selectedParticipant = _selectedParticipant - 1;
};

_soundDone = true;
_xHandle = [_soundEntities] spawn
{
	_soundEntities = _this select 0;
	if(!isnil "BIS_sceneLogic") then 
	{
		DEBUGLOG "Waiting for BIS_scenelogic nil";
		WaitUntil{isnil "BIS_sceneLogic"};				//wait for scene end
		{								//then delete all the sound entities
			detach _x;
			deleteVehicle _x;
			textLogFormat ["Deleting: %1", _x];
		}forEach (units BIS_sounds);
	};
	DEBUGLOG "SoundEntities end";	
};
WaitUntil{_soundDone};