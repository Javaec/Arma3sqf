_radiusS = 2500;
_radiusSF = 3000;
_radiusC = 1000;
_radiusCF = 1300;

// ----- sites check -----
[_radiusS,_radiusSF] spawn {
	_radiusS = _this select 0;
	_radiusSF = _this select 1;
	while {true} do {
		_unactiveSites = [];
		_activeSites = [];
		_closeSites = [];
		_distSites = [];
		
		{								//active check
			_active = _x getVariable "active";
			if (_active) then {
				_activeSites = _activeSites + [_x]
			} else {
				_unactiveSites = _unactiveSites + [_x]
			}
		} forEach BIS_siteCivList;
		
		{								//distance check - unactive
			_dist = _x distance player;
			if (_dist < _radiusS) then {
				_closeSites = _closeSites + [_x]
			}
		} forEach _unactiveSites;
		
		{								//distance check - active
			_dist = _x distance player;
			if (_dist > _radiusSF) then {
				_distSites = _distSites + [_x]
			}
		} forEach _activeSites;
		
		{								//activation
			_type = _x getVariable "siteType";
			_x setVariable ["active",true];
			_killed = _x getVariable "killed";						
			if (_type == "settlement_village") then {
				[_x] execVM "\A3\modules_f\sites\site_inits\settlement_village_core.sqf"
			} else {
				if (_type == "farm") then {
					[_x] execVM "\A3\modules_f\sites\site_inits\settlement_farm_core.sqf"
				} else {	
					if (_type == "fishermen_place") then {
						[_x] execVM "\A3\modules_f\sites\site_inits\fishermen_place_core.sqf"
					} else {
					//next types
					}
				}
			}
		} forEach _closeSites;
		
		{								//delete civs and vehicles on deleted sites
			_site = _x;
			{
				if (_site == (_x select 1)) then {
					_pos = _x select 0;
					{
						_civPos = _x getVariable "position";
						if (str _pos == str _civPos) then {
							[_x] call BIS_deleteUnitsCiv
						}
					} forEach BIS_siteCiv
				}
			} forEach BIS_createdCivList;
			
			{
				if (_site == (_x select 1)) then {
					deleteVehicle (_x select 0)
				}
			} forEach BIS_siteCarsList
		} forEach _distSites;
		
		{								//deactivate site
			_site = _x;
			_tempList = [];
			{
				if !(_site == (_x select 1)) then {
					_tempList = _tempList + [_x]
				}
			} forEach BIS_siteCivPos;
			BIS_siteCivPos = _tempList;
			
			_tempList = [];
			{
				if !(_site == (_x select 1)) then {
					_tempList = _tempList + [_x]
				}
			} forEach BIS_siteCarsList;
			BIS_siteCarsList = _tempList;
			
			_site setVariable ["active",false];
		} forEach _distSites;
				
		sleep 2
	}
};

// ----- civPos check -----
[_radiusC,_radiusCF] spawn {
	_radiusC = _this select 0;
	_radiusCF = _this select 1;
	BIS_createdCivList = [];
	while {true} do {
		{				//delete civs
			if ((!(alive _x)) && (!(_x getVariable "killed"))) then {
				_site = _x getVariable "inSite";
				_killed = _site getVariable "killed";
				_killed = _killed + 1;
				_site setVariable ["killed",_killed];
				_x setVariable ["killed", true];
			};
			
			if !(isNil{_x getVariable "inAction"}) then {
				if (_x getVariable "inAction") then {
					_dist = _x distance player;
					if (_dist > _radiusCF) then {
						[_x] call BIS_deleteUnitsCiv;
						_pos = _x getVariable "position";

						_tempList = [];
						{
							if (str _tempList == "[]") then {
								if ((str (_x select 0)) == (str _pos)) then {
									_tempList = _tempList + [_x]
								}
							}
						} forEach BIS_createdCivList;
						_posC = _tempList select 0;
						
						_tempList = [];
						{
							if !((str _x) == (str _posC)) then {
								_tempList = _tempList + [_x]
							}
						} forEach BIS_createdCivList;
						BIS_createdCivList = _tempList;
						BIS_siteCivPos = BIS_siteCivPos + [_posC];
					}
				}
			} else {
				_dist = _x distance player;
				if (_dist > _radiusCF) then {
					[_x] call BIS_deleteUnitsCiv;
					_pos = _x getVariable "position";

					_tempList = [];
					{
						if (str _tempList == "[]") then {
							if ((str (_x select 0)) == (str _pos)) then {
								_tempList = _tempList + [_x]
							}
						}
					} forEach BIS_createdCivList;
					_posC = _tempList select 0;
					
					_tempList = [];
					{
						if !((str _x) == (str _posC)) then {
							_tempList = _tempList + [_x]
						}
					} forEach BIS_createdCivList;
					BIS_createdCivList = _tempList;
					BIS_siteCivPos = BIS_siteCivPos + [_posC];
				}
			}
		} forEach BIS_siteCiv;
			
		{								//create civs
			_dist = (_x select 0) distance player;
			if (_dist < _radiusC) then {
				BIS_createdCivList = BIS_createdCivList + [_x];
				_temp = _x;
				_tempList = [];
				{
					if !((str _x) == (str _temp)) then {
						_tempList = _tempList + [_x]
					}
				} forEach BIS_siteCivPos;
				BIS_siteCivPos = _tempList;
				if ((count _x) == 3) then {
					_unit = [1,(_x select 0),(_x select 1),(_x select 2)] call BIS_selectUnitCiv
				} else {
					_unit = [1,(_x select 0),(_x select 1)] call BIS_selectUnitCiv
				}
			}
		} forEach BIS_siteCivPos;
	
		sleep 2.2
	}
};

// ----- killing check -----
[] spawn {
	while {true} do {
		_activeSites = [];
		{
			_active = _x getVariable "active";
			if (_active) then {
				_activeSites = _activeSites + [_x]
			}
		} forEach BIS_siteCivList;
		
		{
			_killed = _x getVariable "killed";
			_killedOld = _x getVariable "killedOld";
			if (_killed != _killedOld) then {
				_killDif = _killed - _killedOld;
				_x setVariable ["killedOld",_killed];
				_site = _x;
				
				_i = 0;
				_tempList = [];
				{
					if ((_i < _killDif) && ((_x select 1) == _site)) then {
						_i = _i + 1
					} else {
						_tempList = _tempList + [_x]
					}
				} forEach BIS_createdCivList;
				BIS_createdCivList = _tempList
			}
		} forEach _activeSites;
		sleep 10;
	}
};