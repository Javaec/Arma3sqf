//Accept either a single staff character, or a list
private ["_staff"];
_staff = [_this, 0, [], [[], objNull]] call bis_fnc_param;
if ((typeName _this) == typeName objNull) then 
{
	_staff = [_staff];
};

{
	private ["_positions"];
	_positions = getArray ((_x getVariable "config") >> "positions");
	if ((count _positions) > 0) then 
	{
		private ["_posObj"];
		//call (compile ("_posObj = " + (_positions select 0)));
		_posObj = missionnamespace getvariable (_positions select 0);
		if !(isnil "_posObj") then {
			private ["_pos"];
			_pos = position _posObj;
			if (_x != HSim_Mechanic) then {_pos = [_pos select 0, _pos select 1, 0.04];}; //Dropping slightly above surface to prevent sinking
			_x setPos _pos;
			_x setDir (direction _posObj);
			resetSubgroupDirection _x;
			_x switchMove (["AidlPercMstpSnonWnonDnon_idleSteady01", "AidlPercMstpSnonWnonDnon_idleSteady02", "AidlPercMstpSnonWnonDnon_idleSteady03", "AidlPercMstpSnonWnonDnon_idleSteady04"] call BIS_fnc_selectRandom);
			if (_x != player) then //Looking at is handled in conversations
			{
				_x disableAI "AUTOTARGET";
				_x glanceAt HSim_Player;
			};
		};
	};
} forEach _staff;

true