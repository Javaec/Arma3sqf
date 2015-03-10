//scriptName "Functions\systems\fn_modulefriendlyfire.sqf";
/*******************************************************************************
	Version:		0.1
	Name:			Friendly Fire
	Author:			Zozo
	DESCRIPTION:	www.  
	PARAMETERS:		1) function called - string, list of functions:
						- Init
						- Destroy
					2) parameter for the function
					For more informations see https://
	RETURNED VALUE:	depends on the function called
	
	TODO:	        + AddUnitToFriendlyFire 
					+ RemoveUnitFromFriendlyFire - will need to change data structure - must remember eventhandlers :-( 
					+ CheckRenegadeStatus
					- StopChecking the status (pause?)
					- RemoveEventhandlers on Destroy - will need to change data structure - must remember eventhandlers :-(
					+ change calling of execVM "fn_moduleFriendlyFire.sqf"
					- Display a warning message if player will shoot a civilian 
					- handle deleted units (clear array from NULL-OBJECT)
*******************************************************************************/

//Functions interface
private[ "_Init", "_Destroy" ];

/*******************************************************************************
 *	Name:			Init - constructor
 *	Description:	Initializes 
 *	Parameters:		1) 
 *	Return value:	none
 ******************************************************************************/
_Init = 
{
	private["_array", "_logic", "_units", "_activated", "_tmpunits", "_unit" ];
	_array = [_this,0,[],[[]]] call bis_fnc_param;
			
	//_logic = [_array,0,objnull,[objnull]] call bis_fnc_param;
	_units = [_array,0,[],[[]]] call bis_fnc_param;
	_activated = [_array,1,true,[true]] call bis_fnc_param;
	
/*
	["[FriendlyFire::Init] _units are: %1", _units ] call BIS_fnc_LogFormat;
	["[FriendlyFire::Init] _array is: %1", _array ] call BIS_fnc_LogFormat;
*/
		
	if(isNil "BIS_FriendlyFire") then
	{
		BIS_FriendlyFireGroup = createGroup sideLogic;
		//BIS_InstructorGroup = createGroup WEST;
		//"Logic" createUnit [[0,0,0], BIS_FriendlyFire, "BIS_FriendlyFire = this"];
		"Logic" createUnit [[0,0,0], BIS_FriendlyFireGroup, "BIS_FriendlyFire = this; this setGroupID [""FriendlyFire"", ""GroupColor0""]"];
		PublicVariable "BIS_FriendlyFire";
			
		_tmpunits = [];
		
		{
			_tmpunits = _tmpunits + [[_x, -1]];  
		}  foreach _units;
		
		["_tmpunit: %1", _tmpunits] call BIS_fnc_LogFormat;



		BIS_FriendlyFire setVariable ["units", _tmpunits, TRUE];
		BIS_FriendlyFire setVariable ["playerkilledfriendly", false, TRUE];
		BIS_FriendlyFire setVariable [ "checkStatusInLoop", true, TRUE ];
		
		[_tmpunits] call _AddEventHandlers;
		[] spawn _Main;
		 
		
		["=================Friendly Fire================="] call BIS_fnc_Log;
		["[Friendly Fire] Successfully initialized:"] call BIS_fnc_Log;
		["==============================================="] call BIS_fnc_Log;
		
		[] call _ListActiveUnits;
		
		_returnValue = true;
	}
	else
	{
        ["=================Friendly Fire================="] call BIS_fnc_Log;
		["[Friendly Fire] Already initialized!"] call BIS_fnc_Log;
		["================================================"] call BIS_fnc_Log;
		_returnValue = false;
	};
	_returnValue
};

//Destroy(): deinitialize the Friendly Fire module
_Destroy = 
{
	deleteVehicle BIS_FriendlyFire;
	BIS_FriendlyFire = nil;
	deleteGroup BIS_FriendlyFireGroup;
		
	["=================Friendly Fire================="] call BIS_fnc_Log;
	["[Friendly Fire] Deinitialized!"] call BIS_fnc_Log;
	["================================================"] call BIS_fnc_Log;
	true;
};

