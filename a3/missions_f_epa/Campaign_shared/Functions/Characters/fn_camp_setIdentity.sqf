/*
	Author: Jiri Wainar

	Description:


	Example:
	[_unit,_identity] call BIS_fnc_camp_setIdentity;
*/

//init persistent arrays for persistent indentity magic
[] call BIS_fnc_camp_setIdentityInit;

private["_fnc_log_disable"]; _fnc_log_disable = true;

private["_fn_getSide","_fn_createIdentity","_fn_loadIdentity"];

//overloads the default "side" command, to return side "Guer" for "IND_G_F" (FIA) faction
_fn_getSide =
{
	if (faction _this == "BLU_G_F") exitWith
	{
		resistance
	};

	(side _this)
};

_fn_createIdentity =
{
	private["_unit","_identity","_cfgCharacters","_cfgCharacter","_class"];

	_unit 	 	= _this select 0;
	_identity 	= _this select 1;
	_cfgCharacters	= _this select 2;

	_cfgCharacter   = _cfgCharacters >> vehicleVarName _unit;

	if (isClass _cfgCharacter) then
	{
		_class = getText(_cfgCharacter >> "appearance");

	}
	else
	{
		["[!][%1] Cannot find unit in 'cfgCharacters'!",_unit] call BIS_fnc_logFormat;

		_class = typeOf _unit;
	};

	["[!][%1] Identity '%2' (re-)created!",_unit,_identity] call BIS_fnc_logFormat;

	/*--------------------------------------------------------------------------------------------------

		NAME

	--------------------------------------------------------------------------------------------------*/
	private["_names","_name","_nameSound","_index","_namelist"];

	_namelist = BIS_PER_IDENT_FreeNamesVO;

	_index = [_namelist, str (_unit call _fn_getSide)] call BIS_fnc_findInPairs; if (_index == -1) then {_index = 0};
	_names = (_namelist select _index) select 1;

	//run out-of names that have voiceover (radio protocol recording)
	if (count _names == 0) then
	{
		_namelist = BIS_PER_IDENT_FreeNames;
		_names = (_namelist select _index) select 1;
	};

	//run out-of names without voiceovers
	if (count _names == 0) then
	{
		private["_cfg","_i"];

		_namelist = nil;
		_names = [];

		_cfg = switch (_unit call _fn_getSide) do
		{
			case west:
			{
				configfile >> "CfgWorlds" >> "GenericNames" >> "NATOMen" >> "LastNames";
			};
			case resistance:
			{
				configfile >> "CfgWorlds" >> "GenericNames" >> "GreekMen" >> "LastNames";
			};
			case east:
			{
				configfile >> "CfgWorlds" >> "GenericNames" >> "TakistaniMen" >> "LastNames";
			};
		};

		for "_i" from 0 to (count _cfg - 1) do
		{
			_names set [count _names, ["",getText(_cfg select _i)]];
		};

		_names = _names call BIS_fnc_arrayShuffle;
	};

	_name = _names select 0;

	//remove the name from the list
	_names set [0, objNull];
	_names = _names - [objNull];

	//store the shortened list of names, if used
	if !(isNil "_namelist") then
	{
		_namelist set [_index, [str (_unit call _fn_getSide), _names]];
	};

	_nameSound 	= _name select 0;
	_name		= _name select 1;

	["[i][%1] name: %2",_unit,_name] call BIS_fnc_logFormat;
	["[i][%1] nameSound: %2",_unit,_nameSound] call BIS_fnc_logFormat;

	/*--------------------------------------------------------------------------------------------------

		FACE

	--------------------------------------------------------------------------------------------------*/
	private["_faceType","_unitIdentityTypes","_faceIdentityTypes","_faces","_face","_faceIndex","_isMatching"];

	_faceType = toLower gettext (configfile >> "CfgVehicles" >> typeOf _unit >> "faceType");	//eg. "Man_A3"
	_unitIdentityTypes = getarray(configfile >> "CfgVehicles" >> typeOf _unit >> "identityTypes");	//eg. ["LanguageGRE_F","Head_Greek","G_HAF_default"]

	//convert _unitIdentityTypes to lowercase
	{
		_unitIdentityTypes set [_forEachIndex, toLower _x];
	}
	forEach _unitIdentityTypes;

	//get all faces that use the face
	_faces = (configfile >> "CfgFaces" >> _faceType) call Bis_fnc_getCfgSubClasses;
	{_faces set [_forEachIndex, toLower _x]} forEach _faces;
	_faces = _faces - ["default","custom"];

	{
		_face = _x;
		_faceIndex = _forEachIndex;
		_faceIdentityTypes = getarray(configfile >> "CfgFaces" >> _faceType >> _face >> "identityTypes"); {_faceIdentityTypes set [_forEachIndex, toLower _x]} forEach _faceIdentityTypes;
		_isMatching = false;

		{
			_x = toLower _x;

			if (_x in _unitIdentityTypes) exitWith
			{
				_isMatching = true;
			};
		}
		forEach _faceIdentityTypes;

		if !(_isMatching) then
		{
			//["[%1] face [%2] removed!",_unit,_face] call BIS_fnc_logFormat;

			_faces set [_faceIndex, "---"];
		};
	}
	forEach _faces;

	_faces = _faces - ["---"];

	if (count _faces == 0) then
	{
		["No matching face for unit '%1'!"] call BIS_fnc_error;
		_face = "";
	}
	else
	{
		_face = _faces call BIS_fnc_selectRandom;
	};

	["[i][%1] face: %2",_unit,_face] call BIS_fnc_logFormat;

	/*--------------------------------------------------------------------------------------------------

		PITCH (hardcoded to 1 for now)

	--------------------------------------------------------------------------------------------------*/
	private["_pitch"];

	_pitch = 1;

	/*--------------------------------------------------------------------------------------------------

		GLASSES

	--------------------------------------------------------------------------------------------------*/
	private["_glasses"];

	_glasses =
	[
		"g_tactical_black",
		"g_tactical_clear",
		"g_shades_black",
		"g_shades_blue",
		"g_sport_blackred",
		"g_shades_green",
		"g_shades_red",
		"g_squares",
		"g_squares_tinted",
		"g_sport_blackwhite",
		"g_sport_blackyellow",
		"g_sport_greenblack"

	] call BIS_fnc_selectRandom;

	if (random 1 > 0.35) then
	{
		_glasses = "none";
	};

	["[i][%1] glasses: %2",_unit,_glasses] call BIS_fnc_logFormat;

	/*--------------------------------------------------------------------------------------------------

		SPEAKER

	--------------------------------------------------------------------------------------------------*/
	private["_speakers","_speaker","_side"];

	_side = _unit call _fn_getSide;

	if (_side == civilian) then
	{
		_side = getNumber(configfile >> "cfgVehicles" >> _class >> "side");
		_side = [east,west,resistance,civilian] select _side;

		["[i][%1] Side re-typed from %1 to %2.",civilian,_side] call BIS_fnc_logFormat;
	};

	_speakers = switch (_side) do
	{
		case west:
		{
			[
				"male01eng",
				"male02eng",
				"male03eng",
				"male04eng",
				"male05eng",
				"male06eng",
				"male07eng",
				"male08eng",
				"male09eng"
			];
		};
		case resistance:
		{
			[
				"male01gre",
				"male02gre",
				"male03gre",
				"male04gre",
				"male05gre"
			];
		};
		case east:
		{
			[
				"male01per",
				"male02per",
				"male03per"
			];
		};

		default
		{
			[
				"male01gre",
				"male02gre",
				"male03gre",
				"male04gre",
				"male05gre"
			];
		};
	};

	_speaker = _speakers call BIS_fnc_selectRandom;

	["[i][%1] speaker: %2",_unit,_speaker] call BIS_fnc_logFormat;

	/*--------------------------------------------------------------------------------------------------

		SUM IT UP!

	--------------------------------------------------------------------------------------------------*/

	[
		["name",	_name],
		["nameSound",	_nameSound],
		["face",	_face],
		["glasses",	_glasses],
		["speaker",	_speaker],
		["pitch",	_pitch]
	]
};

