/*
	Call-sign		Character		Variable		Name			ID
	
	Nomad-2			Kerry			BIS_inf			EPC B Player		KER
	Nomad			Squad Leader		BIS_leader		EPC B Leader		LEA
	Crossroads		HQ			BIS_bhq			EPC B HQ		BHQ
	Golf			Convoy			BIS_leaderConvoy	EPC B Abstract A	ABA
	Victor			Pinned leader		BIS_pinnedLeader	EPC B Member		MEM
	Nikos			Nikos			BIS_nikos		EPC I Nikos		NIK
*/
//***************************************
//Main
//***************************************
/*
	Description:
	* Communication from HQ
	
	Participants:
	* HQ
	* Squad Leader
	
	Sentences:
	* 00_intro
	* 05_boardVehicles
*/
case "BIS_intro" : {
	//Team leader talks on the radio
	[BIS_leader, 0] call BIS_fnc_C_m02_talkOnRadio;
	
	//00_intro
	["00_intro","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//Team leader talks on the radio
	[BIS_leader, 1] call BIS_fnc_C_m02_talkOnRadio;
	BIS_leader playMove "Acts_SignalToCheck";
	
	//05_boardVehicles
	["05_boardVehicles","C_m02", nil, "DIRECT"] call bis_fnc_kbTell;
};

/*
	Description:
	* Communication from HQ about ongoing investigation of Kerry
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* 07_investigationClosed
*/
case "BIS_investigation" : {
	//Store current group ID
	private ["_group", "_groupID"];
	_group = group player;
	_groupID = groupID _group;
	
	//Set id as Nomad during this conversation
	_group setGroupID [localize "STR_A3_Group_Nomad"];
	
	//07_investigationClosed
	["07_investigationClosed","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//Set old group id
	_group setGroupID [_groupID];
};

/*
	Description:
	* Convoy becomes aware of an ambush
	
	Participants:
	* HQ
	* Convoy Leader
	* Squad Leader
	* Squad Member
	* Player
	
	Sentences:
	* 10_ambush
	* 15_ambushGroup
	* 20_ambushHq
*/
case "BIS_ambush" : {
	//10_ambush
	["10_ambush","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//15_ambushGroup
	["15_ambushGroup","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
	
	//20_ambushHq
	["20_ambushHq","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Convoy clears enemy ambush
	
	Participants:
	* HQ
	* Convoy Leader
	* Squad Leader
	
	Sentences:
	* 25_ambushClear
	* 30_attackWarehouses
	* 35_attackWarehousesConvoy
	* 40_attackWarehousesGroup
*/
case "BIS_ambushClear" : {
	//25_ambushClear
	["25_ambushClear","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
	
	//30_attackWarehouses
	["30_attackWarehouses","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//35_attackWarehousesConvoy
	["35_attackWarehousesConvoy","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//40_attackWarehousesGroup
	["40_attackWarehousesGroup","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* The later on, pinned down squad, advances through the highway to Pyrgos
	
	Participants:
	* HQ
	* Pinned Leader
	
	Sentences:
	* 45_pinnedSquadMoves
*/
case "BIS_pinnedSquadMoves" : {
	//45_pinnedSquadMoves
	["45_pinnedSquadMoves","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Small earth quake happens
	
	Participants:
	* HQ
	* Squad Leader
	* Kerry
	
	Sentences:
	* 46_earthQuakeSmall
	* 47_earthQuakeSmallGroup
*/
case "BIS_earthQuakeSmall" : {
	//Delay
	sleep 1;
	
	//47_earthQuakeSmallGroup
	["47_earthQuakeSmallGroup", "C_m02", ["c_m02_47_earthquakesmallgroup_KER_0", "c_m02_47_earthquakesmallgroup_KER_0"], "GROUP"] call bis_fnc_kbTell;
	
	waitUntil { isNil { BIS_fnc_earthquake_inProgress } || { !BIS_fnc_earthquake_inProgress } };
	
	//47_earthQuakeSmallGroup
	["47_earthQuakeSmallGroup", "C_m02", ["c_m02_47_earthquakesmallgroup_KER_1", "c_m02_47_earthquakesmallgroup_KER_2"], "GROUP"] call bis_fnc_kbTell;
	
	//Delay
	sleep 2;
	
	//46_earthQuakeSmall
	["46_earthQuakeSmall","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//47_earthQuakeSmallGroup
	["47_earthQuakeSmallGroup", "C_m02", ["c_m02_47_earthquakesmallgroup_LEA_0", "c_m02_47_earthquakesmallgroup_LEA_0"], "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Big earth quake happens
	
	Participants:
	* HQ
	* Squad Leader
	* Kerry
	
	Sentences:
	* 48_earthQuakeBig
	* 49_earthQuakeBigGroup
*/
case "BIS_earthQuakeBig" : {
	//48_earthQuakeBig
	["48_earthQuakeBig","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
	
	//49_earthQuakeBigGroup
	["49_earthQuakeBigGroup","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* An unexpected call
	
	Participants:
	* HQ
	* Squad Leader
	* Player
	* Nikos
	* Guerilla
	
	Sentences:
	* 50_anUnexpectedCall
	* 55_anUnexpectedCallReaction
	* 60_anUnexpectedCallFia
	* 65_anUnexpectedCallGroup
	* 70_anUnexpectedCallHq
*/
case "BIS_anUnexpectedCall" : {
	//Store current group ID
	private ["_group", "_groupID"];
	_group = group player;
	_groupID = groupID _group;
	
	//Set id as Nomad during this conversation
	_group setGroupID [localize "STR_A3_Group_Nomad"];
	
	//50_anUnexpectedCall
	["50_anUnexpectedCall","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//Set Nikos callsign at this point
	group BIS_nikos setGroupId [localize "STR_A3_cfgfaces_man_a3_nikos0"];
	
	//55_anUnexpectedCallReaction
	["55_anUnexpectedCallReaction","C_m02", nil, "DIRECT"] call bis_fnc_kbTell;
	
	//60_anUnexpectedCallFia
	["60_anUnexpectedCallFia","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//Set old group id
	_group setGroupID [_groupID];
	
	//65_anUnexpectedCallGroup
	["65_anUnexpectedCallGroup","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
	
	//70_anUnexpectedCallHq
	["70_anUnexpectedCallHq","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Warehouses are declared secure
	
	Participants:
	* HQ
	* Squad Leader
	* Pinned Leader
	
	Sentences:
	* 75_warehousesSecure
	* 80_warehousesSecureHq
	* 85_pinnedSquadHelp
	* 90_pinnedSquadHelpHq
*/
case "BIS_warehousesSecure" : {
	//75_warehousesSecure
	["75_warehousesSecure","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
	
	//Team leader talks on the radio
	[BIS_leader, 0] call BIS_fnc_C_m02_talkOnRadio;
	
	//80_warehousesSecureHq
	["80_warehousesSecureHq","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//85_pinnedSquadHelp
	["85_pinnedSquadHelp","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
	
	//90_pinnedSquadHelpHq
	["90_pinnedSquadHelpHq","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//Team leader talks on the radio
	[BIS_leader, 1] call BIS_fnc_C_m02_talkOnRadio;
};

/*
	Description:
	* Reinforcements arrive at the warehouses
	
	Participants:
	* HQ
	* Squad Leader
	
	Sentences:
	* 95_reinforcementsArrived
	* 100_reinforcementsArrivedGroup
*/
case "BIS_reinforcementsArrival" : {
	//Team leader talks on the radio
	[BIS_leader, 0] call BIS_fnc_C_m02_talkOnRadio;
	
	//95_reinforcementsArrived
	["95_reinforcementsArrived","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//Team leader talks on the radio
	[BIS_leader, 1] call BIS_fnc_C_m02_talkOnRadio;
	
	//100_reinforcementsArrivedGroup
	["100_reinforcementsArrivedGroup","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Reinforcements arrive at the warehouses
	
	Participants:
	* HQ
	* Squad Leader
	
	Sentences:
	* 95_reinforcementsArrived
	* 100_reinforcementsArrivedGroup
*/
case "BIS_investigationExplained" : {
	//Store current group ID
	private ["_group", "_groupID"];
	_group = group player;
	_groupID = groupID _group;
	
	//Set id as Nomad during this conversation
	_group setGroupID [localize "STR_A3_Group_Nomad"];
	
	//102_investigationExplained
	["102_investigationExplained","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//103_millerIsAnAssHole
	["103_millerIsAnAssHole","C_m02", nil, "VEHICLE"] call bis_fnc_kbTell;
	
	//Set old group id
	_group setGroupID [_groupID];
};

/*
	Description:
	* Convoy arrives at the cemetery
	
	Participants:
	* Squad Leader
	* Pinned Leader
	
	Sentences:
	* 105_cemeteryArrival
	* 110_cemeteryArrivalGroup
*/
case "BIS_cemeteryArrival" : {
	//105_cemeteryArrival
	["105_cemeteryArrival","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
	
	//110_cemeteryArrivalGroup
	["110_cemeteryArrivalGroup","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Under fire conversation
	
	Participants:
	* Squad Leader
	* Pinned Leader
	* Player
	
	Sentences:
	* 115_underFireDiscussion
	* 120_underFireDiscussionGroup
*/
case "BIS_underFireDiscussion" : {
	//115_underFireDiscussion
	["115_underFireDiscussion","C_m02", nil, "DIRECT"] call bis_fnc_kbTell;
	
	//120_underFireDiscussionGroup
	["120_underFireDiscussionGroup","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Player takes control of small team and is tasked in destroying the enemy tank
	
	Participants:
	* Player
	
	Sentences:
	* 125_playerTakesControl
*/
case "BIS_playerTakesControl" : {
	//125_playerTakesControl
	["125_playerTakesControl","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Player has direct visual on the enemy tank and reports to his leader
	
	Participants:
	* HQ
	* Squad Leader
	* Player
	
	Sentences:
	* 130_visualOnTank
*/
case "BIS_visualOnTank" : {
	//130_visualOnTank
	["130_visualOnTank","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Player requests artillery strike on the enemy tank position
	
	Participants:
	* HQ
	* Player
	
	Sentences:
	* 135_tankStrike
*/
case "BIS_tankStrike" : {
	//135_tankStrike
	["135_tankStrike","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Last assault on enemy position is initialized
	
	Participants:
	* Squad Leader
	* Player
	
	Sentences:
	* 140_attackEnemy
*/
case "BIS_startMainAttack" : {
	//140_attackEnemy
	["140_attackEnemy","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Enemy position seized
	
	Participants:
	* HQ
	* Squad Leader
	
	Sentences:
	* 145_areaClear
*/
case "BIS_enemyPositionSeized" : {
	//145_areaClear
	["145_areaClear","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

//***************************************
//Exceptions
//***************************************
/*
	Description:
	* Player is warned to board the convoy vehicle
	
	Participants:
	* Squad Leader
	
	Sentences:
	* x00_boardVehicleWarning
*/
case "BIS_boardVehicleWarning" : {
	//x00_boardVehicleWarning
	["x00_boardVehicleWarning","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Player is punished for not boarding the convoy vehicle
	
	Participants:
	* Squad Leader
	
	Sentences:
	* x05_boardVehiclePunishment
*/
case "BIS_boardVehiclePunishment" : {
	//x05_boardVehiclePunishment
	["x05_boardVehiclePunishment","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Player call calls strike in Pyrgos and Nikos/FIA do not like it
	
	Participants:
	* Nikos
	* Kerry
	
	Sentences:
	* x10_pyrgosBombardmentAgain
*/
case "BIS_pyrgosBombardmentAgain" : {
	//x10_pyrgosBombardmentAgain
	["x10_pyrgosBombardmentAgain","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};

//***************************************
//Exceptions
//***************************************
/*
	Description:
	* Kerry asks about current situation, what is going on, the big picture of the mission. There is time, player is moving in convoy
	
	Participants:
	* Squad Leader
	* Kerry
	
	Sentences:
	* i00_situation
*/
case "BIS_i_situation" : {
	//i00_situation
	["i00_situation","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Kerry asks about current plan. Waiting for reinforcements and then move to help friendly squad
	
	Participants:
	* Squad Leader
	* Kerry
	
	Sentences:
	* i05_plan
*/
case "BIS_i_plan" : {
	//i05_plan
	["i05_plan","C_m02", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Squad leader explains Kerry how to proceed with neutralizing the enemy tank
	
	Participants:
	* Squad Leader
	* Kerry
	
	Sentences:
	* i10_tank
*/
case "BIS_i_tank" : {
	//i10_tank
	["i10_tank","C_m02", nil, "SIDE"] call bis_fnc_kbTell;
};
