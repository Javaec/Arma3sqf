/*
	File: fn_indicateBleeding.sqf
	Author: Vladimir Hynek

	Description:
	Do not use - WIP.

	Parameter(s):
	-

	Returned value:
	-
*/


//-----------------Bleeding - show PP in the corners of the screen instead of health guy---------------------------------------------------------------------------------
BIS_applyPP7 = false; //prevent this PP from triggering again

//krvaceni s frekvenci 0.25-2, tj. lze pouzit sleep (2/(GetBleedingFrequency player)) * 2; frekvence zobrazovani PP ma byt 2x nizsi nez krvaceni
[]spawn {
	
	private ["_coef", "_delay"];  //is dependent also on oxygen to be better aligned with blue suffocating PP
	
	//pause between two red flashes that indicate bleeding
	//_delay = 4 / (if(GetBleedingFrequency player > 0) then {GetBleedingFrequency player} else {1});  //   =(2/(GetBleedingFrequency player)) * 2
	//_delay = 4 / (if(GetBleedingRemaining player > 5) then {GetBleedingRemaining player} else {1}); //not used in new system with GetBleedingRemaining

	
	
	// if (isDiving player) then
	// {
		// _coef = 0.4 max ((1.0 min (GetOxygenRemaining player * 1.7)) - BIS_deltaDMG); //narrow, from suffocating unit gets damage 0.005/s   //quite good: _coef = 0.0 max (0.6 - BIS_deltaDMG);
		////hint str _coef;
	// }
	// else
	// {
		// _coef = 1 - (BIS_deltaDMG / 2);
	// };
	
	_coef = 0.95;
	
	//hint "test";
	BIS_BleedCC ppEffectAdjust [1,1,0,[0.17, 0.0008, 0.0008, 0],[0.17, 0.0008, 0.0008, 0.1],[1, 1, 1, 0], [_coef, _coef, 0, 0, 0, 0.2, 2]];
	BIS_BleedCC ppEffectEnable TRUE;
	BIS_BleedCC ppEffectCommit 0.0;
	
	sleep 0.2;
	
	// switch Hit PP off
	BIS_BleedCC ppEffectAdjust [1,1,0,[0, 0, 0, 0],[1, 1, 1, 1],[0, 0, 0, 0], [1, 1, 0, 0, 0, 0.1, 0.5]];
	BIS_BleedCC ppEffectCommit 2;
	sleep 2;

	BIS_BleedCC ppEffectEnable FALSE;
		
	sleep 5;//_delay;	//wait according to bleeding frequency (pause between two red flashes that indicate bleeding)
	
	
	BIS_applyPP7 = true; //allow this PP from triggering again
};