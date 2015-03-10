/*
	Author: Karel Moricky

	Description:
	Override group params from CfgORBAT.

	Parameter(s):
		0: NUMBER or STRING - ID (e.g., 1 to result in "1st", or a specific string)
		1: STRING - size as a class from CfgChainOfCommand > Sizes (e.g., "Platoon")
		2: STRING - type as a class from CfgChainOfCommand > Types (e.g., "Infantry")
		3: STRING - side as a class from CfgChainOfCommand > Sides (e.g., "West")
		4: STRING - name. Passed arguments are: %1 - ID, %2 - type, %3 - size)
		5: STRING - short name. Passed arguments are: %1 - ID, %2 - type, %3 - size)
		6: STRING - texture. Can be link to a file or a class from CfgMarkers
		7: NUMBER - texture size coeficient. 1 is the default size
		8: STRING - insignia displayed in tooltip and in the ORBAT viewer background
		9: ARRAY - texture color in format RGBA
		10: STRING - commander name. Can be the name directly or a class from CfgWorlds > GenericNames
		11: STRING - commander rank.
		12: STRING - description
		13: ARRAY - assets. Items are ARRAYs in format [vehicleClass:STRING,count:NUMBER]

	Returns:
	BOOL
*/
private ["_group","_groupArray","_groupID","_types","_type","_value"];
_group = [_this,0,configfile,[configfile]] call bis_fnc_param;
_groupArray = [];
_groupArray resize 9;

_remove = if (typename _this == typename []) then {count _this <= 1} else {true};
if (_remove) then {
	//--- Remove param
	_groupID = BIS_fnc_ORBATsetGroupParams_groups find _group;
	if (_groupID >= 0) then {
		BIS_fnc_ORBATsetGroupParams_groups set [_groupID,-1];
		BIS_fnc_ORBATsetGroupParams_groups set [_groupID + 1,-1];
		BIS_fnc_ORBATsetGroupParams_groups = BIS_fnc_ORBATsetGroupParams_groups - [-1];
		true
	} else {
		false
	};
} else {
	//--- Set param
	_typesArray = [
		["",00], //--- ID
		[""], //--- Size
		[""], //--- Type
		[""], //--- Side
		[""], //--- Text
		[""], //--- TextShort
		[""], //--- Texture
		[00], //--- TextureSize
		[""], //--- insignia
		[[]], //--- Color
		[""], //--- Commander
		[""], //--- CommanderRank
		[""], //--- Description
		[[]] //--- Assets
	];


	for "_t" from 0 to (count _typesArray - 1) do {
		_types = _typesArray select _t;
		_value = [_this,_t + 1,objnull,_types + [objnull]] call bis_fnc_param;
		if ({typename _value == typename _x} count _types > 0) then {
			_groupArray set [_t,_value];
		};
	};

	if (isnil "BIS_fnc_ORBATsetGroupParams_groups") then {BIS_fnc_ORBATsetGroupParams_groups = [];};
	_groupID = BIS_fnc_ORBATsetGroupParams_groups find _group;
	if (_groupID < 0) then {_groupID = count BIS_fnc_ORBATsetGroupParams_groups};

	//--- Create a new entry
	BIS_fnc_ORBATsetGroupParams_groups set [_groupID,_group];
	BIS_fnc_ORBATsetGroupParams_groups set [_groupID + 1,_groupArray];
	true
};