/*******************************************************************************
 *	Name:			ListActiveUnits	
 *	Description:	List active checked units for friendly fire 
 *	Parameters:		none
 *	Return value:   true
 *	Note:			  
 ******************************************************************************/
private["_ListActiveUnit"];
_ListActiveUnits = 
{
	["=================Friendly Fire================="] call BIS_fnc_Log;
	["[Friendly Fire] List of active units:"] call BIS_fnc_Log;
	{ ["- %1", _x select 0] call BIS_fnc_LogFormat; } forEach (BIS_FriendlyFire getVariable "units");
	["================================================"] call BIS_fnc_Log;

};
/*******************************************************************************
 *	Name:			_AddUnits	
 *	Description:	Added units will be checked against Friendly Fire 
 *	Parameters:		none
 *	Return value:   true
 *	Note:			  
 ******************************************************************************/
private["_AddUnits"];
_AddUnits = 
{
	private ["_array", "_units", "_unitscount", "_unit", "_actualunits", "_tmpunits" ];
	
	_array = [_this,0,[],[[]]] call bis_fnc_param;
	_units = [_array,0,[],[[]]] call bis_fnc_param;
		
	_actualunits = BIS_FriendlyFire getVariable "units";
	
	_tmpunits = [];
	{
		if( !isNil "_x" ) then
		{ _tmpunits = _tmpunits + [[_x, -1]] };  
	}  foreach _units; 
	
	{
		_unit = _x select 0;
		//[ "_unit = %1 | _x = %2", _unit, _x] call BIS_fnc_LogFormat;
		_tmpfound = [_actualunits, _unit] call BIS_fnc_findNestedElement;
		//[ "_tmpfound = %1", _tmpfound ] call BIS_fnc_LogFormat;
		if( count _tmpfound == 0 ) then  
		{
			_actualunits = _actualunits + [_x]; 
		};
		//DEBUGLOG format ["_actualunits: %1", _actualUnits]; 
	} forEach _tmpunits;
	
	BIS_FriendlyFire setVariable [ "units", _actualunits, TRUE ];
	
	[_tmpunits] call _AddEventHandlers;
	
	[] call _ListActiveUnits;
		
	true	
};

/*******************************************************************************
 *	Name:			RemoveUnits	
 *	Description:	Added units will be checked against Friendly Fire 
 *	Parameters:		none
 *	Return value:   true
 *	Note:			  
 ******************************************************************************/
private["_RemoveUnits"];
_RemoveUnits = 
{
	private ["_array", "_units", "_unitscount", "_unit", "_actualunits", "_tmpunits", "_foundunit", "_foundhandler", "_actualunits2" ];
	
	_array = [_this,0,[],[[]]] call bis_fnc_param;
	_units = [_array,0,[],[[]]] call bis_fnc_param;
	_actualunits = BIS_FriendlyFire getVariable "units";
		
	{
		if( !isNil "_x" ) then
		{
			_unit = _x;
			_tmpfound = [_actualunits, _unit] call BIS_fnc_findNestedElement;
				
			if( count _tmpfound != 0 ) then  
			{
				_foundunit = (_actualunits select (_tmpfound select 0)) select 0;
				_foundhandler = (_actualunits select (_tmpfound select 0)) select 1; 
				_foundunit removeEventHandler [ "killed", _foundhandler ];
				_actualunits2 = [_actualunits, (_tmpfound select 0)] call BIS_fnc_removeIndex;
				_actualunits = _actualunits2;			  
			};
		};
	} forEach _units;
	
	BIS_FriendlyFire setVariable [ "units", _actualunits, TRUE ];
	
	[] call _ListActiveUnits;

	true	
};

/*******************************************************************************
 *	Name:            AddEventHandlers	
 *	Description:     Add Killed eventhandlers to units passed as a parameter
 *	Parameters:	     none
 *	Return value:    true
 ******************************************************************************/
