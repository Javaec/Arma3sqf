/*

	Author: Jiøí Wainar

	Example:
	_inEqPool:bool = ["weapon","arifle_katiba_f"] call BIS_fnc_camp_poolAvailable;
*/

private["_category","_class","_count","_toScan","_fn_isAvailable","_isAvailable"];

_category  = toLower(_this select 0);
_class 	   = toLower(_this select 1);
_count 	   = [_this, 2, 1, [123,[]]] call bis_fnc_param;

if (typeName _count == typeName []) then
{
	_count = _count select 0;
};

//gather all data, check for weapon attachments
if (_category == "weapon") then
{
	private["_componets","_item"];

	_componets = _class call BIS_fnc_weaponComponents;
	_toScan    = [];

	{
		if (_forEachIndex == 0) then
		{
			_item = ["weapon",_x,_count];
		}
		else
		{
			_item = ["attachment",_x,_count];
		};

		_toScan set [count _toScan,_item];
	}
	forEach _componets;
}
else
{

	_toScan = [[_category,_class,_count]];
};

//validation function
_fn_isAvailable =
{
	private["_category","_class","_count","_poolCount"];

	_category  = _this select 0;
	_class 	   = _this select 1;
	_count 	   = _this select 2;

	_poolCount = [_category,_class] call BIS_fnc_camp_poolCount;

	if (_count > _poolCount) exitWith
	{
		false
	};

	true
};


//run the validation
{
	_isAvailable = _x call _fn_isAvailable;

	if !(_isAvailable) exitWith {};
}
forEach _toScan;

_isAvailable