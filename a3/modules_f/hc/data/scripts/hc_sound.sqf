if (true) exitwith {};

scriptName "HC\data\scripts\HC_sound.sqf";
	//isclass(configFile >> "cfgSounds" >> "hc_069n")

//textLogFormat["HC_RUN (%1) HC_sound.sqf %2",time,_this];
//textLogFormat["HC_SOUND (%1) %2",time,_this];

private["_constant","_len"];
_constant = 150000;

//hint str _this;
private["_moved"]; //moved voice
_moved = false;

private["_i"];

private["_toBsaid","_toBsaidC"];

//textLogFormat["HC_014 SOUNDplay%1",_this];

_delay = count _this;
if (BIS_HC_mainscope getvariable "sound") exitwith {};
BIS_HC_mainscope setvariable ["sound",true];

for "_i" from 0 to ((count _this)-1) do 
	{
		_toBsaid = _this select _i;
		//hint str (_toBsaid);
		//player sideChat _toBsaid;
				

		switch (_toBsaid) do 
		{
			//(( Markers
			
			case "motor infantry": {_toBsaidC = "hc_057";_len = 111800;}; 
			case "motorinfantry": {_toBsaidC = "hc_057";_len = 111800;}; 
			case "tracked": {_toBsaidC = "hc_058";_len = 57900;}; 
			
			
			case "b_motor_inf": {_toBsaidC = "hc_057";_len = 111800;}; 						
			
			case "b_inf": {_toBsaidC = "hc_056";_len = 79500;}; 								
			case "b_hq": {_toBsaidC = "hc_046";_len = 72216;}; 			
			case "b_armor": {_toBsaidC = "hc_058";_len = 57900;}; 						
			case "b_air": {_toBsaidC = "hc_060";_len = 52448;}; 
			
			case "o_inf": {_toBsaidC = "hc_056";_len = 79500;}; 								
			case "o_hq": {_toBsaidC = "hc_046";_len = 72216;}; 			
			case "o_armor": {_toBsaidC = "hc_058";_len = 57900;}; 						
			case "o_air": {_toBsaidC = "hc_060";_len = 52448;}; 
			
			
			case "sel0": {_toBsaidC = "hc_033";_len = 95600;}; 		
			case "sel1": {_toBsaidC = "hc_033";_len = 95600;}; 		
			case "Select": {_toBsaidC = "hc_033";_len = 95600;}; 		
			
			
			
			//)) Markers
						
			case "command": {_toBsaidC = "hc_001";_len = 54246;}; 
			case "frostbite": {_toBsaidC = "hc_002";_len = 70078;}; 
			case "battlemage": {_toBsaidC = "hc_003";_len = 65028;}; 
			case "swordman": {_toBsaidC = "hc_004";_len = 60968;}; 
			case "command": {_toBsaidC = "hc_001n";_len = 65028;}; 
			case "frostbite": {_toBsaidC = "hc_002n";_len = 79404;}; 
			case "battlemage": {_toBsaidC = "hc_003n";_len = 79404;}; 
			case "swordman": {_toBsaidC = "hc_004n";_len = 79404;}; 
			case "orders received": {_toBsaidC = "hc_005";_len = 79404;}; 
			case "thats affirmative": {_toBsaidC = "hc_006";_len = 79404;}; 
			case "roger that": {_toBsaidC = "hc_007";_len = 79404;}; 
			case "copy that": {_toBsaidC = "hc_008";_len = 63230;}; 
			case "orders understood": {_toBsaidC = "hc_009";_len = 106162;}; 
			case "sure": {_toBsaidC = "hc_010";_len = 59636;}; 
			case "we are": {_toBsaidC = "hc_011";_len = 62682;}; 
			case "advancing": {_toBsaidC = "hc_012";_len = 79404;}; 
			case "moving to contact": {_toBsaidC = "hc_013";_len = 105312;}; 
			case "moving to the objective": {_toBsaidC = "hc_014";_len = 116194;}; 
			case "attacking": {_toBsaidC = "hc_015";_len = 79404;}; 
			case "assaulting enemy positions": {_toBsaidC = "hc_016";_len = 138112;}; 
			case "engaging": {_toBsaidC = "hc_017";_len = 84796;}; 
			case "disengaging": {_toBsaidC = "hc_018";_len = 86592;}; 
			case "holding position": {_toBsaidC = "hc_019";_len = 97374;}; 
			case "retreating": {_toBsaidC = "hc_020";_len = 79404;}; 
			case "regrouping ": {_toBsaidC = "hc_021";_len = 79404;}; 
			case "attack ": {_toBsaidC = "hc_022";_len = 61434;}; 
			case "hold ": {_toBsaidC = "hc_023";_len = 59636;}; 
			case "patrol ": {_toBsaidC = "hc_024";_len = 73628;}; 
			case "withdraw ": {_toBsaidC = "hc_025";_len = 63230;}; 
			case "regroup  ": {_toBsaidC = "hc_026";_len = 58590;}; 
			case "wait for reinforcements ": {_toBsaidC = "hc_027";_len = 122436;}; 
			case "move to": {_toBsaidC = "hc_028";_len = 64710;}; 
			case "marked area": {_toBsaidC = "hc_029";_len = 79404;}; 
			case "at marked area ": {_toBsaidC = "hc_030";_len = 100970;}; 
			case "reporting in": {_toBsaidC = "hc_031";_len = 93780;}; 
			case "we are ready for some action": {_toBsaidC = "hc_032";_len = 134810;}; 
			case "waiting for orders": {_toBsaidC = "hc_033";_len = 95578;}; 
			case "standing by for orders": {_toBsaidC = "hc_034";_len = 119492;}; 
			case "combat ready": {_toBsaidC = "hc_035";_len = 79404;}; 
			case "ready to kick ass": {_toBsaidC = "hc_036";_len = 109438;}; 
			case "this is": {_toBsaidC = "hc_037";_len = 79404;}; 
			case "weapons squad": {_toBsaidC = "hc_038";_len = 85634;}; 
			case "armor platoon": {_toBsaidC = "hc_039";_len = 79404;}; 
			case "rifle platoon": {_toBsaidC = "hc_040";_len = 79404;}; 
			case "company": {_toBsaidC = "hc_041";_len = 61434;}; 
			case "battalion": {_toBsaidC = "hc_042";_len = 79404;}; 
			case "squadron": {_toBsaidC = "hc_043";_len = 79404;}; 
			case "wing": {_toBsaidC = "hc_044";_len = 52448;}; 
			case "headquaters": {_toBsaidC = "hc_045";_len = 79404;}; 
			case "HQ": {_toBsaidC = "hc_046";_len = 72216;}; 
			case "combat element": {_toBsaidC = "hc_047";_len = 86592;}; 
			case "fire team": {_toBsaidC = "hc_048";_len = 79404;}; 
			case "squad": {_toBsaidC = "hc_049";_len = 84310;}; 
			case "platoon": {_toBsaidC = "hc_050";_len = 79404;}; 
			case "fire team": {_toBsaidC = "hc_048n";_len = 79404;}; 
			case "squad": {_toBsaidC = "hc_049n";_len = 52448;}; 
			case "platoon": {_toBsaidC = "hc_050n";_len = 65028;}; 
			case "fire teams ": {_toBsaidC = "hc_048s";_len = 66824;}; 
			case "squads": {_toBsaidC = "hc_049s";_len = 79404;}; 
			case "platoons": {_toBsaidC = "hc_050s";_len = 68622;}; 
			case "fire teams ": {_toBsaidC = "hc_048sn";_len = 79404;}; 
			case "squads": {_toBsaidC = "hc_049sn";_len = 77608;}; 
			case "platoons": {_toBsaidC = "hc_050sn";_len = 79404;}; 
			case "friendly": {_toBsaidC = "hc_051";_len = 61434;}; 
			case "enemy": {_toBsaidC = "hc_052";_len = 57840;}; 
			case "team": {_toBsaidC = "hc_053";_len = 56042;}; 
			case "group": {_toBsaidC = "hc_054";_len = 50652;}; 
			case "unit": {_toBsaidC = "hc_055";_len = 56678;}; 
			case "infantry": {_toBsaidC = "hc_056";_len = 79404;}; 
			case "mechanized infantry": {_toBsaidC = "hc_057";_len = 111752;}; 
			case "armor": {_toBsaidC = "hc_058";_len = 57840;}; 
			case "tank": {_toBsaidC = "hc_059";_len = 57840;}; 
			case "tanks": {_toBsaidC = "hc_059s";_len = 67876;}; 
			case "air": {_toBsaidC = "hc_060";_len = 52448;}; 
			case "first ": {_toBsaidC = "hc_061";_len = 55400;}; 
			case "second ": {_toBsaidC = "hc_062";_len = 65126;}; 
			case "third ": {_toBsaidC = "hc_063";_len = 65452;}; 
			case "fourth ": {_toBsaidC = "hc_064";_len = 68622;}; 
			case "alfa": {_toBsaidC = "hc_065";_len = 41666;}; 
			case "bravo": {_toBsaidC = "hc_066";_len = 48854;}; 
			case "charlie": {_toBsaidC = "hc_067";_len = 53398;}; 
			case "delta": {_toBsaidC = "hc_068";_len = 59636;}; 
			case "first ": {_toBsaidC = "hc_061n";_len = 56042;}; 
			case "second ": {_toBsaidC = "hc_062n";_len = 61434;}; 
			case "third ": {_toBsaidC = "hc_063n";_len = 62350;}; 
			case "fourth ": {_toBsaidC = "hc_064n";_len = 79404;}; 
			case "alfa": {_toBsaidC = "hc_065n";_len = 59636;}; 
			case "bravo": {_toBsaidC = "hc_066n";_len = 79404;}; 
			case "charlie": {_toBsaidC = "hc_067n";_len = 63230;}; 
			case "delta": {_toBsaidC = "hc_068n";_len = 61434;}; 
			case "we are in bad shape": {_toBsaidC = "hc_069";_len = 109656;}; 
			case "we need to retreat": {_toBsaidC = "hc_070";_len = 115896;}; 
			case "we are under heavy fire": {_toBsaidC = "hc_071";_len = 99072;}; 
			case "we are under artillery fire": {_toBsaidC = "hc_072";_len = 104364;}; 
			case "we need repairs": {_toBsaidC = "hc_073";_len = 131520;}; 
			case "we lost armor": {_toBsaidC = "hc_074";_len = 130824;}; 
			case "we lost personell": {_toBsaidC = "hc_075";_len = 149490;}; 
			case "we suffered heavy casualties": {_toBsaidC = "hc_076";_len = 159460;}; 
			case "we are pinned down": {_toBsaidC = "hc_077";_len = 91190;}; 
			case "all systems go": {_toBsaidC = "hc_078";_len = 99172;}; 
			case "fully operational": {_toBsaidC = "hc_079";_len = 98224;}; 
			case "we are in bad shape": {_toBsaidC = "hc_069n";_len = 107110;}; 
			case "we need to retreat": {_toBsaidC = "hc_070n";_len = 89988;}; 
			case "we are under heavy fire": {_toBsaidC = "hc_071n";_len = 100572;}; 
			case "we are under artillery fire": {_toBsaidC = "hc_072n";_len = 127254;}; 
			case "we need repairs": {_toBsaidC = "hc_073n";_len = 156182;}; 
			case "we lost armor": {_toBsaidC = "hc_074n";_len = 98224;}; 
			case "we lost personell": {_toBsaidC = "hc_075n";_len = 101390;}; 
			case "we suffered heavy casualties": {_toBsaidC = "hc_076n";_len = 104364;}; 
			case "we are pinned down": {_toBsaidC = "hc_077n";_len = 110604;}; 
			case "all systems go": {_toBsaidC = "hc_078n";_len = 99072;}; 
			case "fully operational": {_toBsaidC = "hc_079n";_len = 109756;}; 
			



			
			
			
			
			
			

			
			case "n": {_moved = true;_len = 0;_toBsaidC = "";};
			default {//hint "-";
				_toBsaidC = "";};						
		};
		
		//if (isNumber "_toBsaid") then {Sleep (_toBsaid/100);};
		
		//player sideChat str _toBsaidC;
		
	
	
	if (_moved) then {
		if (isclass(configFile >> "cfgSounds" >> (_toBsaidC + "n"))) then {_toBsaidC = _toBsaidC + "n";};				
		//hint str _moved;
		};

//	player sideChat _toBsaid;
  //if (_toBsaid != "n") then {say _};
	//player sideChat _toBsaidC;
	//player say _toBsaidC;
 	if (_toBsaidC != "") then {playSound _toBsaidC;};

	//player globalChat format["%1",(_len / _constant)];
		Sleep(_len / _constant);
	};

sleep (_delay);
BIS_HC_mainscope setvariable ["sound",false];
