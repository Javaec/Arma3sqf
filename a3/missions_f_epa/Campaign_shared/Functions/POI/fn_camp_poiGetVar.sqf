/*
	Author: Jiri Wainar

	Description:
	Return POI status global variable in string.

	Example:
	"POI_Checkpoint_01" call BIS_fnc_camp_poiGetVar;
*/

(format["BIS_PER_%1_status",_this])