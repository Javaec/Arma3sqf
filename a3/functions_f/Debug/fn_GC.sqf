/*
	Author: Joris-Jan van 't Land & Karel Moricky

	Description:
	Sends an entity to the garbage collection queue.

	Parameter(s):
	_this select 0: the entity
	
	Returns:
	Success flag (Boolean).
*/

private ["_object", "_queue", "_timeToDie"];
_object = [[_this]] call bis_fnc_param;

if (isnil {bis_functions_mainscope getvariable "queue"}) exitwith {
	bis_fnc_initGC = [] call bis_fnc_GCInit;
	_this spawn {
		waituntil {!isnil {bis_functions_mainscope getvariable "queue"}};
		_this call bis_fnc_GC;
	};
};

_queue = bis_functions_mainscope getVariable "queue";

//--- Multiple Items
if ((typeName _object) == (typename [])) exitwith {
	{
		_x call bis_fnc_GC;
	} foreach _object;
	true
};

switch (typeName _object) do
{
	//--- Object
	case (typeName objNull):
	{
		if (alive _object) then
		{
			_timeToDie = time + 30;
		}
		else
		{
			_timeToDie = time + 60;
		};
	};

	//--- Group
	case (typeName grpNull):
	{
		_timeToDie = time + 60;
	};

	//--- Everything else
	default
	{
		_timeToDie = time;
	};
};

_queue = _queue + [[_object, _timeToDie]];
bis_functions_mainscope setVariable ["queue", _queue];

["%1 %2 marked for deletion",typename _object,_object] call bis_fnc_logFormat;

true