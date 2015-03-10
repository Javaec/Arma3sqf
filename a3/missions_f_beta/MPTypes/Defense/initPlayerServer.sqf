_player = _this select 0;
_logic = _this select 1;
_curator = missionnamespace getvariable ["bis_curator",objnull];

//--- Curator init
if (_player == _curator) then {

	sleep .1;
	waituntil {count (bis_curator call bis_fnc_curatorplaceableaddons) > 0};
	[[],"bis_fnc_openCuratorInterface",bis_curator] call bis_fnc_mp;

} else {
	if !(isnull _curator) then {
		[bis_curator,[_player]] call bis_fnc_curatorAddPlayers;
	};
};