
/*******************************************************************************
	Version:	2.0
	Name:		Respawn manager
	Author:		Zozo
	DESCRIPTION:	All checkpoints must be markers with name prefix BIS_checkpointnr  
	PARAMETERS:	1) function called - string, list of functions:
				- Init
				- Destroy
				- AddCheckpoint
				- RemoveCheckpoint			
			2) parameter for the function
			For more informations see https://wiki.bistudio.com/index.php/RespawnManager
	RETURNED VALUE: depends on the function called
	
	TODO:		-performance: add markers positions to the array instead of the testing 
			their positions every loop in _CheckNearestCheckpoint function - DONE
			-pridat funkci GetActualCheckpoint(character) - DONE 
			-osetrit pripad, kdy postava neexistuje (je prave v respawnu/zahynula) - NEPOTREBUJEME
			-typy markeru podle modu: normal/debug - DONE
			-optional parameter marker name - DONE
			-optional prefix marker name as a parameter to the Init procedure
			-add functionality for 3 parameters function call - DONE
			-vlastni lokalni checkpointy(markery) pro hratelne postavy(AddCheckpoint/RemoveCheckpoint)
*******************************************************************************/
DEBUGLOG "Started";
//Variables
private["_functionCalled", "_returnValue", "_paramForFunction1", "_paramForFunction2"];
//Functions interface
private["_Init", "_Destroy", "_AddCheckpoint", "_RemoveCheckpoint"];
//Functions internal
private["_CheckNearestCheckpoint",
	"_CheckRespawnPointInLoop", 
	"_ShowCheckpoints", 
	"_ScanForAllCheckpoints", 
	"_SetNearestCheckpoint", 
	"_GetNearestCheckpoint"];

/*******************************************************************************
 *	Name:		Init - constructor
 *	Description:	Initializes the Respawn manager
 *	Parameters:	1) respawners|array - all respawning characters
 *	Return value:	none
 ******************************************************************************/
