scriptName "initDayTime.sqf";

/*--------------------------------------------------------------------------------------------------

	STUFF RELATED TO DAYTIME AND LIGHT LEVEL

--------------------------------------------------------------------------------------------------*/

#define	WAIT		if !(BIS_DayTime_forceUpdate || BIS_DayTime_fastUpdate) then {sleep 1}
#define NIGHT_GOGGLES	["g_tactical_clear","g_balaclava_blk","g_balaclava_combat","g_balaclava_lowprofile","g_balaclava_oli","g_bandanna_beast","g_bandanna_blk","g_bandanna_khk","g_bandanna_oli","g_bandanna_tan"]

[] spawn
{
	scriptName "initDayTime.sqf: main loop";

	waitUntil {!(isNil "BIS_Ai_walkingBots")};

	private["_stage","_walkingUnits","_allUnits","_goggles","_t","_chemlightPoints"];

	BIS_DayTime_forceUpdate = true;
	BIS_DayTime_fastUpdate = true;

	_stage = ["stage"] call BIS_fnc_getCfgData;
	_chemlightPoints = allMissionObjects "Sign_Arrow_Large_Green_F";

	//remove gunlights from walking patrols
	{
		//remove flashlights
		_x removePrimaryWeaponItem "acc_flashlight";

		//turn on the flashlights
		(group _x) enableGunLights "forceOff";
	}
	forEach BIS_Ai_walkingBots;

	while {true} do
	{
		_walkingUnits = BIS_Ai_walkingBots;
		_allUnits = entities "Man";

		/*----------------------------------------------------------------------------------

			NIGHT

		----------------------------------------------------------------------------------*/
		if !((daytime > 7.5) && (daytime < 18.5)) then
		{
			["Refreshing nighttime effects..."] call BIS_fnc_logFormat;

			//setup walking soldiers ---------------------------------------------------
			/*
			{
				//add flashlights
				_x addPrimaryWeaponItem "acc_flashlight";

				//turn on the flashlights
				(group _x) enableGunLights "forceOn";

				WAIT;
			}
			forEach _walkingUnits;
			*/

			//remove unwanted goggles --------------------------------------------------
			{
				_goggles = toLower (goggles _x);

				if (_goggles != "") then
				{
					if !(_goggles in NIGHT_GOGGLES) then
					{
						_x setVariable ["BIS_goggles",_goggles];
						removeGoggles _x;
					};

					WAIT;
				};
			}
			forEach _allUnits;

			//create chemlights --------------------------------------------------------
			private["_chemlight","_class"];

			{
				_chemlight = _x getVariable ["BIS_chemlight",objNull];
				_class 	   = _x getVariable ["BIS_chemlightType","chemlight_blue"];

				if !(isNull _chemlight) then
				{
					_chemlight spawn
					{
						scriptName "initDayTime.sqf: delayed chemlight spawn";

						sleep 5;

						deleteVehicle _this; waitUntil{isNull _this};
					};
				};

				_chemlight = _class createVehicle (getPos _x);
				_chemlight setPos getPos _x;

				_x setVariable ["BIS_chemlight",_chemlight];
			}
			forEach _chemlightPoints;
		}
		/*----------------------------------------------------------------------------------

			DAY

		----------------------------------------------------------------------------------*/
		else
		{
			["Refreshing daytime effects..."] call BIS_fnc_logFormat;

			//setup walking soldiers ---------------------------------------------------
			/*
			{
				//add flashlights
				_x removePrimaryWeaponItem "acc_flashlight";

				//turn on the flashlights
				(group _x) enableGunLights "forceOff";

				WAIT;
			}
			forEach _walkingUnits;
			*/

			//re-add original goggles --------------------------------------------------
			{
				_goggles = _x getVariable ["BIS_goggles",""];

				if (_goggles != "") then
				{
					if (goggles _x == "") then
					{
						_x setVariable ["BIS_goggles",nil];
						_x addGoggles _goggles;

						WAIT;
					};
				};
			}
			forEach _allUnits;

			//delete chemlights --------------------------------------------------------
			private["_chemlight"];

			{
				_chemlight = _x getVariable ["BIS_chemlight",objNull];

				if !(isNull _chemlight) then
				{
					deleteVehicle _chemlight; waitUntil{isNull _chemlight};
					_x setVariable ["BIS_chemlight",nil];
				};
			}
			forEach _chemlightPoints;
		};

		_t = time + 900;

		waitUntil
		{
			(time > _t) || (BIS_DayTime_forceUpdate)
		};

		if (BIS_DayTime_forceUpdate) then
		{
			BIS_DayTime_fastUpdate = true;
		};

		BIS_DayTime_forceUpdate = false;
	};
};