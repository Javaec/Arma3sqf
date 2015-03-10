//Parameters
private ["_group", "_skill"];
_group 	= [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;
_skill	= [_this, 1, 0.2, [0]] call BIS_fnc_param;

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
		
		//Skill
		_unit setSkill _skill;
	};
} forEach units _group;

//Return value
true;
