
/*
	File: returnGroupComp.sqf
	Author: Joris-Jan van 't Land

	Description:
	Function which returns a logical group composition based on a number of parameters.

	Parameter(s):
	_this select 0: side (Side).
	_this select 1: number of characters (Number).
	_this select 2: (optional) type (String):
		- "riflesquad": (default) standard rifle squad.
		- "sniper": sniper team.

	Returns:
	Array of Strings - object types.
	
	TODO: use CfgGroups instead?
*/

//Validate parameter count
if ((count _this) < 2) exitWith {debugLog "Log: [returnGroupComp] Function requires at least 2 parameters!"; []};

private ["_side", "_amount", "_type"];
_side = _this select 0;
_amount = _this select 1;
_type = "riflesquad";
if ((count _this) == 3) then
{
	_type = _this select 2;
};

//Validate parameters
if ((typeName _side) != (typeName sideEnemy)) exitWith {debugLog "Log: [returnGroupComp] Side (0) must be a Side!"; []};
if ((typeName _amount) != (typeName 0)) exitWith {debugLog "Log: [returnGroupComp] Amount (1) must be a Number!"; []};
if ((typeName _type) != (typeName "")) exitWith {debugLog "Log: [returnGroupComp] Type (2) must be a String!"; []};

private ["_types"];
_types = [];

