//--- Create channels
hsim_channel_heliLocal = radioChannelCreate [
	[1,1,1,1],
	"Intercom",
	"(%UNIT_NAME)",
	[]
];
hsim_channel_heliBase = radioChannelCreate [
	[1,1,1,1],
	"Heliport",
	"VHF 120.13 (%UNIT_NAME)",
	[]
];
hsim_channel_heliGlobal = radioChannelCreate [
	[1,1,1,1],
	"Global",
	"", //--- Created procedurally
	[]
];

//--- Identify channel
BIS_fnc_kbTell_3 = {
	private ["_from","_to","_speaker","_frequency"];
	_from = _this select 0;
	_to = _this select 1;

	if (vehicle _from == vehicle _to) then {

		if (_from == _to) then {

			//--- Same vehicle
			if (_from == vehicle _from) then {

				//--- Speaking to self
				"DIRECT"
			} else {

				//--- Helicopter Intercom
				hsim_channel_heliLocal
			};
		} else {

			//--- Helicopter Intercom
			hsim_channel_heliLocal
		};
	} else {

		//--- Force direct channel (and movie subtitles) when player is near speaker
		if (vehicle _from == _from && vehicle _to == _to && _from distance player < 20 && vehicle player == player) then {

			//--- Direct
			"DIRECT"
		} else {

			if ({isnil {_x getvariable "config"}} count [_from,_to] > 0) then {

				if (side _from == sidelogic) then {
					hsim_channel_heliGlobal radioChannelSetCallSign "%UNIT_NAME";
				} else {
					//--- Generic
					_speaker = [_from,_to] - [player];
					if (count _speaker > 0) then {
						_speaker = _speaker select 0;

						//--- Random frequency
						_frequency = _speaker getvariable "hsim_channel_heliGlobal";
						if (isnil "_frequency") then {
							_frequency = 118 + random 19;
							_frequency = str ((round (_frequency * 100)) / 100);
							_speaker setvariable ["hsim_channel_heliGlobal",_frequency]
						};
						hsim_channel_heliGlobal radioChannelSetCallSign ("VHF " + _frequency + " (%UNIT_NAME)");
					};
				};

				hsim_channel_heliGlobal
			} else {

				//--- Heliport
				hsim_channel_heliBase
			};
		};
	};
};