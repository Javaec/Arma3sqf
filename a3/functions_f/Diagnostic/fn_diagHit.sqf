/*
	Author: Karel Moricky

	Description:
	Tracks received wounds

	Parameter(s): None

	Returns:
	BOOL
*/

//--- No diagnostic in empty missions
if (getnumber (missionconfigfile >> "diagHit") > 0) then {

	//--- Store current mission
	BIS_fnc_diagHit_reset = {
		_data = uinamespace getvariable ["BIS_fnc_diagHit_data",[]];
		_missionID = _data find missionname;
		if (_missionID < 0) then {
			_data set [
				count _data,
				missionname
			];
			_data set [
				count _data,
				[
					"head_hit",[0,0,0,0,0],
					"body",[0,0,0,0,0],
					"hands",[0,0,0,0,0],
					"legs",[0,0,0,0,0],
					"death",0
				]
			];
		};
		uinamespace setvariable ["BIS_fnc_diagHit_data",_data];
	};

	//--- Init (delay becase player is not initialized yet)
	BIS_fnc_diagHit_initCode = {
		waituntil {!isnull player};

		player addeventhandler [
			"handledamage",
			{
				_type = _this select 1;
				_damage = _this select 2;

				//--- Init variables
				[] call BIS_fnc_diagHit_reset;

				with uinamespace do {

					//--- Find mission
					_missionID = BIS_fnc_diagHit_data find missionname;
					if (_missionID >= 0) then {
						_missionArray = BIS_fnc_diagHit_data select (_missionID + 1);

						//--- Find wound type
						_typeId = _missionArray find _type;
						if (_typeId >= 0) then {
							_damageArray = _missionArray select (_typeId + 1);
							_damageId = floor ((_damage min 1) * 4);
							_damageArray set [_damageId,(_damageArray select _damageId) + 1];
							_missionArray set [
								(_typeId + 1),
								_damageArray
							];
						};
					};
				};

				//--- Return original damage
				_damage
			}
		];

		player addeventhandler ["killed",{true call bis_fnc_diagHit_upload;}];
		player addeventhandler ["respawn",{[] spawn BIS_fnc_diagHit_initCode;}];
	};
	[] spawn BIS_fnc_diagHit_initCode;
	addmissioneventhandler ["ended",{false call bis_fnc_diagHit_upload;}];


	//--- Upload to server
	bis_fnc_diagHit_upload = {
		_fnc_scriptName = "Big Brother / Hit Diagnostic";
		scriptname _fnc_scriptName;
		with uinamespace do {
			_killed = _this;

			//--- Scan saved missions
			for "_m" from 0 to (count BIS_fnc_diagHit_data - 1) step 2 do {
				_missionName = BIS_fnc_diagHit_data select _m;
				_missionArray = BIS_fnc_diagHit_data select (_m + 1);
				_missionResults = "";

				//--- Scan wounds
				for "_i" from 0 to (count _missionArray - 1) step 2 do {
					_type = _missionArray select _i;
					_typeDam = _missionArray select (_i + 1);

					//--- When killed, raise death counter by 1
					if (_type == "death") then {_typeDam = [[0,1] select _killed];};
					{
						_missionResults = _missionResults + str _x;
						if (_type != "death") then {_missionResults = _missionResults + ","};
					} foreach _typeDam;
				};
				//--- Upload
				_uploadData = format [
					"action=update-wounds&mise=%1&hrac=%2&data=%3",
					_missionName call bis_fnc_filterString,
					profileName call bis_fnc_filterString,
					_missionResults
				];
				["Uploading '%1'",_uploadData] call bis_fnc_logFormat;
				diag_radioHttpPostLog [
					"http://splendid.bistudio.com/wounds.php",
					"application/x-www-form-urlencoded",
					_uploadData
				];
			};
			BIS_fnc_diagHit_data = nil;
		};
	};
};

true