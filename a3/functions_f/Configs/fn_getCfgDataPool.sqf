/*
	Author: Jiøí Wainar (Warka)

	Description:
	* Get array of attribute values out of the parent config class.
	* Attributes need to be in this format: "_n", where n is an index number (starting from 0).
	* If any discrepancy in indexing is detected, loading will stop and only the correctly indexed values will be returned.
	* Max. index supported is 99.
	* If more then 9 attributes used, 0-9 need to use leading zeroes.

	CFG example:

	class Timeline
	{
		class StageA
		{
			_0[] = {2035,7,7,04,30};
			_1[] = {2035,7,7,06,15};
			_2[] = {2035,7,7,18,35};
			_3[] = {2035,7,8,09,05};
			_4[] = {2035,7,8,13,25};
			_5[] = {2035,7,8,17,10};
			_6[] = {2035,7,8,21,40};
			_7[] = {2035,7,9,19,55};
		};
	};


	Remark(s):
	* Can by called 2 ways:
		* 1st way (general) works for any config.
		* 2nd way is for comfortable working with mission description.ext.

	Parameter(s):
		_this: CFG
		_this: ARRAY of STRINGS - missionConfigFile classes.

	Example:

	* 1st way of calling:

		_array = (configfile >> "BulletBubbles" >> "BulletBubbles1") call BIS_fnc_getCfgData;
		_array = (missionconfigfile >> "Timeline" >> "StageA") call BIS_fnc_getCfgData;

	* 2nd way of calling:

		_array = ["Timeline","StageA"] call BIS_fnc_getCfgData;

	Returns:
		ARRAY or nil, if parent class is not found
*/

private["_cfg","_value","_idMax","_id","_fn_getValue","_pool","_value","_attribute"];

if (typeName _this != "ARRAY") then
{
	_cfg = _this;
}
else
{
	{
		if (_forEachIndex == 0) then
		{
			_cfg = missionConfigFile >> _x;
		}
		else
		{
			_cfg = _cfg >> _x;
		};

	} forEach _this;
};

//parent / pool class not found!
if !(isClass (missionconfigfile >> "Timeline" >> "StageA")) exitWith {nil};

_idMax = (count _cfg) - 1;

//parent / pool class is empty - doesn't have any child attributes
if (_idMax < 0) exitWith {nil};

_pool = [];

_fn_getValue =
{
	private["_value"];

	switch (true) do
	{
		case (isNumber _this): 	{_value = getNumber _this};
		case (isText _this): 	{_value = getText _this};
		case (isArray _this): 	{_value = getArray _this;};

		default 		{_value = nil};
	};

	//make sure returning 'nil' works
	if (isNil "_value") exitWith {nil};

	_value
};

if (_idMax > 99) then
{
	_idMax = 99;
};

for "_id" from 0 to _idMax do
{
	if ((_idMax > 9) && (_id < 10)) then
	{
		_attribute = format["_0%1",_id];
	}
	else
	{
		_attribute = format["_%1",_id];
	};

	_value = (_cfg >> _attribute) call _fn_getValue;


	if (isNil "_value") exitWith
	{
		["Pool data discrepancy detected!"] call BIS_fnc_error;
		[_cfg] call BIS_fnc_error;
	};

	//["%1 = %2",_attribute,_value] call BIS_fnc_logFormat;

	_pool set[count _pool,_value];
};

_pool