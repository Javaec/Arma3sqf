/*
	Author: Muf (modified by Karel Moricky)

	Description:
		* Opens Field Manual in briefing (SP, MP Server, MP Client) and player's map.
		* Selects the topic and hint passed as parameters.

	Parameter(s):
		0: ARRAY OF STRINGS - Class names of topic and hint that will be selected in the opened Field Manual (e. g. ["Damage", "HitDamage"]).

	Returns:
		NOTHING
*/


private ["_topic","_hint","_parentDisplay"];

_topic = [_this,0,"",[""]] call bis_fnc_param;
_hint = [_this,1,"",[""]] call bis_fnc_param;
_parentDisplay = [_this,2,displaynull,[displaynull]] call bis_fnc_param;

uinamespace setvariable ['RscDisplayFieldManual_Topic', "GlobalTopic_" + _topic];
uinamespace setvariable ['RscDisplayFieldManual_Hint', _topic + "_" + _hint];

_parentDisplay = switch true do {
	case !(isnull _parentDisplay): {_parentDisplay}; // Custom display (has priority)
	case !isnull(findDisplay 129): {finddisplay 129}; // Tasks after J key in game (RscDisplayDiary)
	case !isnull(findDisplay 37): {finddisplay 37}; // SP Briefing (DisplayGetReady)
	case !isnull(findDisplay 52): {finddisplay 52}; // MP Server Briefing (RscDisplayServerGetReady)
	case !isnull(findDisplay 53): {finddisplay 53}; // MP Client Briefing (RscDisplayClientGetReady)
	case !isnull(findDisplay 12): {finddisplay 12}; // Map (RscDisplayMainMap)
};
_parentDisplay createDisplay "RscDisplayFieldManual";