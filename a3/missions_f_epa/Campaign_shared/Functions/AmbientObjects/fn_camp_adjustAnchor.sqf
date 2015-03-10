/*
	Author: Jiri Wainar

	Description:
	Adjust and randomizes the anchor data according to the situation (eg. soldiers nearby).

	Example:

	[_anchorPos,_anchorDir,_surfaceClass,_maxSize] = [_anchor:array] call BIS_fnc_camp_adjustAnchor;


*/

private["_anchor","_theme"];

_anchor = [_this,0,[],[[]]] call BIS_fnc_param;
_theme  = [_this,1,"Default",[""]] call BIS_fnc_param;

if (count _anchor != 6) exitwith
{
	["Anchor data are broken!"] call BIS_fnc_error;
	[]
};

private["_anchorPos","_anchorDir","_surfaceClass","_maxSize","_maxSizeOverride","_coreGroup","_coreClass","_soldiers","_fn_isValid","_fn_getAnimsetData"];

_anchorPos 	= _anchor select 0;
_anchorDir 	= _anchor select 1;
_surfaceClass 	= _anchor select 2;
_maxSize   	= _anchor select 3;
_coreGroup	= _anchor select 4;
_coreClass	= _anchor select 5;

//[_proximity,_maxSizeOverride,_fixAnimMagnet] = _soldier call _fn_getAnimsetData;
_fn_getAnimsetData =
{
	private["_animset","_proximity","_maxSizeOverride","_fixAnimMagnet","_coreGroupOverride"];

	//check animations / stance
	_animset = _this getVariable ["BIS_fnc_ambientAnim__animset",""];

	_proximity 	 = 0;	//max. distance to consider soldier as "nearby"
	_maxSizeOverride = 3;	//max. size of the object to be used with the nearby soldier
	_fixAnimMagnet   = 0;	//offset fix, positive = move the anchor closer to the nearby soldier, negative further away
	_coreGroupOverride = "";

	switch (_animset) do
	{
		case "SIT";
		case "SIT1";
		case "SIT2";
		case "SIT3";
		case "SIT_U1";
		case "SIT_U2";
		case "SIT_U3":
		{
			_proximity = 1.5;
			_maxSizeOverride = 3;
		};
		case "LEAN_ON_TABLE":
		{
			_proximity = 0.8;
			_maxSizeOverride = 2;
			_fixAnimMagnet = -0.3;
		};
		case "SIT_HIGH":
		{
			_proximity = 1;
			_maxSizeOverride = 0;		//disable anchor, if soldier is sitting on table close to it / on it
		};
		case "SIT_AT_TABLE":
		{
			_proximity = 0.8;

			if (random 1 < 0.5) then
			{
				_maxSizeOverride = 2.2;
				_fixAnimMagnet = -0.35;
				_coreGroupOverride = "Devices";
			}
			else
			{
				_maxSizeOverride = 1.7;
				_fixAnimMagnet = 0.05;
				_coreGroupOverride = "Office";
			};
		};
	};

	[_proximity,_maxSizeOverride,_fixAnimMagnet,_coreGroupOverride]
};

//_isValid = _soldier call _fn_isValid;
_fn_isValid =
{
	private["_animData","_proximity","_pos","_distance"];

	_animData 	= _this call _fn_getAnimsetData;
	_proximity	= _animData select 0;

	if (_proximity <= 0) exitWith {false};

	//check proximity
	_pos	   = getPosASL _this;
	_pos 	   set [2,_anchorPos select 2];
	_distance  = [_pos, _anchorPos] call BIS_fnc_distance2D;

	if (_distance > _proximity) exitWith {false};

	true
};

//get nearby soldiers
_soldiers = [];

{
	//["[!] Theme: %1 | Anchor: %2 | Soldier: %3",_theme,_anchor,_x] call BIS_fnc_logFormat;

	if (_x call _fn_isValid) then
	{
		_soldiers set [count _soldiers, _x];
	};
}
forEach (nearestObjects [ASLtoATL _anchorPos, ["Man"], 3]);

//check the probability
private["_chance","_roll"];

_chance = ["HubObjects","HubSections",_theme,"probability"] call BIS_fnc_getCfgData;

//["[!] Theme: %1 | Anchor: %2 | Soldiers: %3",_theme,_anchor,_soldiers] call BIS_fnc_logFormat;

//anchors with soldiers nearby have higher chance to contain something
if (count _soldiers > 0) then
{
	//_chance = _chance + ((1 - _chance) * 0.75);

	_chance = 1;	//if there is soldier nearby, always spawn ambient object(s)

	//["[!] Soldier nearby %1, chance is %2",_anchor,floor(_chance * 100)] call BIS_fnc_logFormat;
};

_roll = random 1;

if (_roll > _chance) exitWith
{
	//["Anchor %1 failed the chance roll: %2 against %3!",_anchor,floor(_roll * 100),floor(_chance * 100)] call BIS_fnc_logFormat;
	[]
};

if ((count _soldiers > 0) && (_theme != "WeaponStash")) then
{
	private["_soldier","_unitVector","_offsetVector","_offset","_soldierPos","_fixAnimMagnet","_animData","_coreGroupOverride"];

	_soldier  = _soldiers call BIS_fnc_selectRandom;
	_animData = _soldier call _fn_getAnimsetData;

	_maxSizeOverride   = _animData select 1;
	_fixAnimMagnet	   = _animData select 2;
	_coreGroupOverride = _animData select 3;

	if (_coreGroupOverride != "") then
	{
		_coreGroup = _coreGroupOverride;
	};

	_soldierPos = getPosASL _soldier;
	_soldierPos set [2,_anchorPos select 2];

	//recalc anchor position = move the anchor closer to the soldier
	_unitVector 	= [_anchorPos,_soldierPos] call BIS_fnc_vectorFromXToY;
	_offset 	= ["HubObjects","SurfaceObjects",_surfaceClass,"anchorMagnet"] call BIS_fnc_getCfgData;
	_offset		= _offset + _fixAnimMagnet;

	_offsetVector 	= [_unitVector,_offset] call BIS_fnc_vectorMultiply;
	_anchorPos	= [_anchorPos,_offsetVector] call BIS_fnc_vectorAdd;

	//recalc anchor direction = turn the anchor to the soldier
	_anchorDir 	= [_anchorPos, _soldierPos] call BIS_fnc_dirTo;

	//overrides the max size if anims requires it
	if (_maxSizeOverride < _maxSize) then
	{
		_maxSize = _maxSizeOverride;
	};

	//if there is enough room (and a soldier without weapon nearby), put (his) weapon on the surface object (eg. table)
	/*

	WORKING & DISABLED AS WE DON'T WANT IT ANYMORE

	if (_maxSize == 3) then
	{
		if (primaryWeapon _soldier != "") exitWith {};

		private["_weapon"];

		_weapon = _soldier getVariable ["BIS_fnc_ambientAnim__weapon",""];

		if (_weapon == "") exitWith {};

		_coreGroup = "Weapons";
		_coreClass = _weapon;
	};
	*/
};

//["Anchor: %1",[_anchorPos,_anchorDir,_surfaceClass,_maxSize,_coreGroup,_coreClass]] call BIS_fnc_logFormat;

[_anchorPos,_anchorDir,_surfaceClass,_maxSize,_coreGroup,_coreClass]