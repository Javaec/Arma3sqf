private ["_timesActivated"];
_timesActivated = _this select 0;

private ["_delayMain", "_delay"];
_delayMain = 5 * 60;
_delay =  random ((60 - (2.5 * _timesActivated)) * 60);

sleep (_delayMain + _delay);

private ["_handle", "_musicTime"];
_musicTime = -200;

private ["_startMusicScript"];
_startMusicScript = 
{
	2 fadeMusic 0;
	sleep 2;
	playMusic "Track27_Killing_Machines";
	2 fadeMusic 0.6;
};

private ["_animPool"];
_animPool = 
[
	"AmovPercMstpSnonWnonDnon_idle56kliky", 
	"AmovPercMstpSnonWnonDnon_idle68boxing", 
	"AmovPercMstpSnonWnonDnon_idle69drepy", 
	"AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou", 
	"AmovPercMstpSnonWnonDnon_idle71kliky", 
	"AmovPercMstpSnonWnonDnon_idle72lehSedy"
];

sleep 2;

while {alive player} do 
{
	if ((time - _musicTime) >= 200) then 
	{
		_handle = [] spawn _startMusicScript;
		_musicTime = time;
	};
	
	
	private ["_nearChars"];
	_nearChars = ((position player) nearObjects ["Man", 20]) - [player];
	
	{
		private ["_alreadyDancing"];
		_alreadyDancingSince = _x getVariable "BIS_IAmDancingHardSince";
		if (isnil "_alreadyDancingSince") then 
		{
			_alreadyDancingSince = -90;
		};
		
		if ((time - _alreadyDancingSince) >= 90) then 
		{
			_x doWatch player;
			_x setMimic "Smile";
			_x playMove (_animPool select (floor (random (count _animPool))));
			_x setVariable ["BIS_IAmDancingHardSince", time];
		};
		
		sleep 0.5;
	} 
	forEach _nearChars;
};

playMusic "";

true