/*
	Author: Karel Moricky

	Description:
	Return group params from CfgORBAT

	Parameter(s):
		0: CONFIG - path to group in CfgORBAT

	Returns:
	ARRAY
*/



private [
	"_class",
	"_overrideParams",
	"_fnc_checkOverride",
	"_id",
	"_idText",
	"_type",
	"_typeName",
	"_typeTexture",
	"_typeGender",
	"_cfgType",
	"_size",
	"_sizeTexture",
	"_sizeName",
	"_sizeNameShort",
	"_sizeNameGender",
	"_textDefault",
	"_textShortDefault",
	"_sizeValue",
	"_cfgSize",
	"_side",
	"_sidePrefix",
	"_sideColor",
	"_cfgSide",
	"_text",
	"_textShort",
	"_texture",
	"_textureSize",
	"_insignia",
	"_color",
	"_cfgColor",
	"_commander",
	"_commanderID",
	"_cfgCommander",
	"_commanderRank",
	"_commanderRankNameShort",
	"_commanderTexture",
	"_description",
	"_cfgDescription",
	"_assets",
	"_assetsText",
	"_asset",
	"_assetCountActive",
	"_assetCountInactive",
	"_assetIcon",
	"_infoText",
	"_paramsArray",
	"_cfgParamsArray",
	"_newArray"
];



_class = [_this,0,configfile,[configfile,""]] call bis_fnc_param;

//--- Function output definitions
#define DEF_indexClassname		0
#define DEF_indexSubclasses		1
#define DEF_indexText			2
#define DEF_indexTexture		3
#define DEF_indexinsignia		4
#define DEF_indexSize			5
#define DEF_indexColor			6
#define DEF_indexTextureSize		7
#define DEF_indexInfoText		8
#define DEF_indexSizeTexture		9
#define DEF_indexTextShort		10
#define DEF_indexAssetsText		11

//--- Override definitions
#define DEF_overrideID			0
#define DEF_overrideSize		1
#define DEF_overrideType		2
#define DEF_overrideSide		3
#define DEF_overrideText		4
#define DEF_overrideTextShort		5
#define DEF_overrideTexture		6
#define DEF_overrideTextureSize		7
#define DEF_overrideinsignia		8
#define DEF_overrideColor		9
#define DEF_overrideCommander		10
#define DEF_overrideCommanderRank	11
#define DEF_overrideDescription		12
#define DEF_overrideAssets		13

//--- Return param index
if (typename _class == typename "") exitwith {
	switch (tolower _class) do {
		case "count":			{12};
		case "configname":		{DEF_indexClassname};
		case "subclasses":		{DEF_indexSubclasses};
		case "text":			{DEF_indexText};
		case "texture":			{DEF_indexTexture};
		case "insignia":		{DEF_indexinsignia};
		case "size":			{DEF_indexSize};
		case "color":			{DEF_indexColor};
		case "texturesize":		{DEF_indexTextureSize};
		case "infotext":		{DEF_indexInfoText};
		case "sizetexture":		{DEF_indexSizeTexture};
		case "textshort":		{DEF_indexTextShort};
		case "assetstext":		{DEF_indexAssetsText};
		default				{-1};
	};
};

//--- Class not found - exit with default values
if !(isclass _class) then {
	"Class not found" call bis_fnc_error;
	_result = [];
	_result set [DEF_indexClassname,		""];
	_result set [DEF_indexSubclasses,		1];
	_result set [DEF_indexText,			""];
	_result set [DEF_indexTexture,			""];
	_result set [DEF_indexinsignia,			""];
	_result set [DEF_indexSize,			0];
	_result set [DEF_indexColor,			[0,0,0,0]];
	_result set [DEF_indexTextureSize,		0];
	_result set [DEF_indexInfoText,			""];
	_result set [DEF_indexSizeTexture,		0];
	_result set [DEF_indexTextShort,		""];
	_result set [DEF_indexAssetsText,		[]];
	_result
};

