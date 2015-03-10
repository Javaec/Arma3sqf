/*
	Author: Karel Moricky

	Description:
	Move a unit to the respawn position.

	Parameter(s):
		0: OBJECT
		1:
			STRING - move to marker position
			OBJECT - move inside a vehicle (when seats are empty and not locked) or around it
			ARRAY - move to precise [X,Y,Z] position

	Returns:
	BOOL
*/

_unit = [_this,0,player,[objnull]] call bis_fnc_param;
_position = [_this,1,_unit,[[],"",objnull,grpnull]] call bis_fnc_param;
_init = [_this,2,!isserver && time == 0,[true]] call bis_fnc_param;

_fnc_setPos = {
	_posOrig = (_this select 0) call bis_fnc_position;
	_dummy = (typeof player) createvehiclelocal _posOrig;
	_pos = position _dummy;
	deletevehicle _dummy;
	_unit setpos _pos;
	if (count _this > 1) then {
		_unit setdir (_this select 1);
	} else {
		_unit setdir ([_pos,_posOrig] call bis_fnc_dirto);
	};
};

switch (typename _position) do {
	case (typename grpnull);
	case (typename objnull): {
		if (typename _position == typename grpnull) then {_position = leader _position;};

		_obj = vehicle _position;
		_objPos = _obj call bis_fnc_position;
		if (
			(
				{_obj emptypositions _x > 0} count ["driver","commander","gunner","cargo"] > 0
				||
				{{isnull (_obj turretunit _x)} count ([_obj,[]] call bis_fnc_getTurrets) > 0}
			) && (
				getnumber (configfile >> "cfgvehicles" >> typeof _obj >> "isUav") == 0
			)
		) then {
			//--- Inside
			[_position,direction _obj] call _fnc_setPos; //--- Move near the vehicle in case moving in fails
			_unit moveinany _obj;
		} else {
			//--- Outside
			if ((_objPos select 2) > 20) then {
				//--- Parachute
				_para = createvehicle ["Steerable_Parachute_F",_objPos,[],0,"none"];
				_para setpos _objPos;
				_para setdir direction _obj;
				_unit moveindriver _para;
			} else {
				_objPosATL = getposatl _obj;
				if ((_objPosATL select 2) > 1 && (_objPos select 2) < 1) then {
					//--- Building
					_unit setposatl _objPosATL;
					_unit setdir direction _obj;
				} else {
					//--- Ground
					[_obj,direction _obj] call _fnc_setPos;
				};
			};
		};
	};
	case (typename ""): {
		_direction = markerdir _position;
		if (_direction > 360) then {_direction = _direction / 360;};
		[_position,_direction] call _fnc_setPos;
	};
	case (typename []): {
		if ((_position select 2) > 20) then {
			//--- Parachute
			_para = createvehicle ["Steerable_Parachute_F",_position,[],0,"none"];
			_para setpos _position;
			_unit moveindriver _para;
		} else {
			//--- Position
			_unit setposatl _position;
		};
	};

};
true