bis_curator call bis_fnc_addCurator;
[bis_curator,[+0,true]] call bis_fnc_curatorSetCoefMove;
[bis_curator,[+0,true]] call bis_fnc_curatorSetCoefDelete;
[bis_curator,[+0,false]] call bis_fnc_curatorSetCoefDestroy;
[
	bis_curator,
	(playableunits + switchableunits) - [bis_curator]
] call bis_fnc_curatorAddPlayers;