_Init = 
{
	private	[	"_respawners", "_tempActualCheckpoints", "_respawnMarker", "_checkPointPosition", "_marker", "_RESPAWN_DELAY", "_RESPAWN_COUNT",
			"_CheckpointMarkerType", "_CHECKPOINTMARKERTYPEDEFAULT", "_amountOfCheckpoints", "_returnValue", "_safePositions"
		];
		
	_respawners = (_this select 0) select 0;
	_safePositions = (_this select 0) select 1;
	
	
	_CheckpointMarkerType = _this select 1;
	if(isNil "BIS_RespawnManager") then
	{
		BIS_RespawnManagerGroup = createGroup sideLogic;
		"Logic" createUnit [[0,0,0], BIS_RespawnManagerGroup, "BIS_RespawnManager = this"];
		PublicVariable "BIS_RespawnManager";
		_RESPAWN_DELAY = 5;
		_RESPAWN_COUNT = 100;
		_CHECKPOINTMARKERTYPEDEFAULT = "EMPTY";				//15.06.2010 - default changed to EMPTY
		switch(_CheckpointMarkerType) do							//if true set markers visible
		{
			case "":
			{_CheckpointMarkerType = _CHECKPOINTMARKERTYPEDEFAULT};			
			case "true":
			{_CheckpointMarkerType = _CHECKPOINTMARKERTYPEDEFAULT};
			case "false":
			{_CheckpointMarkerType = "EMPTY"};
			default
			{_CheckpointMarkerType = "EMPTY"};
		};
		BIS_RespawnManager setVariable ["Respawners", _respawners, TRUE];
		BIS_RespawnManager setVariable ["CheckpointMarkerType", _CheckpointMarkerType, TRUE];		//checkpoints are visible, otherwise "empty" marker
		BIS_RespawnManager setVariable ["CheckpointPrefix", "BIS_checkpointnr", TRUE];			//Checkpoint prefix
		BIS_RespawnManager setVariable ["Checkpoints", [], TRUE];					//Array of markers
		BIS_RespawnManager setVariable ["NextCheckpointNr", 1, TRUE];					//next checkpoint number (in case of add operation) 
		BIS_RespawnManager setVariable ["ScanEnabled", true, TRUE];					//execute scanning checkpoints 
		BIS_RespawnManager setVariable ["serNr", 0, TRUE];							//serial number for the name compiling for units without a names
		BIS_RespawnManager setVariable ["Positions", ["gunner", "driver", "commander", "cargo"], TRUE];
		//BIS_RespawnManager setVariable ["SafePositions", [[],[]], TRUE];					//safe positions, if findsavepos will not find any
		
		
		_tempActualCheckpoints = [];
		RespawnersCrew = [] ;
		{
			_tempActualCheckpoints = _tempActualCheckpoints + [[_x, ""]];			//set empty actual checkpoint for each character
		}forEach _respawners;
		BIS_RespawnManager setVariable ["ActualCheckpoints", _tempActualCheckpoints, TRUE];	//Actual nearest checkpoints for each character
		
		private["_safePositionsCount", "_xxLoop"];
		_safePositionsCount = (count _safePositions);
		_defaultSafePos = [8179.12, 1881.57, 0];

		_xxLoop = 0;
		{											//Save safe position for every character in case findsavepos will not find proper safe position
			if(_safePositionsCount > 0) then
			{
				_x setVariable ["savepos", _safePositions select _xxLoop, true];	//save it to the local player space
				_xxLoop = _xxLoop + 1;
			}
			else
			{
				_x setVariable ["savepos", _defaultSafePos, true];			//if designer wasnt provide any safe pos, we will use the default
			};
		} forEach _respawners;
	
		
		//_amountOfCheckpoints =  ([] call _ScanForAllCheckpoints);				//check all checkpoints markers in the mission
		if((([] call _ScanForAllCheckpoints) - 2) != 0) then
		{
			_tempActualCheckpoints = (BIS_RespawnManager getVariable "Checkpoints");	//
			DEBUGLOG format ["=================RespawnManager================="];
			DEBUGLOG format ["RespawnManager: Manager successfully initialized:"];
			DEBUGLOG format ["================================================"];
			{
				DEBUGLOG format ["RespawnManager: %1", _x];
			}forEach _tempActualCheckpoints;
			DEBUGLOG format ["Respawners:"];
			{
				DEBUGLOG format ["RespawnManager: %1", _x];
			}forEach (BIS_RespawnManager getVariable "Respawners");
			
			DEBUGLOG format ["================================================"];
		}
		else											//if there is no checkpoint in the mission
		{
			DEBUGLOG format ["=================RespawnManager================="];		//tell it to the console 
			DEBUGLOG format ["RespawnManager: ERROR: At least one checkpoint must be in the mission"];
			DEBUGLOG format ["RespawnManager: Manager initialization FAILED:"];
			DEBUGLOG format ["================================================"];			
			_returnValue = false;
			[] call _Destroy;								//and get away
		};
		
		{
			//IMPORTANT: 
			//Eventhandlers must be distributed by MPF, becouse 'killed' and 'hit' events are 
			//executed only localy   
			private["_code1", "_code2"];
					
			_code1 = "
					_whoDied = (_this select 0);						
					[""SetNearestCheckpoint"", _whoDied] call BIS_fnc_RespawnManager;
					DEBUGLOG format [""RespawnManager: Player %1 died"", _whoDied];				 	
				";
			_code2 = "
					DEBUGLOG format [""RespawnManager: this = %1"", _this];
					private[""_oldUnit"", ""_newUnit"", ""_tempActualCheckpoints"", ""_actualCheckpointAndUnit"", ""_nearestCheckpoint""];
					private[""_oldUnitMagazines"", ""_oldUnitWeapons"", ""_oldUnitTasks"", ""_tmpRespawners""];
					_newUnit = (_this select 0);
					_oldUnit = (_this select 1);
					_oldUnitMagazines = magazines _oldUnit;
					_oldUnitWeapons = weapons _oldUnit;
										
					
					_tmpRespawners = BIS_RespawnManager getVariable ""Respawners"";
					_tmpRespawners = _tmpRespawners - [_oldUnit] + [_newUnit];
					BIS_RespawnManager setVariable [""Respawners"", _tmpRespawners, true];
					
																				
					DEBUGLOG format[""RespawnManager:_oldUnit magazines = %1"", _oldUnitMagazines];
					DEBUGLOG format[""RespawnManager:_oldUnit weapons = %1"", _oldUnitWeapons];
					DEBUGLOG format[""RespawnManager:_oldUnit tasks = %1"", _oldUnitTasks];
					removeAllWeapons _newUnit;
					{
						_newUnit addMagazine _x	
					}forEach _oldUnitMagazines;
					{
						_newUnit addWeapon _x	
					}forEach _oldUnitWeapons;
					_newUnit selectWeapon (currentWeapon _oldUnit);
										
					
					_nearestCheckpoint = (BIS_RespawnManager getVariable ""Checkpoints"") select 0;	
															
					_tempActualCheckpoints = BIS_RespawnManager getVariable ""ActualCheckpoints"";
					{
						_actualCheckpointAndUnit = _x;
						if(_oldUnit in _actualCheckpointAndUnit) then				
						{
							_nearestCheckpoint = _actualCheckpointAndUnit select 1;		
							_actualCheckpointAndUnit set [0, _newUnit];			
						};
					}forEach _tempActualCheckpoints;
					DEBUGLOG format[""_oldUnit:%1|vehicle _oldUnit:%2"", vehicle _oldUnit, _oldUnit];	
					DEBUGLOG format[""crew: %1"", _oldUnit getVariable ""vehicleCrew""];
					DEBUGLOG format[""crew: %1"", _newUnit getVariable ""vehicleCrew""];
					if(isNil(compile format[""%1_Vehicle"", _oldUnit])) then
					{
						DEBUGLOG format[""RespawnManager:Moving NOT to the %1_Vehicle"", _newUnit];
						markerpos _nearestCheckpoint;
							
					}					
					else
					{
						DEBUGLOG format[""Moving to the %1_Vehicle"", _newUnit];
						if(!alive (call compile format[""%1_Vehicle"", _newUnit])) then
						{
							DEBUGLOG format[""RespawnManager:BUT DOESNT ALIVE"", _newUnit];
						};
						if(!canmove (call compile format[""%1_Vehicle"", _newUnit])) then
						{
							(call compile format[""%1_Vehicle"", _newUnit]) setpos [10,10,0];	
							(call compile format[""%1_Vehicle"", _newUnit]) setdamage 1;
						};
						[_newUnit, _nearestCheckpoint, _oldUnit]spawn
						{
							_newUnit = _this select 0;
							_nearestCheckpoint = _this select 1;
							_oldUnit = _this select 2;
							_t = time + 6;
							DEBUGLOG format[""RespawnManager:Waiting for vehicle %1_Vehicle respawn"", _newUnit];
							WaitUntil{alive (call compile format[""%1_Vehicle"", _newUnit])};
							DEBUGLOG ""RespawnManager:Vehicle respawned!"";
							
							
							_newpos1 = [markerpos _nearestCheckpoint, 0, 80, 15, 0, 60 * (pi / 180), 0, [], [(_newUnit getvariable ""savepos""), []]] call BIS_fnc_findSafePos;
							call compile format[""%1_Vehicle setpos _newpos1"", _newUnit];
							DEBUGLOG format[""RespMan: crew: %1"", _newUnit getVariable ""vehicleCrew""];
							_xCrew = _newUnit getVariable ""vehicleCrew"";
							[""ReplaceNullObjectInArray"", [_newUnit]] call BIS_fnc_RespawnManager;
						
							_newUnit setVariable [""vehicleCrew"", _xCrew, true];
							
							[""RespawnCrew"", [(call compile format[""%1_Vehicle"", _newUnit]), _xCrew, _newUnit]] call BIS_fnc_RespawnManager;
							true
						};
						
					};
				 															 	
				";
			x = [objNull, _x, "per", rSPAWN, [str _x, _code1], {(call compile (_this select 0)) addEventHandler ["killed", _this select 1];}] call RE;		
			x = [objNull, _x, "per", rSPAWN, [str _x, _code2], {(call compile (_this select 0)) addEventHandler ["respawn", _this select 1];}] call RE;
			//_nic = [objnull, _x, "locper", rADDEVENTHANDLER, "killed", _code1] call RE;
			//_nic = [objnull, _x, "locper", rADDEVENTHANDLER, "respawn", _code2] call RE;
			
			if(isNil(compile format["%1_Vehicle", _x])) then
			{
				DEBUGLOG format["RespMan: %1 is without a vehicle", _x];
			}
			else	
			{
				DEBUGLOG format["RespMan: %1 has vehicle", _x];
				_crew = [(call compile format["%1_Vehicle", _x]), _x] call _CheckTheVehicleCrew;
				(call compile format["%1", _x]) setVariable ["vehicleCrew", _crew, true];
				private["_myCode2"];
				_myCode2 = 
				{
					private ["_what"];
					_what = _this select 0;
					_what respawnVehicle[-1, 0];		
				};
				[objNull, _x, rSPAWN, [(call compile format["%1_Vehicle", _x])], _myCode2] call RE;
				
			};
			

			DEBUGLOG format ["RespawnManager: unit:%1|vehicle Unit:%2", _x, vehicle _x];
			//DEBUGLOG format ["RespawnManager: Adding respawn to %1", _x];
		}foreach _respawners;
		
		//[] call _CheckRespawnPointInLoop;									//no more needed, markers are set in the events callback functions
		_returnValue = true;
	}
	else
	{
		DEBUGLOG "RespawnManager: Already initialized";
		_returnValue = false;
	};
	_returnValue
};

