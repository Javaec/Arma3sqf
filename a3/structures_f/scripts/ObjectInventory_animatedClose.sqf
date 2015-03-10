// Close a lockable drawer with a key.

// _this select 0		object pointer
// _this select 1		array of animations and their animation values

_counter = ((_this select 0) getVariable ["BIS_accessCounter", 0]);

if(_counter < 1) then
{
	// this should not happen (inventory being closed without first being accessed)
	_counter = 0;
}
else
{
	_counter = _counter - 1;

	if(_counter < 1) then
	{
		{
			(_this select 0) animate [(_x select 0), (_x select 1)];
		}
		forEach (_this select 1);
	};
};

(_this select 0) setVariable ["BIS_accessCounter", _counter, true];