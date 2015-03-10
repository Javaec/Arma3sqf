// Attempt to open locked door without an animated doorhandle.

// _this select 0		object pointer
// _this select 1		locked door animation

sleep 0.1;
(_this select 0) animate [(_this select 1), 1];
sleep 0.1;
(_this select 0) animate [(_this select 1), 0];
sleep 0.1;
(_this select 0) animate [(_this select 1), 1];
sleep 0.1;
(_this select 0) animate [(_this select 1), 0];
sleep 0.1;
(_this select 0) animate [(_this select 1), 1];
sleep 0.1;
(_this select 0) animate [(_this select 1), 0];