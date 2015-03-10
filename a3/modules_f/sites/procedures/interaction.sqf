_trg1 = createTrigger ["EmptyDetector", position _this];
_trg1 setVariable ["site", _this, TRUE];

_trg2 = createTrigger ["EmptyDetector", position _this];
_trg3 = createTrigger ["EmptyDetector", position _this];
_trg4 = createTrigger ["EmptyDetector", position _this];
{_x setVariable ["site", _this, TRUE]} forEach [_trg2, _trg3, _trg4];

_this setVariable ["visitedTrg", _trg1, TRUE];
_this setVariable ["ownedTrgs", [_trg2, _trg3, _trg4], TRUE];