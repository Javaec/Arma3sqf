_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_respawn = [_this,2,-1,[0]] call bis_fnc_param;

_layer = "BIS_fnc_respawnSpectator" call bis_fnc_rscLayer;

if (!alive _unit) then {
	_layer cutrsc ["RscSpectator","plain"];
} else {
	if (_respawn == 1) then {

		//--- Open
		waituntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen",true]};
		BIS_fnc_feedback_allowPP = false;
		//(["HealthPP_black"] call bis_fnc_rscLayer) cutText ["","BLACK IN",1];
		_layer cutrsc ["RscSpectator","plain"];
	} else {

		//--- Close
		_layer cuttext ["","plain"];
	};
};