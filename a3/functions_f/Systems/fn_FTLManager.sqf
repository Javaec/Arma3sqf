
#include "fn_FTLManager.hpp";
/*******************************************************************************
	Version:	1.0
	Name:		FTL manager
	Author:		Zozo
	DESCRIPTION:	FTL tracks relationship between player and civilian side. More on https://wiki.bistudio.com/index.php/FriendlyToLocal_System  
	PARAMETERS:	
	RETURNED VALUE:	
*******************************************************************************/

//Variables
private["_functionCalled", "_returnValue", "_type", "_updateLoop"];
//Functions interface
private["_GetFTLState", "_SetFTLState", "_Init", "_Destroy"];
//Functions internal
private["_SetFTLStateFromFTLValue", "_ComputeOblivionIndex", "_DecodeValueFromTable", "_GetNearestTown"];
_type = "";
_returnValue = 0;
_functionCalled = _this select 0;
if(count _this > 1) then
{
	_type = _this select 1;
};
_updateLoop = 0;
//Init(): initializes the FTL manager
_Init = 
{
	private["_tmpFTL", "_tmpLastNegOp", "_tmpPrevOblivIndex", "_tmpPlayerSide", "_tmpSecondSide", "_tmpPlayerFaction"];
	if(isNil "BIS_FTLManager") then
	{
		BIS_FTLManagerGroup = createGroup sideLogic;
		"Logic" createUnit [[0,0,0], BIS_FTLManagerGroup, "BIS_FTLManager = this"];
		PublicVariable "BIS_FTLManager";
		if(isNil "BIS_FTLValue") then 
		{
			BIS_FTLValue = [];
			_tmpFTL = 0.2;
			_tmpLastNegOp = 0;
			_tmpPrevOblivIndex = 0;
		}
		 else 
		{
			_tmpFTL = BIS_FTLValue select 0;						//if value is not saved in the global campaign space, create new zero value
			_tmpLastNegOp = BIS_FTLValue select 1;						//last negative op from the last mission
			_tmpPrevOblivIndex = BIS_FTLValue select 2;
		};	
		
		if(count _this > 1) then
		{
			_tmpSecondSide = _this select 1;
		}
		else
		{
			_tmpSecondSide = RESISTANCE;							//if side is not passed then RESISTANCE is default	
		};
		_tmpPlayerFaction = "none";								//if factions are not activated set faction to none				
		if(!isNil "BIS_fnc_getFactions") then							
		{		
			_tmpPlayerFaction = [faction player] call BIS_fnc_getFactions;			//otherwise set his faction
		};		
				
		call _updateFTLInLoop;									//constantly update the FTL 
		
		BIS_FTLManager setVariable ["FTLValue", _tmpFTL];
		BIS_FTLManager setVariable ["FTLState", "NEUTRAL"];
		BIS_FTLManager setVariable ["FTLManagerTable", _FTLManagerTable];
		BIS_FTLManager setVariable ["FTLLevels", _FTLLevels];
		BIS_FTLManager setVariable ["FTLHistory", []];
		BIS_FTLManager setVariable ["FTLPlayerSide", SIDE player];
		BIS_FTLManager setVariable ["FTLSecondSide", _tmpSecondSide];
		BIS_FTLManager setVariable ["FTLLastNegativeOperationTime", _tmpLastNegOp];		//here will be saved time of last negative operation (means value lower then 0)
		BIS_FTLManager setVariable ["FTLOblivionIndex", 0];
		BIS_FTLManager setVariable ["FTLPreviousOblivIndex", _tmpPrevOblivIndex];
		BIS_FTLManager setVariable ["FTLPlayerFaction", _tmpPlayerFaction];
		BIS_FTLManager setVariable ["FTLRespect", 0];
		BIS_FTLManager setVariable ["FTLStringArray", ["STR_EP1_FTLBad", "STR_EP1_FTLNeutral", "STR_EP1_FTLGood"], true];	//String for FTL informations
		BIS_FTLManager setVariable ["FTLString", "STR_EP1_FTLNeutral"]; 
		DEBUGLOG format ["=================FTLManager================="];
		DEBUGLOG format ["FTLManager: Manager successfully initialized:"];
		DEBUGLOG format ["FTLManager: Table:%1", BIS_FTLManager getVariable "FTLManagerTable"];
		DEBUGLOG format ["FTLManager: LOW:%1", BIS_FTLManager getVariable "FTLLevels" select 0];
		DEBUGLOG format ["FTLManager: NEUTRAL:%1", BIS_FTLManager getVariable "FTLLevels" select 1];
		DEBUGLOG format ["FTLManager: HIGH:%1", BIS_FTLManager getVariable "FTLLevels" select 2];
		DEBUGLOG format ["FTLManager: Current value:%1", BIS_FTLManager getVariable "FTLValue"];
		DEBUGLOG format ["==========================================="];
		call _GetFTLState
	}
	else
	{
		DEBUGLOG "FTLManager: Already initialized";
		true;
	}
};

