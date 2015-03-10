/*

	Author: Jiri Wainar

	Example:
	["weapon","arifle_katiba_gl_aco_pointer_f",1] call BIS_fnc_camp_poolAdd;

*/

//disable debug logging
private["_fnc_log_disable"]; _fnc_log_disable = true;

private["_category","_class","_count","_toAdd"];

_category = toLower(_this select 0);
_class 	  = toLower(_this select 1);
_count 	  = [_this, 2, 1, [123]] call bis_fnc_param;

if (_count > 0) then
{
	["[i][%3x] %1 >> %2",_category,_class,_count] call BIS_fnc_logFormat;
};

//gather all data, check for weapon attachments
if (_category == "weapon") then
{
	private["_componets","_item"];

	_componets = _class call BIS_fnc_weaponComponents;
	_toAdd 	   = [];

	{
		if (_forEachIndex == 0) then
		{
			_item = ["weapon",_x,_count];
		}
		else
		{
			_item = ["attachment",_x,_count];
		};

		_toAdd set [count _toAdd,_item];
	}
	forEach _componets;
}
else
{
	if (_category == "backpack") then
	{
		private["_classPrev"];

		_classPrev = _class;
		_class 	   = _class call BIS_fnc_basicBackpack;

		if (_classPrev != _class) then
		{
			private["_fnc_log_disable"]; _fnc_log_disable = false;

			["[!][POOL] Backpack [%1] replaced for [%2]!",_classPrev,_class] call BIS_fnc_logFormat;
		};
	};

	_toAdd = [[_category,_class,_count]];
};

//do the adding
private["_category","_class","_count","_pool","_poolVar","_countAfter"];

{
	_category 	= _x select 0;
	_class 	  	= (_x select 1) call BIS_fnc_camp_getEquipClass;
	_count 	  	= _x select 2;

	_poolVar	= format["BIS_PER_POOL_%1",_category];
	_pool 	  	= missionnamespace getVariable _poolVar;
	_pool 	  	= [_pool,_class,_count] call BIS_fnc_addToPairs;

	_countAfter 	= [_pool,_class] call BIS_fnc_getFromPairs;

	if (_countAfter < 0) then
	{
		[_pool,_class,0] call BIS_fnc_setToPairs;
	};

	//debug
	//_count = [_category,_class] call BIS_fnc_camp_poolCount;
	//["[ ][%3x] %1 >> %2",_category,_class,_count] call BIS_fnc_logFormat;
}
forEach _toAdd;