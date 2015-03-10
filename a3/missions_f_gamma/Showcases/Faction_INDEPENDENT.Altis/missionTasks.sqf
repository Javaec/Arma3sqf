case "BIS_Explore": 
{
	if (_taskState == "") then 
	{
		[
			player,
			_taskID,
			[
				localize "STR_A3_Faction_showcase_task_text",
				localize "STR_A3_Faction_showcase_task_title",
				""
			],
			nil,
			false
		] call BIS_fnc_taskCreate;
	} 
	else 
	{
		[_taskID, _this] call BIS_fnc_taskSetState;
	};
};