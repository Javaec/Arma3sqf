_requester = _this getVariable "BIS_SUPP_requester";

if (vehicle _requester != vehicle _this) then {

	while {vehicle _requester != vehicle _this && (_this getVariable "BIS_SUPP_supporting") && canMove vehicle _this && alive _this && vehicle _this != _this} do {
		waitUntil {(vehicle _requester == vehicle _this) || position (vehicle _this) select 2 > 10};
		if (vehicle _requester != vehicle _this) then {
			vehicle _this land "GET IN";
			waitUntil {position (vehicle _this) select 2 < 10}
		}
	}
	
} else {
	
	while {vehicle _requester == vehicle _this && (_this getVariable "BIS_SUPP_supporting") && canMove vehicle _this && alive _this && vehicle _this != _this} do {
		waitUntil {(vehicle _requester != vehicle _this) || position (vehicle _this) select 2 > 10};
		if (vehicle _requester == vehicle _this) then {
			vehicle _this land "GET OUT";
			waitUntil {position (vehicle _this) select 2 < 10}
		}
	}
	
}