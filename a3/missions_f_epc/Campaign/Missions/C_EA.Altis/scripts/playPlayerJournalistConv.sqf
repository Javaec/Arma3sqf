private ["_conversation", "_mission"];
_conversation = _mode;
_mission = missionName;

private ["_config", "_count"];
_config = configFile >> "CfgSentences" >> _mission >> _conversation >> "Sentences";
_count = (count _config) - 1;

// Build array of sentences
private ["_sentences"];
_sentences = [];

for "_i" from 0 to _count do {
	private ["_sentence"];
	_sentence = configName (_config select _i);
	_sentences = _sentences + [_sentence];
};

//[] call BIS_fnc_logFormat;

// Play conversation
{
	if (_conversation in BIS_convSkip) exitWith
	{
		["Conversation [%1] interrupted as it in BIS_convSkip.",_conversation] call BIS_fnc_logFormat;
	};

	private ["_sentence"];
	_sentence = _x;

	[
		_conversation,
		_mission,
		[_sentence,_sentence],
		if (vehicle BIS_inf == vehicle BIS_journalist) then
		{
			// Vehicle is the same
			"VEHICLE"
		}
		else
		{
			if ({vehicle _x != _x} count [BIS_inf, BIS_journalist] > 0) then
			{
				// One of them is in a vehicle
				"SIDE"
			}
			else
			{
				// Both of them are outside
				"DIRECT"
			};
		},
		nil, nil,
		1
	]
	call BIS_fnc_kbTell;
}
forEach _sentences;