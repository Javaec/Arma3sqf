/*
	Author: Karel Moricky

	Description:
	Remove virtual weapons from an object (e.g., ammo box).
	Virtual items can be selected in the Arsenal.

	Parameter(s):
		0: OBJECT - objct from which weapons will be removed
		1: STRING or ARRAY of STRINGs - weapon class(es) to be removed
		2 (Optional): BOOL - true to remove weapons globally (default: false)

	Returns:
	ARRAY of ARRAYs - all virtual items within the object's space in format [<items>,<weapons>,<magazines>,<backpacks>]
*/

private ["_object","_classes","_isGlobal"];
_object = [_this,0,missionnamespace,[missionnamespace,objnull]] call bis_fnc_param;
_classes = [_this,1,[],["",true,[]]] call bis_fnc_param;
_isGlobal = [_this,2,false,[false]] call bis_fnc_param;
[_object,_classes,_isGlobal,true,-1,1] call bis_fnc_addVirtualItemCargo;