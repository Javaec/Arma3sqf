/************************************
Main
************************************/
case "BIS_lost": {
	["01_Lost","B_in", nil, "DIRECT"] call bis_fnc_kbTell;
};

case "BIS_radioBabble": {
	private ["_group", "_speaker"];
	_group		= createGroup WEST;
	_speaker 	= _group createUnit [typeOf BIS_BLU1, [0,0,0], [], 0, "NONE"];
	
	_speaker hideObject true;
	_speaker setPos getPos BIS_BLU1;
	_speaker setDir getDir BIS_BLU1;
	_speaker switchMove animationState BIS_BLU1;
	_speaker setIdentity "EPB_B_James";
	_speaker attachTo [BIS_BLU1, [0,0,0]];
	
	//The last spoken line
	private "_lastSpokenLine";
	_lastSpokenLine = missionNameSpace getVariable ["BIS_radioBabbleLastSpokenLine", ""];
	
	//The list of sentences
	private "_sentences";
	_sentences = [
		"b_in_05_radio_babble_JAM_0",
		"b_in_05_radio_babble_JAM_1",
		"b_in_05_radio_babble_JAM_2",
		"b_in_05_radio_babble_JAM_3",
		"b_in_05_radio_babble_JAM_4"
	];
	
	//Remove last spoken sentence from list
	_sentences = _sentences - [_lastSpokenLine];
	
	//The sentence/line to play
	private "_sentence";
	_sentence = _sentences call BIS_fnc_selectRandom;
	
	//Store sentence as last, for next play
	missionNameSpace setVariable ["BIS_radioBabbleLastSpokenLine", _sentence];
	
	private ["_topic", "_bikb"];
	_topic		= "05_Radio_Babble";
	_bikb		= "\a3\Missions_F_EPB\kb\B_in\b_in_05_radio_babble.bikb";
	
	_speaker kbAddTopic [_topic, _bikb, ""];
	_speaker kbTell [_speaker, _topic, _sentence];
	waitUntil { _speaker kbWasSaid [_speaker, _topic, _sentence, 60] };
	
	detach _speaker;
	deleteVehicle _speaker;
	deleteGroup _group;
};

case "BIS_apologies": {
	["10_Apologies","B_in", nil, "DIRECT"] call bis_fnc_kbTell;
};

case "BIS_radioContact": {
	["15_Radio_Contact","B_in", nil, "SIDE", { waitUntil { { _x == "itemRadio" } count assignedItems player > 0 }; }] call bis_fnc_kbTell;
};

case "BIS_noMapKavala": {
	["20_No_Map_Kavala","B_in", nil, "SIDE", { waitUntil { { _x == "itemRadio" } count assignedItems player > 0 }; }] call bis_fnc_kbTell;
};

case "BIS_moreThanOne": {
	["25_More_Than_One","B_in", nil, "DIRECT", { waitUntil { { _x == "itemRadio" } count assignedItems player > 0 }; }] call bis_fnc_kbTell;
};

case "BIS_noMapRV": {
	["30_No_Map_RV","B_in", nil, "SIDE", { waitUntil { { _x == "itemRadio" } count assignedItems player > 0 }; }] call bis_fnc_kbTell;
};

case "BIS_moving": {
	["35_Moving","B_in", nil, "SIDE", { waitUntil { { _x == "itemRadio" } count assignedItems player > 0 }; }] call bis_fnc_kbTell;
};

case "BIS_mapFound": {
	["40_Map_Found","B_in", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_approachFromSouth" : {
	["43_Approach_From_South","B_in", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_hasRadioMeeting": {
	["45_Has_Radio_Meeting","B_in", nil, "DIRECT"] call bis_fnc_kbTell;
};

/************************************
Exceptions
************************************/
case "BIS_hasMapRV": {
	["x01_Has_Map_RV","B_in", nil, "SIDE", { waitUntil { { _x == "itemRadio" } count assignedItems player > 0 }; }] call bis_fnc_kbTell;
};

case "BIS_hasMapKavala": {
	["x05_Has_Map_Kavala","B_in", nil, "SIDE", { waitUntil { { _x == "itemRadio" } count assignedItems player > 0 }; }] call bis_fnc_kbTell;
};

case "BIS_noRadioMeeting": {
	["x10_No_Radio_Meeting","B_in", nil, "DIRECT"] call bis_fnc_kbTell;
};

case "BIS_mines": {
	["x15_Mines","B_in", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_headDown": {
	["x20_Head_Down","B_in", nil, "DIRECT"] call bis_fnc_kbTell;
};
