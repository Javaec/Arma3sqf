/*
	Author: Karel Moricky

	Description:
	Scan throught pending missions and finish the ones marked as complete

	Parameter(s): NOTHING

	Returns: BOOL
*/
private ["_mode"];
_mode = [_this,0,false,[false]] call bis_fnc_param;

if (_mode) then {

	//--- Heliport - check pending missions for completed
	private ["_missionname","_completed","_missionconfig","_missionworld","_missionconfigdef","_repeat","_turn"];

	{
		//_missionName = [] call bis_fnc_heliportMission;
		_missionName = _x;

		//--- Proceed only when mission is makred as completed
		_completed = [hsim_heliportDB,["MissionsPending",_missionName,"completed"],false] call bis_fnc_dbValueReturn;
		if (_completed) then {

			//--- Detect mission config
			_missionConfig = [hsim_heliportDB,["MissionsPending",_missionName,"config"]] call bis_fnc_dbValueReturn;
			_missionWorld = [hsim_heliportDB,["MissionsPending",_missionName,"world"]] call bis_fnc_dbValueReturn;
			if (!isnil "_missionConfig" && !isnil "_missionWorld") then {

				//--- Campaign mission - convert config into type CONFIG
				_missionConfigDef = _missionConfig; //--- Original value will be alter stored to DB
				if (typename _missionConfig == typename "") then {
					_missionConfig = campaignconfigfile >> "campaign" >> "missions" >> _missionConfig;
				};

				//--- Add mission reward
				_repeat = getnumber (_missionConfig >> "repeat") > 0;
				if (
					//--- Not yet completed
					!([hsim_heliportDB,[_missionWorld,"Missions",_missionName]] call BIS_fnc_dbClassCheck)
					||
					//--- Can be repeated
					_repeat
				) then {
					_coef = [hsim_heliportDB,["MissionsPending",_missionName,"rewardCoef"],1] call bis_fnc_dbValueReturn;
					_price = getnumber (_missionConfig >> "price");
					_price = _price * _coef;
					_price call bis_fnc_heliportMoneyAdd;
				};

				//--- Add to 'completed' section
				[hsim_heliportDB,[_missionWorld,"Missions",_missionName,"config"],_missionConfigDef] call BIS_fnc_dbValueSet;

				//--- Copy mission turn (not when replayed and not repeatable)
				_turnCurrent = [hsim_heliportDB,[_missionWorld,"Missions",_missionName,"turn"],-1] call bis_fnc_dbValueReturn;
				if (_turnCurrent < 0 || _repeat) then {
					_turn = [hsim_heliportDB,["MissionsPending",_missionName,"turn"],[] call BIS_fnc_heliportTurn] call bis_fnc_dbValueReturn;
					[hsim_heliportDB,[_missionWorld,"Missions",_missionName,"turn"],_turn] call BIS_fnc_dbValueSet;
				};

				//--- Remove from 'pending' section
				[hsim_heliportDB,["MissionsPending",_missionName]] call BIS_fnc_dbClassRemove;
			};
		};
	} foreach ([hsim_heliportDB,["MissionsPending"]] call bis_fnc_dbClassList);
} else {

	//--- On mission end
	private ["_missionName","_turn"];

	//--- Add 1 turn
	_turn = [] call BIS_fnc_heliportTurnAdd;

	//--- Mark mission as completed
	_missionName = [hsim_heliportDBCampaign,["mission"],""] call bis_fnc_dbValueReturn;
	if (_missionName != "") then {
		_dbAdd = [hsim_heliportDB,["MissionsPending",_missionName,"completed"],true] call BIS_fnc_dbValueSet;
		_dbAdd = [hsim_heliportDB,["MissionsPending",_missionName,"turn"],_turn] call BIS_fnc_dbValueSet;
	};
};

true