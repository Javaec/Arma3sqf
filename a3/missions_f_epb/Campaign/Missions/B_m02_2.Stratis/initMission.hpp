//Disable sound and music
0 fadeSound 0;
0 fadeMusic 0;

//Disable radio, protocol and environment
enableRadio false;
enableSentences false;
enableEnvironment false;

//Fade screen to black
["BIS_blackStart", false] call BIS_fnc_blackOut;

//Delay
sleep 5;

//Enable sound and music
5 fadeSound 0.3;
5 fadeMusic 0.25;

//Enable radio, protocol and environment
enableRadio true;
enableSentences true;
enableEnvironment true;

//Fade screen from black
["BIS_blackStart", true] call BIS_fnc_blackIn;
