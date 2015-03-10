/*
	Author: Karel Moricky

	Description:
	Set unit identity. To be used together with BIS_fnc_MP, because identity related commands are local.
	When executed on server, the identity will be JIP compatible.

	Parameter(s):
		0: OBJECT
		1 (Optional): STRING - face from CfgFaces
		2 (Optional): STRING - speaker from CfgVoice
		3 (Optional): NUMBER - speaker pitch (1 is unchanged pitch)
		4 (Optional): STRING - callsign

	Returns:
	BOOL
*/

_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
if (isnull _unit) exitwith {
	//--- Execute for all units with save identity
	{
		_x call bis_fnc_setIdentity;
	} foreach (missionnamespace getvariable ["bis_fnc_setIdentity_units",[]]);
};

_face = [_this,1,"",[""]] call bis_fnc_param;
_speaker = [_this,2,"",[""]] call bis_fnc_param;
_pitch = [_this,3,-1,[0]] call bis_fnc_param;
_namesound = [_this,4,"",[""]] call bis_fnc_param;

if (_face != "") then {_unit setface _face;};
if (_speaker != "") then {_unit setspeaker _speaker;};
if (_pitch >= 0) then {_unit setpitch _pitch;};
if (_namesound != "") then {_unit setnamesound _namesound;};

//--- Persistent call for JIP
if (isserver) then {
	if (isnil "bis_fnc_setIdentity_units") then {
		bis_fnc_setIdentity_units = [];
		[[],"bis_fnc_setIdentity",true,true] call bis_fnc_mp;
	};
	_unitID = count bis_fnc_setIdentity_units;
	{
		if (_unit == _this select 0) exitwith {_unitID = _foreachindex;};
	} foreach bis_fnc_setIdentity_units;

	bis_fnc_setIdentity_units set [_unitID,[_unit,_face,_speaker,_pitch,_namesound]];
	publicvariable "bis_fnc_setIdentity_units";
};

true