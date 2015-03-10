// Close a set of sliding doors.

// _this select 0		object pointer
// _this select 1		doorA animation
// _this select 2		doorB animation

(_this select 0) animate [(_this select 1), 0];
(_this select 0) animate [(_this select 2), 0];