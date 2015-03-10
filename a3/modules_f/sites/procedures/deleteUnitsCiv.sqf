_unit = _this select 0;
_pos = [10707,10250,0];
_damageCiv = damage _unit;

if (_damageCiv < 0.1) then {
	_unit enableSimulation false;
	_unit hideObject true;
	_unit setVariable ["inAction",false];
	_unit setPos _pos;
	_unit allowDamage false;
} else {
	BIS_siteCiv = BIS_siteCiv - [_unit];
	deletevehicle _unit;

	_group = 0;
	_emptyGroups = [];
	{
		if ((side _x == civilian) && (count (units _x) == 0)) then {
			_emptyGroups = _emptyGroups + [_x]
		}
	} forEach allGroups;
	if ((count _emptyGroups) != 0) then {
		_group = _emptyGroups select 0;
	} else {
		_group = createGroup Civilian
	};
	
	_unitNew = BIS_siteUnitsList select round (random ((count BIS_siteUnitsList) - 1));
	_unitNew createUnit [_pos, _group, "BIS_newUnit = this"];
	
	BIS_newUnit setVariable ["inAction",false];
	BIS_newUnit setVariable ["inSite",objNull];
	BIS_newUnit setVariable ["killed",false];
	BIS_newUnit hideObject true;
	BIS_newUnit enableSimulation false;
	BIS_newUnit allowDamage false;
	BIS_siteCiv = BIS_siteCiv + [BIS_newUnit];
	/*debuglog str BIS_siteCiv;
	debuglog str (count BIS_siteCiv);
	debuglog str ({alive _x} count BIS_siteCiv);*/
};