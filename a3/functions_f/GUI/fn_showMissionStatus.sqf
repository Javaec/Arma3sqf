/*
	Author: Karel Moricky

	Description:
	Show mission status with sectors, respawn tickets, etc.

	Parameter(s):
	None

	Returns:
	BOOL
*/

("RscMissionStatus" call bis_fnc_rscLayer) cutrsc ["RscMPProgress","plain"];
true