
/*******************************************************************************
	Version:		0.1
	Name:			Instructor Figure
	Author:			Zozo
	DESCRIPTION:	www.  
	PARAMETERS:		1) function called - string, list of functions:
						- Init
						- Destroy
					2) parameter for the function
					For more informations see https://wiki.bistudio.com/index.php/A3_InstructorFigure
	RETURNED VALUE:	depends on the function called
	
	TODO:	        + PlayTopic
					+ Fade out New Intel text
					+ wait for TAB press
					+ use functions for dynamic text
					- kbTell support
						- logging
						+ rework data structure (add, remove, search)
						- ContainerExists function
			        + display only if difficulty is low
					+ disableSerialization
					+ GetTopics should return array, not just debuglog info
					+ deny play more than one topic in a time
					+ Localize
					+ check and fix return values of functions
					+ correct debuglog informations
					- deny addtopic during playing
					+ safe work with BIS_GroupCommunication - dont overwrite user menus
					+ remove INSTRUCTOR FIGURE from BIS_GroupCommunication  
					+ PlayTopicRandom - rule exceeding selection of a previous sentence
*******************************************************************************/

//Variables
private[ "_functionCalled", "_returnValue", "_paramForFunction1", "_paramForFunction2" ];
//Functions interface
private[ "_Init", "_Destroy" ];

/*******************************************************************************
 *	Name:			Init - constructor
 *	Description:	Initializes the Instructor Figure
 *	Parameters:		1) 
 *	Return value:	none
 ******************************************************************************/
_Init = 
{
	private	[ "_topics, _defaultTopic", "_index", "_INSTRUCTOR_menu" ];
		
	if(isNil "BIS_InstructorFigure") then
	{
		BIS_InstructorFigureGroup = createGroup sideLogic;
		BIS_InstructorGroup = createGroup WEST;
		//"Logic" createUnit [[0,0,0], BIS_InstructorFigureGroup, "BIS_InstructorFigure = this"];
		"Logic" createUnit [[0,0,0], BIS_InstructorGroup, "BIS_InstructorFigure = this; this setGroupID [""Instructor"", ""GroupColor0""]"];
		PublicVariable "BIS_InstructorFigure";
		
		//"B_Soldier_F" createUnit [position player, BIS_InstructorGroup, "BIS_Instructor = this; this setGroupID [""Instructor"", ""GroupColor0""]"];
				
		_topics = [];                                       
		_defaultTopic = [ "Figure_1_name", "Instructor_Figure_container", "Figure 1 name", -1 ];
		
		_topics = _topics + [_defaultTopic];
		
		BIS_InstructorFigure setVariable ["playingtopic", false, TRUE];
		BIS_InstructorFigure setVariable ["lastplayedtopic", [ -1, -1 ], TRUE];	//store last played figure form topic
		BIS_InstructorFigure setVariable ["topics", _topics, TRUE];				
		
		_index = player createDiarySubject ["Instructor", localize "STR_A3_InstructorFigure_subject"];        //create Instructor diary category where we will store played figures
		
		["=================Instructor Figure================="] call BIS_fnc_Log;
		["[Instructor Figure] Successfully initialized:"] call BIS_fnc_Log;
		["==============================================="] call BIS_fnc_Log;
		
		_returnValue = true;
	}
	else
	{
        ["=================Instructor Figure================="] call BIS_fnc_Log;
		["[Instructor Figure] Already initialized:"] call BIS_fnc_Log;
		["==============================================="] call BIS_fnc_Log;
		_returnValue = false;
	};
	_returnValue
};

//Destroy(): deinitialize the Respawn manager
_Destroy = 
{	
	deleteVehicle BIS_InstructorFigure;
	BIS_InstructorFigure = nil;
	deleteGroup BIS_InstructorFigureGroup;
		
	["=================Instructor Figure================="] call BIS_fnc_Log;
	["[Instructor Figure] Deinitialized:"] call BIS_fnc_Log;
	["==============================================="] call BIS_fnc_Log;
	true;
};
/*******************************************************************************
 *	Name:			ContainerExists	
 *	Description:	Looks for existing conversation in cfgSentences 
 *	Parameters:		1] topic|string	 
  *	Return value:   true or false
 *	Note:			  
 ******************************************************************************/
