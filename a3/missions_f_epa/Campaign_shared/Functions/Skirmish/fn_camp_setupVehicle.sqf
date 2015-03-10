/*
	Author: Jiri Wainar

	Description:
	Customize vehicle according to the given or random selected set and stores the customization id (set) for reference.

	Example:
	[_vehicle:object(,_customizationId:string)] call BIS_fnc_camp_setupVehicle;
*/

private["_vehicle","_customId","_class","_customPool","_selectionsAll","_selectionsHide","_selectionsShow","_tex1","_tex2"];

_vehicle  = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_customId = [_this, 1, "", [""]] call BIS_fnc_param;

if (isNull _vehicle) exitWith {};

_vehicle setVariable ["BIS_enableRandomization",false];

_class = typeOf _vehicle;

_customPool = ["Vehicles","Matrix",_class] call BIS_fnc_getCfgDataArray;

if (count _customPool == 0) exitWith
{
	//["[x][%1] No customizations are defined for given vehicle class [%2]!",_vehicle,_class] call BIS_fnc_logFormat;

	_vehicle setVariable ["BIS_customizationId",""];
};

if (_customId == "") then
{
	_customId = _customPool call BIS_fnc_selectRandom;
};

if ({_x == _customId} count _customPool == 0) exitWith
{
	//["[x][%1] Trying to set non-existing customization id to the vehicle!",_vehicle] call BIS_fnc_logFormat;

	_vehicle setVariable ["BIS_customizationId",""];
};

_vehicle setVariable ["BIS_customizationId",_customId];

_selectionsAll  = ["Vehicles","Variants",_customId,"all"] call BIS_fnc_getCfgDataArray;
_selectionsHide = ["Vehicles","Variants",_customId,"hide"] call BIS_fnc_getCfgDataArray;
_selectionsShow = _selectionsAll - _selectionsHide;
_tex1		= ["Vehicles","Variants",_customId,"texture1"] call BIS_fnc_getCfgData;
_tex2		= ["Vehicles","Variants",_customId,"texture2"] call BIS_fnc_getCfgData;

{
	_vehicle animate [_x, 0];
}
forEach _selectionsShow;

{
	_vehicle animate [_x, 1];
}
forEach _selectionsHide;

if (_tex1 != "") then
{
	_vehicle setObjectTextureGlobal [0, _tex1];
};
if (_tex2 != "") then
{
	_vehicle setObjectTextureGlobal [1, _tex2];
};

//["[!][%1] Vehicle customization id set to [%2]!",_vehicle,_customId] call BIS_fnc_logFormat;