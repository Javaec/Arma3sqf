/*
	Author: Karel Moricky

	Description:
	Unregister texture(s) to be displayed over CfgORBAT group.

	Parameter(s):
		0: CONFIG - path to group in CfgORBAT.
		1: NUMBER - overlay ID returned by BIS_fnc_ORBATAddGroupOverlay

	Returns:
	BOOL - true if overlay entry no longer exists
*/

private ["_group","_id","_groupID","_params"];
_group = [_this,0,configfile,[configfile]] call bis_fnc_param;
_id = [_this,1,-1,[0]] call bis_fnc_param;

if (isnil "BIS_fnc_ORBATAddGroupOverlay_groups") then {BIS_fnc_ORBATAddGroupOverlay_groups = [];};
_groupID = BIS_fnc_ORBATAddGroupOverlay_groups find _group;
if (_groupID >= 0) then {
	_params = BIS_fnc_ORBATAddGroupOverlay_groups select (_groupID + 1);
	if (_id < count _params && _id >= 0) then {
		_params set [_id,-1];

		//--- No entries left, remove whole group
		if ({typename _x == typename -1} count _params == count _params) then {
			BIS_fnc_ORBATAddGroupOverlay_groups set [_groupID,-1];
			BIS_fnc_ORBATAddGroupOverlay_groups set [_groupID + 1,-1];
			BIS_fnc_ORBATAddGroupOverlay_groups = BIS_fnc_ORBATAddGroupOverlay_groups - [-1];
		};
		true	
	} else {
		["Cannot remove '%1' parameter #%2, only %3 exists.",_group,_id,count _params] call bis_fnc_error;
		false
	};
} else {
	["Group '%1' not found in overlay list. Register it first by BIS_fnc_ORBATAddGroupOverlay.",_group] call bis_fnc_error;
	false
};