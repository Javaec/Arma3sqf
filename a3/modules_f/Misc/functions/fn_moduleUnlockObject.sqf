_logic = _this select 0;
_units = _this select 1;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Unlock addons
	_curator = objnull;
	_addons = [];
	{
		if (_x call bis_fnc_isCurator) then {
			_curator = _x;
		} else {
			_addons = _addons + (unitAddons typeof vehicle _x);
		};
	} foreach (synchronizedobjects _logic);
	_addons = _addons - [""];
	if (isnull _curator) then {
		["Cannot unlock %1, curator not found.",_addons] call bis_fnc_error;
	} else {
		[_curator,_addons] call bis_fnc_curatorAddPlaceableAddons;
	};
};