/*
	Author: Jaroslav Kasny (Zozo)

	Description:
	Sets campaign's default PP effect depending on the time of the day

	Parameters:
	nothing

	Returns:
	none
*/

//if the day is still bright enough
if (daytime > 5.15 && daytime < 18) then
{
	//apply the postprocess
	["EastWind"] call BIS_fnc_setPPeffectTemplate;
	["Mission [%1]: Default PP effect applied", missionname] call BIS_fnc_LogFormat;
}
else
{
	["Mission [%1]: Default PP effect NOT applied - too dark for it", missionname] call BIS_fnc_LogFormat;
};



