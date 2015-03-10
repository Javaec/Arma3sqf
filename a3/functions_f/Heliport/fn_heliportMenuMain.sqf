/*
	Author: Karel Moricky

	Description:
	Launch Heliport Main Menu.

	Parameter(s):
	NOTHING

	Returns:
	BOOLEAN
*/

#define DISPLAY		(uinamespace getvariable "RscDisplayHeliportMain")
#define CONTROL		(DISPLAY displayctrl _idc)
#define MENU_CONFIG	BIS_fnc_heliportMenuMain_config
#define MENU_PATH	BIS_fnc_heliportMenuMain_class

//3000 cutrsc ["RscHeliportBackground","plain"];
createdialog "RscDisplayHeliportMain";
waituntil {!isnil {DISPLAY}};

DISPLAY displayaddeventhandler ["unload","3000 cuttext ['','plain'];"];

//--- Dialog IDC
BIS_fnc_heliportMenuMain_config = ["RscDisplayHeliportMain"] call BIS_fnc_heliportDialogInit;


//--- Header
_idc = ([MENU_CONFIG,"TextHeader"] call BIS_fnc_getIDC);
_displayName = gettext (campaignconfigfile >> "campaign" >> "missions" >> worldname >> "displayname");
if (_displayName == "") then {_displayName = hsim_heliportMission};
CONTROL ctrlsetstructuredtext parsetext format ["<t size='1.4'>%1</t>",_displayName];

//--- Missions
_idc = ([MENU_CONFIG,"ButtonMission"] call BIS_fnc_getIDC);
CONTROL buttonsetaction "['INIT'] spawn BIS_fnc_heliportMenuMission;";

//--- Helicopters
_idc = ([MENU_CONFIG,"ButtonHeli"] call BIS_fnc_getIDC);
if (player call bis_fnc_kbCanSpeak) then {
	CONTROL buttonsetaction "['INIT'] spawn BIS_fnc_heliportMenuHeli;";
} else {
	CONTROL buttonsetaction "[] spawn {(localize 'str_hsim_bis_fnc_heliportmenumain_nohelicopters') call bis_fnc_guimessage;};";
};

//--- Staff
//_idc = ([MENU_CONFIG,"ButtonStaff"] call BIS_fnc_getIDC);
//CONTROL buttonsetaction "['INIT'] spawn BIS_fnc_heliportMenuStaff;";

//--- Heliport
//_idc = ([MENU_CONFIG,"ButtonUpgrade"] call BIS_fnc_getIDC);
//CONTROL buttonsetaction "['INIT'] spawn BIS_fnc_heliportMenuUpgrade;";

//--- Instant Messaging
_idc = ([MENU_CONFIG,"ButtonPersonal"] call BIS_fnc_getIDC);
CONTROL buttonsetaction "['INIT'] spawn BIS_fnc_heliportMenuIM;";

//--- Close
_idc = ([MENU_CONFIG,"ButtonBack"] call BIS_fnc_getIDC);
CONTROL buttonsetaction "closedialog ([BIS_fnc_heliportMenuMain_config] call BIS_fnc_getIDD)";

true