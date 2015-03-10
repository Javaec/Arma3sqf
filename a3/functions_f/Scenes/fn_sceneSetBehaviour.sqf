
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:		sceneSetBehaviour
 *	description:	Enables/disables AI (move, target, etc...) - usefull for scenes   
 *	author:		zozo
 *	parameters:	described bellow	
 *	return value:	NOTHING
 *	  
 ******************************************************************************/ 

private["_allParticipants", "_mode", "_level"];


_mode 			= _this select 0;		//variants are {enableAI, disableAI}
_allParticipants 	= _this select 1;		//who use it on

if((count _this) > 2) then
{
	_level		= _this select 2;		//level of dumbness - 0 is most dumbness 
}else
{
	_level		= 0;
};


switch(_mode) do
{
	case "disableAI":
	{
	  {_x setVariable ["BIS_noCoreConversations", true, true]} forEach _allParticipants;		
		switch(_level) do
		{
			case 0:
			{
				// total stupid
				{
					_x stop true;
					_x disableAI "ANIM";
					_x disableAI "MOVE";
					_x disableAI "AUTOTARGET";
					_x disableAI "TARGET";
					if(!isNil"BIS_debugModules") then
					{
						textLogFormat["Freezing: %1 - (level 0) ALL AI", _x];
					};
				}forEach _allParticipants;
			};
			case 1:
			{
				// for anims, scenes
				{
					_x stop true;
					_x disableAI "MOVE";
					_x disableAI "AUTOTARGET";
					_x disableAI "TARGET";
					if(!isNil"BIS_debugModules") then
					{
						textLogFormat["Freezing: %1 - (level 1) scenes: STOP, MOVE, AUTOTARGET, TARGET", _x];
					};
				}forEach _allParticipants;
			};
			case 2:
			{
				{
					_x stop true;
					_x disableAI "AUTOTARGET";
					_x disableAI "TARGET";
				if(!isNil"BIS_debugModules") then
				{
					textLogFormat["Freezing: %1 - (level 2) STOP, AUTOTARGET, TARGET", _x];
				};
				}forEach _allParticipants;
			};
			case 3:
			{
				//only targeting 
				{
					_x disableAI "AUTOTARGET";
					_x disableAI "TARGET";
					if(!isNil"BIS_debugModules") then
					{
						textLogFormat["Freezing: %1 - (level 3) AUTOTARGET, TARGET", _x];
					};
				}forEach _allParticipants;
					
			};
		};
	
	};
	case "enableAI":
	{
		{
			_x stop false;
			_x enableAI "ANIM";
			_x enableAI "MOVE";
			_x enableAI "AUTOTARGET";
			_x enableAI "TARGET";
			_x setSpeedMode "NORMAL";
			if(!isNil"BIS_debugModules") then
			{
				textLogFormat["Unfreezing: %1", _x];
			};
		}forEach _allParticipants;
	
	};
};


