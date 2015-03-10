//Make the target pop down and back up
scopeName "root";

if ("target" in ((_this select 0) select 5)) then 
{
	private ["_target"];
	_target = (_this select 0) select 0;
	_target setDamage 0;

	_target animate ["Terc", 1];
	
	sleep 3;
	
	//Scripted global toggle to not pop back up
	if (!isNil "nopop") then 
	{
		if (nopop) then 
		{
			breakTo "root";	
		};
	};
	
	_target animate ["Terc", 0];
};

true