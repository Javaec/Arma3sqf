if !(_this select 1) then {
	{
		{
			_x hideobject false;
			_x enablesimulation true;
		} foreach ([_x] + crew _x);
	} foreach (allmissionobjects "All");
	{
		removevest _x;
		removebackpack _x;
		removeheadgear _x;
		removegoggles _x;
		removeallweapons _x;
		_x addvest vest player;
		_x addbackpack backpack player;
		_x addheadgear headgear player;
		_x addgoggles goggles player;
		_x addweapon primaryweapon player;
		_x addweapon secondaryweapon player;
		_x addweapon handgunweapon player;
	} foreach (entities "B_Soldier_VR_F" + entities "O_Soldier_VR_F" + entities "I_Soldier_VR_F");

	("RscVRMeta" call bis_fnc_rscLayer) cutrsc ["RscVRMeta","plain"];
};