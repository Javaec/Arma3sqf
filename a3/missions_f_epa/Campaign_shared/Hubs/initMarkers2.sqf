scriptName "initMarkers2.sqf";

[] spawn
{
	private[ "_stage" ];

	_stage = ["stage"] call BIS_fnc_getCfgData;

	//["STAGE INIT MARKERS:%1", _stage ] call BIS_fnc_LogFormat;

	switch( _stage ) do
	{
		case "B":
		{
			[ [ 0.001, 0.00492918 ] ] call BIS_fnc_camp_showHubMarkers;
		};
	        case "A":
	        {
			[ [ 0.001, 0.0208046 ] ] call BIS_fnc_camp_showHubMarkers;
		};
	};
};