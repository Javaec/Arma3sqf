disableSerialization;
/*
	File: objectComposition.sqf
	Author: Joris-Jan van 't Land

	Description:
	UI script used to make the filters for editing object Object Composition work.

	Parameter(s):
	_this select 0: object parameter (String)
	_this select 1: event type (String)
	_this select 2: parameters from the event handler (Array)

	Returns:
	Success flag (Boolean)
*/

private ["_param", "_event", "_params"];
_param = _this select 0;
_event = _this select 1;
_params = _this select 2;

//Select code to execute for the correct object parameter.
switch (_param) do 
{
	case "SIDE": 
	{
		private ["_ctrlSide", "_ctrlFaction"];
		_ctrlSide = _params select 0;
		_ctrlFaction = _params select 1;
		
		private ["_side"];
		_side = _ctrlSide lbData (lbCurSel _ctrlSide);
		
		//TODO: Stringtablize.
		
		lbClear _ctrlFaction;
		
		//TODO: remove hard-coded factions!
		
		switch (_side) do 
		{
			case "west": 
			{
				_ctrlFaction lbAdd "USMC";
				_ctrlFaction lbSetData [0, "USMC"];
				_ctrlFaction lbAdd "CDF";
				_ctrlFaction lbSetData [1, "CDF"];
			};
			
			case "east": 
			{
				_ctrlFaction lbAdd "Russia";
				_ctrlFaction lbSetData [0, "RU"];
				_ctrlFaction lbAdd "Insurgents";
				_ctrlFaction lbSetData [1, "INS"];
			};
			
			case "guer": 
			{
				_ctrlFaction lbAdd "Guerillas";
				_ctrlFaction lbSetData [0, "GUE"];
			};
			
			case "civ": 
			{
				_ctrlFaction lbAdd "Civilians";
				_ctrlFaction lbSetData [0, "CIV_F"];
			};
			
			default {};	
		};
		
		_ctrlFaction lbSetCurSel 0;
	};
	
	case "FACTION": 
	{
		private ["_ctrlFaction", "_ctrlType"];
		_ctrlFaction = _params select 0;
		_ctrlType = _params select 1;
		
		private ["_faction"];
		_faction = _ctrlFaction lbData (lbCurSel _ctrlFaction);
		
		lbClear _ctrlType;
		
		//Fetch all matching compositions from config.
		private ["_cfgComp", "_k"];
		_cfgComp = configFile >> "CfgObjectCompositions";
		_k = 0;
		for "_i" from 0 to ((count _cfgComp) - 1) do 
		{
			private ["_comp"];
			_comp = _cfgComp select _i;
			
			//Make sure we selected a class.
			if (isClass _comp) then 
			{
				//If the faction is right, add this composition.
				if (getText(_comp >> "faction") == _faction) then 
				{
					_ctrlType lbAdd (getText(_comp >> "displayName"));
					_ctrlType lbSetData [_k, configName _comp];
					
					_k = _k + 1;
				};	
			};
		};
		
		_ctrlType lbSetCurSel 0;
	};
	
	default {};	
};

true