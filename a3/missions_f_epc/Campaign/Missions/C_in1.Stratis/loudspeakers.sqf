["Radio broadcasting starts."] call BIS_fnc_logFormat;

private["_loudspeakers","_broadcasts","_fn_broadcastWhole","_fn_broadcastSentence"];

_loudspeakers = allMissionObjects "Land_Loudspeakers_F";

_broadcasts =
[
	["c_in1_20_broadcast_SPE_0","c_in1_20_broadcast_SPE_1"],
	["c_in1_21_broadcast_SPE_0","c_in1_21_broadcast_SPE_1"],
	["c_in1_22_broadcast_SPE_0","c_in1_22_broadcast_SPE_1"],
	["c_in1_23_broadcast_SPE_0"],
	["c_in1_21_broadcast_SPE_0","c_in1_21_broadcast_SPE_1"],
	["c_in1_22_broadcast_SPE_0","c_in1_22_broadcast_SPE_1"],
	["c_in1_23_broadcast_SPE_0"],
	["c_in1_21_broadcast_SPE_0","c_in1_21_broadcast_SPE_1"],
	["c_in1_22_broadcast_SPE_0","c_in1_22_broadcast_SPE_1"],
	["c_in1_23_broadcast_SPE_0"]
];

//[_sound,_text] call _fn_broadcastSentence;
_fn_broadcastSentence =
{
	//["[!][_fn_broadcastSentence] %1", _this] call BIS_fnc_LogFormat;

	private["_sound","_text","_class"];

	_sound = [_this, 0, "", [""]] call BIS_fnc_param;
	_text  = [_this, 1, "", [""]] call BIS_fnc_param;
	_class = [_this, 2, "", [""]] call BIS_fnc_param;

	{
		_x say3D _class;

		//["[!][_fn_broadcastSentence] distance %1 m", round (player distance _x)] call BIS_fnc_LogFormat;

		sleep 0.1;
	}
	forEach _loudspeakers;

	//titleText [_text, "plain down"];
};

//["c_in1_20_broadcast_SPE_0","c_in1_20_broadcast_SPE_1"] call _fn_broadcastWhole;
_fn_broadcastWhole =
{
	//["[!][_fn_broadcastWhole] %1", _this] call BIS_fnc_LogFormat;

	_loudspeakers = [_loudspeakers,[],{player distance _x},"ASCEND"] call BIS_fnc_sortBy;

	private["_sound","_text","_duration"];

	{
		_sound = (getArray(configfile >> "CfgSounds" >> _x >> "sound")) select 0;
		_text  = (getArray(configfile >> "CfgSounds" >> _x >> "titles")) select 0;
		_duration = getNumber(configfile >> "CfgSounds" >> _x >> "duration");

		[_sound,_text,_x] call _fn_broadcastSentence;

		sleep (_duration + 1);
	}
	forEach _this;
};

{
	_x call _fn_broadcastWhole;

	sleep ((random 30) + 10);

	if (BIS_HubBriefing_executed) then
	{
		waitUntil{missionNamespace getVariable ["BIS_HubBriefing_finished",false]};

		sleep 3;
	};
}
forEach _broadcasts;