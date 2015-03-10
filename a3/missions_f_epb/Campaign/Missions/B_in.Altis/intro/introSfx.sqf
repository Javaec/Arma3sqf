//Sound
playSound "b_in_intro";
5 fadeSound 1;

sleep 2;

//Fade screen from black
["BIS_blackStart", true] call BIS_fnc_blackIn;

sleep 2.325;

//Music
playMusic "EventTrack04a_F_EPB";
5 fadeMusic 0.5;

sleep 35;

//Play radio noise
"BIS_radioBabble" spawn BIS_fnc_missionConversations;

waitUntil { !isNil { BIS_introSceneFinished } };

//Enable radio, protocol and environment
enableRadio true;
enableSentences true;
enableEnvironment true;

//Music
playMusic "EventTrack04_F_EPB";
0 fadeMusic 0;
5 fadeMusic 0.25;
