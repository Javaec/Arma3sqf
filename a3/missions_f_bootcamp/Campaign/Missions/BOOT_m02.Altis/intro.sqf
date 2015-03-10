0 fadeMusic 0.4;
playMusic "LeadTrack01c_F";

sleep 5;

// Laptop animation
_z = [] spawn 
{ 
	while{true} do 
	{
		BIS_laptop1 setObjectTexture [0, "a3\Missions_F_Bootcamp\data\img\laptop\Electronics_screens_laptop_simulationterminated1_CO.paa"]; 
		Sleep 0.5;  
		BIS_laptop1 setObjectTexture [0, "a3\Missions_F_Bootcamp\data\img\laptop\Electronics_screens_laptop_simulationterminated2_CO.paa"]; 
		Sleep 0.5;
	};
};

// Disable control of camera
selectPlayer BIS_laceyFake;
vehicle BIS_lacey switchCamera "INTERNAL";

// Player's animations
BIS_lacey setBehaviour "CARELESS";
{BIS_lacey disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_lacey enableSimulation true;
BIS_lacey switchMove "Acts_BootKoreShootingRange_Lacey1";

// Control player's animations
private ["_animEH"];
_animEH = BIS_lacey addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		switch (toLower _anim) do {
			case "acts_bootkoreshootingrange_lacey4": {
				// Remove eventhandler
				_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
				_unit setVariable ["BIS_animEH", nil];
				
				// End the cutscene
				BIS_cutsceneEnded = true;
			};
		};
	}
];

BIS_lacey setVariable ["BIS_animEH", _animEH];

// Adams' animations
BIS_adams switchMove "Acts_BootKoreShootingRange_Adams";

private ["_animEH"];
_animEH = BIS_adams addEventHandler [
	"AnimDone",
	{
		private ["_unit", "_anim"];
		_unit = _this select 0;
		_anim = _this select 1;
		
		if (_anim == "Acts_BootKoreShootingRange_Adams") then {
			// Remove eventhandler
			_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
			_unit setVariable ["BIS_animEH", nil];
			
			{_unit enableAI _x} forEach ["AUTOTARGET", "TARGET"];
			_unit enableMimics true;
			_unit setBehaviour "SAFE";
		};
	}
];

BIS_adams setVariable ["BIS_animEH", _animEH];

// Fade in
enableEnvironment true;
3 fadeSound 1;
15 fadeMusic 0.1;
titleCut ["", "BLACK IN", 3];

sleep 4.75;

"01_Start" spawn BIS_fnc_missionConversations;

sleep 4.25;

[
	[localize "STR_A3_BOOT_m02_SITREP_1", ""], ["", "<br/>"],
	[(localize "STR_A3_BOOT_m02_SITREP_2") + " ", "font = 'PuristaMedium'"],
	[localize "STR_A3_BOOT_m02_SITREP_3", ""]
] call BIS_fnc_SITREP;

sleep 9.5;

"d01_Hello_World" spawn BIS_fnc_missionConversations;

sleep 11;

// Pop up targets except broken one
{
	_x animate ["Terc", 0];
	_x say3D "FD_Target_PopUp_Large_F";
} forEach (BIS_targets_short - [BIS_target_short5]);

"ERROR" call BIS_laptopStatus;

waitUntil {BIS_cutsceneEnded};

// Give player control again
BIS_lacey setBehaviour "AWARE";
{BIS_lacey enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
BIS_lacey enableMimics true;
selectPlayer BIS_lacey;
deleteVehicle BIS_laceyFake;

"BIS_BOOT_m02" call BIS_fnc_enableSaving;
[1, 1, false] spawn BIS_fnc_cinemaBorder;

15 fadeMusic 0;

// Register that the intro ended
BIS_introEnded = true;