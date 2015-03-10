// Open a set of sliding doors.

// _this select 0		object pointer
// _this select 1		doorA animation
// _this select 2		doorB animation

(_this select 0) animate [(_this select 1), 1];
(_this select 0) animate [(_this select 2), 1];