_overrideParams = missionnamespace getvariable ["BIS_fnc_ORBATsetGroupParams_groups",[]];
_fnc_checkOverride = {
	private ["_id","_value","_groupID","_params","_valueOverride"];
	_id = _this select 0;
	_value = _this select 1;

	_groupID = _overrideParams find _class;
	if (_groupID >= 0) then {
		_params = _overrideParams select (_groupID + 1);
		_valueOverride = [_params,_id,_value] call bis_fnc_paramIn;
		if !(isnil "_valueOverride") then {_valueOverride} else {_value};
	} else {
		_value
	};
};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- ID
_id = [_class,"id"] call bis_fnc_returnconfigentry;
if (isnil "_id") then {_id = "";};
_id = [DEF_overrideID,_id] call _fnc_checkOverride;
_idTextShort = "";
_idText = switch (true) do {
	case (typename _id == typename 00): {
		if (_id > 0) then {
			_idType = getnumber (_class >> "idType");
			switch _idType do {
				case 1: {_id call bis_fnc_romanNumeral};
				case 2: {_idTextShort = [_id,true] call bis_fnc_phoneticalWord; [_id,false] call bis_fnc_phoneticalWord};
				case 3: {_id call bis_fnc_teamColor};
				default {_id call bis_fnc_ordinalNumber};
			};
		} else {
			""
		};
	};
	case (typename _id == typename ""): {_id};
	case (typename _id == typename []): {""};
};
if (_idTextShort == "") then {_idTextShort = _idText;};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Unit Size
_size = gettext (_class >> "size");
_size = [DEF_overrideSize,_size] call _fnc_checkOverride;
_sizeTexture = "";
_sizeName = "";
_sizeNameShort = "";
_sizeNameGender = 0;
_textDefault = "";
_textShortDefault = "";
_sizeValue = 1;
_cfgSize = configfile >> "CfgChainOfCommand" >> "Sizes" >> _size;
if (isclass _cfgSize) then {
	_sizeTexture = gettext (_cfgSize >> "texture");
	_sizeName = gettext (_cfgSize >> "name");
	_sizeNameShort = gettext (_cfgSize >> "nameShort");
	_sizeNameGender = ((gettext (_cfgSize >> "nameGender")) call bis_fnc_parsenumber) max 0 min 2;
	if (isnil {_sizeNameGender}) then {_sizeNameGender = 0;};
	_sizeValue = getnumber (_cfgSize >> "size");
	_textDefault = gettext (_cfgSize >> "textDefault");
	_textShortDefault = gettext (_cfgSize >> "textShortDefault");
} else {
	if (_size != "") then {
		["%1: Size '%2' not found in ""CfgChainOfCommand"" >> ""Sizes""",_class,_size] call bis_fnc_error;
	};
};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Type
_type = gettext (_class >> "type");
_type = [DEF_overrideType,_type] call _fnc_checkOverride;
_typeName = "";
_typeTexture = "";
_cfgType = configfile >> "CfgChainOfCommand" >> "Types" >> _type;
if (isclass _cfgType) then {
	_typeTexture = gettext (_cfgType >> "texture");
	_typeGender = ["nameMasculine","nameFeminine","nameNeutral"] select _sizeNameGender;
	_typeName = gettext (_cfgType >> _typeGender);
} else {
	if (_type != "") then {
		["%1: Type '%2' not found in ""CfgChainOfCommand"" >> ""Types""",_class,_type] call bis_fnc_error;
	};
};
_typeTexture = _typeTexture call bis_fnc_textureMarker;
_sizeTexture = _sizeTexture call bis_fnc_textureMarker;


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Side
_side = gettext (_class >> "side");
_side = [DEF_overrideSide,_side] call _fnc_checkOverride;
_sidePrefix = "";
_sideColor = [1,1,1,1];
_cfgSide = configfile >> "CfgChainOfCommand" >> "Sides" >> _side;
if (isclass _cfgSide) then {
	_sidePrefix = gettext (_cfgSide >> "prefix");
	_sideColor = (_cfgSide >> "color") call bis_fnc_colorConfigToRGBA;
} else {
	if (_side != "") then {
		["%1: Side '%2' not found in ""CfgChainOfCommand"" >> ""Sides""",_class,_side] call bis_fnc_error;
	};
};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Text
_text = gettext (_class >> "text");
if (_text == "") then {_text = _textDefault;};
_text = [DEF_overrideText,_text] call _fnc_checkOverride;


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Short Text
_textShort = gettext (_class >> "textShort");
if (_textShort == "") then {_textShort = _textShortDefault;};
if (_textShort == "") then {_textShort = _text;};
_textShort = [DEF_overrideTextShort,_textShort] call _fnc_checkOverride;


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Icon Texture
_texture = gettext (_class >> "texture");
_texture = [DEF_overrideTexture,_texture] call _fnc_checkOverride;
if (_texture == "" && _sidePrefix != "" && _typeTexture != "") then {_texture = _sidePrefix + _typeTexture};
_texture = _texture call bis_fnc_textureMarker;
_texture = _texture call bis_fnc_textureVehicleIcon;


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Icon Texture Size
_textureSize = getnumber (_class >> "textureSize");
_textureSize = [DEF_overrideTextureSize,_textureSize] call _fnc_checkOverride;
if (_textureSize <= 0) then {
	_textureSize = getnumber (_cfgSide >> "size");
	if (_textureSize <= 0) then {_textureSize = 1;};
};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Background Texture
_insignia = gettext (_class >> "insignia");
_insignia = [DEF_overrideinsignia,_insignia] call _fnc_checkOverride;


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Icon Texture Color
_cfgColor = _class >> "color";
_color = if (istext _cfgColor) then {
	_colorMarker = configfile >> "CfgMarkerColors" >> (gettext _cfgColor);
	if (isclass _colorMarker) then {(_colorMarker >> "color") call bis_fnc_colorConfigToRGBA} else {_sideColor};
} else {
	if (isarray _cfgColor) then {_cfgColor call bis_fnc_colorConfigToRGBA} else {_sideColor};
};
_color = [DEF_overrideColor,_color] call _fnc_checkOverride;
if (count _color != 4) then {_color = _sideColor;};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Commander
_commander = gettext (_class >> "commander");
_commander = [DEF_overrideCommander,_commander] call _fnc_checkOverride;
_cfgCommander = configfile >> "CfgWorlds" >> "GenericNames" >> _commander >> "LastNames";
if (isclass _cfgCommander) then {
	_classArray = toarray str _class;
	_commanderID = 42;
	{
		_commanderID = _commanderID + (-_x + _foreachindex)^2;
	} foreach _classArray;
	_commanderID = abs (_commanderID % (count _cfgCommander));	
	_commander = gettext (_cfgCommander select _commanderID);
};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Commander Rank (empty string will use unit size default)
_commanderRank = gettext (_class >> "commanderRank");
_commanderRank = [DEF_overrideCommanderRank,_commanderRank] call _fnc_checkOverride;
_commanderRankNameShort = "";
_commanderRankTexture = "";
if (_commanderRank == "") then {_commanderRank = gettext (_cfgSize >> "commanderRank");}; //--- Apply rank based on unit size
if (_commanderRank != "") then {
	_commanderRankNameShort = [_commanderRank,"displayNameShort"] call bis_fnc_rankParams;
	_commanderRankTexture = [_commanderRank,"texture"] call bis_fnc_rankParams;
};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Description
_cfgDescription = _class >> "description";
_description = if (isarray _cfgDescription) then {
	_descriptionArray = getarray _cfgDescription;
	_description = "";
	{
		_description = _description + _x;
		_description = _description + "<br />";
	} foreach _descriptionArray;
	_description
} else {
	gettext _cfgDescription;
};
_description = [DEF_overrideDescription,_description] call _fnc_checkOverride;


