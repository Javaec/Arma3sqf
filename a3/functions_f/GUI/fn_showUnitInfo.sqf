/*
	Author: Vladimir Hynek

	Description:
		Hides or shows weapon info.

	Parameter(s):
		_this select 0: BOOL - Show (true - show, false - hide)

	Returns:
		Bool
*/

{
	if((ctrlIDD _x) == 300) then
	{
		private ["_unitInfoDisplay","_show"];
		
		_unitInfoDisplay = _x;
		_show = [_this, 0, true, [true]] call BIS_fnc_param;

		{
			private ["_ctrl"];
			_ctrl = _unitInfoDisplay displayCtrl _x;
			
			if(_show) then
			{
				_ctrl ctrlSetFade 0;
			}
			else
			{
				_ctrl ctrlSetFade 1;
			};
			
			_ctrl ctrlCommit 0;
			
		} foreach ([(configfile >> "RscInGameUI" >> "RscUnitInfo"), 0] call bis_fnc_displaycontrols);
	};	
} foreach (uinamespace getvariable "IGUI_displays"); //RscUnitInfo can be present several times for some reason


//TODO: Stance Indicator (unable to obtain its display)
