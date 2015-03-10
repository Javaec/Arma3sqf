
_xx = [] spawn 
{ 
	private [ "_addMagazine", "_targets", "_selectedTarget", "_poses" ];
	_addMagazine = 5;
	BIS_expoSniper01 setunitpos "down"; 
	Sleep 5;
	_targets = [BIS_expoTarget01, BIS_expoTarget02, BIS_expoTarget03, BIS_expoTarget04, BIS_expoTarget05];
	_poses = [ "UP", "MIDDLE", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "MIDDLE", "MIDDLE", "MIDDLE" ]; 

	while {true} do
	{
		
		_selectedTarget = _targets select ( floor random ( count _targets ) ); 
		BIS_expoSniper01 setunitpos ( _poses select ( floor random ( count _poses ) ) );
		BIS_expoSniper01 lookat position _selectedTarget; 
		BIS_expoSniper01 doTarget _selectedTarget; 
		Sleep 4 + random 3 ;
    	
		if( (count list BIS_trg_restrictedarea1) == 0 ) then
		{ 
			BIS_expoSniper01 forceWeaponFire [ primaryWeapon BIS_expoSniper01, "SINGLE"];
		};
		Sleep 2 + random 4 ;
		_addMagazine = _addMagazine - 1;
		if( _addMagazine == 0 ) then
		{
			BIS_expoSniper01 addMagazine "5Rnd_127x108_Mag";
			_addMagazine = 5;
		};
		
		
		
	};
};


_showPip = [] spawn 
{
	private ["_distance" ];
	_distance = 15;
	while {true} do
	{
		waituntil{ player distance BIS_mrkExpo <= _distance};
		_pip = [BIS_PIPpos, BIS_expoTarget03, player] spawn BIS_fnc_liveFeed;
		Sleep 5;
		waituntil{ player distance BIS_mrkExpo > _distance };
		_pipterm = [] spawn BIS_fnc_liveFeedTerminate;
		Sleep 5;		
	};
};