//Destroy(): deinitialize the Respawn manager
_Destroy = 
{
	//call compile format ["deleteMarker ""%1"" ", (BIS_RespawnManager getVariable "RespawnMarker")];
	BIS_RespawnManager setVariable ["ScanEnabled", false, TRUE];				//stop scanning checkpoints 
	deleteVehicle BIS_RespawnManager;
	BIS_RespawnManager = nil;
	deleteGroup BIS_RespawnManagerGroup;
	DEBUGLOG "RespawnManager: Deinitialized";
	true;
};

/*******************************************************************************
 *	Name:		ScanForAllCheckpoints
 *	Description:	Gets all checkpoints in the missions - markers with
 *			the prefix saved in "CheckpointPrefix" 
 *	Parameters:	none
 *	Return value:	number of the checkpoints found   
 ******************************************************************************/
_ScanForAllCheckpoints = 
{
	private["_scanEnabled", "_checkPointNumber", "_checkPointPrefix", "_checkPointPosition", "_checkPointsArray"];
	_checkPointNumber = BIS_RespawnManager getVariable "NextCheckpointNr";
	_checkPointPrefix = BIS_RespawnManager getVariable "CheckpointPrefix";
	_checkPointsArray = BIS_RespawnManager getVariable "Checkpoints";
	
	_scanEnabled = true;
	while{_scanEnabled} do								
	{
		_checkPointName = _checkPointPrefix + str(_checkPointNumber);
		_checkPointPosition = getMarkerpos _checkPointName;
		if((_checkPointPosition select 0 != 0) && (_checkPointPosition select 1 != 0)) then 
		{
			call compile format["_checkPointsArray = _checkPointsArray + [%1]", str(_checkPointName)];
		}
		else
		{
			_scanEnabled = false;
		};
		_checkPointNumber = _checkPointNumber + 1;
		//Sleep 0.1;	
	};
	BIS_RespawnManager setVariable ["Checkpoints", _checkPointsArray, TRUE];
	BIS_RespawnManager setVariable ["NextCheckpointNr", (_checkPointNumber-1), TRUE];	//save the next possible number (in case of add operation)
	_checkPointNumber	
};