//Destroy(): deinitialize the FTL manager
_Destroy = 
{
	//["sysUpdate"] call _SetFTLState;							//before destroy we will save the value + oblivion index
	
	_updateLoop = BIS_FTLManager getVariable "_updateLoop";					//destroy the loop in separate thread	
	terminate _updateLoop;
	_updateLoop = nil;
	DEBUGLOG format ["=================FTLManager================="];
	DEBUGLOG format ["FTLManager: Manager deinitialized(exiting with these values):"];
	DEBUGLOG format ["FTLManager: _FTLState: %1, FTLValue: %2 + obliv.Idx: %3", 
			BIS_FTLManager getVariable "FTLState", 
			BIS_FTLManager getVariable "FTLValue",
			BIS_FTLManager getVariable "FTLPreviousOblivIndex"
			];
	DEBUGLOG format ["==========================================="];
	deleteVehicle BIS_FTLManager;
	BIS_FTLManager = nil;
	deleteGroup BIS_FTLManagerGroup;
	true;
};

//GetFTLState(): returns current FTL state
_GetFTLState = 
{
	private["_FTLState", "_oblivIdx", "_respect", "_FTLValue", "_LOW", "_NEUTRAL", "_HIGH"];
	
	_FTLState = call _SetFTLStateFromFTLValue;
	BIS_FTLManager setVariable ["FTLState", _FTLState];
	/*
	DEBUGLOG format ["FTLManager: _FTLState: %1, FTLValue: %2 + obliv.Idx: %3", 
			BIS_FTLManager getVariable "FTLState", 
			BIS_FTLManager getVariable "FTLValue",
			BIS_FTLManager getVariable "FTLPreviousOblivIndex"
			];
	*/
	_FTLState;	
};


//SetFTLState(): computes and sets the new FTLValue and FTLState afterwards
_SetFTLState = 
{
	
	private["_FTLManagerTable", "_type", "_valueFromTable", 
		"_FTLValue", "_FTLState", "_FTLValueBeforeChange", 
		"_history", "_HIGH", "_LOW", "_NEUTRAL"];
	
	_type = _this select 0;
	
	_LOW = (BIS_FTLManager getVariable "FTLLevels") select 0;
	_NEUTRAL = (BIS_FTLManager getVariable "FTLLevels") select 1;
	_HIGH = (BIS_FTLManager getVariable "FTLLevels") select 2;
	
	_valueFromTable = [_type] call _DecodeValueFromTable;
	if(_valueFromTable < 0) then						//negative operation occured 
	{
		BIS_FTLManager setVariable ["FTLOblivionIndex", 0];
		BIS_FTLManager setVariable ["FTLPreviousOblivIndex", 0];	//reset timer for oblivion index
		BIS_FTLManager setVariable ["FTLLastNegativeOperationTime", DateToNumber date]	
	};
	
	
	_FTLValue = BIS_FTLManager getVariable "FTLValue";
	_FTLValueBeforeChange = _FTLValue;
	_FTLValue = _FTLValue + _valueFromTable;				//add/subtract from current FTL value
		
	if(_FTLValue < (_LOW select 0)) then {_FTLValue = (_LOW select 0)};
	if(_FTLValue > (_HIGH select 1)) then {_FTLValue = (_HIGH select 1)}; 
	BIS_FTLManager setVariable ["FTLValue", _FTLValue];
			
	//Add changes to the history
	//call compile format ["_history = ""Before: %1|change: %2|after: %3|state: %4""",_FTLValueBeforeChange, _type, _FTLValue, BIS_FTLManager getVariable "FTLState"];  
	call compile format ["_history = ""|||%1|%2|%3|%4""",_FTLValueBeforeChange, _type, _FTLValue, BIS_FTLManager getVariable "FTLState"];
	BIS_FTLManager setVariable ["FTLHistory", (BIS_FTLManager getVariable "FTLHistory") + [_history]];
	//BIS_FTLValue = BIS_FTLManager getVariable "FTLValue";	//save it into the campaign global variable;
	//saveVar "BIS_FTLValue";
	true
};

