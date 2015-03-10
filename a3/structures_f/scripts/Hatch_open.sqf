// _this select 0		pointer to model
// _this select 1		animation of the hatch

_count = (_this select 0) animationPhase (_this select 1);
_stepDif = 0.08;

// open the hatch with decreasing speed
while {_count < 1} do
{
	(_this select 0) animate [(_this select 1), _count];
	sleep 0.04;
	_count = _count + _stepDif;
	_stepDif = _stepDif - 0.0016;

	// Prevent _stepDif from becoming too small so the hatch would never fully open
	if (_stepDif < 0.01) then
	{
		_stepDif = 0.01;
	};
};
(_this select 0) animate [(_this select 1), 1];