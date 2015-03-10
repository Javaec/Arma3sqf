/*
	Author: Karel Moricky

	Description:
	Register code to be executed after mission load.
	Replaced by "loaded" mission event handler, function now exists only because of backward compatibility

	Parameter(s):
	_this:
		CODE
		NUMBER - remove code of given index

	Returns:
	NUMBER - index of onLoad code
*/

private ["_input","_index"];

_input = _this;
_index = switch (typename _input) do {
	case (typename {}): {
		addmissioneventhandler ["loaded",_input]
	};
	case (typename 00): {
		removemissioneventhandler ["loaded",_input];
		_input
	};
	default {-1}
};

_index