/*
	Author: Jiri Wainar

	Description:
	Generates the composition content - number of objects and their classnames.

	Example:

	[[_coreGroup,_coreClass],[_xtra1Group,_xtra1Class,_xtra1Dir],...] = [_anchor:array,_theme:string] call BIS_fnc_camp_generateCompositionData;
*/

private["_anchor","_theme","_anchorPos","_anchorDir","_surfaceClass","_soldier","_maxSize","_size","_fnc_log_disable"];
private["_coreClasses","_coreClass","_coreGroups","_coreGroup","_dataCore","_dataXtra","_remGroup","_addGroup"];

//disable debug logging
_fnc_log_disable = true;

_anchor = [_this,0,[],[[]]] call BIS_fnc_param;
_theme  = [_this,1,"",[""]] call BIS_fnc_param;

if (count _anchor != 6) exitwith
{
	["Anchor data are broken!"] call BIS_fnc_error;
	_anchor
};

_anchorPos 	= _anchor select 0;
_anchorDir 	= _anchor select 1;
_surfaceClass 	= _anchor select 2;
_maxSize 	= _anchor select 3;
_coreGroup	= _anchor select 4;
_coreClass	= _anchor select 5;

_dataCore	= [];
_dataXtra	= [];

_remGroup	= ["HubObjects","SurfaceObjects",_surfaceClass,"remGroup"] call BIS_fnc_getCfgData;
_addGroup	= ["HubObjects","SurfaceObjects",_surfaceClass,"addGroup"] call BIS_fnc_getCfgData;

/*--------------------------------------------------------------------------------------------------

	SELECT CORE / CENTRAL OBJECT

--------------------------------------------------------------------------------------------------*/

if (true) then
{
	private["_noClasses","_noGroups"];

	_coreGroups = ["HubObjects","HubSections",_theme,"objGroups"] call BIS_fnc_getCfgDataArray;
	_coreGroups = _coreGroups + _addGroup - _remGroup;

	/*
	if (_surfaceClass == "Land_Pallet_F") then
	{
		["_coreGroups",_coreGroups] call BIS_fnc_log;
		["_addGroup",_addGroup] call BIS_fnc_log;
		["_remGroup",_remGroup] call BIS_fnc_log;
	};
	*/

	_noClasses  = [];
	_noGroups   = [];

	//find a core object that fits into the anchor, size is the keyfactor
	waitUntil
	{
		_coreGroups = _coreGroups - _noGroups;

		if (count _coreGroups > 0) then
		{
			if (_coreGroup == "") then
			{
				_coreGroup   = _coreGroups call BIS_fnc_selectRandom;
			};
			_coreClasses = ["HubObjects","ObjectGroups",_coreGroup,"Pool"] call BIS_fnc_getCfgDataPool;
			_coreClasses = _coreClasses - _noClasses;

			if (count _coreClasses > 0) then
			{
				if (_coreClass == "") then
				{
					_coreClass = _coreClasses call BIS_fnc_selectRandom;
				};
				_size = [_coreClass,_coreGroup,"size",1] call BIS_fnc_camp_getObjectParam;

				//filter out objects that are too big
				if (_size > _maxSize) exitWith
				{
					//["[!] Core object '%1' was removed cuz being too big!",_coreClass] call BIS_fnc_logFormat;

					_noClasses set [count _noClasses,_coreClass];
					_coreClass = "";

					/*
					["[!] _coreGroups = %1",_coreGroups] call BIS_fnc_logFormat;
					["[!] _coreGroup = %1",_coreGroup] call BIS_fnc_logFormat;
					["[!] _coreClasses = %1",_coreClasses] call BIS_fnc_logFormat;
					["[!] _coreClass = %1",_coreClass] call BIS_fnc_logFormat;
					*/
				};

				//check if the weapon or grenade is in the pool
				if (_coreGroup in ["Weapons","Launchers","Grenades"]) then
				{
					//["_coreGroup = %1",_coreGroup] call BIS_fnc_logFormat;
					//["_coreClass = %1",_coreClass] call BIS_fnc_logFormat;

					private["_isAvailable","_type"];

					_type = switch (_coreGroup) do
					{
						case "Launchers": 	{"weapon"};
						case "Grenades":  	{"magazine"};
						default 		{"weapon"};
					};

					_isAvailable = [_type,_coreClass] call BIS_fnc_camp_poolAvailable;

					if (_isAvailable) then
					{
						//["[OK]: %1 ",_coreClass] call BIS_fnc_logFormat;

						[_type,_coreClass,-1] call BIS_fnc_camp_poolAdd;
					}
					else
					{
						//["[x]: %1 ",_coreClass] call BIS_fnc_logFormat;

						_noClasses set [count _noClasses,_coreClass];
						_coreClass = "";
					};
				};


			}
			//filter out object groups that are empty
			else
			{
				//["[!] Core group '%1' has no objects fitting the anchor point!",_coreGroup] call BIS_fnc_logFormat;

				_noGroups set [count _noGroups,_coreGroup];
				_coreClass = "";
				_coreGroup = "";
			};
		}
		else
		{
			["[!] No core group available!"] call BIS_fnc_logFormat;
			_coreClass = "";
			_coreGroup = "";
		};

		//["[!] _coreClass = %1",_coreClass] call BIS_fnc_logFormat;
		//["[!] _coreGroups = %1",_coreGroups] call BIS_fnc_logFormat;

		(_coreClass != "") || (count _coreGroups == 0)
	};
};

