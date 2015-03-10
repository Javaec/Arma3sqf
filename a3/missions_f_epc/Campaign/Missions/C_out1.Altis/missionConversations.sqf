/*
	Call-sign		Character		Variable		Name			ID
	
	Nomad			Kerry			BIS_inf			EPC B Player		KER
	Crossroads		HQ			BIS_bhq			EPC B HQ		BHQ
	Kilo			APC			BIS_amv			EPC B Leader		LEA
	Victor			Infantry		BIS_infantry		EPC B Member		MEM
	Eagle			Jet			BIS_jet1		EPC B Abstract A	ABA
	Sierra			Chopper			BIS_heli		EPC B Abstract B	ABB
*/
//***************************************
//Main
//***************************************
/*
	Description:
	* Insertion pilot warns Kerry squad to be ready for landing
	
	Participants:
	* Pilot
	
	Sentences:
	* 00_flyIn
*/
case "BIS_flyIn" : {
	//00_flyIn
	["00_flyIn","C_out1", nil, "VEHICLE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Jet team reports they have neutralized enemy AA at the power plant, but LZ is still hot
	
	Participants:
	* HQ
	* Kerry
	* Jet
	
	Sentences:
	* 05_flyInEvent
*/
case "BIS_flyInEvent" : {
	//05_flyInEvent
	["05_flyInEvent","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Kerry briefs his team about the landing
	
	Participants:
	* Kerry
	
	Sentences:
	* 10_flyInGroup
*/
case "BIS_flyInGroup" : {
	//10_flyInGroup
	["10_flyInGroup","C_out1", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Helicopter crew detects and engages enemy while landing
	
	Participants:
	* Pilot
	
	Sentences:
	* 12_doorGunnerEngages
*/
case "BIS_doorGunnerEngages" : {
	//12_doorGunnerEngages
	["12_doorGunnerEngages","C_out1", nil, "VEHICLE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Insertion pilot informs squad that the chopper has landed and it is safe to disembark
	
	Participants:
	* Pilot
	* Kerry
	
	Sentences:
	* 15_flyInTouchDown
	* 20_flyInTouchDownGroup
*/
case "BIS_flyInTouchDown" : {
	//15_flyInTouchDown
	["15_flyInTouchDown","C_out1", nil, "VEHICLE"] call bis_fnc_kbTell;
	
	//20_flyInTouchDownGroup
	["20_flyInTouchDownGroup","C_out1", nil, "GROUP"] call bis_fnc_kbTell;
};

/*
	Description:
	* Insertion pilot leaves the LZ and RTB
	
	Participants:
	* Pilot
	
	Sentences:
	* 25_flyOut
*/
case "BIS_flyOut" : {
	//25_flyOut
	["25_flyOut","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Kerry's team, Infantry support and AMV support report their actions
	
	Participants:
	* HQ
	* Support Apc
	* Infantry
	* Kerry
	
	Sentences:
	* 30_teamsReport
*/
case "BIS_teamsReport" : {
	//30_teamsReport
	["30_teamsReport","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Ground troops secure the power plant
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* 35_solarPowerSecure
*/
case "BIS_solarPowerSecure" : {
	//35_solarPowerSecure
	["35_solarPowerSecure","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Ground troops rally up and start moving towards Kalochori
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* 40_rallyPoint
*/
case "BIS_rallyPoint" : {
	//40_rallyPoint
	["40_rallyPoint","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Earth quake
	
	Participants:
	* HQ
	* Support AMV
	
	Sentences:
	* 42_earthQuake
*/
case "BIS_earthQuake" : {
	//42_earthQuake
	["42_earthQuake","C_out1", nil, "DIRECT"] call bis_fnc_kbTell;
	
	//Some delay
	sleep 5;
	
	//43_earthQuakeReport
	["43_earthQuakeReport","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Kalochori is deemed secure by the ground troops and HQ reports visual on enemy reinforcements trying to take the position back
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* 00_intro
*/
case "BIS_kalochoriSecure" : {
	//45_kalichoriSecure
	["45_kalichoriSecure","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
	
	sleep 10;
	
	//46_kalichoriDefend
	["46_kalichoriDefend","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Friendly AMV lets kerry knows he can transport his team to the other side of the city, protected
	
	Participants:
	* Kerry
	* Support AMV
	
	Sentences:
	* 48_transport
*/
case "BIS_transport" : {
	//48_transport
	["48_transport","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Enemy reinforcements are neutralized
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* 50_reinforcementsNeutralized
*/
case "BIS_reinforcementsNeutralized" : {
	//50_reinforcementsNeutralized
	["50_reinforcementsNeutralized","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

//***************************************
//Exceptions
//***************************************
/*
	Description:
	* Kerry's team steals enemy Gordon
	
	Participants:
	* Kerry
	
	Sentences:
	* x00_vehicleStolen
*/
case "BIS_vehicleStolen" : {
	//x00_vehicleStolen
	["x00_vehicleStolen","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Support APC is destroyed
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* x05_transportDestroyed
	* x10_transportDestroyedHq
*/
case "BIS_transportDestroyed" : {
	//x05_transportDestroyed
	["x05_transportDestroyed","C_out1", nil, "DIRECT"] call bis_fnc_kbTell;
	
	//x10_transportDestroyedHq
	["x10_transportDestroyedHq","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Friendly AMV starts moving to defence position with Kerry's team inside
	
	Participants:
	* Kerry
	* Support AMV
	
	Sentences:
	* x15_transportMoving
*/
case "BIS_transportMoving" : {
	//x15_transportMoving
	["x15_transportMoving","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Friendly AMV drops Kerr's team successfully in the defence position
	
	Participants:
	* Kerry
	* Support AMV
	
	Sentences:
	* x20_transportSucceeded
*/
case "BIS_transportSucceeded" : {
	//x20_transportSucceeded
	["x20_transportSucceeded","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Friendly AMV drops Kerr's team but was unable to reach the defence position in time
	
	Participants:
	* Kerry
	* Support AMV
	
	Sentences:
	* x25_transportFailed
*/
case "BIS_transportFailed" : {
	//x25_transportFailed
	["x25_transportFailed","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Friendly AMV cant wait for player team any longer and moves out
	
	Participants:
	* Kerry
	* Support AMV
	
	Sentences:
	* x30_transportCanceled
*/
case "BIS_transportCanceled" : {
	//x30_transportCanceled
	["x30_transportCanceled","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* Friendly AMV drops Kerr's team but was unable to reach the defence position because enemy vehicle is dangerously close
	
	Participants:
	* Kerry
	* Support AMV
	
	Sentences:
	* x35_transportEnemy
*/
case "BIS_transportEnemy" : {
	//x35_transportEnemy
	["x35_transportEnemy","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* When tasked with defending Kalochori from enemy counter attack, Kerry fails
	
	Participants:
	* Kerry
	* HQ
	
	Sentences:
	* x40_overrun
*/
case "BIS_overrun" : {
	//x40_overrun
	["x40_overrun","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

//***************************************
//Instructor Figure
//***************************************
/*
	Description:
	* HQ warns Kerry that his squad is not fighting alone and friendlies are nearby
	
	Participants:
	* HQ
	
	Sentences:
	* i00_friendlies
*/
case "BIS_i_friendlies" : {
	//i00_friendlies
	["i00_friendlies","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* HQ tells Kerry about the UAV and how to use it
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* i05_uav
*/
case "BIS_i_uav" : {
	//i05_uav
	["i05_uav","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* After Solar station is secured, HQ reminds Kerry that enemy snipers at the solar towers were neutralized and their sniper rifles could be useful
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* i10_snipers
*/
case "BIS_i_snipers" : {
	//i10_snipers
	["i10_snipers","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};

/*
	Description:
	* HQ warns Kerry about the enemy armoured vehicle at Kalochori and how player can approach it
	
	Participants:
	* HQ
	* Kerry
	
	Sentences:
	* i15_enemyVehicle
*/
case "BIS_i_enemyVehicle" : {
	//i15_enemyVehicle
	["i15_enemyVehicle","C_out1", nil, "SIDE"] call bis_fnc_kbTell;
};
