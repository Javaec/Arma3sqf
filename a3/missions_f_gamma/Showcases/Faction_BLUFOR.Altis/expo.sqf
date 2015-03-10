_xx = [] spawn 
{ 
	BIS_expogunner02 moveinGunner BIS_expo02;
	BIS_expogunner02 lookat BIS_expoTarget01; 
	Sleep 3;
/*
	while {true} do
	{
		BIS_expogunner02 lookat [ getpos BIS_expoTarget01 select 0, getpos BIS_expoTarget01 select 1, 30 + random 60] ;
		Sleep 2;
        WaitUntil{ !BIS_attendantDisabled };
		x = BIS_expogunner02 fireAtTarget [BIS_expoTarget01, "cannon_120mm"];
		Sleep 2 + random 4 ;
		BIS_expo02 setVehicleAmmo 1;
	};
*/
};


_xx = [] spawn
{
	BIS_expogunner03 moveinGunner BIS_expo03;
	BIS_expogunner03 lookat BIS_expoTarget01; 
	Sleep 1;
	
	while {true} do
	{
		BIS_expogunner03 lookat [ (getpos BIS_expoTarget01 select 0) + random 5, (getpos BIS_expoTarget01 select 1) + random 5, 0 + random 6] ;
		Sleep 2;
		WaitUntil{ !BIS_attendantDisabled };
		for "_i" from 1 to (ceil random 11) do
		{
		 	if(BIS_attendantDisabled) exitwith {true};
			x = BIS_expogunner03 fireAtTarget [BIS_expoTarget01];
		 	Sleep 0.3;
		};
		Sleep 3 + random 4;
		BIS_expo03 setVehicleAmmo 1;
	};
	
};

_xx = [] spawn
{
	private [ "_firepos" ];
	BIS_expogunner01 moveinGunner BIS_expo01;
	BIS_expogunner01 lookat BIS_expoTarget01; 
	Sleep 4;
	
	while {true} do
	{
		_firepos = [ (getpos BIS_expoTarget01 select 0) - random 5 , (getpos BIS_expoTarget01 select 1) - random 5, 30 + random 6];
		BIS_expogunner01 lookat _firepos ;
		Sleep 2;
		WaitUntil{ !BIS_attendantDisabled };
		x = BIS_expogunner01 fireAtTarget [BIS_expoTarget01, "mortar_155mm_AMOS" ];
		/*
		if( !isnil "BIS_liveFeed" ) then
		{
			if( _firepos select 2 < 40 ) then
			{
				BIS_liveFeed camSetFov 0.65;   BIS_liveFeed camCommit 3;
			};
			if( _firepos select 2 >= 40 && _firepos select 2 < 50) then
			{
				BIS_liveFeed camSetFov 0.55;   BIS_liveFeed camCommit 3;
			};
			if( _firepos select 2 >= 50  && _firepos select 2 < 60 ) then
			{
				BIS_liveFeed camSetFov 0.40;   BIS_liveFeed camCommit 3;
			};
			if( _firepos select 2 >= 60 ) then
			{
				BIS_liveFeed camSetFov 0.35;   BIS_liveFeed camCommit 3;
			};
		};	
		*/
		Sleep 3 + random 4;
		BIS_expo01 setVehicleAmmo 1;
	};
	
};


_showPip = [] spawn 
{
	private ["_distance" ];
	_distance = 45;
	
	while {true} do
	{
		waituntil{ player distance BIS_mrkExpo <= _distance };
		_pip = [BIS_PIPpos, BIS_PIPpos2, player] spawn BIS_fnc_liveFeed;
		Sleep 5;
		waituntil{ player distance BIS_mrkExpo > _distance };
		_pipterm = [] spawn BIS_fnc_liveFeedTerminate;
		Sleep 5;		
	};
};