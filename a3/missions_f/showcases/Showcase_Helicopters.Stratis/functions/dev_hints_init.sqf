//advanced hints -----------------------------------------------------------------------------------

missionNamespace setVariable ["Vehicle|Radar", ["Vehicle", "Radar", -1, {vehicle player == Bis_Heli}]];
missionNamespace setVariable ["Vehicle|Countermeasures", ["Vehicle", "CountermeasuresSimple", -1, {vehicle player == Bis_Heli}]];
missionNamespace setVariable ["InfantryMovement|Death", ["InfantryMovement", "Death", 1, {!(alive player)}]];

Bis_ContextHints =
[
	"InfantryMovement|Death",
	"Vehicle|Radar",
	"Vehicle|Countermeasures"
];