////////////////////////////////////////////////////////////////////////////////////////////////
//--- ParamsArray
_cfgParamsArray = _class >> "ParamsArray";
_paramsArray = [];
if (isarray _cfgParamsArray) then {
	_paramsArray = getArray _cfgParamsArray;
};


////////////////////////////////////////////////////////////////////////////////////////////////
//--- Assets
_assets = getarray (_class >> "assets");
_assets = [DEF_overrideAssets,_assets] call _fnc_checkOverride;
_assetsText = "";
{
	_asset = [_x,0,"",[""]] call bis_fnc_paramIn;
	_assetCountActive = [_x,1,1,[1]] call bis_fnc_paramIn;
	_assetCountInactive = [_x,2,0,[0]] call bis_fnc_paramIn;

	_assetIcon = gettext (configfile >> "CfgVehicles" >> _asset >> "picture");
	_assetIcon = _assetIcon call bis_fnc_textureVehicleIcon;
	for "_a" from 1 to _assetCountActive do {
		_assetsText = _assetsText + format ["<img image='%1' color='#ffffffff' size='1.1' />",_assetIcon];
	};
	for "_i" from 1 to _assetCountInactive do {
		_assetsText = _assetsText + format ["<img image='%1' color='#26ffffff' size='1.1' />",_assetIcon];
	};
} foreach _assets;


