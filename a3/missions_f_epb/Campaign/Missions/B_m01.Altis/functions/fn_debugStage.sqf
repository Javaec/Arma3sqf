//Parameters
private ["_stage"];
_stage = [_this, 0, 0, [0]] call BIS_fnc_param;

//Exit if stage 1
if (_stage == 1) exitWith {
	["Skipping to stage: %1", _stage] call BIS_fnc_logFormat;
};

//Skip needed only if stage is 2
if (_stage == 2) then {
	//Go through all player group units
	{
		//Move to Frini
		_x setPos getMarkerPos "BIS_frini";
		
	} forEach units BIS_alpha;
	
	//Move bravo and charlie units to the Outpost
	{
		//Move to Outpost
		_x setPos getMarkerPos "BIS_outpost";
		
	} forEach units BIS_bravo + units BIS_charlie;
	
	//Set combat mode
	{
		//Combat mode
		_x setBehaviour "COMBAT";
		_x setCombatMode "GREEN";
		_x setSpeedMode "NORMAL";
		_x enableAttack false;
		_x allowFleeing 0;
		
	} forEach [BIS_bravo, BIS_charlie];
	
	//AI stuff
	{
		//Brain
		_x enableAi "MOVE";
		_x enableAi "ANIM";
		_x enableAi "FSM";
		_x enableAi "TARGET";
		_x enableAi "AUTOTARGET";
		
		//Anim
		_x playMove "amovpercmstpsraswrfldnon";
		
		//Stance
		_x setUnitPos "AUTO";
		
	} forEach units BIS_alpha + units BIS_bravo + units BIS_charlie;
	
	//Supplies truck
	BIS_vehicleTruck setPos [14205.759,21212.945,0.000];
	
	//Log
	["Skipping to stage: %1", _stage] call BIS_fnc_logFormat;
} else {
	//Error
	["Invalid stage: %1", _stage] call BIS_fnc_error;
};
