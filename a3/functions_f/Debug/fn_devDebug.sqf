//--- Allow only in dev version
if (cheatsEnabled) then {

	//--- Teleport player
	onmapsingleclick "
		if (_alt) then {
			vehicle player setpos [_pos select 0,_pos select 1,position vehicle player select 2];
		};
	";
};