private["_ContainerExists"];
_ContainerExists = 
{
	//private [ "_topic", "_tmptopic", "_tmpfigures", "_alltopics", "_value", "_retvalue", "_topictitletext", "_allfigures", "_lcINSTRUCTOR_menu", "_cmdMenuRecord" ];
	//_array = [_this,0,[],[[]]] call bis_fnc_param;
	true
};

/*******************************************************************************
 *	Name:            GetTopics	
 *	Description:     Returns all topics available
 *	Parameters:	     none
 *	Return value:    Array of topics (also includes name of the container - topic itself is returnedarray select 0) 
 ******************************************************************************/
private["_GetTopics"];
_GetTopics = 
{
	private[ "_alltopics", "_xLoop", "_yLoop" ];
	_alltopics = BIS_InstructorFigure getVariable "topics";
	"=================Instructor Figure=================" call BIS_fnc_Log;
	"                    TOPIC LIST                      " call BIS_fnc_Log;
	"====================================================" call BIS_fnc_Log;
	_tmptopicname = [];
	_xLoop = -1;
	while{ _xLoop = _xLoop + 1; _xLoop < (count _alltopics) } do
	{
		_tmptopic = _alltopics select _xLoop;
		_tmptopicname = _tmptopicname + [_tmptopic]; 
		 [ "[%1] %2", (_tmptopic select 1), (_tmptopic select 0)] call BIS_fnc_LogFormat;
	};
		"=======================LIST END======================" call BIS_fnc_Log;
	_tmptopicname
};

/*******************************************************************************
 *	Name:			AddTopic	
 *	Description:	Adds a topic with figures
 *	Parameters:		1] topic|string	 
 *					2] figures|array of strings
 *	Return value:   none
 *	Note:			Already existing topic will not be added  
 ******************************************************************************/
private["_AddTopic"];
_AddTopic = 
{
	private [ "_topic", "_tmptopic", "_tmpfigures", "_alltopics", "_value", "_retvalue", "_topictitletext", "_allfigures", "_lcINSTRUCTOR_menu", "_cmdMenuRecord", "_tmpconvname" ];
	_array = [_this,0,[],[[]]] call bis_fnc_param;
	_tmptopic = [_array,0,"",[""]] call bis_fnc_param;
	_tmpcontainer = [_array,1,missionname,[""]] call bis_fnc_param;
	_tmpconvname = [_array,2,missionname,[""]] call bis_fnc_param;
	_tmpchannel = [_array,3,"",[""]] call bis_fnc_param;
		
	
	_alltopics = BIS_InstructorFigure getVariable "topics";
	_retvalue = false;
	//_lcINSTRUCTOR_menu = BIS_InstructorFigure getVariable "INSTRUCTOR_menu";
		
	
	if( isInstructorFigureEnabled ) then
	{ 
		_value = [ "TopicExists", [_tmptopic ] ] call BIS_fnc_InstructorFigure;
		if( _value == -1 ) then
		{
			if !( [ "ContainerExists", [_tmptopic ] ] call BIS_fnc_InstructorFigure ) then {exit};
		};
		if( _value == -1 ) then
		{
			_topic = [];
			_topic = _topic + [_tmptopic];
			_topic = _topic + [_tmpcontainer];
	        _topic = _topic + [_tmpconvname];		//name of topic which will be displayed in the communication menu 
			
			
			private "_params";
			_params = [ player, "Training_InstructorFigure", _tmpconvname, _tmptopic, "InstructorFigure" ] call BIS_fnc_addCommMenuItem;                 
			
			_topic = _topic + [_params];				//index in the comm menu - for later remove
			_topic = _topic + [-1];					//added last played sentence 
			_topic = _topic + [_tmpchannel];			//channel to be played over
			_alltopics = _alltopics + [_topic];
		    BIS_InstructorFigure setVariable ["topics", _alltopics, TRUE];
		    
			_retvalue = true;
		} 
		else
		{
			["Topic %1 is already in the system!", _tmptopic] call BIS_fnc_LogFormat;
		};
	};
	
	_retvalue;	
};

/*******************************************************************************
 *	Name:			TopicExists	
 *	Description:	Looks for the Topic's name
 *	Parameters:		1] topic|string	 
 *	Return value:   If found, returns position, otherwise -1
 *	Note:			 
 ******************************************************************************/
