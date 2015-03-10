/*%FSM<COMPILE "C:\BIS\fsmeditor\missionTask.cfg, BIS_fnc_basicTask">*/
/*%FSM<HEAD>*/
/*
item0[] = {"ATTACK",0,250,-125.000000,-125.000000,-25.000000,-75.000000,0.000000,"ATTACK"};
item1[] = {"New",4,218,0.000000,-125.000000,100.000000,-75.000000,0.000000,"New"};
item2[] = {"Existing",4,218,0.000000,-50.000000,100.000000,0.000000,0.000000,"Existing"};
item3[] = {"Add_a_new_task",2,250,125.000000,-125.000000,225.000000,-75.000000,0.000000,"Add a new task"};
item4[] = {"Change_task_stat",2,4346,125.000000,-50.000000,225.000000,0.000000,0.000000,"Change" \n "task state"};
item5[] = {"Task_ID___defined",-1,250,-125.000000,-300.000000,-25.000000,-150.000000,0.000000,"Task ID" \n "" \n "(defined" \n "by state name)"};
item6[] = {"Condition_and_Code",-1,250,0.000000,-300.000000,225.000000,-150.000000,0.000000,"Condition and Code" \n "" \n "Pre-set variables:" \n "" \n "_task:" \n "   Task ID" \n "" \n "_taskState:" \n "   Current task state." \n "   Empty string when task doesn't exist."};
version=1;
class LayoutItems
{
	class Item5
	{
		class ItemInfo
		{
			FontFace="Arial";
			FontHeight=8;
			lStyle=1;
		};
	};
	class Item6
	{
		class ItemInfo
		{
			FontFace="Arial";
			FontHeight=8;
			lStyle=1;
			Align=0;
		};
	};
};
link0[] = {0,1};
link1[] = {0,2};
link2[] = {1,3};
link3[] = {2,4};
globals[] = {25.000000,1,0,0,16777215,640,480,1,9,6316128,1,-190.499237,297.867096,129.645691,-343.086792,584,623,1};
window[] = {0,-1,-1,-1,-1,993,225,1313,225,1,602};
*//*%FSM</HEAD>*/
private ["_fsmMode","_fsmId","_params","_fsmModes","_task","_taskState"];
_fsmMode = [_this,0,"",[""]] call bis_fnc_param;
_fsmId = [_this,1,0,[0]] call bis_fnc_param;
_params = [_this,2,[],[[]]] call bis_fnc_param;
_fsmModes = [_fsmMode];
while {count _fsmModes > 0} do {
    switch (_fsmModes select 0) do
    {
        /*%FSM<STATE "ATTACK">*/
        case "ATTACK":
        {
            _task = "ATTACK" + "_" + str _fsmId;
            _taskState = if (_task call bis_fnc_taskExists) then {_task call bis_fnc_taskstate} else {""};
            _fsmModes = _fsmModes - ["ATTACK"];
            /*%FSM<STATEINIT>*/
            /*%FSM</STATEINIT>*/
            switch true do {
                /*%FSM<LINK "Existing">*/
case (call {/*%FSM<CONDITION>*/
_taskState in ["Assigned","Created"]
/*%FSM</CONDITION>*/}): {
                    _fsmModes = _fsmModes + ["STATE_Change_task_stat"];
                };
                /*%FSM</LINK>*/
                /*%FSM<LINK "New">*/
case (call {/*%FSM<CONDITION>*/
_taskState == ""
/*%FSM</CONDITION>*/}): {
                    _fsmModes = _fsmModes + ["STATE_Add_a_new_task"];
                };
                /*%FSM</LINK>*/
            };
        };
        /*%FSM</STATE>*/
        /*%FSM<STATE "Add_a_new_task">*/
        case "STATE_Add_a_new_task":
        {
            _fsmModes = _fsmModes - ["STATE_Add_a_new_task"];
            /*%FSM<STATEINIT>*/
            private ["_pos","_name","_current"];
            _pos = [_params,0,markerpos "BIS_attack"] call bis_fnc_param;
            _name = [_params,1,"the location"] call bis_fnc_param;
            _current = [_params,2,true,[true]] call bis_fnc_param;
            _pos = _pos call bis_fnc_position;

            [
            	player,
            	_task,
            	[
            		"Attack the location and neutralize all enemies.",
            		format ["Attack %1",_name],
            		format ["Attack %1",_name]
            	],
            	if (_pos distance [0,0,0] > 0) then {_pos} else {nil},
            	_current
            ] call bis_fnc_taskCreate;
            /*%FSM</STATEINIT>*/
            switch true do {
            };
        };
        /*%FSM</STATE>*/
        /*%FSM<STATE "Change_task_stat">*/
        case "STATE_Change_task_stat":
        {
            _fsmModes = _fsmModes - ["STATE_Change_task_stat"];
            /*%FSM<STATEINIT>*/
            private ["_state"];
            _state = [_params,0,"succeeded",[""]] call bis_fnc_param;

            [_task,_state] call bis_fnc_taskSetState;
            /*%FSM</STATEINIT>*/
            switch true do {
            };
        };
        /*%FSM</STATE>*/
        default {_fsmModes = []; ["Could not find task '%1'",_fsmMode] call bis_fnc_error;};
    };
};/*%FSM</COMPILE>*/