_fn_loadIdentity =
{
	private["_unit","_identity","_cfg","_nameSound","_name"];

	_unit 	 = _this select 0;
	_identity = _this select 1;
	_cfg 	 = configFile >> "cfgIdentities" >> _identity;

	["[i][%1] Identity '%2' loaded!",_unit,_identity] call BIS_fnc_logFormat;

	/*
	STATUS:
	-------
	OK	- identity is active
	DEAD	- identity was killed and is waiting to be refreshed
	*/

	_nameSound 	= getText(_cfg >> "nameSound");
	_name		= getText(_cfg >> "name");

	//subtract the name from the pool of free names, if it exists there too
	private["_names","_index","_side"];

	{
		_side  = _x;
		_names = [BIS_PER_IDENT_FreeNamesVO,_side] call BIS_fnc_getFromPairs;
		_index = [_names,_nameSound] call BIS_fnc_findInPairs;

		if (_index > -1) then
		{
			["[!][%1] Identity '%2' name '%3' removed from 'BIS_PER_IDENT_FreeNamesVO'!",_unit,_identity,_nameSound] call BIS_fnc_logFormat;

			_names set [_index, objNull]; _names = _names - [objNull];

			BIS_PER_IDENT_FreeNamesVO set [_forEachIndex,[_side,_names]];
		};
	}
	forEach ["WEST","GUER","EAST"];

	{
		_side  = _x;
		_names = [BIS_PER_IDENT_FreeNames,_side] call BIS_fnc_getFromPairs;
		_index = -1;

		{
			if ((_x select 1) == _name) exitWith {_index = _forEachIndex};
		}
		forEach _names;

		if (_index > -1) then
		{
			["[!][%1] Identity '%2' name '%3' removed from 'BIS_PER_IDENT_FreeNames'!",_unit,_identity,_nameSound] call BIS_fnc_logFormat;

			_names set [_index, objNull]; _names = _names - [objNull];

			BIS_PER_IDENT_FreeNames set [_forEachIndex,[_side,_names]];
		};
	}
	forEach ["WEST","GUER","EAST"];

	//return the values set
	[
		["name",	_name],
		["nameSound",	_nameSound],
		["face",	getText(_cfg >> "face")],
		["glasses",	getText(_cfg >> "glasses")],
		["speaker",	getText(_cfg >> "speaker")],
		["pitch",	getNumber(_cfg >> "pitch")]
	]
};

