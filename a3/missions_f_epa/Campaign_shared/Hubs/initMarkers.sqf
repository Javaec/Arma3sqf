private[ "_stage" ];

_stage = ["stage"] call BIS_fnc_getCfgData;

//["STAGE INIT MARKERS:%1", _stage ] call BIS_fnc_LogFormat;

switch( _stage ) do
{
	case "B":
	{
		#include "\a3\Missions_F_EPA\Campaign_shared\Scripts\SetSituationMarkersStageB.sqf"
	};
        case "A":
        {
		#include "\a3\Missions_F_EPA\Campaign_shared\Scripts\SetSituationMarkers.sqf"
	};
	default
	{
		#include "\a3\Missions_F_EPA\Campaign_shared\Scripts\markers_for_hubs_shared.hpp"
	};
};