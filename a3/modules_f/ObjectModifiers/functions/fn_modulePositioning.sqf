private ["_logic","_units","_isPosition","_isRotation","_pitch","_bank","_pos","_dir","_radius"];

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_units = [_this,1,[],[[]]] call bis_fnc_param;
_activated = [_this,2,true,[true]] call bis_fnc_param;

if (_activated) then {

	//--- Extract the user defined module arguments
	_isPosition = parsenumber (_logic getvariable ["position","0"]) > 0;
	_isRotation = parsenumber (_logic getvariable ["rotation","0"]) > 0;
	_pitch		= _logic getvariable ["pitch",0];	
	_bank 		= _logic getvariable ["bank",0];
	_radius		= _logic getvariable ["radius",3];
	_elevation 	= _logic getvariable ["elevation",0];

	//---saving module position and orientation
	_pos = getPos _logic;
	_dir = getDir _logic;

	//--- Repositioning objects to posion of module
	if (_isPosition) then
	{
		_pos set [2,((_pos select 2) + _elevation)]; // adding elevation if available
		{
			(vehicle _x) setPos ([_pos,random _radius,random 360] call BIS_fnc_relPos);
		} foreach _units;
	};
	//--- Rotating objects in direction of module
	if (_isRotation) then
	{
		{
			_veh = vehicle _x;
			_veh setDir _dir;
			if (_veh isKindOf "CaManBase") then 
			{
				(group _veh) setFormDir _dir;
			};
		} foreach _units;	
	};	
	//--- Object pitch and bank
	if !((_pitch==0)&&(_bank==0)) then
	{
		{
			_veh = vehicle _x;
			[_veh,_pitch,_bank] call BIS_fnc_setPitchBank; 
		} foreach _units;	
	};
};

true