/*******************************************************************************
 *	Name:		CheckRespawnPointInLoop
 *	Description:	Continously checking the nearest checkpoint for each character
 *	Parameters:	none - takes global variables
 *	Return value:	none	   
 *	NOTE:		disabled - mot needed, markers are set in the event's 
 *			callback procedures 
 ******************************************************************************/
_CheckRespawnPointInLoop =
{
	[]spawn
	{
		private["_respawner", "_tempActualCheckpoints", "_actualCheckpointAndUnit", "_nearestCheckpoint"];
		_tempActualCheckpoints = BIS_RespawnManager getVariable "ActualCheckpoints";
		while{(BIS_RespawnManager getVariable "ScanEnabled")} do
		{

			_tempActualCheckpoints = BIS_RespawnManager getVariable "ActualCheckpoints";
			{
				_actualCheckpointAndUnit = _x;
				//DEBUGLOG format ["_actualCheckpointAndUnit=%1", _actualCheckpointAndUnit];
				_respawner = _actualCheckpointAndUnit select 0;
				//DEBUGLOG format ["_respawner=%1", _respawner];
				_nearestCheckpoint = ["CheckNearestCheckpoint", _respawner] call BIS_fnc_RespawnManager;//check nearest to the actual respawner
				_actualCheckpointAndUnit set [1, _nearestCheckpoint];					//can do this way, becouse it is not a copy, it is something like the pointer
				//TODO: performance - BIS_RespawnManager setVariable ["ActualCheckpoints", _actualCheckpointAndUnit, true];//but for MP is needed to update it
				BIS_RespawnManager setVariable ["ActualCheckpoints", BIS_RespawnManager getVariable "ActualCheckpoints", true];//but for MP is needed to update it
				//DEBUGLOG format ["_nearestCheckpoint=%1", _nearestCheckpoint];
				if(isplayer _respawner) then
				{
					//DEBUGLOG format ["respawner: %1 posunuju na %2",_respawner, (markerPos (_actualCheckpointAndUnit select 1))];
					call compile format ["_nic = [nil, _respawner, ""loc"", rSETMARKERPOSLOCAL, ""%1"", (markerPos _nearestCheckpoint)] call RE", (BIS_RespawnManager getVariable "RespawnMarker")];
					//call compile format ["""%1"" setMarkerPosLocal (markerPos _nearestCheckpoint);", BIS_RespawnManager getVariable "RespawnMarker"];
					//player setpos markerpos "respawn_vehicle_west";
				};
				Sleep 1;
			}forEach _tempActualCheckpoints;
			Sleep 1;
		};
		
	}; 
	true
};

