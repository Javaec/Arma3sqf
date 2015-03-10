/*
	File: fn_flamesEffect.sqf
	Author: Vladimir Hynek

	Description:
	Flames (texture) postprocess.

	Parameter(s):
	None.

	Returned value:
	None. 
*/


BIS_oldWasBurning = true;
BIS_applyPP6 = false; //do not allow the PP to start again before the previous ended

//------------------flames - fast changing 10 textures to simulate animation---------------------------------
[] spawn
{
	//_null = [1, "FLAMES"] execVM "A3\data_f\scripts\TEST_fn_screen.sqf";
	disableSerialization;
	if (isnil {uinamespace getvariable "RscHealthTextures"}) then {uinamespace setvariable ["RscHealthTextures",displaynull]};
	//if (isnull (uinamespace getvariable "str_screen")) then {1918 cutrsc ["screen","plain"]};(["unikatniJmeno"] call bis_fnc_rscLayer)
	if (isnull (uinamespace getvariable "RscHealthTextures")) then {(["HealthPP_fire"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"]};
	
	//initialize all textures, //textures are defined in TEST_description_screen.hpp
	private ["_ctrl", "_pos", "_text_1", "_text_2", "_text_3", "_text_4", "_text_5", "_text_6", "_text_7", "_text_8", "_text_9", "_text_10", "_texture"]; //creates local variables (see command private)
	
	for "_i" from 1 to 10 do {
		//(_texturesArray select _i) = (uinamespace getvariable "str_screen") displayctrl (1000 + _i);
		
		//format creates string, compile creates code from the string and call runs that code
		//_call compile format [ "_text_%1 = %2; _array = _array + [_text_%1];", _i, (uinamespace getvariable "str_screen") displayctrl (1000+_i) ];	
		
		_ctrl = (uinamespace getvariable "RscHealthTextures") displayctrl (1200+_i);
		//debuglog str _ctrl;
		//call compile format [ "_text_%1 = _ctrl; _array = _array + [_text_%1]", _i];
		
		//_textX = call compile format[ "_text_%1", _i];
		_pos = [safezoneX,safezoneY,safezoneW,safezoneH];
		
		//first set position and commit - to not see movement of the texture
		_ctrl ctrlsetposition _pos;
		_ctrl ctrlsetfade 0.5;
		_ctrl ctrlcommit 0;
		debugLog str _ctrl;
		sleep 0.04;
		//set alpha to 0 to avoid artefact when displayed first time
		_ctrl ctrlsetfade 1;
		_ctrl ctrlcommit 0;
	};
	
	
	//burn 60 times
	//for "_i" from 1 to 30 do {
	/*
	//position and display the textures
	for "_i" from 1 to 10 do {
	
		

		_texture = call compile format[ "_text_%1", _i];

		//--- Fade in 0s
		_texture ctrlsetfade ((sin( (((2*_i)/pi + (pi/2))*180)/pi ))/4) + 0.75;//(sin(2*_i/pi+pi/2)/4+0.75); //1+(0.09 * ((_i - 5.5)^2)) - 0.5; //1+(0.15 * ((_i - 5.5)^2)) - 0.5;
		_texture ctrlcommit 0;
		//waituntil {ctrlcommitted _texture};	//consider NO waiting here
		
		//((sin(((2*8)/pi)+(pi/2))/4)+0.75)
		
		//((sin( (((2*8)/pi + (pi/2))*180)/pi ))/4) + 0.75
		
		sleep 0.03; //0.04 is 25 FPS

		//--- Fade out in 0s
		_texture ctrlsetfade 1;
		_texture ctrlcommit 0;
	
	};*/
	
	sleep (0.4 + random 2);

	BIS_applyPP6 = true;  //allow the PP to start again
};
//------------------flames - fast changing 10 textures to simulate animation---------------------------------



//------------------flames - one static texture---------------------------------
/*
[] spawn
{
	//_null = [1, "FLAMES"] execVM "A3\data_f\scripts\TEST_fn_screen.sqf";
	disableSerialization;
	if (isnil {uinamespace getvariable "str_screen"}) then {uinamespace setvariable ["str_screen",displaynull]};
	if (isnull (uinamespace getvariable "str_screen")) then {1918 cutrsc ["screen","plain"]};
	
	//textures are defined in TEST_description_screen.hpp
	_control = (uinamespace getvariable "str_screen") displayctrl 1005;
	_pos = [safezoneX,safezoneY,safezoneW,safezoneH];

	//first set position and commit - to not see movement of the texture
	_control ctrlsetposition _pos;
	_control ctrlcommit 0;

	//--- Fade in (0.2s)
	_control ctrlsetfade 0;
	_control ctrlcommit 0.5;
	waituntil {ctrlcommitted _control};	//consider NO waiting here
	
	sleep 1;

	//--- Fade out
	_control ctrlsetfade 1;
	_control ctrlcommit (1 + random 1);
	//waituntil {ctrlcommitted _control};		//consider removing this

	//sleep 1;

	//BIS_applyPP6 = true;
};
*/
//------------------flames - one static texture---------------------------------