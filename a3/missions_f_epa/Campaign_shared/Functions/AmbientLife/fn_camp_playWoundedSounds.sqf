scriptName "a3\Missions_F_EPA\Campaign_shared\Functions\fn_camp_playWoundedSounds.sqf";
/*******************************************************************************
	Author: zozo

	Description:
	- Plays random sounds of a wounded soldier
	- there are currently 3 different sets of voices
	- script is automatically stopped if unit is not alive
	- to STOP the sound, use command terminate <script handle> which this function returns

	Parameter(s):
	_this select 0: OBJECT - who the sound will be playing from
	_this select 1 (Optional): INT - type of the voice (actor)

	Returns:
	script handle

*******************************************************************************/

private [ "_type", "_spawnedscript", "_sounds", "_selectedSoundArray", "_who" ];
_who = [_this, 0, player, [objNull]] call BIS_fnc_param;
_type = [_this, 1, 0, [ 0 ]] call BIS_fnc_param;
_spawnedscript = -1;

_spawnedscript = [_who, _type] spawn
{
	private [ "_arraySize", "_lastplayed", "_randomIndex", "_type", "_who", "_selectedSoundArray" ];
	_who = _this select 0;
	_type = _this select 1;
	_selectedSoundArray = -1;

	_sounds = 	[
					[ "WoundedGuyA_01","WoundedGuyA_02","WoundedGuyA_03","WoundedGuyA_04","WoundedGuyA_05","WoundedGuyA_06","WoundedGuyA_07","WoundedGuyA_08" ],
					[ "WoundedGuyB_01","WoundedGuyB_02","WoundedGuyB_03","WoundedGuyB_04","WoundedGuyB_05","WoundedGuyB_06","WoundedGuyB_07","WoundedGuyB_08" ],
					[ "WoundedGuyC_01","WoundedGuyC_02","WoundedGuyC_03","WoundedGuyC_04","WoundedGuyC_05"]
				];

	if(_type < count _sounds) then
	{

		_selectedSoundArray = _sounds select _type;

		_arraySize = (count _selectedSoundArray);
		_lastplayed = 0;
		_randomIndex = 0;

		while {true} do
		{
			if !(alive _who) exitWith {};
			while{_randomIndex == _lastplayed} do
			{
				_randomIndex = (floor random _arraysize)
			};
			_lastplayed = _randomIndex;
			//["_randomIndex:%1", _randomIndex ] call BIS_fnc_LogFormat;

			_who say3D (_selectedSoundArray select _randomIndex);
			sleep (2 + random 4);
		};
	}
	else
	{
		[ "BIS_fnc_playWoundedSounds: This type doesn't exist. Use 0 - %1", (count _sounds) - 1 ] call BIS_fnc_LogFormat;
		_spawnedscript = -1;
	};

	false
};

_spawnedscript
