//Parameters
private ["_trigger"];
_trigger = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

//Loop
while { alive player } do {
	switch (true) do {
		case (leader group player == BIS_leadPlayer) : 	{ _trigger setPos position BIS_leadPlayer; };
		case DEFAULT 					{ _trigger setPos position player; };
	};
	sleep 0.1;
};
