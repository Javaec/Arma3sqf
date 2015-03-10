/*

	Author: Jiri Wainar

	Description:
	Function removes the unit's equipment from the equipment pool.

	Example:
	[player] call BIS_fnc_camp_poolRemoveCharacter;

*/

private["_unit","_weapons","_attachments","_magazines","_items","_uniforms","_vests","_backpacks","_headgears","_goggles"];

_unit 		= [_this, 0, objNull, [objNull,""]] call bis_fnc_param;

_weapons 	= [_unit] call BIS_fnc_camp_unitWeapons;
_attachments 	= [_unit] call BIS_fnc_camp_unitAttachments;
_magazines 	= [_unit] call BIS_fnc_camp_unitMagazines;

_items		= [_unit] call BIS_fnc_camp_unitItems;
_uniforms	= [_unit,"uniform"] call BIS_fnc_camp_unitOutfit;
_vests		= [_unit,"vest"] call BIS_fnc_camp_unitOutfit;
_backpacks	= [_unit,"backpack"] call BIS_fnc_camp_unitOutfit;
_headgears	= [_unit,"headgear"] call BIS_fnc_camp_unitOutfit;
_goggles	= [_unit,"goggles"] call BIS_fnc_camp_unitOutfit;


["[i][%1] Removing character gear from pool.",_unit] call BIS_fnc_logFormat;

["[ ][%1] Removing weapons: %2",_unit,_weapons] call BIS_fnc_logFormat;
["[ ][%1] Removing attachments: %2",_unit,_attachments] call BIS_fnc_logFormat;
["[ ][%1] Removing magazines: %2",_unit,_magazines] call BIS_fnc_logFormat;

["[ ][%1] Removing items: %2",_unit,_items] call BIS_fnc_logFormat;
["[ ][%1] Removing uniforms: %2",_unit,_uniforms] call BIS_fnc_logFormat;
["[ ][%1] Removing vests: %2",_unit,_vests] call BIS_fnc_logFormat;
["[ ][%1] Removing backpacks: %2",_unit,_backpacks] call BIS_fnc_logFormat;
["[ ][%1] Removing headgears: %2",_unit,_headgears] call BIS_fnc_logFormat;
["[ ][%1] Removing goggles: %2",_unit,_goggles] call BIS_fnc_logFormat;

{
	["weapon",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _weapons;

{
	["attachment",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _attachments;

{
	["magazine",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _magazines;

{
	["item",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _items;

{
	["uniform",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _uniforms;

{
	["vest",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _vests;

{
	["backpack",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _backpacks;

{
	["headgear",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _headgears;

{
	["goggles",_x select 0,-(_x select 1)] call BIS_fnc_camp_poolAdd;
}
forEach _goggles;