private ["_cfgMission","_heliport","_requiredMission","_requiredHelicopter","_requiredHelicopterUpgrades","_typeRequired","_type","_listMissions","_hasRequiredMissions","_listHelicopters","_listHelicoptersMatching","_hasRequiredHelicopters","_config","_hasRequiredHelicopterUpgrades","_helicopter","_listCategories","_category","_listItems","_item"];

scopename "main";
_cfgMission =	[_this,0,campaignconfigfile,[configfile,""]] call bis_fnc_param;
_returnList =	[_this,1,false,[false]] call bis_fnc_param;

if (typename _cfgMission == typename "") then {_cfgMission = campaignconfigfile >> "campaign" >> "missions" >> _cfgMission};

//--- Room of Requirements
_heliport = gettext (_cfgMission >> "terrain");
if (_heliport == "") then {_heliport = worldname};
_requiredMissions = getarray (_cfgMission >> "requiredMissions");
_requiredHelicopters = getarray (_cfgMission >> "requiredHelicopters");
_requiredHelicopterUpgrades = getarray (_cfgMission >> "requiredHelicopterUpgrades");

if (_returnList) exitwith {
	[_requiredMissions,_requiredHelicopters,_requiredHelicopterUpgrades]
};

//////////////////////////////////////////////////////////////////////////////////////////////////
//--- Functions
_fnc_checkTypes = {
	_typeRequired = _x;
	if (typename _typeRequired != typename []) then {_typeRequired = [_typeRequired];};
	if (
		{
			_type = _x;
			{_x == _type} count _listTypes > 0
		} count _typeRequired > 0
	) then {
		call _this;
	};
};


//////////////////////////////////////////////////////////////////////////////////////////////////
//--- Missions
_hasRequiredMissions = if (count _requiredMissions > 0) then {
	{!(_x in BIS_heliportMissionsCompleted)} count _requiredMissions == 0
} else {
	true
};


//////////////////////////////////////////////////////////////////////////////////////////////////
//--- Helicopters
_listHelicopters = [hsim_heliportDB,[_heliport,"Helicopters"]] call BIS_fnc_dbClassList;
_listHelicoptersMatching = [];

_hasRequiredHelicopters = if (count _requiredHelicopters > 0) then {
	{
		_config = [hsim_heliportDB,[_heliport,"Helicopters",_x,"config"]] call BIS_fnc_dbValueReturn;
		if (!isnil "_config") then {
			_missionSpecific = getnumber (_config >> "missionSpecific") > 0;
			if !(_missionSpecific) then {
				if ([_config,_requiredHelicopters] call bis_fnc_heliportTypesRequired) then {
					_listHelicoptersMatching set [count _listHelicoptersMatching,configname _config];
				};
			};
		};
	} foreach _listHelicopters;

	count _listHelicoptersMatching > 0
} else {
	_listHelicoptersMatching = _listHelicopters;
	true;
};


//////////////////////////////////////////////////////////////////////////////////////////////////
//--- Helicopter Upgrades
_hasRequiredHelicopterUpgrades = false;
if (count _requiredHelicopterUpgrades > 0) then {
	{
		_helicopter = _x;
		_listCategories = [hsim_heliportDB,[_heliport,"Helicopters",_helicopter]] call BIS_fnc_dbClassList;
		{
			_category = _x;
			_listItems = [hsim_heliportDB,[_heliport,"Helicopters",_helicopter,_category]] call BIS_fnc_dbClassList;
			{
				_item = _x;
				_config = [hsim_heliportDB,[_heliport,"Helicopters",_helicopter,_category,_item,"config"]] call BIS_fnc_dbValueReturn;
				if (!isnil "_config") then {
					if ([_config,_requiredHelicopterUpgrades] call bis_fnc_heliportTypesRequired) then {
						_hasRequiredHelicopterUpgrades = true;
						breakto "main";
					};
				};
			} foreach _listItems;
		} foreach _listCategories;
	} foreach _listHelicoptersMatching; //--- Seatch only matching helicopters
} else {
	_hasRequiredHelicopterUpgrades = true;
};

//////////////////////////////////////////////////////////////////////////////////////////////////
//--- Results

[_hasRequiredMissions, _hasRequiredHelicopters, _hasRequiredHelicopterUpgrades]