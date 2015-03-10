_faction = _this select 0;
_unitPref = _this select 1;

switch (_faction) do {
	case "BLU_F": {_faction = "Blue"};
	case "OPF_F": {_faction = "Red"};
	case "IND_F": {_faction = "Green_army"};
	case "Guerilla": {_faction = "Green_para"};
};

_ret = "";

/* ---------- accepted values:
	- "rifleman"
	- "autorifleman"
	- "AA_battery"
*/

switch (_faction) do {
	case "Blue": {
		switch (_unitPref) do {
			case "rifleman": {_ret = "B_Soldier_F"};
			case "autorifleman": {_ret = "B_soldier_AR_F"};
			case "AA_battery": {_ret = "B_Panther_AA_F"};
		}
	};
	case "Red": {
		switch (_unitPref) do {
			case "rifleman": {_ret = "O_Soldier_F"};
			case "autorifleman": {_ret = "O_Soldier_AR_F"};
			case "AA_battery": {_ret = "O_tracked_AA_placeholder_F"};
		}
	};
	case "Green_army": {
		switch (_unitPref) do {
			case "rifleman": {_ret = "I_Soldier_F"};
			case "autorifleman": {_ret = "I_Soldier_AR_F"};
			case "AA_battery": {_ret = "IA_tracked_AA_placeholder_F"};
		}
	};
	case "Green_para": {
		switch (_unitPref) do {
			case "rifleman": {_ret = "I_G_Soldier_F"};
			case "autorifleman": {_ret = "I_G_Soldier_AR_F"};
			case "AA_battery": {_ret = "I_G_offroad_armed"};
		}
	};
};

_ret