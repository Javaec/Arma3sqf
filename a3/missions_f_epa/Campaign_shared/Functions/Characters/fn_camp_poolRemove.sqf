/*

	Author: Jiøí Wainar

	Example:
	["weapon","arifle_mx_f",1] call BIS_fnc_camp_poolRemove;
*/

//disable debug logging
private["_fnc_log_disable"]; _fnc_log_disable = true;

private["_category","_class","_count","_toRemove"];

_category = toLower(_this select 0);
_class 	  = toLower(_this select 1);
_count 	  = [_this, 2, 1, [123]] call bis_fnc_param;

["[i][%3x] %1 >> %2",_category,_class,_count] call BIS_fnc_logFormat;

//gather all data, check for weapon attachments
if (_category == "weapon") then
{
	private["_componets","_item"];

	_componets = _class call BIS_fnc_weaponComponents;
	_toRemove  = [];

	{
		if (_forEachIndex == 0) then
		{
			_item = ["weapon",_x,_count];
		}
		else
		{
			_item = ["attachment",_x,_count];
		};

		_toRemove set [count _toRemove,_item];
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

	_toRemove = [[_category,_class,_count]];
};

//do the removal
private["_category","_class","_count","_pool","_countAfter"];

{
	_category 	= _x select 0;
	_class 	  	= (_x select 1) call BIS_fnc_camp_getEquipClass;
	_count 	  	= _x select 2;

	_pool 	  	= missionnamespace getVariable format["BIS_PER_POOL_%1",_category];
	_pool 	  	= [_pool,_class,-_count] call BIS_fnc_addToPairs;

	_countAfter 	= [_pool,_class] call BIS_fnc_getFromPairs;

	if (_countAfter < 0) then
	{
		[_pool,_class,0] call BIS_fnc_setToPairs;
	};
}
forEach _toRemove;