/*******************************************************************************
 *	Name:		CheckNearestCheckpoint	
 *	Description:	Checks nearest checkpoint for a character
 *	Parameters:	character|object
 *	Return value:	nearestCheckpoint|String - marker's name   
 ******************************************************************************/
_CheckNearestCheckpoint = 
{
	private["_respawner", "_tempCheckpoints", "_nearestCheckpoint", "_distance", "_checkPoint"];
	_respawner = _this select 0;	
	_tempCheckpoints = BIS_RespawnManager getVariable "Checkpoints";
	_distance = 99999999;
	{
		call compile format["_checkPoint = ""%1""", _x];
		_tempDistance = (_respawner distance (markerpos _checkPoint));
		//DEBUGLOG format ["%1 distance %2 = %3", _respawner, _checkPoint, _tempDistance];
		if(_tempDistance <= _distance) then
		{
			call compile format["_nearestCheckpoint = ""%1""", _checkPoint];
			_distance = _tempDistance;
		}; 	
	}forEach _tempCheckpoints;
	//DEBUGLOG format ["nejblizsi pro %2 je %1", _nearestCheckpoint, _respawner];
	_nearestCheckpoint
};

/*******************************************************************************
 *	Name:		SetNearestCheckpoint	
 *	Description:	Sets nearest checkkpoint as actual for a unit
 *	Parameters:	character|object
 *	Return value:	nothing   
 ******************************************************************************/
//private["_SetNearestCheckpoint"];
_SetNearestCheckpoint =
{
	private["_respawner", "_tempActualCheckpoints", "_actualCheckpointAndUnit", "_nearestCheckpoint"];
	_respawner = _this select 0;
	_tempActualCheckpoints = BIS_RespawnManager getVariable "ActualCheckpoints";
	{
		_actualCheckpointAndUnit = _x;
		if(_respawner in _actualCheckpointAndUnit) then
		{
			_nearestCheckpoint = ["CheckNearestCheckpoint", _respawner] call BIS_fnc_RespawnManager;	//check nearest to the actual respawner
			_actualCheckpointAndUnit set [1, _nearestCheckpoint];
			//_actualCheckpointAndUnit set [0, "SULIN"];
		};
	}forEach _tempActualCheckpoints;	
	true	
};

/*******************************************************************************
 *	Name:		GetNearestCheckpoint	
 *	Description:	Returns the nearest checkpoint
 *	Parameters:	character|object
 *	Return value:	marker|string   
 ******************************************************************************/
private["_GetNearestCheckpoint"];
_GetNearestCheckpoint = 
{
	private["_respawner", "_tempActualCheckpoints", "_actualCheckpointAndUnit", "_nearestCheckpoint"];
	_respawner2 = _this select 0;
	_nearestCheckpoint = BIS_RespawnManager getVariable "Checkpoints" select 0;					//in the case, a character is not found we will return 1st checkpoint
	_tempActualCheckpoints = BIS_RespawnManager getVariable "ActualCheckpoints";
	{
		_actualCheckpointAndUnit = _x;
		DEBUGLOG format["_respawner match: %1 ", (_respawner2 == _x select 0)];	
		if(_respawner2 in _actualCheckpointAndUnit) then
		{
			_nearestCheckpoint = _actualCheckpointAndUnit select 1;
		};
	}forEach _tempActualCheckpoints;
	_nearestCheckpoint	
};

/*******************************************************************************
 *	Name:		RemoveCheckPoint
 *	Description:	Removes checkpoint from checkpoint list
 *	Parameters:	1) checkPointToDelete|String
 *	Return value:	none	   
 ******************************************************************************/
