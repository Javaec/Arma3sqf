// _this select 0		pointer to model
// _this select 1		animation of the hatch

_count = (_this select 0) animationPhase (_this select 1);
_stepDif = 0.025;

// Until hatch is closed, move the hatch by increasing _stepDif - simulates acceleration as the hatch falls down
while {_count > 0} do
{
	(_this select 0) animate [(_this select 1), _count];
	sleep 0.04;
	_count = _count - _stepDif;
	_stepDif = _stepDif + 0.01;
};

// Align the hatch to "closed" and let it bounce open a bit and then back to closed again (with _stepDif going from 0.035 to -0.035)
_count = 0;
_stepDif = 0.035;
while {_stepDif > -0.035} do
{
	(_this select 0) animate [(_this select 1), _count];
	sleep 0.04;
	_count = _count + _stepDif;
	_stepDif = _stepDif - 0.02;
};
(_this select 0) animate [(_this select 1), 0];