/*
	Author: Karel Moricky

	Description:
	Register a unit as Trident unit.
	When competing sides are still friendly and the unit is killed by the competing side,
	the killer won't be punsihed by negative score. Instead, Trident relationship will decrease.

	Parameter(s):
		0: OBJECT

	Returns:
	BOOL - true if event handler managing the functionality was added, false when it existed already
*/

private ["_unit"];
_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
if (isnil {_x getvariable "BIS_fnc_tridentHandleDamage_eh"}) then {
	private ["_eh"];
	_eh = _unit addeventhandler [
		"handleDamage",
		{
			_unit = _this select 0;
			_section = _this select 1;
			_dam = _this select 2;
			_shooter = _this select 3;
			_projectile = _this select 4;

			//--- Continue only when local unit died
			if (local _unit && alive _unit && _dam >= 0.9 && _section == "" && _projectile != "") then {

				_sideUnit = _unit call bis_fnc_objectside;
				_sideShooter = side group _shooter;

				if (_sideUnit != _sideShooter) then {

					[_sideUnit,_sideShooter,-1] call bis_fnc_tridentSetRelationship;

					if ([_sideUnit,_sideShooter] call bis_fnc_areFriendly) then {
						_rating = _shooter getvariable ["BIS_fnc_tridentHandleDamage_rating",0];
						["Trident Fake",_unit,_shooter,rating _shooter,_rating] call bis_fnc_log;

						//--- Fake the death
						[_unit,_shooter,_rating] spawn {
							_unit = _this select 0;
							_shooter = _this select 1;
							_rating = _this select 2;

							_unit setdamage 1;
							_shooter addrating (_rating - rating _shooter);
							if (_unit iskindof "Man") then {
								[[_shooter,1],"bis_fnc_addscore",false] call bis_fnc_mp;
							};
						};

						_dam = 0;
					};
				};
			} else {
				_shooter setvariable ["BIS_fnc_tridentHandleDamage_rating",rating _shooter];
				//if (vehicle _unit != _unit && _section == "" && _dam == 1 && isnull _shooter && _projectile == "") then {_dam = 0;};
			};
			_dam
		}
	];
	_unit setvariable ["BIS_fnc_tridentHandleDamage_eh",_eh];
	//_unit addeventhandler ["getin",{_this call bis_fnc_log;}];

	true
} else {
	false
};