_RemoveCheckpoint = 
{
	private["_tempCheckpoints", "_checkPointToDelete", "_returnValue"];	
	_checkPointToDelete = _this select 0;
	_tempCheckpoints = BIS_RespawnManager getVariable "Checkpoints";
	if((count _tempCheckpoints) != 1) then
	{
		if(_checkPointToDelete in _tempCheckpoints) then
		{
			call compile format ["_tempCheckpoints = _tempCheckpoints - [""%1""]", _checkPointToDelete];
			BIS_RespawnManager setVariable ["Checkpoints", _tempCheckpoints, TRUE];
			call compile format ["deleteMarker ""%1"" ", _checkPointToDelete];
			[] call _ShowCheckpoints;
			_returnValue = true;
		}
		else
		{
			DEBUGLOG format ["=================RespawnManager================="];		 
			DEBUGLOG format ["RespawnManager: ERROR: Marker with given name NOT FOUND"];
			DEBUGLOG format ["RespawnManager: Checkpoint remove FAILED:"];
			DEBUGLOG format ["================================================"];
			_returnValue = false;
		}
	}
	else
	{
		DEBUGLOG format ["=================RespawnManager================="];		 
		DEBUGLOG format ["RespawnManager: ERROR: At least one checkpoint must be in the mission"];
		DEBUGLOG format ["RespawnManager: Checkpoint remove FAILED:"];
		DEBUGLOG format ["================================================"];	
		_returnValue = false;		
	};
	_returnValue
};

/*******************************************************************************
 *	Name:		AddCheckpoint
 *	Description:	Creates marker and adds this checkpoint to the list 
 *			of the checkpoints. Marker will have the next possible
 *			number.	
 *			If you will pass 2nd optional parameter then will 
 *			be created marker with the name you passed. Otherwise
 *			default marker name with suffix number will be created.   		 
 *	Parameters:	1) checkPointPosition|Position - where to create the checkpoint
 *			2) checkpointName|String - OPTIONAL 
 *	Return value:	none   
 ******************************************************************************/