//no suitable object found for given anchor
if (_coreClass == "") exitWith
{
	["[!] No core object is matching the criteria for anchor %1.",_anchor] call BIS_fnc_logFormat;
	[]
};

//store data about core object
_dataCore = [_anchorPos,_anchorDir,_surfaceClass,_maxSize,_coreGroup,_coreClass];

/*--------------------------------------------------------------------------------------------------

	SELECT XTRA / SURROUNDING OBJECT(S)

--------------------------------------------------------------------------------------------------*/

//get the xtra object(s)
private["_xtraClass","_xtraGroup","_xtraCount","_xtraDirs","_xtraDir","_xtraConsistent","_useXtras"];

_xtraGroup = ["HubObjects","ObjectGroups",_coreGroup,"xGroups"] call BIS_fnc_getCfgDataArray;
_useXtras  = ["HubObjects","SurfaceObjects",_surfaceClass,"useXtras"] call BIS_fnc_getCfgData;

//check if there is enough room for the xtra objects
_size = [_coreClass,_coreGroup,"size",1] call BIS_fnc_camp_getObjectParam;

//not enough space, deny adding xtra objects
if (_maxSize - _size < 0.8) then
{
	//["Object '%3' size '%1' placed on surface '%4' with space '%2'. Xtras were denied!",_size,_maxSize,_coreClass,_surfaceClass] call BIS_fnc_logFormat;

	_xtraGroup = [];
	_useXtras = 0;
};

if (count _xtraGroup > 0) then
{
	_xtraGroup 	 = _xtraGroup call BIS_fnc_selectRandom;

	_xtraCount	 = ["HubObjects","ObjectGroups",_coreGroup,"xCount"] call BIS_fnc_getCfgDataArray;
	_xtraCount	 = (round random((_xtraCount select 1) - (_xtraCount select 0))) + (_xtraCount select 0);
	_xtraDirs 	 = ["HubObjects","ObjectGroups",_coreGroup,"xDirs"] call BIS_fnc_getCfgDataArray;
	_xtraConsistent	 = ["HubObjects","ObjectGroups",_coreGroup,"xConsistent"] call BIS_fnc_getCfgData;

	if (_xtraCount <= 0) exitWith {};
	if (count _xtraDirs == 0) exitWith {};

	if ((_useXtras == 0) && (_xtraConsistent == 0)) exitWith {};

	if (_xtraCount > count _xtraDirs) then
	{
		_xtraCount = count _xtraDirs;
	};

	for "_i" from 1 to _xtraCount do
	{
		_xtraDir = _xtraDirs call BIS_fnc_selectRandom;
		_xtraDirs = _xtraDirs - [_xtraDir];

		if (_xtraConsistent == 1) then
		{
			_dataXtra = _dataXtra + [[_coreGroup,_coreClass,_xtraDir]];
		}
		else
		{
			_xtraClass = ["HubObjects","ObjectGroups",_xtraGroup,"Pool"] call BIS_fnc_getCfgDataPool;
			_xtraClass = _xtraClass call BIS_fnc_selectRandom;

			_dataXtra = _dataXtra + [[_xtraGroup,_xtraClass,_xtraDir]];
		};
	};
};

//update the anchor data
if (count _dataXtra > 0) then
{
	_anchor = _dataCore + [_dataXtra];
}
else
{
	_anchor = _dataCore;
};

//["Anchor (full processed): %1",_anchor] call BIS_fnc_logFormat;

_anchor