private["_TopicExists"];
_TopicExists = 
{
	private [ "_topic", "_tmptopic", "_tmpfigures", "_alltopics", "_xLoop", "_position" ];
	_array = [_this,0,[],[[]]] call bis_fnc_param;
	_tmptopicname = [_array,0,"",[""]] call bis_fnc_param;
	
	
	_alltopics = BIS_InstructorFigure getVariable "topics";
	_position = -1;
	_xLoop = count _allTopics;
	while { _xLoop >= 0 } do
	{
		if( _tmptopicname == (( _alltopics select _xLoop ) select 0) ) then 
		{ 
			//DEBUGLOG format [ "Found on position %1", _xLoop ];
			_position = _xLoop;
			exit; 
		}; 
		_xLoop = _xLoop - 1;
	};	
	_position
};
/*******************************************************************************
 *	Name:			PlayCore	
 *	Description:	Plays core  
 *	Parameters:		1] topic|string	 
 *	Return value:   
 *	Note:			Not needed now (kbTell is used instead)			 
 ******************************************************************************/
private["_PlayCore"];
_PlayCore = 
{
	
	/*
	private [ "_tmptopic", "_tmpfigure", "_figuretoplay", "_currenttopic" ];
		
	 //["_this:%1", _this ] call BIS_fnc_LogFormat;                 
	
	_tmptopic = [_this,0,0,[0]] call bis_fnc_param;
	_tmpfigure = [_this,1,0,[0]] call bis_fnc_param;
	
	_alltopics = BIS_InstructorFigure getVariable "topics";
	_currenttopic = ( _alltopics select _tmptopic );
	_currenttopic set [(count _currenttopic) - 1 , _tmpfigure];					//update last played figure
	//DEBUGLOG format [ "Playing = %1", _currenttopic select _tmpfigure];
	BIS_InstructorFigure commandChat (_currenttopic select _tmpfigure) ;
	
	"Logic" createUnit [position player, Group player, "BIS_Expo = this"];
	private ["_rand"];
	_rand = floor random 3;
	xx = ["01_B_ExpoWelcome", "Faction_BLUFOR", [["EXB",_rand],["EXB",_rand]], "SIDE", { sleep 1 }] spawn BIS_fnc_kbTell;
	["01_O_ExpoWelcome", "Faction_BLUFOR", nil, "SIDE", { sleep 1 }] spawn BIS_fnc_kbTell;
	*/
	
	nil		
};
/*******************************************************************************
 *	Name:			PlayTopicRandom	
 *	Description:	Plays one random figure from given topic  
 *	Parameters:		1] topic|string	 
 *	Return value:   If successful true, otherwise false
 *	Note:			 
 ******************************************************************************/
private["_PlayTopicRandom"];
_PlayTopicRandom = 
{
	_retvalue = false;
	if( (BIS_InstructorFigure getVariable "playingtopic") ) then
	{
		"ANOTHER TOPIC IS BEING PLAYED - TRY IT LATER!" call BIS_fnc_Log;
	}
	else
	{
		BIS_InstructorFigure setVariable ["playingtopic", true, TRUE];				//block simultaneous plays
		private [ "_tmptopic", "_alltopics", "_xLoop", "_value", "_position", "_rand", "_currtopic", "_figure", "_lastplayedfigure", "_notchosen" ];
		_array = [_this,0,[],[[]]] call bis_fnc_param;
		_tmptopicname = [_array,0,"",[""]] call bis_fnc_param;
		
		_alltopics = BIS_InstructorFigure getVariable "topics";
		_retvalue = false;
		
		_value = [ "TopicExists", [ _tmptopicname ] ] call BIS_fnc_InstructorFigure;
		if( _value != -1 ) then
		{
			_currtopic = _alltopics select _value;
			_lastplayedfigure = _currtopic select ((count _currtopic) - 1); 
			_notchosen = true;
			while { _notchosen } do
			{
				_rand = ceil random (( count _currtopic ) - 2 );					// -2 becouse last item in the array is "the last played figure" so it will take item from interval (1;x-2) where x is number of items
				if( _rand != _lastplayedfigure ) then { _notchosen = false} ;       //choose only figure that was not played last time
				//Sleep 0.01; 
			};
			[[ _value, _rand ]] call _PlayCore;
			_retvalue = true;
		}
		else
		{
			 "TOPIC NOT FOUND" call BIS_fnc_Log;
		};
		BIS_InstructorFigure setVariable ["playingtopic", false, TRUE];				//unblock
	};
	
	_retvalue;
};
/*******************************************************************************
 *	Name:			PlayTopic	
 *	Description:	Plays all figures from given topic  
 *	Parameters:		1] topic|string	 
 *	Return value:   If successfull index, otherwise -1
 *	Note:			 
 ******************************************************************************/