//--- //--- Apply arguments on the text
_text = format [
	_text,
	/* %1 */ _idText,
	/* %2 */ _typeName,
	/* %3 */ _sizeName
];
_textShort = format [
	_textShort,
	/* %1 */ _idTextShort,
	/* %2 */ _typeName,
	/* %3 */ _sizeNameShort
];

//--- Remove white space on the beginning (e.g. when unit ID and type are empty)
_space = toarray " " select 0;

_textArray = toarray _text;
{
	if (_x != _space) exitwith {};
	_textArray set [_foreachindex,-1];
} foreach _textArray;
_textArray = _textArray - [-1];
_text = tostring _textArray;

_textShortArray = toarray _textShort;
{
	if (_x != _space) exitwith {};
	_textShortArray set [_foreachindex,-1];
} foreach _textShortArray;
_textShortArray = _textShortArray - [-1];
_textShort = tostring _textShortArray;



//--- Parse tooltip text
_infoText = _text;
if (_commander != "") then {
	if (_commanderRankNameShort == "") then {
		_infoText = _infoText + format ["<br /><t size='0.3' color='#00000000'>-<br /></t><t size='0.8'>%1</t>",_commander];
	} else {
		_infoText = _infoText + format ["<br /><t size='0.3' color='#00000000'>-<br /></t><img image='%1' /><t size='0.8'> %2. %3</t>",_commanderRankTexture,_commanderRankNameShort,_commander];
	};
};
if (_description != "") then {
	if ((count _paramsArray) != 0) then {
		_newArray = [];
		{
			_newArray = _newArray + [call (compile _x)]
		} forEach _paramsArray;
		_paramsArray = _newArray;
		_description = format ([_description] + _paramsArray);
	};
	_infoText = _infoText + format ["<br /><t size='0.5' color='#00000000'>-<br /></t><t size='0.8'>%1</t>",_description];
};

//--- Compose params
_result = [];
_result set [DEF_indexClassname,		configname _class];
_result set [DEF_indexSubclasses,		1];
_result set [DEF_indexText,		_text];
_result set [DEF_indexTexture,		_texture];
_result set [DEF_indexinsignia,	_insignia];
_result set [DEF_indexSize,		_sizeValue];
_result set [DEF_indexColor,		_color];
_result set [DEF_indexTextureSize,		_textureSize];
_result set [DEF_indexInfoText,		_infoText];
_result set [DEF_indexSizeTexture,		_sizeTexture];
_result set [DEF_indexTextShort,		_textShort];
_result set [DEF_indexAssetsText,		_assetsText];
_result