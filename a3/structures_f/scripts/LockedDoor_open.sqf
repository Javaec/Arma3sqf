// Attempt to open locked door with an animated doorhandle.

// _this select 0		object pointer
// _this select 1		doorhandle up->down animation
// _this select 2		locked door animation

(_this select 0) animate [(_this select 1), 1];
sleep 0.1;
(_this select 0) animate [(_this select 2), 1];
sleep 0.1;
(_this select 0) animate [(_this select 2), 0];
sleep 0.1;
(_this select 0) animate [(_this select 2), 1];
sleep 0.1;
(_this select 0) animate [(_this select 1), 0];
(_this select 0) animate [(_this select 2), 0];
sleep 0.1;
(_this select 0) animate [(_this select 2), 1];
sleep 0.1;
(_this select 0) animate [(_this select 2), 0];