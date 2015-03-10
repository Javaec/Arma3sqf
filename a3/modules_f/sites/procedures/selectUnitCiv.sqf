_count = _this select 0;
_pos = _this select 1;
_site = _this select 2;
_unitType = "";
if (count _this == 4) then {_unitType = _this select 3};
_siteType = _site getVariable "siteType";
_civList = [];
_i = 0;

{
	if (_i < _count) then {
		_inAction = _x getVariable "inAction";
		if !(_inAction) then {
			_civList = _civList + [_x];
			_i = _i + 1;
		}
	}
} forEach BIS_siteCiv;

{
	_x enableSimulation true;
	_x hideObject false;
	_x setVariable ["inAction",true];
	_x setVariable ["inSite",_site];
	_x setVariable ["position",_pos];
	_x setPos _pos;
	_x setDir (random 360);
	_x allowDamage true;
	
	//if (_unitType != "") then {_x changeShape _unitType};
	
	if (_siteType == "Settlement_village") then {
		_null = [_x,12,100,1500,300] execFSM "\A3\modules_f\sites\behaviour\civilian_main.fsm"
	} else {
		if (_siteType == "farm") then {
			_null = [_x,30,100,100,80] execFSM "\A3\modules_f\sites\behaviour\farm.fsm"
		} else {
			if (_siteType == "fishermen_place") then {
				_null = [_x,8,20,100,50] execFSM "\A3\modules_f\sites\behaviour\fishermen.fsm"
			}
		}
	};
} forEach _civList;

_civList

//"_null = this call BIS_addSideQuestConvs; _null = [this] execFSM ""\A3\modules_f\sites\behaviour\village_main.fsm"";
//this setVariable [""nearestVillage"",BIS_activeSite getVariable ""nearestVillage""];this setVariable [""dist"",BIS_activeSite getVariable ""dist""]"