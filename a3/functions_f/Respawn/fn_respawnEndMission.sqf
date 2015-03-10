/*
	Author: Karel Moricky

	Description:
	End a mission if all players are dead

	Parameter(s):
	NONE

	Returns:
	NOTHING (the script never ends)
*/


if (ismultiplayer) then {

	if ((0 call bis_fnc_missionRespawnType) in [0,1,4,5]) then {

		//--- No more respawn slots
		if ({isplayer _x && alive _x} count playableunits == 0) then {
			[["endDeath",false],"bis_fnc_endmission"] call bis_fnc_mp;
		};

		//--- Don't end the script to prevent premature mission end
		waituntil {false};
	} else {

		_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
		if (!alive _unit) then {

			//--- No more respawn tickets
			if ([] call bis_fnc_respawntickets == 0 && {isplayer _x} count playableunits == 0) then {
				[["endDeath",false],"bis_fnc_endmission"] call bis_fnc_mp;
			};
		};
	};
};