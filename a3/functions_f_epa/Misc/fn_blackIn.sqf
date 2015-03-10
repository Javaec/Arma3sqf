/*
	Author: Jiri Wainar

	Description:
	Unregister a black screen. When none other black screen is registered, fade it out.

	Parameter(s):
	0: _id:string - black screen id used for registration
	1: _smooth:bool (optional, default: true) - should fade smoothly?

	Remarks:
	* Screen id is case sensitive.
	* If a function requires a black screen, use it's name as an id.

	Returns:
	nil

	Example:
	["BIS_ScreenSetup"] call BIS_fnc_blackIn;
*/

if (isNil "BIS_fnc_blackIn_fading") then {BIS_fnc_blackIn_fading = false};
if (isNil "BIS_fnc_blackIn_completed") then {BIS_fnc_blackIn_completed = false};
if (isNil "BIS_fnc_blackOut_fading") then {BIS_fnc_blackOut_fading = false};
if (isNil "BIS_fnc_blackOut_completed") then {BIS_fnc_blackOut_completed = false};

if (missionNamespace getVariable ["BIS_fnc_blackOut_disabled",false]) exitWith
{
	BIS_fnc_blackIn_completed = true;
	BIS_fnc_blackIn_fading = true;
	BIS_fnc_blackOut_ids = [];
};

private ["_id","_smooth","_fadeSpeed","_rsc"];

_id        = [_this,0,"",[""]] call bis_fnc_param;
_smooth    = [_this,1,true,[true]] call bis_fnc_param;
_fadeSpeed = [_this,2,2,[123]] call bis_fnc_param;

_id        = toLower _id;
_rsc       = "BIS_fnc_blackOut" call BIS_fnc_rscLayer;

if (isNil "BIS_fnc_blackOut_ids") then
{
	BIS_fnc_blackOut_ids = [];
};

if !(_id in BIS_fnc_blackOut_ids) exitWith
{
	["[BlackScreen][%1]: '%2' did not started yet!",round time,_id] call bis_fnc_error;
};

//remove the id to to pool of ids
BIS_fnc_blackOut_ids = BIS_fnc_blackOut_ids - [_id];

//do the fade in
[_id,_smooth,_fadeSpeed,_rsc] spawn
{
	//surpress the debuglog output
	private["_fnc_log_disable"];_fnc_log_disable = true;

	private["_id","_smooth","_fadeSpeed","_rsc"];

	_id 	   = _this select 0;
	_smooth    = _this select 1;
	_fadeSpeed = _this select 2;
	_rsc	   = _this select 3;

	["[BlackScreen][%1]: '%2' un-registered.",round time,_id] call bis_fnc_logFormat;

	if (count BIS_fnc_blackOut_ids == 0) then
	{
		if !(_smooth) then
		{
			_rsc cutText ["","PLAIN",10e10];

			//return sound volume to 100%
			if (soundVolume < 1) then
			{
				0 fadeSound 1;
			};
			enableEnvironment true;

			BIS_fnc_blackIn_fading = false;
			BIS_fnc_blackIn_completed = true;
			BIS_fnc_blackOut_fading = false;
			BIS_fnc_blackOut_completed = false;

			["[BlackScreen][%1]: '%2' was instantly hidden.",round time,_id] call bis_fnc_logFormat;
		}
		else
		{
			["[BlackScreen][%1]: '%2' ending...",round time,_id] call bis_fnc_logFormat;

			_rsc cutText ["","BLACK IN",_fadeSpeed];

			enableEnvironment true;
			enableRadio true;
			enableSentences true;

			if (soundVolume < 1) then
			{
				_fadeSpeed fadeSound 1;
			};

			BIS_fnc_blackIn_fading = true;
			BIS_fnc_blackIn_completed = false;
			BIS_fnc_blackOut_fading = false;
			BIS_fnc_blackOut_completed = false;

			sleep _fadeSpeed;

			if (BIS_fnc_blackIn_fading) then
			{
				BIS_fnc_blackIn_fading = false;
				BIS_fnc_blackIn_completed = true;
				BIS_fnc_blackOut_fading = false;
				BIS_fnc_blackOut_completed = false;
			};

			["[BlackScreen][%1]: '%2' is fully hidden!",round time,_id] call bis_fnc_logFormat;
		};
	};
};