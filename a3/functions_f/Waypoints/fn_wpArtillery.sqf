/*
	Author: Karel Moricky

	Description:
	Let group members fire artillery barrage on waypoint position

	Parameters:
		0: GROUP
		1: ARRAY - waypoint position
		2: OBJECT - target to which waypoint is attached to
		3 (Optional): NUMBER - number of fired rounds
		4 (Optional): STRING - magazine type

	Returns:
	BOOL
*/

private ["_group","_pos","_target","_count","_magazine","_wp"];
_group = [_this,0,grpnull,[grpnull]] call bis_fnc_param;
_pos = [_this,1,[],[[]],3] call bis_fnc_param;
_target = [_this,2,objnull,[objnull]] call bis_fnc_param;
_count = [_this,3,100,[0]] call bis_fnc_param;
_magazine = [_this,4,"",[""]] call bis_fnc_param;
_wp = [_group,currentwaypoint _group];
_wp setwaypointdescription localize "STR_A3_CfgWaypoints_Artillery";

private ["_vehsFire"];
_vehsFire = [];

waituntil {
	private ["_countReady","_vehsGroup"];
	_countReady = 0;
	_vehsGroup = [];

	//--- Fire
	{
		private ["_veh"];
		_veh = vehicle _x;
		if (_x == effectivecommander _x) then {
			//--- Determine which rounds to fire
			private ["_vehMagazine","_vehArtilleryAmmo"];
			_vehMagazine = _veh getvariable ["bis_fnc_wpArtillery_magazine",_magazine];
			_vehArtilleryAmmo = getartilleryammo [_veh];
			if (_vehMagazine == "" && count _vehArtilleryAmmo > 0) then {_vehMagazine = _vehArtilleryAmmo select 0};

			if !(_veh in _vehsFire) then {
				//--- Fire
				_veh setvariable ["bis_fnc_wpArtillery_magazine",_vehMagazine]; //--- Use only one magazine type
				_veh doartilleryfire [_pos,_vehMagazine,_count];
				_vehsFire set [count _vehsFire,_veh];
			} else {
				if (currentcommand _veh != "FIRE AT POSITION") then {
					if ((_pos inRangeOfArtillery [[_veh],_vehMagazine]) && (_vehMagazine in _vehArtilleryAmmo)) then {
						//--- Magazine reloaded - refresh the fire command
						_vehsFire = _vehsFire - [_veh];
					} else {
						//--- Can no longer fire
						_countReady = _countReady + 1;
					};
				};

			};
			_vehsGroup set [count _vehsGroup,_veh];
		};
	} foreach units _group;

	//--- Remove vehicles which are no longer in the group
	_vehsObsolete = _vehsFire - _vehsGroup;
	_vehsFire = _vehsFire - _vehsObsolete;
	{
		_x setvariable ["bis_fnc_wpArtillery_magazine",nil];
		_x move position _x;
	} foreach _vehsObsolete;

	sleep 1;
	count _vehsGroup == _countReady
};

//--- Cleanup
{
	_x setvariable ["bis_fnc_wpArtillery_magazine",nil];
	_x move position _x;
} foreach _vehsFire;
true