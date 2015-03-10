_faction = _this select 0;
_grpPref = _this select 1;

_ret = grpNull;

/* ---------- accepted values:
	- "sentry"
	- "fireteam"
	- "squad"
	- "motorized"
*/

switch (_faction) do {
	case "Blue": {
		switch (_grpPref) do {
			case "sentry": {_ret = configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSentry"};
			case "fireteam": {_ret = configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam"};
			case "squad": {_ret = configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad"};
			case "motorized": {_ret = configFile >> "CfgGroups" >> "West" >> "BLU_F" >> "Motorized" >> "BUS_MotInf_Team"};
		}
	};
	case "Red": {
		switch (_grpPref) do {
			case "sentry": {_ret = configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSentry"};
			case "fireteam": {_ret = configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"};
			case "squad": {_ret = configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad"};
			case "motorized": {_ret = configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Motorized_MTP" >> "OIA_MotInf_Team"};
		}
	};
	case "Green_army": {
		switch (_grpPref) do {
			case "sentry": {_ret = configFile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSentry"};
			case "fireteam": {_ret = configFile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfTeam"};
			case "squad": {_ret = configFile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfSquad"};
			case "motorized": {_ret = configFile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Motorized" >> "HAF_MotInf_Team"};
		}
	};
	case "Green_para": {
		switch (_grpPref) do {
			case "sentry": {_ret = configFile >> "CfgGroups" >> "Indep" >> "Guerilla" >> "Infantry" >> "IRG_InfSentry"};
			case "fireteam": {_ret = configFile >> "CfgGroups" >> "Indep" >> "Guerilla" >> "Infantry" >> "IRG_InfTeam"};
			case "squad": {_ret = configFile >> "CfgGroups" >> "Indep" >> "Guerilla" >> "Infantry" >> "IRG_InfSquad"};
			case "motorized": {_ret = configFile >> "CfgGroups" >> "Indep" >> "Guerilla" >> "Motorized_MTP" >> "IRG_MotInf_Team"};
		}
	};
};

_ret