private["_PlayTopic"];
_PlayTopic = 
{
	_retvalue = false;
	if( (BIS_InstructorFigure getVariable "playingtopic") ) then
	{
		"ANOTHER TOPIC IS BEING PLAYED - TRY IT LATER!" call BIS_fnc_Log;
	}
	else
	{
		BIS_InstructorFigure setVariable ["playingtopic", true, TRUE];				//block simultaneous plays
		private [ "_tmptopic", "_alltopics", "_xLoop", "_value", "_container", "_channel", "_currtopic", "_figure" ];
		_array = [_this,0,[],[[]]] call bis_fnc_param;
		_tmptopicname = [_array,0,"",[""]] call bis_fnc_param;
		_tmptopicdescr = [_array,0,"",[""]] call bis_fnc_param;
		
		 ["topic name:%1", _tmptopicname ] call BIS_fnc_LogFormat;                  
						
		_alltopics = BIS_InstructorFigure getVariable "topics";
		
		_value = [ "TopicExists", [ _tmptopicname ] ] call BIS_fnc_InstructorFigure;
		
		_container = (_alltopics select _value) select 1;
		_channel = (_alltopics select _value) select 5;
		
		_channel = if (_channel != "") then {
			//use defined channel
			_channel
		}
		else {
			//get conversation participants
			private [ "_sentences", "_actors" ];
			_sentences = configFile >> "CfgSentences" >> _container >> _tmptopicname >> "Sentences";
			_actors = [];
			
			for "_i" from 0 to (count _sentences - 1) do {
				private [ "_sentence", "_actorName", "_actor", "_captive" ];
				_sentence = _sentences >> (configName (_sentences select _i));
				_actorName = getText (_sentence >> "actor");
				_actor = missionNamespace getVariable [ _actorName, objNull ];
				
				//handle setCaptive
				_captive = if (captive _actor) then
				{
					_actor setCaptive false;
					true
				}
				else
				{
					false
				};
				
				_actors = _actors + [ [ _actor, _captive ] ];
			};
			
			private "_sameSide";
			_sameSide = {side (_x select 0) != side player} count _actors == 0;
			{if (_x select 1) then {(_x select 0) setCaptive true}} forEach _actors;
			
			private "_tmpveh";
			_tmpveh = vehicle ((_actors select 0) select 0);
			
			if ({vehicle (_x select 0) != _tmpveh} count ( _actors + [ [ player ] ] ) == 0) then
			{
				//all in same vehicle
				"VEHICLE"
			}
			else
			{
				private "_tmpgroup";
				_tmpgroup = group ((_actors select 0) select 0);
				
				if ({group (_x select 0) != _tmpgroup} count ( _actors + [ [ player ] ] ) > 0) then
				{
					if (!(_sameSide)) then
					{
						//must play over global
						"GLOBAL"
					}
					else
					{
						//not all in same group
						"SIDE"
					};
				}
				else
				{
					//let the function decide
					true
				};
			};
		};
		
		
		if( _value != -1 ) then
		{
			["Value:%1", (_alltopics select _value) select 1 ] call BIS_fnc_LogFormat;
			[ 
				_tmptopicname, 
				_container, 
				nil, 
				_channel, 
				[
					{
						 
						private "_sentence";
						_sentence = call compile format [ "localize 'STR_A3_%1'", _this select 2];
						 //["select5:%1", ( _this select 4 ) ] call BIS_fnc_LogFormat;                     
						_x = player createDiaryRecord 
						[
							"Instructor", 										//TODO:localize
							[
								( _this select 4 ) select 0,
								_sentence
								
							]
						];
					},
					[ (_alltopics select _value) select 2 ]
				], 
				true
			] spawn BIS_fnc_kbTell;
		 	
			BIS_InstructorFigure setVariable ["playingtopic", false, TRUE];		//unblock
			_retvalue = true;
		}
		else
		{
			BIS_InstructorFigure setVariable ["playingtopic", false, TRUE];	//unblock
			"Instructor Figure: TOPIC NOT FOUND" call BIS_fnc_Log;
		};
	};
	_retvalue
};