private["_unit","_identity","_pool","_identityIndex","_attributes","_processGoggles","_mission","_cfgCharacters"];

_unit 		= [_this, 0, player, [objNull,""]] call bis_fnc_param;
_identity 	= [_this, 1, "", [""]] call bis_fnc_param;
_processGoggles = [_this, 2, true, [true]] call bis_fnc_param;
_mission	= [_this, 3, missionName, [""]] call bis_fnc_param;
_pool		= BIS_PER_IDENT_Main;
_cfgCharacters  = ([_mission] call BIS_fnc_camp_getMissionDesc) >> "Characters";

if (typeName _unit == typeName "") then
{
	_unit = missionnamespace getVariable [_unit,objNull];
};

if (isNull _unit) exitWith
{
	["[%1] Unit is NULL. Identity '%2' cannot be set!",_unit,_identity] call BIS_fnc_error;
};

if (_identity == "") exitWith
{
	["[%1] Identity is an empty string!",_unit] call BIS_fnc_error;
};

_identityIndex = [_pool,_identity] call BIS_fnc_findInPairs;

if (_identityIndex != -1) then
{
	_attributes = (_pool select _identityIndex) select 1;
}
else
{
	_attributes = [];
};

/*--------------------------------------------------------------------------------------------------

	GET IDENTITY DATA

--------------------------------------------------------------------------------------------------*/
private["_name","_nameSound","_face","_glasses","_speaker","_pitch","_status","_respawns"];

_status   = "OK";
_respawns = 0;

//identity not used yet
if (_identityIndex == -1) then
{
	//load attributes from cfg by loading the identity
	if (isClass(configFile >> "cfgIdentities" >> _identity)) then
	{
		_attributes = [_unit,_identity] call _fn_loadIdentity;
	}
	//generate new attributes for the identity
	else
	{
		_attributes = [_unit,_identity,_cfgCharacters] call _fn_createIdentity;
	};
}
else
{
	_status    = [_attributes,"status","OK"] call BIS_fnc_getFromPairs;
	_respawns  = [_attributes,"respawns",0] call BIS_fnc_getFromPairs;

	if (_identity in BIS_PER_IDENT_killed) then
	{

		if (_status != "DEAD") then
		{
			["[x][%1] Dead identity '%2' has wrong status: '%3'!",_unit,_identity,_status] call BIS_fnc_logFormat;
		}
		else
		{
			["[!][%1] Dead identity '%2' was successfully refreshed!",_unit,_identity] call BIS_fnc_logFormat;

			_respawns   = _respawns + 1;
		};

		BIS_PER_IDENT_killed = BIS_PER_IDENT_killed - [_identity];

		_status	    = "OK";
		_attributes = [_unit,_identity,_cfgCharacters] call _fn_createIdentity;
	};
};

[_attributes,"status",_status] call BIS_fnc_setToPairs;
[_attributes,"respawns",_respawns] call BIS_fnc_setToPairs;

_name 		= [_attributes,"name",""] call BIS_fnc_getFromPairs;
_nameSound 	= [_attributes,"nameSound",""] call BIS_fnc_getFromPairs;
_face 		= [_attributes,"face",""] call BIS_fnc_getFromPairs;
_glasses 	= [_attributes,"glasses",""] call BIS_fnc_getFromPairs;
_speaker 	= [_attributes,"speaker",""] call BIS_fnc_getFromPairs;
_pitch 		= [_attributes,"pitch",-1] call BIS_fnc_getFromPairs;

/*--------------------------------------------------------------------------------------------------

	STORE IDENTITY DATA

--------------------------------------------------------------------------------------------------*/

_unit setVariable ["BIS_identity",_identity];

if (_identityIndex != -1) then
{
	_pool set [_identityIndex,[_identity,_attributes]];
}
else
{
	_pool set [count _pool,[_identity,_attributes]];
};

/*--------------------------------------------------------------------------------------------------

	APPLY IDENTITY

--------------------------------------------------------------------------------------------------*/

if (_name != "") then
{
	_unit setName [_name,_name,_name];
};

if (_nameSound != "") then
{
	_unit setNameSound _nameSound;
};

if (_face != "") then
{
	_unit setFace _face;
};

if (_glasses != "" && _glasses != "none" && _processGoggles) then
{
	_unit addGoggles _glasses;
};
if (_speaker != "") then
{
	_unit setSpeaker _speaker;
};
if (_pitch != -1) then
{
	_unit setPitch _pitch;
};