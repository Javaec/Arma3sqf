/*
_error =
[
	ID_INVESTIGATE_COMBAT_SITE1,
	ID_INVESTIGATE_COMBAT_SITE2,
	ID_INVESTIGATE_COMBAT_SITE3

] call BIS_taskSetNext;
*/
BIS_taskSetNext = {
	private["_next"];

	_next = "";

	//find available task
	{
		if !(_x call Bis_fnc_taskCompleted) exitwith
		{
			["Next task selected >> %1",_x] call Bis_debugLogF;

			_next = _x;
		};
	}
	forEach _this;

	//no available task found
	if (_next == "") exitwith
	{
		["No available task found!"] call Bis_debugLog;

		1
	};

	//select next available task
	_next call Bis_fnc_taskSetCurrent;

	0
};


//[player,["SETUP:GET_TO_POSITION","SETUP"],["Scuba dive to shore. Stay underwater to avoid compromising your presence.","Get on Shore","Shore"]]
BIS_taskStoreParams = {
	private["_taskId","_key"];

	_taskId = _this select 1;

	if (typeName _taskId == "ARRAY") then
	{
		_taskId = _taskId select 0;
	};

	_key = format["TASK_%1",_taskId];

	player setVariable [_key,_this];
};

//["SETUP:GET_TO_POSITION","DESCRIPTION"]
BIS_taskGetParams = {
	private["_taskId","_getType","_key","_params","_return"];

	_taskId 	= [_this,0] call BIS_fnc_param;
	_getType 	= [_this,1,"DESCRIPTION"] call BIS_fnc_param;	//"DESCRIPTION","ALL","PARENT"

	_key = format["TASK_%1",_taskId];
	_params = player getVariable [_key,[]];

	if (count _params == 0) exitWith {["'BIS_taskGetParams' failed, stored params were not found!"] call BIS_debugLog};

	switch (_getType) do
	{
		case "DESCRIPTION":
		{
			_return = _params select 2;
		};
		case "ALL":
		{
			_return = _params;
		};
		case "PARENT":
		{
			_return = _params select 1;

			if (typeName _return == "ARRAY") then
			{
				if (count _return > 1) then
				{
					_return = _return select 1;
				}
				else
				{
					_return = _return select 0;
				};
			};
		};
		default
		{
			_return = _params;
		};
	};

	_return
};

//[player,["SETUP:GET_TO_POSITION","SETUP"],["Scuba dive to shore. Stay underwater to avoid compromising your presence.","Get on Shore","Shore"]]
BIS_taskCreate = {
	//store all task params
	_this call BIS_taskStoreParams;

	["NEW TASK",_this] call BIS_debugLog;

	//send all params to 'BIS_fnc_taskCreate' function
	_this call BIS_fnc_taskCreate;
};

//["SETUP:GET_TO_POSITION",[BIS_OBJ_Emerge_A,BIS_OBJ_Emerge_B,BIS_OBJ_Emerge_C,BIS_OBJ_Emerge_D],"CENTER"] call BIS_taskAutoSelectLocation;
BIS_taskAutoSelectLocation = {

	_this spawn {
		private["_taskId","_locations","_taskDesc","_logic","_storedLoc","_storedDist","_distance","_screen","_selected","_selectedLast","_taskGuiTitle","_taskGuiTitleId"];

		_taskId 	= [_this,0] call BIS_fnc_param;
		_locations 	= [_this,1,[]] call BIS_fnc_param;
		_logic		= [_this,2,"CENTER"] call BIS_fnc_param;

		_taskDesc	= [_taskId,"DESCRIPTION"] call BIS_taskGetParams;

		if (count _locations == 0) exitWith {};

		while {(_taskId call BIS_fnc_taskState) in ["ASSIGNED","CREATED"]} do
		{
			waitUntil{(_taskId call BIS_fnc_taskState) != "CREATED"};

			if ((_taskId call BIS_fnc_taskState) == "ASSIGNED") then
			{
				_storedLoc = _locations select 0;
				_storedDist = player distance _storedLoc;

				//find closest location
				{
					_distance = player distance _x;

					if (_distance < _storedDist) then
					{
						_storedLoc = _x;
						_storedDist = _distance;
					};

				} forEach _locations;

				_selected = _storedLoc;

				_storedLoc = nil;
				_storedDist = nil;

				//find closest to screen center
				if (_logic == "CENTER") then
				{
					{
						_screen = worldToScreen (getPos _x);

						//location is on-screen
						if (count _screen == 2) then
						{
							_screen = _screen + [0];
							_distance = _screen distance [0.5,0.5,0];

							if (isNil "_storedLoc") then
							{
								_storedLoc = _x;
								_storedDist = _distance;
							}
							else
							{
								if (_distance < _storedDist) then
								{
									_storedLoc = _x;
									_storedDist = _distance;
								};
							};
						};

					} forEach _locations;

					if !(isNil "_storedLoc") then
					{
						_selected = _storedLoc;
					};
				};

				//["_selected",_selected] call BIS_debugLog;

				if !(isNil "_selected") then
				{
					if (_selectedLast != _selected) then
					{
						[_taskId,getPosATL _selected] call BIS_fnc_taskSetDestination;

						//update task DESCRIPTION
						_taskGuiTitle = _taskDesc select 2;
						_taskGuiTitleId = ["A","B","C","D","E","F","G","H","I","J","K"] select (_locations find _selected);
						_taskGuiTitle = format["%1 (%2)",_taskGuiTitle,_taskGuiTitleId];

						//["Gui Title",_taskGuiTitle] call BIS_debugLog;

						[_taskId,[_taskDesc select 0,_taskDesc select 1,_taskGuiTitle]] call BIS_fnc_taskSetDescription;
					};

					_selectedLast = _selected;
				};

				sleep 0.1;
			};
		};

		["[BIS_taskAutoSelectLocation] Loop ended: Task '%1' is no longer 'ASSIGNED' or 'CREATED'.",_taskId] call BIS_debugLogF;
	};
};