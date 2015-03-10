if (isNil {BIS_siteCivCreate}) then {BIS_siteCivCreate = false; [] call BIS_civilCheck};
if (isNil {BIS_siteCivList}) then {BIS_siteCivList = []};
if (isNil {BIS_siteCivPos}) then {BIS_siteCivPos = []};

_site = _this select 0;
_site setVariable ["active",false];
_site setVariable ["killed",0];
_site setVariable ["killedOld",0];
BIS_siteCivList = BIS_siteCivList + [_site];
BIS_siteCarsList = [];

 
if !(BIS_siteCivCreate) then {
	_CfgVehicles = configFile >> "cfgVehicles";
	_number = count _Cfgvehicles;
	BIS_cVehCarsList = [];
	BIS_cVehOtherList = [];

	for "_i" from 0 to (_number - 1) do {
		_item = _CfgVehicles select _i;
		if (isClass _item) then {
			if (((getnumber (_item >> "scope")) == 2) && ((getnumber (_item >> "side")) == 3)) then{
				_class = configName _item;
				if (_class isKindOf "Car") then {
					if !((_class isKindOf "Truck") || (_class isKindOf "Wheeled_APC")) then {
						BIS_cVehCarsList = BIS_cVehCarsList + [_class]
					} else {
						BIS_cVehOtherList = BIS_cVehOtherList + [_class]
					}
				}
			}
		}
	}
};

