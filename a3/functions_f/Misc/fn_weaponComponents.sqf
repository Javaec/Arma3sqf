/*--------------------------------------------------------------------------------------------------

	Author: Jiri Wainar

	Description:
	Returns array with classname of the plain weapon (without attachments), followed by classnames of all its attachments.

	Example:
	["arifle_mx_f","optic_aco","acc_pointer_ir"] = "arifle_mx_aco_pointer_f" call BIS_fnc_weaponComponents;

	Remarks:
	* Classnames returned are converted all to lowercase.

--------------------------------------------------------------------------------------------------*/
private["_weapon","_core","_attachments","_cfg","_parents","_scope","_cfgAttachments","_cfgAttachClasses","_attachment"];

_weapon  = toLower _this;
_cfg	 = configfile >> "CfgWeapons" >> _weapon;

if (_weapon == "") exitWith
{
	//["Weapon class cannot be an empty string!"] call BIS_fnc_error;
	[]
};

if !(isClass _cfg) exitWith
{
	//["Weapon class '%1' doesn't exist!",_weapon] call BIS_fnc_error;
	[]
};

if (_weapon == "laserdesignator" || _weapon == "rangefinder") exitWith {[_weapon]};

//get the core class (plain weapon without attachments)
_parents = [_cfg,true] call BIS_fnc_returnParents;

if !(count _parents > 1) exitWith
{
	["Weapon %1 has 1 or zero parents. Function terminated; an empty array is returned.",_weapon] call BIS_fnc_logFormat;

	[]
};

_core	 = toLower(_parents select 1);
_scope	 = getNumber(configfile >> "CfgWeapons" >> _core >> "scope");

if (_scope != 2) then
{
	_core = _weapon;
};

_core = toLower _core;

//get attachments
_attachments 	= [];
_cfgAttachments = _cfg >> "LinkedItems";

if (isClass _cfgAttachments) then
{
	_cfgAttachClasses = _cfgAttachments call Bis_fnc_getCfgSubClasses;

	{
		_attachment = getText(_cfgAttachments >> _x >> "item");
		_attachment = toLower (_attachment);

		_attachments set [count _attachments,_attachment];

	}
	forEach _cfgAttachClasses;
};

([_core] + _attachments)