_AddCheckpoint = 
{
	private	[	"_tempCheckpoints", "_checkPointToAdd", "_checkpointNumber", 
			"_checkPointName", "_checkPointPrefix", "_marker",
			"_checkpointPos", "_checkPointNameText"
		];

	_checkpointPos = _this select 0;		
	_tempCheckpoints = BIS_RespawnManager getVariable "Checkpoints";
	if((_this select 1) != "") then
	{
		_checkPointName = _this select 1;
		_checkPointNameText = _checkPointName;
	}
	else
	{
		_checkpointNumber = BIS_RespawnManager getVariable "NextCheckpointNr";
		BIS_RespawnManager setVariable ["NextCheckpointNr", (_checkpointNumber + 1), TRUE];
		_checkPointPrefix = BIS_RespawnManager getVariable "CheckpointPrefix";
		_checkPointName = _checkPointPrefix + str(_checkPointNumber);
		_checkPointNameText = "CheckPoint_" + str(_checkPointNumber);	
	};

	call compile format ["_marker = createMarker [""%1"", _checkpointPos];", _checkPointName];
	_marker setMarkerShape "ICON";
	call compile format ["""%1"" setMarkerType ""%2"";", _checkPointName, BIS_RespawnManager getVariable "CheckpointMarkerType"];
	//call compile format ["""%1"" setMarkerColor ""ColorGreen"";", _checkPointName];
	//DEBUGLOG _checkPointNameText;
	call compile format ["""%1"" setMarkerText ""%2"";", _checkPointName, _checkPointNameText];
	call compile format ["_tempCheckpoints = _tempCheckpoints + [""%1""]", _checkPointName];
	
	BIS_RespawnManager setVariable ["Checkpoints", _tempCheckpoints, TRUE];
	[] call _ShowCheckpoints;
	true
};

/*******************************************************************************
 *	Name:		ShowCheckpoints	
 *	Description:	Show all checkpoints to the debug console
 *	Parameters:	none
 *	Return value:	none   
 ******************************************************************************/
_ShowCheckpoints = 
{
	private["_tempActualCheckpoints"];
	_tempActualCheckpoints = (BIS_RespawnManager getVariable "Checkpoints");
	DEBUGLOG format ["RespawnManager: Checkpoints:"];
	{
		DEBUGLOG format ["RespawnManager: %1", _x];
	}forEach _tempActualCheckpoints;
	true
};

/*******************************************************************************
 *	Name:		CheckTheVehicleCrew	
 *	Description:	Check the crew of given vehicle and return array with
 *			units and theirs parameters 
 *	Parameters:	1) vehicle|object
 *			2) player 
 *	Return value:	Units with params|array
 ******************************************************************************/

_CheckTheVehicleCrew = 
{
	private["_vehicle", "_crew", "_crewParams", "_name", "_class", "_gunner", "_driver", "_commander", "_functionInVehicle", "_playerMP", "_newName"];
	_vehicle =  _this select 0;
	_playerMP = _this select 1;
	
	//DEBUGLOG format["_playerMP:%1", _playerMP];
	_gunner = assignedGunner _vehicle;
	_driver = assignedDriver _vehicle;
	_commander = assignedCommander _vehicle;
	_cargo = assignedCargo _vehicle;
	_crew = crew _vehicle - [_playerMP] - playableUnits;
	_newName = "";
	//_crew = crew _vehicle;
	
		
	_crewParams = [];
	{
		_functionInVehicle = "none";
		_name = _x;
		
		if(vehicleVarName _name == "") then
		{
			_serNr = (BIS_RespawnManager getVariable "serNr") + 1;		//increment of serial number
			_newName = (str _vehicle) + (str _serNr);
			
			call compile format ["%1 = _x; PublicVariable ""%1""; ", _newName];
			_nic = [objNull, _x, rSPAWN, [_x, _newName], {(_this select 0) setVehicleVarName (_this select 1)}] call RE;
			PublicVariable _newName;
			private["_myCode"];
			_myCode = 
			{
				private["_who", "_newName2"];
				_who = _this select 0;
				_newName2 = _this select 1;
				DEBUGLOG format ["_newName: %1", _newName2];
				PublicVariable _newName2;
				_who setVehicleVarName _newName2;
				call compile format["%1 = _who", _newName2];
				
			};
			[objNull, _playerMP, "locper", rSPAWN, [_x, _newName], _myCode] call RE;

			BIS_RespawnManager setVariable ["serNr", _serNr, true];		//save incremented number
			//_x setVehicleVarName _newName; 
		}
		else
		{
			_newName = _name; 
		};
		
		//DEBUGLOG format ["_x = %1", _x];
	
		_class = typeof _x;
		switch(_name) do
		{
			case _gunner:
			{
				_functionInVehicle = "gunner";	
			};
			case _driver:
			{
				_functionInVehicle = "driver";	
			};
			case _commander:
			{
				_functionInVehicle = "commander	";	
			};
			case _cargo:
			{
				_functionInVehicle = "cargo";	
			};	
			default
			{
				
			};
		}; 
		/*
		if(vehicleVarName _name == "") then					//if unit has no name
		{
			//DEBUGLOG str _name;
			private["_serNr"];
						
			_serNr = (BIS_RespawnManager getVariable "serNr") + 1;		//increment of serial number
			//call compile format ["%1_%2 = 1;", _vehicle, _serNr];	//we just will create the name
			_name = (str _vehicle) + str(_serNr);
			//call compile format ["name = %1_%2;", _vehicle, _serNr];
			//_name = (str _vehicle) + str(_serNr);
			//call compile format ["_name = str (%1_%2)", _vehicle, _serNr];	//we just will create the name									
			//DEBUGLOG format ["(%1_%2) = 1;", _vehicle, _serNr];		
			BIS_RespawnManager setVariable ["serNr", _serNr];
				
		};
		*/
		
		call compile format["_crewParams = _crewParams + [[%1, _class, _functionInVehicle]]", _newName];
	}forEach _crew;
	_crewParams
};
_RespawnCrew = 
{ 
	private["_vehicle", "_crew", "_actualUnit", "_name", "_class", "_function"];
	_vehicle = (_this select 0) select 0;
	_crew = (_this select 0) select 1;
	_who = (_this select 0) select 2;
	{
		_actualUnit = _x;
		
		_name = _actualUnit select 0;
		_class = _actualUnit select 1;
		_function = _actualUnit select 2;
	
		DEBUGLOG format ["_actualUnit: %1|%2|%3|%4", _actualUnit,_name,_class,_function];
	
		/*
		if(!isPlayer _name) then
		{
		*/	
			if(_function != "none") then
			{
				//DEBUGLOG format ["Vytvarim jednotku %1", _name];
				if(!alive _name) then
				{
					DEBUGLOG format ["_this = group player createUnit [""%1"", Position player, [], 0, ""CAN_COLLIDE""];", _class];
					call compile format ["_this = group player createUnit [""%1"", Position player, [], 0, ""CAN_COLLIDE""];", _class];
					call compile format ["%1 = _this;", _name];
					call compile format ["_this setVehicleVarName ""%1""", _name];
				};
				call compile format ["_name assignAs%1 _vehicle", _function];
				call compile format ["%1 moveIn%2 %3", _name, _function, _vehicle];	
				
					
				DEBUGLOG format ["%1 will be %2]", _name, _function];
				DEBUGLOG format ["%1 moveIn%2 %3", _name, _function, _vehicle];
			};
		/*			
		};
		*/
				
	}forEach _crew;
	private["_positions", "_playerInVehicle", "_who"];
	_positions = BIS_RespawnManager getVariable "Positions";			//place player on the first empty place	
	_playerInVehicle = false;
	{
		
		if(((_vehicle emptyPositions _x) > 0) && !(_playerInVehicle)) then
		{
			call compile format ["%1 moveIn%2 %3", _who, _x, _vehicle];	
			_playerInVehicle = true;
		};
	}forEach _positions;
	
		
	true
};