//TODO: now AH content is only used when A2 content is completely missing!
//TODO: better replace by a system based off CfgGroups?
if (configName(configFile >> "CfgVehicles" >> "USMC_Soldier_TL") != "") then 
{
	switch (_side) do
	{
		case west:
		{
			switch (_type) do
			{
				case "riflesquad":
				{
					if (_amount == 4) then
					{
						private ["_pool"];
						_pool =
						[
							[
								"USMC_Soldier_TL",
								"USMC_Soldier_AR",
								"USMC_Soldier",
								"USMC_Soldier_AT"
							],

							[
								"USMC_Soldier_TL",
								"USMC_Soldier_MG",
								"USMC_Soldier_AR",
								"USMC_Soldier"
							],

							[
								"USMC_Soldier_TL",
								"USMC_Soldier_AR",
								"USMC_Soldier_AT",
								"USMC_Soldier_AT"
							],

							[
								"USMC_Soldier_TL",
								"USMC_Soldier_AR",
								"USMC_Soldier",
								"USMC_Soldier_Medic"
							]
						];

						_types = _pool call BIS_fnc_selectRandom;
					};

					if (_amount == 9) then
					{
						private ["_pool"];
						_pool =
						[
							[
								"USMC_Soldier_SL",
								"USMC_Soldier_TL",
								"USMC_Soldier_AR",
								"USMC_Soldier",
								"USMC_Soldier_AT",
								"USMC_Soldier_TL",
								"USMC_Soldier_AR",
								"USMC_Soldier",
								"USMC_Soldier"
							],

							//Weapons squad.
							[
								"USMC_Soldier_SL",
								"USMC_Soldier_TL",
								"USMC_Soldier_MG",
								"USMC_Soldier_AR",
								"USMC_Soldier",
								"USMC_Soldier_TL",
								"USMC_Soldier_MG",
								"USMC_Soldier_AR",
								"USMC_Soldier"
							]
						];

						_types = _pool call BIS_fnc_selectRandom;
					};
				};

				default {};
			};

			//Randomize.
			if ((count _types) == 0) then
			{
				//Squad leader?
				if (_amount > 4) then
				{
					_types = _types + ["USMC_Soldier_SL"];
				};

				//Corpsman?
				if ((_amount > 4) && ((random 1) > 0.5)) then
				{
					_types = _types + ["USMC_Soldier_Medic"];
				};

				//Fill the rest.
				private ["_pool"];
				_pool =
				[
					"USMC_Soldier",
					"USMC_Soldier",
					"USMC_Soldier_AR"
				];

				for "_i" from 0 to ((_amount - (count _types)) - 1) do
				{
					_types = _types + [_pool call BIS_fnc_selectRandom];
				};
			};
		};

		case east:
		{
			switch (_type) do
			{
				case "riflesquad":
				{
					//Weapons squad.
					if (_amount == 7) then
					{
						_types =
						[
							"RU_Soldier_SL",
							"RU_Soldier_MG",
							"RU_Soldier",
							"RU_Soldier_MG",
							"RU_Soldier",
							"RU_Soldier_AT",
							"RU_Soldier"
						];
					};

					if (_amount == 9) then
					{
						_types =
						[
							"RU_Soldier_SL",
							"RU_Soldier2",
							"RU_Soldier_GL",
							"RU_Soldier_AR",
							"RU_Soldier_AT",
							"RU_Soldier2",
							"RU_Soldier_GL",
							"RU_Soldier_AR",
							"RU_Soldier_Marksman"
						];
					};
				};

				default {};
			};

			//Randomize.
			if ((count _types) == 0) then
			{
				//Squad leader?
				if (_amount > 4) then
				{
					_types = _types + ["RU_Soldier_SL"];
				};

				//Medic?
				if ((_amount > 4) && ((random 1) > 0.5)) then
				{
					_types = _types + ["RU_Soldier_Medic"];
				};

				//Marksman?
				if ((_amount > 4) && ((random 1) > 0.7)) then
				{
					_types = _types + ["RU_Soldier_Marksman"];
				};

				//AA soldier?
				if ((_amount > 5) && ((random 1) > 0.6)) then
				{
					_types = _types + ["RU_Soldier_AA"];
				};

				//Fill the rest.
				private ["_pool"];
				_pool =
				[
					"RU_Soldier",
					"RU_Soldier_GL",
					"RU_Soldier_AR"
				];

				for "_i" from 0 to ((_amount - (count _types)) - 1) do
				{
					_types = _types + [_pool call BIS_fnc_selectRandom];
				};
			};
		};
		
		case resistance:
		{
			switch (_type) do
			{
				case "riflesquad":
				{
					//Weapons squad.
					if (_amount == 7) then
					{
						_types =
						[
							"GUE_Soldier_CO",
							"GUE_Soldier_MG",
							"GUE_Soldier_3",
							"GUE_Soldier_MG",
							"GUE_Soldier_1",
							"GUE_Soldier_AT",
							"GUE_Soldier_2"
						];
					};

					if (_amount == 9) then
					{
						_types =
						[
							"GUE_Soldier_CO",
							"GUE_Soldier_3",
							"GUE_Soldier_GL",
							"GUE_Soldier_AR",
							"GUE_Soldier_AT",
							"GUE_Soldier_2",
							"GUE_Soldier_GL",
							"GUE_Soldier_AR",
							"GUE_Soldier_1"
						];
					};
				};

				default {};
			};

			//Randomize.
			if ((count _types) == 0) then
			{
				//Squad leader?
				if (_amount > 4) then
				{
					_types = _types + ["GUE_Soldier_CO"];
				};

				//Medic?
				if ((_amount > 4) && ((random 1) > 0.5)) then
				{
					_types = _types + ["GUE_Soldier_Medic"];
				};

				//AA soldier?
				if ((_amount > 5) && ((random 1) > 0.6)) then
				{
					_types = _types + ["GUE_Soldier_AA"];
				};

				//Fill the rest.
				private ["_pool"];
				_pool =
				[
					"GUE_Soldier_3", 
					"GUE_Soldier_2", 
					"GUE_Soldier_GL",
					"GUE_Soldier_AR"
				];

				for "_i" from 0 to ((_amount - (count _types)) - 1) do
				{
					_types = _types + [_pool call BIS_fnc_selectRandom];
				};
			};
		};

		default {};
	};
} 
else 
{
	if (configName(configFile >> "CfgVehicles" >> "US_Soldier_TL_EP1") != "") then 
	{
		switch (_side) do
		{
			case west:
			{
				switch (_type) do
				{
					case "riflesquad":
					{
						if (_amount == 4) then
						{
							private ["_pool"];
							_pool =
							[
								[
									"US_Soldier_TL_EP1",
									"US_Soldier_AR_EP1",
									"US_Soldier_GL_EP1",
									"US_Soldier_AAR_EP1"
								],

								[
									"US_Soldier_TL_EP1",
									"US_Soldier_MG_EP1",
									"US_Soldier_AMG_EP1",
									"US_Soldier_GL_EP1"
								],

								[
									"US_Soldier_TL_EP1",
									"US_Soldier_AAT_EP1",
									"US_Soldier_AT_EP1",
									"US_Soldier_AT_EP1"
								],

								[
									"US_Soldier_TL_EP1",
									"US_Soldier_GL_EP1",
									"US_Soldier_Marksman_EP1",
									"US_Soldier_Medic_EP1"
								]
							];

							_types = _pool call BIS_fnc_selectRandom;
						};

						if (_amount == 9) then
						{
							private ["_pool"];
							_pool =
							[
								[
									"US_Soldier_SL_EP1",
									"US_Soldier_TL_EP1",
									"US_Soldier_AR_EP1",
									"US_Soldier_GL_EP1",
									"US_Soldier_AT_EP1",
									"US_Soldier_TL_EP1",
									"US_Soldier_AR_EP1",
									"US_Soldier_AAR_EP1",
									"US_Soldier_GL_EP1"
								],

								//Weapons squad.
								[
									"US_Soldier_SL_EP1",
									"US_Soldier_TL_EP1",
									"US_Soldier_MG_EP1",
									"US_Soldier_AMG_EP1",
									"US_Soldier_GL_EP1",
									"US_Soldier_AT_EP1",
									"US_Soldier_AMG_EP1",
									"US_Soldier_AR_EP1",
									"US_Soldier_GL_EP1"
								]
							];

							_types = _pool call BIS_fnc_selectRandom;
						};
					};

					default {};
				};

				//Randomize.
				if ((count _types) == 0) then
				{
					//Squad leader?
					if (_amount > 4) then
					{
						_types = _types + ["US_Soldier_SL_EP1"];
					};

					//Corpsman?
					if ((_amount > 4) && ((random 1) > 0.5)) then
					{
						_types = _types + ["US_Soldier_Medic_EP1"];
					};

					//Fill the rest.
					private ["_pool"];
					_pool =
					[
						"US_Soldier_EP1",
						"US_Soldier_GL_EP1",
						"US_Soldier_AR_EP1"
					];

					for "_i" from 0 to ((_amount - (count _types)) - 1) do
					{
						_types = _types + [_pool call BIS_fnc_selectRandom];
					};
				};
			};

			case east:
			{
				switch (_type) do
				{
					case "riflesquad":
					{
						//Weapons squad.
						if (_amount == 7) then
						{
							_types =
							[
								"TK_Soldier_SL_EP1",
								"TK_Soldier_MG_EP1",
								"TK_Soldier_AMG_EP1",
								"TK_Soldier_MG_EP1",
								"TK_Soldier_AMG_EP1",
								"TK_Soldier_GL_EP1",
								"TK_Soldier_GL_EP1"
							];
						};

						if (_amount == 9) then
						{
							_types =
							[
								"TK_Soldier_SL_EP1",
								"TK_Soldier_MG_EP1",
								"TK_Soldier_GL_EP1",
								"TK_Soldier_AT_EP1",
								"TK_Soldier_LAT_EP1",
								"TK_Soldier_AAT_EP1",
								"TK_Soldier_GL_EP1",
								"TK_Soldier_MG_EP1",
								"TK_Soldier_AMG_EP1"
							];
						};
					};

					default {};
				};

				//Randomize.
				if ((count _types) == 0) then
				{
					//Squad leader?
					if (_amount > 4) then
					{
						_types = _types + ["TK_Soldier_SL_EP1"];
					};

					//Medic?
					if ((_amount > 4) && ((random 1) > 0.5)) then
					{
						_types = _types + ["TK_Soldier_Medic_EP1"];
					};

					//Marksman?
					if ((_amount > 4) && ((random 1) > 0.7)) then
					{
						_types = _types + ["TK_Soldier_Sniper_EP1"];
					};

					//AA soldier?
					if ((_amount > 5) && ((random 1) > 0.6)) then
					{
						_types = _types + ["TK_Soldier_AA_EP1"];
					};

					//Fill the rest.
					private ["_pool"];
					_pool =
					[
						"TK_Soldier_EP1",
						"TK_Soldier_GL_EP1",
						"TK_Soldier_AR_EP1"
					];

					for "_i" from 0 to ((_amount - (count _types)) - 1) do
					{
						_types = _types + [_pool call BIS_fnc_selectRandom];
					};
				};
			};
			
			case resistance:
			{
				switch (_type) do
				{
					case "riflesquad":
					{
						//Weapons squad.
						if (_amount == 7) then
						{
							_types =
							[
								"TK_GUE_Soldier_TL_EP1",
								"TK_GUE_Soldier_MG_EP1",
								"TK_GUE_Soldier_5_EP1",
								"TK_GUE_Soldier_MG_EP1",
								"TK_GUE_Soldier_HAT_EP1",
								"TK_GUE_Soldier_AT_EP1",
								"TK_GUE_Soldier_4_EP1"
							];
						};

						if (_amount == 9) then
						{
							_types =
							[
								"TK_GUE_Soldier_TL_EP1",
								"TK_GUE_Soldier_MG_EP1",
								"TK_GUE_Soldier_4_EP1",
								"TK_GUE_Soldier_Sniper_EP1",
								"TK_GUE_Soldier_5_EP1",
								"TK_GUE_Soldier_AT_EP1",
								"TK_GUE_Soldier_2_EP1",
								"TK_GUE_Soldier_MG_EP1",
								"TK_GUE_Soldier_5_EP1"
							];
						};
					};

					default {};
				};

				//Randomize.
				if ((count _types) == 0) then
				{
					//Squad leader?
					if (_amount > 4) then
					{
						_types = _types + ["TK_GUE_Soldier_TL_EP1"];
					};

					//Medic?
					if ((_amount > 4) && ((random 1) > 0.5)) then
					{
						_types = _types + ["TK_GUE_Bonesetter_EP1"];
					};

					//AA soldier?
					if ((_amount > 5) && ((random 1) > 0.6)) then
					{
						_types = _types + ["TK_GUE_Soldier_AA_EP1"];
					};

					//Fill the rest.
					private ["_pool"];
					_pool =
					[
						"TK_GUE_Soldier_5_EP1", 
						"TK_GUE_Soldier_2_EP1", 
						"TK_GUE_Soldier_4_EP1",
						"TK_GUE_Soldier_AR_EP1"
					];

					for "_i" from 0 to ((_amount - (count _types)) - 1) do
					{
						_types = _types + [_pool call BIS_fnc_selectRandom];
					};
				};
			};

			default {};
		};
	};
};

_types