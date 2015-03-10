if (BIS_FFDetected) exitWith {};

case "BIS_meetJournalist":
{
	private["_op"];

	_op = [_this,0,"",[""]] call bis_fnc_param;
	//["%1 | %2",_taskID,_op] call BIS_fnc_logFormat;

	if !(_taskExists) then
	{
		if (_op == "CANCELED" || _op == "FAILED") exitWith {};

		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_C_EA_taskBIS_meetJournalist_desc",
				localize "STR_A3_C_EA_taskBIS_meetJournalist_title",
				localize "STR_A3_C_EA_taskBIS_meetJournalist_mrkr"
			],
			[BIS_meetingPoint,true],
			true,10
		]
		call BIS_fnc_taskCreate;
	};

	if (_op == "") exitWith {};

	if (_op == "CURRENT") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState};
};

case "BIS_getCar":
{
	private["_op"];

	_op = [_this,0,"",[""]] call bis_fnc_param;
	//["%1 | %2",_taskID,_op] call BIS_fnc_logFormat;

	if !(_taskExists) then
	{
		if (_op == "CANCELED" || _op == "FAILED") exitWith {};

		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_C_EA_taskBIS_getCar_desc",
				localize "STR_A3_C_EA_taskBIS_getCar_title",
				localize "STR_A3_C_EA_taskBIS_getCar_mrkr"
			],
			objNull,
			false,9
		]
		call BIS_fnc_taskCreate;
	};

	if (_op == "") exitWith {};

	if (_op == "CURRENT") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState};
};

case "BIS_refuel":
{
	private["_op"];

	_op = [_this,0,"",[""]] call bis_fnc_param;
	//["%1 | %2",_taskID,_op] call BIS_fnc_logFormat;

	if !(_taskExists) then
	{
		if (_op == "CANCELED" || _op == "FAILED") exitWith {};

		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_C_EA_taskBIS_refuel_desc",
				localize "STR_A3_C_EA_taskBIS_refuel_title",
				localize "STR_A3_C_EA_taskBIS_refuel_mrkr"
			],
			[BIS_gasStation,true],
			true,8
		]
		call BIS_fnc_taskCreate;
	};

	if (_op == "") exitWith {};

	if (_op == "CURRENT") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState};
};

case "BIS_escort":
{
	private["_op"];

	_op = [_this,0,"",[""]] call bis_fnc_param;
	//["%1 | %2",_taskID,_op] call BIS_fnc_logFormat;

	if !(_taskExists) then
	{
		if (_op == "CANCELED" || _op == "FAILED") exitWith {};

		[
			BIS_inf,
			_taskID,
			[
				localize "STR_A3_C_EA_taskBIS_escort_desc",
				localize "STR_A3_C_EA_taskBIS_escort_title",
				localize "STR_A3_C_EA_taskBIS_escort_mrkr"
			],
			[BIS_destinationPoint,true],
			false,7
		]
		call BIS_fnc_taskCreate;
	};

	if (_op == "") exitWith {};

	if (_op == "CURRENT") then {_taskID call BIS_fnc_taskSetCurrent} else {[_taskID, _this] call BIS_fnc_taskSetState};
};