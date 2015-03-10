//--- Allow only in dev version
if (cheatsEnabled) then {

	//--- Teleport player
	onmapsingleclick "
		if (_alt) then {
			vehicle player setpos [_pos select 0,_pos select 1,position vehicle player select 2];
			_dir = direction vehicle player;

			if (_shift) then {
				_vehs = [vehicle player];
				{
					_veh = vehicle _x;
					if !(_veh in _vehs) then {
						_veh setpos ([_pos,10 * (count _vehs),_dir + 180] call bis_fnc_relpos);
						_veh setdir _dir;
						_vehs set [count _vehs,_veh];
					};
				} foreach (units player - [player]);
			};
		};
	";
};
true
/*
[] spawn {
	waituntil {!isnull player};
	player playaction "stand"
};
*/