_ReplaceNullObjectInArray = 
{
	call compile format 
	["
		private[""_who"", ""_crew"", ""_actualUnit"", ""_name"", ""_i"", ""_j"", ""_class"", ""_func""];
		
		_who = (_this select 0) select 0;
		DEBUGLOG format [""RespawnManager:Replace in array""];
		_i = 0;
		_j = 0;
		{
			_actualUnit = _x; 
			_name = _actualUnit select 0;
			_class = _actualUnit select 1;
			_func = _actualUnit select 2;
			if((typeName _name) == ""OBJECT"") then
			{
				if(isNull _name) then
				{
					_actualUnit set [0, _who];
					_crew set [_i, _actualUnit];	
				};			
			};
			_i = _i + 1;	
		}forEach %1;
	",_who getVariable "vehicleCrew"
	
	];
	
	true	
};



/*
RespawnCrew = 
{ 
	private["_vehicle", "_crew", "_crewParams", "_name", "_class", "_gunner", "_driver", "_commander", "_functionInVehicle","_actualCrewArray", "_extractedArray"];
	_vehicle = _this select 0;
	_extractedArray = []; 
	{
		_actualCrewArray = _x;
		if((_x select 0) == _vehicle) then
		{
			_extractedArray = [_x] call GetVehicleCrew;
		};
	}forEach RespawnersCrew;	
	
	{
		_actualUnit = _x;
		_name = _actualUnit select 0;
		_class = _actualUnit select 1;
		_function = _actualUnit select 2;
		if(!isPlayer _name) then
		{
			call compile format ["%1 = group player createUnit [""%2"", Position player, [], 0, ""FORM""]", _name, _class];
			call compile format ["_name assignAs%1 _vehicle", _function];
			call compile format ["%1 moveIn%2 %3", _name, _function, _vehicle];	
			DEBUGLOG format ["%1 = group player createUnit [""%2"", Position player, [], 0, ""FORM""]", _name, _class];	
			DEBUGLOG format ["%1 will be %2]", _name, _function];
			DEBUGLOG format ["%1 moveIn%2 %3", _name, _function, _vehicle];		
		};
		
	}forEach _extractedArray;
};

GetVehicleCrew = 
{
	private["_vehicle", "_crew", "_actualCrewArray", "_extractedArray"];
	_actualCrewArray = _this select 0;
	_extractedArray = [];	 
	{	
		if(typeName _x == "ARRAY") then
		{
			_extractedArray = _extractedArray + _x;	
		};		
	}forEach _actualCrewArray;	
	_extractedArray		
};
*/

/*******************************************************************************
 *	Name:		ENTRY_POINT	
 *	Description:	Entry point for the respawn manager
 *	Parameters:	function called: name of the function without starting
 *			"_" symbol  
 *			param1 | param2: 2 optional parameters 
 *			for the function called 
 *	Return value:	it depends on the function called    
 *	NOTE:		The main entry point for the respawn manager
 *			This part calls functions declared above
 *			It keeps watch whether the respawn manager has been 
 *			initialized or not.    
 *******************************************************************************/
_paramForFunction1 = "";
_paramForFunction2 = "";
_returnValue = 0;
_functionCalled = _this select 0;
if(count _this > 1) then
{
	_paramForFunction1 = _this select 1;
};
if(count _this > 2) then
{
	_paramForFunction2 = _this select 2;
};

private ["_callString"];

//Here we call the appropriate function passed as a parameter

if!(isNil "BIS_RespawnManager" && _functionCalled != "Init") then
{
	
	
	if(typeName _paramForFunction1 == "STRING") then
	{
		_callString = "_returnValue = [""%1"", ""%3""] call _%2";
	}
	else
	{
		_callString = "_returnValue = [%1, ""%3"" ] call _%2";
	};	
	call compile format [_callString, _paramForFunction1, _functionCalled, _paramForFunction2];
}
else
{
	DEBUGLOG format["RespawnManager: Initialize the manager first using Init parameter please!"];
	_returnValue = false;
};

_returnValue
