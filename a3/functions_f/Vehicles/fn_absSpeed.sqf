

//------------------
// Author: Philipp Pilhofer (raedor)
// Purpose: This function returns the absolute speed of a vehicle in km/h
// Arguments: vehicle
// Return: float
//
// Revision History:
// 26/11/06 0.1 - First cut
//------------------


private["_vel"];
_vel = velocity _this;
3.6*sqrt((_vel select 0)^2 + (_vel select 1)^2 + (_vel select 2)^2)