//SetFTLStateFromFTLValue(): private function, sets the right FTL state in depends on FTLvalue  
_SetFTLStateFromFTLValue = 
{
	private["_FTLValue", "_FTLState", "_FTLLevels", "_HIGH", "_LOW", "_NEUTRAL", "_tempOblivionIndex", "_tmpFTLStringArray", "_tmpFTLString"];
	_FTLValue = BIS_FTLManager getVariable "FTLValue";
	_LOW = (BIS_FTLManager getVariable "FTLLevels") select 0;
	_NEUTRAL = (BIS_FTLManager getVariable "FTLLevels") select 1;
	_HIGH = (BIS_FTLManager getVariable "FTLLevels") select 2;
	_FTLState = BIS_FTLManager getVariable "FTLState";;
	_tmpFTLStringArray = BIS_FTLManager getVariable "FTLStringArray";	//take previous
	_tmpFTLString = BIS_FTLManager getVariable "FTLString";			//take previous
	//_tempOblivionIndex = call _ComputeOblivionIndex;
	//_FTLValue = _FTLValue + _tempOblivionIndex;				//add there the oblivion index (time depending value)
	
	//DEBUGLOG format ["_FTLValue1 %1", _FTLValue];
	
	if(_FTLValue < (_LOW select 0)) then {_FTLValue = (_LOW select 0)};
	if(_FTLValue > (_HIGH select 1)) then {_FTLValue = (_HIGH select 1)}; 
	
	//DEBUGLOG format ["_FTLValue2 %1", _FTLValue];
	
	if((_FTLValue >= _LOW select 0) && (_FTLValue <= _LOW select 1)) then
	{
		//DEBUGLOG format ["_FTLState %1", "LOW"];
		_FTLState = "LOW";
		_tmpFTLString = _tmpFTLStringArray select 0;
	};
	if((_FTLValue >= _NEUTRAL select 0) && (_FTLValue <= _NEUTRAL select 1)) then
	{
		//DEBUGLOG format ["_FTLState %1", "NEUTRAL"];
		_FTLState = "NEUTRAL";
		_tmpFTLString = _tmpFTLStringArray select 1;	
	};
	if((_FTLValue >= _HIGH select 0) && (_FTLValue <= _HIGH select 1)) then
	{
		//DEBUGLOG format ["_FTLState %1", "HIGH"];
		_FTLState = "HIGH";
		_tmpFTLString = _tmpFTLStringArray select 2;	
	};
	BIS_FTLManager setVariable ["FTLState", _FTLState];
	BIS_FTLManager setVariable ["FTLString", _tmpFTLString, true];		//set FTL string (i.e. for situation notes)
 		
	_FTLState
};

