/*
	Author: Karel Moricky

	Description:
	Tracks pressed keys

	Parameter(s): None

	Returns:
	BOOL
*/


//--- No diagnostic in empty missions
if (getnumber (missionconfigfile >> "diagKey") > 0) then {

	//--- Store current mission
	BIS_fnc_diagKey_reset = {
		_data = uinamespace getvariable ["BIS_fnc_diagKey_data",[]];
		_missionID = _data find missionname;
		if (_missionID < 0) then {
			_emptyArray = [];
			for "_i" from 0 to 767 do {
				_emptyArray = _emptyArray + [0];
			};
			_data set [count _data,missionname];
			_data set [count _data,_emptyArray];
		};
		uinamespace setvariable ["BIS_fnc_diagKey_data",_data];
	};

	BIS_fnc_diagKey_keydown = {
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		if (_ctrl) then {
			_key = _key + 256;
		} else {
			if (_shift) then {
				_key = _key + 512;
			};
		};

		//--- Init variables
		[] call BIS_fnc_diagKey_reset;

		with uinamespace do {

			//--- Find mission
			_missionID = BIS_fnc_diagKey_data find missionname;
			if (_missionID >= 0) then {
				_missionArray = BIS_fnc_diagkey_data select (_missionID + 1);
				_missionArray set [_key-1,(_missionArray select _key) + 1];
			};
		};
	};

	[] spawn {
		disableserialization;
		waituntil {!isnull ([] call BIS_fnc_displayMission)};
		waituntil {!isnull player};

		_addEH = {
			disableserialization;
			([] call BIS_fnc_displayMission) displayaddeventhandler ["keyup","_this call BIS_fnc_diagKey_keydown"];
		};
		_addEH call bis_fnc_onload;
		[] call _addEH;

		player addeventhandler ["killed",{true call bis_fnc_diagKey_upload;}];
		addmissioneventhandler ["ended",{false call bis_fnc_diagKey_upload;}];
	};

	//--- Upload to server
	bis_fnc_diagKey_upload = {
		_fnc_scriptName = "Big Brother / Key Diagnostic";
		with uinamespace do {
			_killed = _this;

			//--- Scan saved missions
			for "_m" from 0 to (count BIS_fnc_diagKey_data - 1) step 2 do {
				_missionName = BIS_fnc_diagKey_data select _m;
				_missionArray = BIS_fnc_diagKey_data select (_m + 1);

				//--- Upload
				_uploadData = str [
					profileName call bis_fnc_filterString,
					_missionName call bis_fnc_filterString,
					_missionArray
				];
				["Uploading '%1'",_uploadData] call bis_fnc_logFormat;
				diag_radioHttpPostLog [
					"http://splendid.bistudio.com/keys.php",
					"text/plain",
					_uploadData
				];
			};
			BIS_fnc_diagKey_data = nil;
		};
	};
};

true