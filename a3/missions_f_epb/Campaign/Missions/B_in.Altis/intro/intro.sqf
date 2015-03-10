//Block camera switching
uiNameSpace setVariable ["BIS_blockCameraSwitching", (findDisplay 46) displayAddEventHandler ["KeyDown", {
	if ((_this select 1) in actionKeys "PersonView") then {
		true;
	};
}]];

//Cinema borders
[0, 0, false, false] call BIS_fnc_cinemaBorder;

//Disable saving
format ["%1_disabledSave", missionName] call BIS_fnc_disableSaving;

//Player stuff
private ["_position", "_direction"];
_position 	= [3070.42,14281.3,0];
_direction 	= 214;
_class		= typeOf player;
_side		= side player;

//The player unit standby position
private "_positionStandBy";
_positionStandBy = [] + _position;
_positionStandBy set [2, 10];

//Move and hide player
player setPos _positionStandBy;
player hideObject true;
player enableSimulation false;

//The fake player
private ["_groupDummy", "_dummy"];
_dummyGroup	= createGroup _side;
_dummy 		= _dummyGroup createUnit [_class, _position, [], 0, "NONE"];

//Identity
_dummy setIdentity "EPB_B_Kerry";

//Fix position and direction
_dummy setDir _direction;
_dummy setPos _position;

//Dummy load out
removeVest _dummy;
removeHeadgear _dummy;
removeGoggles _dummy;
removeAllWeapons _dummy;
removeAllItems _dummy;
_dummy unassignItem "NVGoggles"; _dummy removeItem "NVGoggles";
_dummy unassignItem "ItemMap"; _dummy removeItem "ItemMap";
_dummy unassignItem "ItemRadio"; _dummy removeItem "ItemRadio";
_dummy unassignItem "FirstAidKit"; _dummy removeItem "FirstAidKit";

//Disable AI
_dummy disableAi "MOVE";
_dummy disableAi "ANIM";
_dummy disableAi "FSM";
_dummy disableAi "TARGET";
_dummy disableAi "AUTOTARGET";

//Do not allow damage
_dummy allowDamage false;

//Used for audio/animation synchronization
_dummy useAudioTimeForMoves true;

//Switch camera
_dummy switchCamera "Internal";

//Play intro animation
_dummy switchMove "acts_unconsciousstandup_part1";

//Store current time
_dummy setVariable ["BIS_introAnimStartTick", diag_tickTime];

//PP's and Scenes
[_dummy] spawn compile preprocessFileLineNumbers "intro\introParticles.sqf";
[] spawn compile preprocessFileLineNumbers "intro\introPostProcessing.sqf";
[] spawn compile preprocessFileLineNumbers "intro\introScenes.sqf";
[] spawn compile preprocessFileLineNumbers "intro\introSfx.sqf";

//Add AnimDone event handler
_dummy setVariable ["BIS_handlerAnimDone", _dummy addEventHandler ["AnimDone", {
	private ["_dummy", "_anim"];
	_dummy 	= _this select 0;
	_anim 	= _this select 1;
	
	switch (toLower _anim) do {
		//Regaining consciousness
		case "acts_unconsciousstandup_part1": {
			//Add pistol
			_dummy addWeapon "hgun_P07_F";
			
			//Take out pistol
			_dummy switchMove "acts_unconsciousstandup_part2";
		};
		
		// Taking out pistol
		case "acts_unconsciousstandup_part2": {
			//Move into default lowered state
			_dummy playMoveNow "AidlPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon";
		};
		
		case "aidlpercmstpslowwpstdnon_amovpercmstpsraswpstdnon" : {
			//Log the time the animation scene took
			["[Intro] Animation took %1 s", diag_tickTime - (_dummy getVariable "BIS_introAnimStartTick")] call BIS_fnc_logFormat;
			
			//Position and direction
			private ["_position", "_direction", "_animation"];
			_position	= position _dummy;
			_direction	= getDir _dummy;
			_animation	= animationState _dummy;
			
			//Remove event handler
			_dummy removeEventHandler ["AnimDone", _dummy getVariable "BIS_handlerAnimDone"];
			
			//Dummy group
			private "_groupDummy";
			_groupDummy = group _dummy;
			
			//Delete dummy
			deleteVehicle _dummy;
			deleteGroup _dummyGroup;
			
			//Put player in correct place
			player setDir _direction;
			player setPos _position;
			
			//Simulation and unhide
			player enableSimulation true;
			player hideObject false;
			
			//Move into default state
			player switchMove "amovpercmstpsraswpstdnon";
			
			//Switch camera
			player switchCamera "Internal";
			
			//Enable saving
			format ["%1_disabledSave", missionName] call BIS_fnc_enableSaving;
			
			//Cinema borders
			[1, nil, false] call BIS_fnc_cinemaBorder;
			
			//Allow switching camera
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", uiNameSpace getVariable "BIS_blockCameraSwitching"];
			uiNameSpace setVariable ["BIS_blockCameraSwitching", nil];
			
			//Flag
			BIS_introSceneFinished = true;
			
			//Log
			"Intro animation finished" call BIS_fnc_log;
		};
	};
}]];