//DecodeValueFromTable(): private function, returns decoded value from the FTLManagerTable
_DecodeValueFromTable = 
{
	private["_decodedValue", "_FTLManagerTable", "_tableRow", "_foundDone", "_rowNumber"];
	_decodedValue = 0;
	
	_FTLManagerTable = BIS_FTLManager getVariable "FTLManagerTable";
	_rowNumber = -1;
	_found = -1;
	{
		if(_found == -1) then 
		{
			_found = _x find _type;
			_rowNumber = _rowNumber + 1;
		}
		
	}foreach _FTLManagerTable;
	if(_found == -1) then
	{
		DEBUGLOG format ["=================FTLManager================="];
		DEBUGLOG format["FTLManager: Parameter %1 not found in FTLManagerTable", _type];
		DEBUGLOG format["FTLManager: List of available types are here:", _type];
		{
			DEBUGLOG format["FTLManager: %1 === %2", _x select 0, _x select 1];
		}foreach _FTLManagerTable; 	
		DEBUGLOG format ["==========================================="];
	}
	else
	{
		
		_tableRow = _FTLManagerTable select _rowNumber;
		_decodedValue = _tableRow select 1;
		//DEBUGLOG format["FTLManager: Decoded value of %1 = %2", _tableRow select 0, _tableRow select 1];
	};
	
	_decodedValue
};

private ["_updateFTLInLoop"];
_updateFTLInLoop = 
{
	_updateLoop = []spawn
	{
		private["_FTLValue", "_oblivionIndex", "_dTime", "_PrevOblivIndex", "_playerSide", "_secondSide", "_convertFTLtoFriend", 
			"_actualRespect", "_newRespect", "_dRespect"];
		_playerSide = BIS_FTLManager getVariable "FTLPlayerSide";
		_secondSide = BIS_FTLManager getVariable "FTLSecondSide";
		while{true} do
		{
			_dTime = 4;
			_FTLValue = BIS_FTLManager getVariable "FTLValue";
			_oblivionIndex = ["ComputeOblivionIndex"] call BIS_fnc_FTLManager;
			_actualRespect = BIS_FTLManager getVariable "FTLRespect";
			_newRespect = ["GetNearestTownRespect"] call BIS_fnc_FTLManager;
			_dRespect = _newRespect - _actualRespect;				//difference between new and actual respect
			//DEBUGLOG format["_actualRespect: %1", _actualRespect];
			//DEBUGLOG format["_newRespect: %1", _newRespect];
			//DEBUGLOG format["_dRespect: %1", _dRespect];
			if(_dRespect != 0) then							//if respect difference is not zero
			{
				_FTLValue = _FTLValue + (_dRespect*4) ;				//add the respect difference to the FTLValue
				BIS_FTLManager setVariable ["FTLRespect", _newRespect];		//actual respect = new respect
			};
						
			if((_FTLValue + (_oblivionIndex)) < 0) then				//increase while FTLValue won't be bigger than 0
			{									//becouse oblivion index will not raise to the positive values
				_FTLValue = _FTLValue + (_oblivionIndex);
			};
									
			if(_FTLValue < (_LOW select 0)) then {_FTLValue = (_LOW select 0)};
			if(_FTLValue > (_HIGH select 1)) then {_FTLValue = (_HIGH select 1)}; 
			BIS_FTLManager setVariable ["FTLValue", _FTLValue];
	
			BIS_FTLValue set [0, BIS_FTLManager getVariable "FTLValue"];		//save it into the campaign global variable;
			BIS_FTLValue set [1, BIS_FTLManager getVariable "FTLLastNegativeOperationTime"];
			BIS_FTLValue set [2, BIS_FTLManager getVariable "FTLPreviousOblivIndex"];	
			saveVar "BIS_FTLValue";
			
			//DEBUGLOG format ["_FTLValue = %1", _FTLValue];
			_convertFTLtoFriend = (-0.1*_FTLValue^2)+(0.5*_FTLValue)+0.815;
			_playerSide setFriend [_secondSide, _convertFTLtoFriend];		//setting friendly value + 1
			_secondSide setFriend [_playerSide, _convertFTLtoFriend];		//becouse ftlvalue is in range [-1,1] and setfriend should be [0,1]
			["GetFTLState"] call BIS_fnc_FTLManager;
			Sleep _dTime;
		};
	};
	BIS_FTLManager setVariable ["_updateLoop", _updateLoop];
};

