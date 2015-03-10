private ["_cheat"];
_cheat = _this;

debuglog ["Log::::::::::::::",_this];
switch (_cheat) do 
{
	case "CAMPAIGN": 
	{
		if (isnil "hsim_heliportCheatAllMissions") then {hsim_heliportCheatAllMissions = true};
		hsim_heliportCheatAllMissions = !hsim_heliportCheatAllMissions;
	};

	case "ENDMISSION": {

	};
	
	default {};	
};

true