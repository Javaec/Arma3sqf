_curator = [_this,0,objnull,[objnull]] call bis_fnc_param;
_code = [_this,1,true,[{},true]] call bis_fnc_param;

if (typename _code == typename {}) then {
	_curator setvariable ["bis_fnc_curatorSystem_objectRegistered",_code,true];
} else {
	_code = _curator getvariable ["bis_fnc_curatorSystem_objectRegistered",{}];
};

_code