private["_AddEventHandlers"];
_AddEventHandlers = 
{
	 private["_handler", "_units", "_unit", "_locatedunit", "_tmpunits" ];
	_units = [_this, 0, [], [[]] ] call BIS_fnc_param;
	{
		_unit = _x select 0;
		_handler = _unit addEventHandler
		[
			"killed", 
			{
				_whowaskilled = [ _this, 0, objNull, [objNull] ] call BIS_fnc_Param;
				_whokilledhim = [ _this, 1, objNull, [objNull] ] call BIS_fnc_Param; 
				[ "[Friendly Fire] %1 was killed by %2",_whowaskilled, _whokilledhim ] call BIS_fnc_LogFormat;
				if( _whokilledhim == player ) then
				{
					BIS_FriendlyFire setVariable ["playerkilledfriendly", true, TRUE];
				};
			}
		];
		_locatedunit = ([_units, _unit] call BIS_fnc_findNestedElement) select 0;	//	[2,0]
		[_units, [_locatedunit, 1], _handler] call BIS_fnc_setNestedElement;
						 		
	} forEach _units;
	true
};

/*******************************************************************************
 *	Name:			FriendlyFire	
 *	Description:	Friendly Fire happened - handles the situation 
 *	Parameters:		none
 *	Return value:   true
 *	Note:			  
 ******************************************************************************/
private["_FriendlyFire"];
_FriendlyFire = 
{
	["[Friendly Fire] Friendly Fire happened! Handling the situation"] call BIS_fnc_Log;
	["FriendlyFire", FALSE] call BIS_fnc_endMission;
	[] call _Destroy;	
	true	
};


/*******************************************************************************
 *	Name:			CheckStatus	
 *	Description:	Check status of friendly fire 
 *	Parameters:		none
 *	Return value:   BOOL: renegade status
 *	Note:			  
 ******************************************************************************/
private["_CheckStatus"];
_CheckStatus = 
{
	private["_returnValue","_playerkilledfriendly"];
	//["[Friendly Fire::CheckStatus] Checking status"] call BIS_fnc_Log;
	_returnValue = false;
	_playerkilledfriendly = BIS_FriendlyFire getVariable "playerkilledfriendly";
	if( side player == sideEnemy || _playerkilledfriendly ) then 
	{
		_returnValue = true
	}; 
	_returnValue
};

/*******************************************************************************
 *	Name:			Main	
 *	Description:	Main loop 
 *	Parameters:		none
 *	Return value:   true
 *	Note:			  
 ******************************************************************************/
private["_Main"];
_Main = 
{
	private["_playerKilledFriendly", "_checkInLoop"];
	
	while{ BIS_FriendlyFire getVariable "checkStatusInLoop" } do
	{
		//["[Friendly Fire::Main] Looping"] call BIS_fnc_Log;
		_playerKilledFriendly = ["CheckStatus", []] call BIS_fnc_moduleFriendlyFire;
		if( _playerKilledFriendly ) then
		{
			BIS_FriendlyFire setVariable [ "checkStatusInLoop", false, TRUE ];
		};
		Sleep 1;
	};
	if( _playerKilledFriendly ) then { ["FriendlyFire", []] call BIS_fnc_moduleFriendlyFire; };	
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
[ "[FriendlyFire::ENTRY POINT] _this: 			%1", _this ] call BIS_fnc_LogFormat;
[ "[FriendlyFire::ENTRY POINT] function: 	%1", _functionCalled ] call BIS_fnc_LogFormat;
[ "[FriendlyFire::ENTRY POINT] params: 			%1", _subset ] call BIS_fnc_LogFormat;
*/


if!(isNil "BIS_FriendlyFire" && _functionCalled != "Init") then
{
	//if ( call compile format ["typeName _%1 != ""CODE""", _functionCalled] ) then
	if ( isNil {call compile format ["typeName _%1", _functionCalled]} ) then
	{ 
		["FriendlyFire::ENTRY POINT] Function %1 doesn't exist!", _functionCalled ] call BIS_fnc_LogFormat;
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
	["[FriendlyFire::ENTRY POINT]: Initialize the Friendly Fire system first using Init parameter please!"] call BIS_fnc_LogFormat;
	_returnValue = false;
};
 
_returnValue

