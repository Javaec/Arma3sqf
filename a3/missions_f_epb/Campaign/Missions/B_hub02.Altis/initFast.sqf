#include "\A3\Missions_F_EPA\Campaign_shared\Hubs\initMissionFast.sqf"

//setup damaged Ifrit
if !(isNil "BIS_DamagedCar") then
{
	BIS_DamagedCar spawn
	{
		private["_v","_p"];

		_v = BIS_DamagedCar;

		waitUntil
		{
			sleep 0.1;

			_v enableSimulation false;

			!(simulationEnabled _v)
		};

		/*

		["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitReserveWheel","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitGlass7","HitGlass8","HitGlass9","HitGlass10","HitGlass11"]

		*/

		_v setDamage 0.75;

		{
			_v setHitPointDamage [_x, 1];
		}
		forEach ["HitLFWheel","HitRFWheel","HitRF2Wheel","HitGlass1","HitGlass3","HitGlass4","HitGlass5""HitGlass7","HitGlass9","HitGlass10","HitGlass11"];

		_p = getPosATL _v;
		_p set [2,-0.05];
		_v setPosATL _p;
	};
};