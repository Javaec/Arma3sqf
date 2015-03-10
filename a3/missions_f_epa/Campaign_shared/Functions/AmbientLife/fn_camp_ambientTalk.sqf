/*
	Author: Jiri Wainar

	Description:
	Handle ambient talk between soldiers on hubs and missions.

	Returns:
	-

	Example:
	[_shuffle:bool] call BIS_fnc_camp_ambientTalk;
*/

if !(isNil "BIS_fnc_camp_ambientTalk__runOnce") exitWith
{
	["System for ambient conversation is already running!"] call BIS_fnc_error;
};
BIS_fnc_camp_ambientTalk__runOnce = true;
BIS_fnc_camp_ambientTalk__paused = false;

private["_shuffle","_cfgAmbientTalk","_defined"];

_shuffle	 = [_this, 0, false, [true]] call BIS_fnc_param;

_cfgAmbientTalk  = ([missionName] call BIS_fnc_camp_getMissionDesc) >> "AmbientTalk";
_defined 	 = _cfgAmbientTalk call Bis_fnc_getCfgIsClass;

if !(_defined) exitWith
{
	["[x] Ambient talk definition not found."] call BIS_fnc_logFormat;

	BIS_fnc_camp_ambientTalk__active = false;
};

BIS_fnc_camp_ambientTalk__active = true;

/*--------------------------------------------------------------------------------------------------

	INITIALIZATION

--------------------------------------------------------------------------------------------------*/
//gather the information about ambient conversations
private["_class","_actors","_sentences","_cfgSentences","_actor","_sentencesXtra","_container","_distance","_playCount","_convData","_pool","_classes","_poi","_linked","_status","_skip"];

_classes = _cfgAmbientTalk call BIS_fnc_getCfgSubClasses;
_classes = _classes - ["Default"];

if (_shuffle) then
{
	_classes = _classes call BIS_fnc_arrayShuffle;
};


_pool = [];	//array of all conversation data

{
	if (true) then
	{
		_class = _x;

		//check for if conversation is linked to POI & if the POI is available
		_poi  = [_cfgAmbientTalk,_class,"poi"] call BIS_fnc_getCfgData;
		_skip = false;

		if (_poi != "") then
		{
			_linked	= [missionName] call BIS_fnc_camp_poiGetLinked;
			_status	= [_poi] call BIS_fnc_camp_poiGetStatus;

			if !(_poi in _linked) exitWith
			{
				//["POI [%1] is not linked to current hub [%2]!",_poi,missionName] call BIS_fnc_logFormat;

				_skip = true;
			};

			if (_status == 1) exitWith
			{
				//["POI [%1] was already completed!",_poi] call BIS_fnc_logFormat;

				_skip = true;
			};
		};

		if (_skip) exitWith {};

		_actors		= [];
		_convData 	= [];	//info about single conversation; stored in associative array
		_sentencesXtra  = [];

		_container	= [_cfgAmbientTalk,_class,"container"] call BIS_fnc_getCfgData;
		_distance	= [_cfgAmbientTalk,_class,"distance"] call BIS_fnc_getCfgData;
		_playCount	= [_cfgAmbientTalk,_class,"playCount"] call BIS_fnc_getCfgData;

		_cfgSentences 	= configfile >> "CfgSentences" >> _container >> _class >> "Sentences";
		_sentences 	= _cfgSentences call Bis_fnc_getCfgSubClasses;

		//store conversation & container class
		[_convData,"class",_class] call BIS_fnc_setToPairs;
		[_convData,"container",_container] call BIS_fnc_setToPairs;

		//get & store actors & sentences
		{
			_actor  = [_cfgSentences,_x,"actor"] call BIS_fnc_getCfgData;
			_actors = _actors - [_actor];
			_actors set [count _actors, _actor];

			_sentencesXtra set [count _sentencesXtra,[_actor,_x]];
		}
		forEach _sentences;

		[_convData,"actors",_actors] call BIS_fnc_setToPairs;
		[_convData,"sentences",_sentencesXtra] call BIS_fnc_setToPairs;

		//store additional params
		[_convData,"distance",_distance] call BIS_fnc_setToPairs;
		[_convData,"playCount",_playCount] call BIS_fnc_setToPairs;

		//store whole conversation settings into the pool
		_pool set [count _pool, _convData];
	};
}
forEach _classes;

BIS_fnc_camp_ambientTalk__pool = _pool;

/*--------------------------------------------------------------------------------------------------

	TRIGGER

--------------------------------------------------------------------------------------------------*/
private["_convData","_class","_container","_actors","_distance","_playCount","_kbTellHandle"];

BIS_fnc_camp_ambientTalk__playing = false;

while {count _pool > 0} do
{
	_convData = _pool select 0;

	_class 	   = [_convData,"class"] call BIS_fnc_getFromPairs;
	_container = [_convData,"container"] call BIS_fnc_getFromPairs;
	_actors    = [_convData,"actors"] call BIS_fnc_getFromPairs;
	_distance  = [_convData,"distance"] call BIS_fnc_getFromPairs;
	_playCount = [_convData,"playCount"] call BIS_fnc_getFromPairs;

	waitUntil
	{
		sleep 1;

		({player distance (missionNamespace getVariable [_x, objNull]) < _distance} count _actors > 0)

		&&

		!(BIS_fnc_camp_ambientTalk__paused)
	};

	//["[!] Ambient conversation started: %1", _class] call BIS_fnc_logFormat;
	BIS_fnc_camp_ambientTalk__playing = true;

	//play conversation
	_kbTellHandle = [_class,_container] spawn bis_fnc_kbTell;

	waitUntil
	{
		(scriptDone _kbTellHandle)
		||
		(BIS_fnc_camp_ambientTalk__paused)
		||
		({player distance (missionNamespace getVariable [_x, objNull]) > _distance * 1.2} count _actors > 0)
	};

	if !(scriptDone _kbTellHandle) then
	{
		[_class,_container] spawn bis_fnc_kbSkip;
	};

	//["[!] Ambient conversation ended: %1", _class] call BIS_fnc_logFormat;
	BIS_fnc_camp_ambientTalk__playing = false;

	//check for the POI and ev. reveal it
	private["_poi","_status"];

	_poi  = [_cfgAmbientTalk,_class,"poi"] call BIS_fnc_getCfgData;

	//conversation has POI and player is standing close when it finishes
	if ((_poi != "") && (scriptDone _kbTellHandle)) then
	{
		_status	= [_poi] call BIS_fnc_camp_poiGetStatus;

		if (_status == -1) then
		{
			[_poi,true,true] call BIS_fnc_camp_poiReveal;
		};
	};

	//update #play counter
	_playCount = _playCount - 1;
	[_convData,"playCount",_playCount] call BIS_fnc_setToPairs;

	//remove the conversation from the top of the heap
	_pool set [0, objNull];
	_pool = _pool - [objNull];

	//if count remains > 0, move the conversation to the end of the pool
	if (_playCount > 0) then
	{
		_pool set [count _pool, _convData];
	};

	BIS_fnc_camp_ambientTalk__pool = _pool;

	sleep (20 + random(20));
};

BIS_fnc_camp_ambientTalk__active = false;