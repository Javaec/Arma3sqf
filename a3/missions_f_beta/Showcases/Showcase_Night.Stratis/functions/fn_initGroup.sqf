//Params
private ["_group"];
_group = [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;

//Validate group
if (isNull _group) exitWith {
	"Group must not be null" call BIS_fnc_error;
};

//The group properties
_group enableAttack false;
_group setBehaviour "SAFE";
_group setCombatMode "GREEN";
_group enableGunLights "ForceOn";

//The units properties
{
	private "_unit";
	_unit = _x;
	
	if (side _unit != WEST) then {
		_unit unassignItem "NVGoggles_Opfor";
		_unit removeItem "NVGoggles_Opfor";
		_unit unassignItem "NVGoggles_INDEP";
		_unit removeItem "NVGoggles_INDEP";
		_unit removeWeapon "Binocular";
		_unit unassignItem "acc_pointer_IR";
		_unit removePrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit assignItem "acc_flashlight";
		_unit enableGunLights "ForceOn";
		
		//Manual skill
		_unit setSkill 0.4;
		_unit setSkill ["aimingAccuracy", 0.2];
		_unit setSkill ["aimingShake", 0.2];
		_unit setSkill ["aimingSpeed", 0.2];
		
		//Remove optics
		{
			private "_type";
			_type = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");
			
			if (_type == 201) then {
				_unit removePrimaryWeaponItem _x;
			};
		} forEach primaryWeaponItems _unit;
	};
} forEach units _group;

//Return value
true;