private ["_ComputeOblivionIndex"];
_ComputeOblivionIndex = 
{
	private["_oblivionIndex", "_howManyHoursFromLastNegOp",
		"_lastNegOp", "_CurroblivionIndex", "_PrevOblivIndex"];
	_oblivionIndex = 0;
	//BIS_FTLManager setVariable ["FTLLastNegativeOperationTime", (DateToNumber date)];
	//if((BIS_FTLManager getVariable "FTLState") == "LOW") then
	//{
	
		_lastNegOp = BIS_FTLManager getVariable "FTLLastNegativeOperationTime";
		//DEBUGLOG format ["FTLManager: date = %1| _lastNegOp = %2", (DateToNumber date), _lastNegOp];
		if(_lastNegOp > 0) then												//do it only if some negative op has occured	
		{
			_howManyHoursFromLastNegOp = ((DateToNumber date) - _lastNegOp) * 8760.94;				//how many hours?
			if(_howManyHoursFromLastNegOp >= 1) then								//if it happend before at least 1 hour
			{
				_PrevOblivIndex = BIS_FTLManager getVariable "FTLPreviousOblivIndex";
				_CurroblivionIndex = (log(_howManyHoursFromLastNegOp)/10)*_howManyHoursFromLastNegOp;		//compute it
				_oblivionIndex = _CurroblivionIndex - _PrevOblivIndex;
				//DEBUGLOG format ["FTLManager: _CurroblivionIndex = %1 | _PrevOblivIndex = %2", _CurroblivionIndex, _PrevOblivIndex];
				BIS_FTLManager setVariable ["FTLPreviousOblivIndex", _CurroblivionIndex];
				//_FTLValue = _FTLValue + _oblivionIndex;	//add it to the FTLValue;
			};
		};
	//};
	_oblivionIndex		
};
/*******************************************************************************
 *	Name:		GetNearestTown 
 *	Description:	Returns nearest town's respect from player
 *	Parameters:	none
 *	Return value:	respect | FLOAT
 *	NOTE: 		Due to the engine overloading, function returns 1st town's
 *			respect	located in the range  
 ******************************************************************************/

private["_GetNearestTownRespect"];
_GetNearestTownRespect = 
{
		private["_RANGE", "_nearestTown", "_amountOfTowns", "_respect", "_allTowns", "_xLoop", "_tmpTown", "_faction"];
		_RANGE = 500;
		_respect = 0;
		_faction = BIS_FTLManager getVariable "FTLPlayerFaction";
		_allTowns = (BIS_functions_mainscope getVariable "locations");												//range for we will be searching for
		_amountOfTowns = count _allTowns;
		//DEBUGLOG format["_allTowns: %1", _allTowns];								//check if there are any towns
		if(_amountOfTowns > 0) then										//if yes, continue
		{
			//_nearestTown = "";
			{
				_xLoop = 0;
				if(isNil "_nearestTown") then								//if we didnt find yet any town in the range
				{
					_tmpTown = (_allTowns select _xLoop);
					//DEBUGLOG format["_tmpTownss: %1", _tmpTown];
					if((player distance _tmpTown) < _RANGE) then			//if we found it
					{
						_nearestTown = _tmpTown;
						_respect = (_nearestTown getVariable "respect") select _faction;
						if(isNil "_respect") then {_respect = 0; DEBUGLOG "BIS_FTLManager warning!: ALICE is not implemented in the mission!";}
						//DEBUGLOG format["_nearestTown: %1", _nearestTown];
					};
				};
				_xLoop = _xLoop + 1; 
			}forEach _allTowns;
		};
		//DEBUGLOG format["_respect: %1", _respect];
		_respect		
};



//Here we call the appropriate function passed as parameter
if!(isNil "BIS_FTLManager" && _functionCalled != "Init") then
{
	call compile format ["_returnValue = [""%1""] call _%2", _type, _functionCalled];	
}
else
{
	DEBUGLOG format["FTLManager: Initialize the manager first using Init parameter please!"];
	_returnValue = false;
};


_returnValue