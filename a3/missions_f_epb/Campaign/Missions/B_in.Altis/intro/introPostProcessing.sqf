"dynamicBlur" ppEffectEnable true; 
"dynamicBlur" ppEffectAdjust [10]; 
"dynamicBlur" ppEffectCommit 0; 


"dynamicBlur" ppEffectAdjust [1];
"dynamicBlur" ppEffectCommit 20;
Sleep 2;

"colorCorrections" ppEffectAdjust 	[1.0, 1.0, 0.0, 	[1.0, 1.0, 1.0, 0.0], 	[1.0, 1.0, 0.8, 0.1],	[0.3, 0.3, 0.3, -0.1]];
"colorCorrections" ppEffectCommit 6;
Sleep 2;

"dynamicBlur" ppEffectAdjust [3];
"dynamicBlur" ppEffectCommit 2;
Sleep 1;

"dynamicBlur" ppEffectAdjust [0.5];
"dynamicBlur" ppEffectCommit 3;
Sleep 1.5;

"dynamicBlur" ppEffectAdjust [3];
"dynamicBlur" ppEffectCommit 2;

"colorCorrections" ppEffectAdjust [1.0, 1.0, 0.0, [0.0, 0.0, 0.0, 0.0], [1.0, 1.0, 1.0, 0.5],[0.199, 0.587, 0.114, 0.0]];   
"colorCorrections" ppEffectCommit 5;
Sleep 0.5;

"dynamicBlur" ppEffectAdjust [1.5];
"dynamicBlur" ppEffectCommit 3;
Sleep 1;

"dynamicBlur" ppEffectAdjust [0.01];
"dynamicBlur" ppEffectCommit 5;
Sleep 8.5;

"dynamicBlur" ppEffectAdjust [4];
"dynamicBlur" ppEffectCommit 0.5;
Sleep 1.0;

"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 1;
Sleep 5;

"colorCorrections" ppEffectAdjust 	[1.0, 1.0, -0.1, 	[1.0, 1.0, 1.0, 0.0], 	[1.0, 1.0, 0.8, 0.1],	[0.3, 0.3, 0.3, -0.1]];
"colorCorrections" ppEffectCommit 3;
"dynamicBlur" ppEffectAdjust [1.5];
"dynamicBlur" ppEffectCommit 0.5;
Sleep 1.0;

// Apply color corrections
[] call BIS_fnc_camp_setPPeffect;

/*
"colorCorrections" ppEffectAdjust [1, 1.08, -0.06, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 1.0, 1.21], [0.09, 0.09, 0.09, 0.0]];
"colorCorrections" ppEffectCommit 1;
*/
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 5;