/*******************************************************************************
 *	Name:			RemoveTopic	
 *	Description:	Removes topic from Instructor Figure  
 *	Parameters:		1] topic|string	 
 *	Return value:   If successfull TRUE, otherwise FALSE
 *	Note:			 
 ******************************************************************************/
private["_RemoveTopic"];
_RemoveTopic = 
{
	private [ "_tmptopic", "_alltopics", "_retvalue", "_value", "_arraywithremovedindex" ];
	_array = [_this,0,[],[[]]] call bis_fnc_param;
	_tmptopic = [_array,0,"",[""]] call bis_fnc_param;
		
	_alltopics = BIS_InstructorFigure getVariable "topics";
	_retvalue = false;
		
	
	_value = [ "TopicExists", [ _tmptopic ] ] call BIS_fnc_InstructorFigure;
	if( _value != -1 ) then
	{                 
		[ player, (_alltopics select _value) select 3 ] call bis_fnc_removeCommMenuItem;
		_arraywithremovedindex = [_alltopics, _value] call BIS_fnc_removeIndex;
		BIS_InstructorFigure setVariable ["topics", _arraywithremovedindex];	
	}
	else
	{
		"Instructor Figure: TOPIC NOT FOUND" call BIS_fnc_Log;
	};
	_retvalue
};
/*******************************************************************************
 *	Name:			ShowFigures	
 *	Description:	Show communication menu  
 *	Parameters:			 
 *	Return value:   
 *	Note:			 
 ******************************************************************************/
private["_ShowFigures"];
_ShowFigures = 
{
	//["passed from comm menu:%1", _this ] call BIS_fnc_LogFormat;
	[ "PlayTopic", _this select 0 ] call BIS_fnc_InstructorFigure;
	[ "RemoveTopic", _this select 0 ] call BIS_fnc_InstructorFigure;                  
	true
};

/*******************************************************************************
 *	Name:			ENTRY_POINT	
 *	Description:	Entry point for the Instructor Figure
 *	Parameters:		function called: name of the function without starting 
 *		  			"_" symbol  
 *					[] parameter for the function 
 *	Return value:	it depends on the function called    
 *	NOTE:			The main entry point for the respawn manager
 *					This part calls functions declared above
 *******************************************************************************/
private[ "_functionCalled", "_returnValue", "_subset" ];

_returnValue = false;
_functionCalled = [_this,0,["", objNull], ["", objNull]] call bis_fnc_param;

if( typeName _functionCalled == "OBJECT" ) then
{
	//If called from MODULE
	_functionCalled = "Init";
	_subset = [];
	_subset = _subset + [[ _this, 1] call BIS_fnc_subSelect]; 	
}
else
{
	//If called directly by designer
	_subset = [ _this, 1] call BIS_fnc_subSelect;
};

_functionCalledCode = call compile format [ "_%1", _functionCalled ];

/*
[ "[InstructorFigure::ENTRY POINT] _this: 			%1", _this ] call BIS_fnc_LogFormat;
[ "[InstructorFigure::ENTRY POINT] function: 	%1", _functionCalled ] call BIS_fnc_LogFormat;
[ "[InstructorFigure::ENTRY POINT] params: 			%1", _subset ] call BIS_fnc_LogFormat;
*/
                                                                                          
if!(isNil "BIS_InstructorFigure" && _functionCalled != "Init") then
{
	//if ( call compile format ["typeName _%1 != ""CODE""", _functionCalled] ) then
	if ( isNil {call compile format ["typeName _%1", _functionCalled]} ) then
	{ 
		["InstructorFigure::ENTRY POINT] Function %1 doesn't exist!", _functionCalled ] call BIS_fnc_LogFormat;
		_returnValue = false;
	}
	else
	{
     	_returnValue = _subset call _functionCalledCode; 
		//[ "_returnValue is: %1", _returnValue ] call BIS_fnc_LogFormat;
	};
} 
	else
{
	["[InstructorFigure::ENTRY POINT]: Initialize the Instructor Figure system first using Init parameter please!"] call BIS_fnc_LogFormat;
	_returnValue = false;
};
 
_returnValue

