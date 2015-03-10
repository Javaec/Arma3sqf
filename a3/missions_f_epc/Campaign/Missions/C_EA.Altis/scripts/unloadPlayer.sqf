if (vehicle player == BIS_introCar) then
{
	//placeholder conversation "We arrived.."
	"01_PlayerArrived" call BIS_fnc_missionConversations;

	//move player out of the vehicle
	moveOut player;

	sleep 2;
};