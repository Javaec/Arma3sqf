#define VAR_RELOADS	(missionname + "_reloads_" + str ismultiplayer)

//--- Mission end type and rating
addMissionEventHandler [
	"ended",
	{

		BIS_fnc_missionHandlers_end = _this;
		BIS_fnc_missionHandlers_rating = rating player;
		//BIS_fnc_missionHandlers_time = [true,true] call bis_fnc_trackMissionTime;

		if !(ismultiplayer) then {
			//--- Get reloads and delete them afterwards
			_reloads = profilenamespace getvariable [VAR_RELOADS,0];
			BIS_fnc_missionHandlers_reloads = _reloads;
			profilenamespace setvariable [VAR_RELOADS,nil];
			saveprofilenamespace;
		};
	}
];

//--- Track reloads
if !(ismultiplayer) then {
	addMissionEventHandler [
		"loaded",
		{
			if (_this != "continue") then {
				if (missionname != "") then {
					_reloads = profilenamespace getvariable [VAR_RELOADS,0];
					_reloads = _reloads + 1;
					profilenamespace setvariable [VAR_RELOADS,_reloads];
					saveprofilenamespace;
				};

				//BIS_fnc_missionHandlers_time = time;
			};
		}
	];
	if (missionname != "") then {
		//_reloads = profilenamespace getvariable [VAR_RELOADS,-1];
		//_reloads = _reloads + 1;
		_reloads = 0;
		profilenamespace setvariable [VAR_RELOADS,_reloads];
		saveprofilenamespace;
	};

	//BIS_fnc_missionHandlers_time = time;
};
true