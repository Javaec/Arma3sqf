/*
	Author: Karel Moricky

	Description:
	Tracks played radio sentences

	Parameter(s): None

	Returns:
	BOOL
*/

if (getnumber (missionconfigfile >> "diagRadio") > 0) then {

	//--- Mission diagnostic
	private ["_continue"];
	//_continue = profilenamespace getvariable ["",[]];
	diag_enableRadioProtocolLogs [true,[]];

	BIS_fnc_diagRadio_initCode = {
		player addeventhandler ["killed",{true call bis_fnc_diagRadio_upload;}];
		player addeventhandler ["respawn",{[] spawn BIS_fnc_diagRadio_initCode;}];
	};
	[] spawn BIS_fnc_diagRadio_initCode;
	addmissioneventhandler ["ended",{false call bis_fnc_diagRadio_upload;}];


	//--- Upload to server
	bis_fnc_diagRadio_upload = {
		_fnc_scriptName = "Big Brother / Radio Diagnostic";
		scriptname _fnc_scriptName;

		_uploadData = diag_radioProtocolsLogs true;
		if (count _uploadData > 0) then {

			["Uploading '%1'",_uploadData] call bis_fnc_logFormat;
			diag_radioHttpPostLog [
				"http://splendid.bistudio.com/protokol.php",
				"text/plain",
				str _uploadData
			];
		};
	};
};

true