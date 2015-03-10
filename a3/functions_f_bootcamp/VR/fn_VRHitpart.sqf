
#define MAT_BLUE	"\A3\Structures_F_Mark\VR\Targets\Data\VR_Target_MBT_01_cannon_BLUFOR.rvmat"
#define MAT_RED		"\A3\Structures_F_Mark\VR\Targets\Data\VR_Target_MBT_01_cannon_OPFOR.rvmat"
#define MAT_GREEN	"\A3\Structures_F_Mark\VR\Targets\Data\VR_Target_MBT_01_cannon_INDEP.rvmat"
#define MAT_ORANGE	"\A3\Structures_F_Mark\VR\Targets\Data\VR_Target_MBT_01_cannon_damage.rvmat"
#define MAT_GREY	"\A3\Structures_F_Mark\VR\Targets\Data\VR_Target_MBT_01_cannon_destroy.rvmat"

_target = [_this,0,objnull,[objnull,[]]] call bis_fnc_param;

if (typename _target == typename objnull) then {

	//--- Init
	if ((_target getvariable ["bis_fnc_VRHitParts_handler",-1]) < 0) then {
		_target setvariable [
			"bis_fnc_VRHitParts_handler",
			_target addeventhandler ["hitpart",{_this call bis_fnc_VRHitpart;}]
		];

		_hitpoints = [];
		_hitparts = [];
		_hitselections = [];
		_hitdamage = [];
		_hiddenselections = getarray (configfile >> "cfgvehicles" >> typeof _target >> "hiddenselections");
		{_hiddenselections set [_foreachindex,tolower _x];} foreach _hiddenselections;
		{
			_hitpoints pushback _x;
			_hitparts pushback tolower gettext (_x >> "name");
			_hitselections pushback (_hiddenselections find tolower gettext (_x >> "visual"));
			_hitdamage pushback 0;
			_target setobjectmaterial [_foreachindex,MAT_GREY];
		} foreach (configproperties [configfile >> "cfgvehicles" >> typeof _target >> "hitpoints"]);
		_target setvariable ["bis_fnc_VRHitParts_hitpoints",_hitpoints];
		_target setvariable ["bis_fnc_VRHitParts_hitparts",_hitparts];
		_target setvariable ["bis_fnc_VRHitParts_hitselections",_hitselections];
		_target setvariable ["bis_fnc_VRHitParts_hitdamage",_hitdamage];
		_target setvariable ["bis_fnc_VRHitParts_script",scriptnull];
	};
} else {
	//--- Exec
	{
		_target = _x select 0;
		_shooter = _x select 1;
		_bullet = _x select 2;
		_position = _x select 3;
		_velocity = _x select 4;
		_selections = _x select 5;
		_ammo = _x select 6;
		_direction = _x select 7;
		_radius = _x select 8;
		_surface = _x select 9;
		_direct = _x select 10;

		if (_direct) then {
			switch (typeof _target) do {
				case "Land_VR_Target_MBT_01_cannon_F": {

					_targetArmor = getnumber (configfile >> "cfgvehicles" >> typeof _target >> "armor");
					_hit = _ammo select 0;
					_hitIndirect = _ammo select 1;
					_hitIndirectRange = _ammo select 2;
					_hitExplosive = _ammo select 3;
					_hitClass = _ammo select 4;

					//--- Some completely fake hit calculation to filter out HE rounds
					_hit = _hit / _targetArmor / (_hitIndirectRange max 1);//* (1 - _hitExplosive);

					_hitpoints = _target getvariable ["bis_fnc_VRHitParts_hitpoints",[]];
					_hitparts = _target getvariable ["bis_fnc_VRHitParts_hitparts",[]];
					_hitselections = _target getvariable ["bis_fnc_VRHitParts_hitselections",[]];
					_hitdamage = _target getvariable ["bis_fnc_VRHitParts_hitdamage",[]];
					{
						_id = _hitparts find tolower _x;
						if (_id >= 0) then {
							_hitpoint = _hitpoints select _id;
							_minimalhit = getnumber (_hitpoint >> "minimalhit");
							_armor = getnumber (_hitpoint >> "armor");

							_mat = MAT_GREY;
							_damage = _hitdamage select _id;
							if (_hit > _minimalhit) then {
								_damage = _damage + _hit;
								_hitdamage set [_id,_damage];
							};
							_mat = switch true do {
								case (_damage > _armor): {MAT_RED};
								case (_damage > _minimalhit): {MAT_ORANGE};
								default {MAT_GREY};
							};
							_target setobjectmaterial [_hitselections select _id,_mat];
						};
					} foreach _selections;

					//--- Reset all textures after some time
					terminate (_target getvariable ["bis_fnc_VRHitParts_script",scriptnull]);
					_target setvariable [
						"bis_fnc_VRHitParts_script",
						_target spawn {
							_target = _this;
							sleep 30;

							//--- Play blinking effect
							_materials = getobjectmaterials _target;
							_selections = _target getvariable ["bis_fnc_VRHitParts_hitselections",[]];
							for "_i" from 0 to 10 do {
								{_target setobjectmaterial [_foreachindex,_x];} foreach _materials;
								sleep 0.05;
								{_target setobjectmaterial [_foreachindex,MAT_GREY];} foreach _materials;
								sleep 0.05;
							};

							//--- Reset damage
							_hitdamage = [];
							{_hitdamage pushback 0;} foreach _materials;
							_target setvariable ["bis_fnc_VRHitParts_hitdamage",_hitdamage];
						}
					];
				};
			};
		};
	} foreach _this;
};