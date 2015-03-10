//********************************
//Main
//********************************
case "BIS_insertionNear" : {
	["00_insertionNear","B_m02_1", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_report" : {
	["05_report","B_m02_1", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_millerSatisfied" : {
	["10_millerSatisfied","B_m02_1", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_endGood" : {
	["15_end", "B_m02_1", ["b_m02_1_15_end_MIL_1", "b_m02_1_15_end_MIL_1"], "DIRECT"] call bis_fnc_kbTell;
};

case "BIS_endDetected" : {
	["20_endDetected","B_m02_1", nil, "DIRECT"] call bis_fnc_kbTell;
};

//********************************
//Exceptions
//********************************
case "BIS_x_insertionFar" : {
	["x00_insertionFar","B_m02_1", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_millerInsatisfied" : {
	["x05_millerInsatisfied","B_m02_1", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_detected" : {
	["x10_detected","B_m02_1", nil, "SIDE"] call bis_fnc_kbTell;
};

case "BIS_x_endBad" : {
	["x15_detected","B_m02_1", nil, "SIDE"] call bis_fnc_kbTell;
};