if !(BIS_siteCivCreate) then {

	_config = configFile >> "Cfgvehicles";
	_count = count _config;
	_civList = [];
	for "_x" from 0 to (_count-1) do {
		_entry = _config select _x;
		if (isClass _entry) then {
			_class = configName _entry;
			if (_class isKindOf "C_man_1") then {
				_civList = _civList + [_class]
			}
		}
	};

	BIS_siteUnitsList = _civList;
	_unitsCount = 40;	//only 1-99
	_i = 0;
	_pos = [10707,10250,0];
	BIS_siteCiv = [];

	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group01 = createGroup Civilian;
		_unit createUnit [_pos, _group01, "BIS_siteCiv01 = this"];
		_i = _i + 1;
		BIS_siteCivCreate = true;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv01];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group02 = createGroup Civilian;
		_unit createUnit [_pos, _group02, "BIS_siteCiv02 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv02];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group03 = createGroup Civilian;
		_unit createUnit [_pos, _group03, "BIS_siteCiv03 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv03];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group04 = createGroup Civilian;
		_unit createUnit [_pos, _group04, "BIS_siteCiv04 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv04];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group05 = createGroup Civilian;
		_unit createUnit [_pos, _group05, "BIS_siteCiv05 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv05];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group06 = createGroup Civilian;
		_unit createUnit [_pos, _group06, "BIS_siteCiv06 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv06];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group07 = createGroup Civilian;
		_unit createUnit [_pos, _group07, "BIS_siteCiv07 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv07];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group08 = createGroup Civilian;
		_unit createUnit [_pos, _group08, "BIS_siteCiv08 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv08];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group09 = createGroup Civilian;
		_unit createUnit [_pos, _group09, "BIS_siteCiv09 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv09];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group10 = createGroup Civilian;
		_unit createUnit [_pos, _group10, "BIS_siteCiv10 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv10];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group11 = createGroup Civilian;
		_unit createUnit [_pos, _group11, "BIS_siteCiv11 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv11];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group12 = createGroup Civilian;
		_unit createUnit [_pos, _group12, "BIS_siteCiv12 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv12];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group13 = createGroup Civilian;
		_unit createUnit [_pos, _group13, "BIS_siteCiv13 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv13];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group14 = createGroup Civilian;
		_unit createUnit [_pos, _group14, "BIS_siteCiv14 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv14];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group15 = createGroup Civilian;
		_unit createUnit [_pos, _group15, "BIS_siteCiv15 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv15];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group16 = createGroup Civilian;
		_unit createUnit [_pos, _group16, "BIS_siteCiv16 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv16];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group17 = createGroup Civilian;
		_unit createUnit [_pos, _group17, "BIS_siteCiv17 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv17];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group18 = createGroup Civilian;
		_unit createUnit [_pos, _group18, "BIS_siteCiv18 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv18];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group19 = createGroup Civilian;
		_unit createUnit [_pos, _group19, "BIS_siteCiv19 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv19];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group20 = createGroup Civilian;
		_unit createUnit [_pos, _group20, "BIS_siteCiv20 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv20];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group21 = createGroup Civilian;
		_unit createUnit [_pos, _group21, "BIS_siteCiv21 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv21];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group22 = createGroup Civilian;
		_unit createUnit [_pos, _group22, "BIS_siteCiv22 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv22];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group23 = createGroup Civilian;
		_unit createUnit [_pos, _group23, "BIS_siteCiv23 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv23];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group24 = createGroup Civilian;
		_unit createUnit [_pos, _group24, "BIS_siteCiv24 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv24];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group25 = createGroup Civilian;
		_unit createUnit [_pos, _group25, "BIS_siteCiv25 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv25];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group26 = createGroup Civilian;
		_unit createUnit [_pos, _group26, "BIS_siteCiv26 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv26];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group27 = createGroup Civilian;
		_unit createUnit [_pos, _group27, "BIS_siteCiv27 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv27];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group28 = createGroup Civilian;
		_unit createUnit [_pos, _group28, "BIS_siteCiv28 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv28];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group29 = createGroup Civilian;
		_unit createUnit [_pos, _group29, "BIS_siteCiv29 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv29];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group30 = createGroup Civilian;
		_unit createUnit [_pos, _group30, "BIS_siteCiv30 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv30];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group31 = createGroup Civilian;
		_unit createUnit [_pos, _group31, "BIS_siteCiv31 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv31];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group32 = createGroup Civilian;
		_unit createUnit [_pos, _group32, "BIS_siteCiv32 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv32];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group33 = createGroup Civilian;
		_unit createUnit [_pos, _group33, "BIS_siteCiv33 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv33];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group34 = createGroup Civilian;
		_unit createUnit [_pos, _group34, "BIS_siteCiv34 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv34];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group35 = createGroup Civilian;
		_unit createUnit [_pos, _group35, "BIS_siteCiv35 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv35];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group36 = createGroup Civilian;
		_unit createUnit [_pos, _group36, "BIS_siteCiv36 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv36];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group37 = createGroup Civilian;
		_unit createUnit [_pos, _group37, "BIS_siteCiv37 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv37];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group38 = createGroup Civilian;
		_unit createUnit [_pos, _group38, "BIS_siteCiv38 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv38];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group39 = createGroup Civilian;
		_unit createUnit [_pos, _group39, "BIS_siteCiv39 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv39];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group40 = createGroup Civilian;
		_unit createUnit [_pos, _group40, "BIS_siteCiv40 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv40];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group41 = createGroup Civilian;
		_unit createUnit [_pos, _group41, "BIS_siteCiv41 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv41];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group42 = createGroup Civilian;
		_unit createUnit [_pos, _group42, "BIS_siteCiv42 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv42];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group43 = createGroup Civilian;
		_unit createUnit [_pos, _group43, "BIS_siteCiv43 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv43];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group44 = createGroup Civilian;
		_unit createUnit [_pos, _group44, "BIS_siteCiv44 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv44];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group45 = createGroup Civilian;
		_unit createUnit [_pos, _group45, "BIS_siteCiv45 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv45];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group46 = createGroup Civilian;
		_unit createUnit [_pos, _group46, "BIS_siteCiv46 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv46];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group47 = createGroup Civilian;
		_unit createUnit [_pos, _group47, "BIS_siteCiv47 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv47];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group48 = createGroup Civilian;
		_unit createUnit [_pos, _group48, "BIS_siteCiv48 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv48];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group49 = createGroup Civilian;
		_unit createUnit [_pos, _group49, "BIS_siteCiv49 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv49];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group50 = createGroup Civilian;
		_unit createUnit [_pos, _group50, "BIS_siteCiv50 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv50];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group51 = createGroup Civilian;
		_unit createUnit [_pos, _group51, "BIS_siteCiv51 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv51];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group52 = createGroup Civilian;
		_unit createUnit [_pos, _group52, "BIS_siteCiv52 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv52];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group53 = createGroup Civilian;
		_unit createUnit [_pos, _group53, "BIS_siteCiv53 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv53];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group54 = createGroup Civilian;
		_unit createUnit [_pos, _group54, "BIS_siteCiv54 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv54];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group55 = createGroup Civilian;
		_unit createUnit [_pos, _group55, "BIS_siteCiv55 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv55];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group56 = createGroup Civilian;
		_unit createUnit [_pos, _group56, "BIS_siteCiv56 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv56];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group57 = createGroup Civilian;
		_unit createUnit [_pos, _group57, "BIS_siteCiv57 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv57];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group58 = createGroup Civilian;
		_unit createUnit [_pos, _group58, "BIS_siteCiv58 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv58];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group59 = createGroup Civilian;
		_unit createUnit [_pos, _group59, "BIS_siteCiv59 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv59];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group60 = createGroup Civilian;
		_unit createUnit [_pos, _group60, "BIS_siteCiv60 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv60];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group61 = createGroup Civilian;
		_unit createUnit [_pos, _group61, "BIS_siteCiv61 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv61];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group62 = createGroup Civilian;
		_unit createUnit [_pos, _group62, "BIS_siteCiv62 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv62];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group63 = createGroup Civilian;
		_unit createUnit [_pos, _group63, "BIS_siteCiv63 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv63];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group64 = createGroup Civilian;
		_unit createUnit [_pos, _group64, "BIS_siteCiv64 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv64];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group65 = createGroup Civilian;
		_unit createUnit [_pos, _group65, "BIS_siteCiv65 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv65];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group66 = createGroup Civilian;
		_unit createUnit [_pos, _group66, "BIS_siteCiv66 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv66];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group67 = createGroup Civilian;
		_unit createUnit [_pos, _group67, "BIS_siteCiv67 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv67];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group68 = createGroup Civilian;
		_unit createUnit [_pos, _group68, "BIS_siteCiv68 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv68];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group69 = createGroup Civilian;
		_unit createUnit [_pos, _group69, "BIS_siteCiv69 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv69];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group70 = createGroup Civilian;
		_unit createUnit [_pos, _group70, "BIS_siteCiv70 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv70];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group71 = createGroup Civilian;
		_unit createUnit [_pos, _group71, "BIS_siteCiv71 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv71];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group72 = createGroup Civilian;
		_unit createUnit [_pos, _group72, "BIS_siteCiv72 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv72];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group73 = createGroup Civilian;
		_unit createUnit [_pos, _group73, "BIS_siteCiv73 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv73];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group74 = createGroup Civilian;
		_unit createUnit [_pos, _group74, "BIS_siteCiv74 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv74];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group75 = createGroup Civilian;
		_unit createUnit [_pos, _group75, "BIS_siteCiv75 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv75];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group76 = createGroup Civilian;
		_unit createUnit [_pos, _group76, "BIS_siteCiv76 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv76];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group77 = createGroup Civilian;
		_unit createUnit [_pos, _group77, "BIS_siteCiv77 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv77];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group78 = createGroup Civilian;
		_unit createUnit [_pos, _group78, "BIS_siteCiv78 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv78];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group79 = createGroup Civilian;
		_unit createUnit [_pos, _group79, "BIS_siteCiv79 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv79];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group80 = createGroup Civilian;
		_unit createUnit [_pos, _group80, "BIS_siteCiv80 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv80];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group81 = createGroup Civilian;
		_unit createUnit [_pos, _group81, "BIS_siteCiv81 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv81];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group82 = createGroup Civilian;
		_unit createUnit [_pos, _group82, "BIS_siteCiv82 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv82];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group83 = createGroup Civilian;
		_unit createUnit [_pos, _group83, "BIS_siteCiv83 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv83];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group84 = createGroup Civilian;
		_unit createUnit [_pos, _group84, "BIS_siteCiv84 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv84];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group85 = createGroup Civilian;
		_unit createUnit [_pos, _group85, "BIS_siteCiv85 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv85];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group86 = createGroup Civilian;
		_unit createUnit [_pos, _group86, "BIS_siteCiv86 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv86];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group87 = createGroup Civilian;
		_unit createUnit [_pos, _group87, "BIS_siteCiv87 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv87];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group88 = createGroup Civilian;
		_unit createUnit [_pos, _group88, "BIS_siteCiv88 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv88];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group89 = createGroup Civilian;
		_unit createUnit [_pos, _group89, "BIS_siteCiv89 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv89];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group90 = createGroup Civilian;
		_unit createUnit [_pos, _group90, "BIS_siteCiv90 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv90];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group91 = createGroup Civilian;
		_unit createUnit [_pos, _group91, "BIS_siteCiv91 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv91];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group92 = createGroup Civilian;
		_unit createUnit [_pos, _group92, "BIS_siteCiv92 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv92];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group93 = createGroup Civilian;
		_unit createUnit [_pos, _group93, "BIS_siteCiv93 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv93];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group94 = createGroup Civilian;
		_unit createUnit [_pos, _group94, "BIS_siteCiv94 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv94];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group95 = createGroup Civilian;
		_unit createUnit [_pos, _group95, "BIS_siteCiv95 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv95];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group96 = createGroup Civilian;
		_unit createUnit [_pos, _group96, "BIS_siteCiv96 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv96];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group97 = createGroup Civilian;
		_unit createUnit [_pos, _group97, "BIS_siteCiv97 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv97];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group98 = createGroup Civilian;
		_unit createUnit [_pos, _group98, "BIS_siteCiv98 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv98];
	};
	
	if (_i < _unitsCount) then {
		_unit = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
		_group99 = createGroup Civilian;
		_unit createUnit [_pos, _group99, "BIS_siteCiv99 = this"];
		_i = _i + 1;
		BIS_siteCiv = BIS_siteCiv + [BIS_siteCiv99];
	};
	
	{
		_x setVariable ["inAction",false];
		_x setVariable ["inSite",objNull];
		_x setVariable ["killed",false];
		_x hideObject true;
		_x enableSimulation false;
		_x allowDamage false;
	} forEach BIS_siteCiv;
};