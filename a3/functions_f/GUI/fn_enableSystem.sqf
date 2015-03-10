private ["_timesActivated"];
_timesActivated = _this select 0;

private ["_delayMain", "_delay"];
_delayMain = 5 * 60;
_delay =  random ((60 - (2.5 * _timesActivated)) * 60);

sleep (_delayMain + _delay);

2 cutRsc ["SplashBohemia", "PLAIN"];
sleep 4;

2 cutRsc ["SplashArma3", "PLAIN"];
playSound ["Hint",true];
sleep 4;

2 cutRsc ["SplashCopyright", "PLAIN"];
sleep 4;

private ["_effectPower"];
_effectPower = 0.1 + (_timesActivated / 25);

"wetDistortion" ppEffectEnable true;
"wetDistortion" ppEffectAdjust [0.5, 0, 0, 4.1, 3.7, 2.5, 1.85, 0.0051, 0.0051, 0.0051, 0.0051, 0.5, 0.3, 10, 6.0];
"wetDistortion" ppEffectCommit 0;

"wetDistortion" ppEffectAdjust [0.5, _effectPower, _effectPower, 4.1, 3.7, 2.5, 1.85, 0.0051, 0.0051, 0.0051, 0.0051, 0.5, 0.3, 10, 6.0];
"wetDistortion" ppEffectCommit 5;
playSound "RadioAmbient7";

true