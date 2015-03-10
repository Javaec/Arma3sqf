
/*******************************************************************************
 *
 *	version: 	1.0
 *	name:
 *	description:	setup talking formations
 *	author:		zozo
 *	parameters:	described bellow	
 *	 
 ******************************************************************************/  
private["_razorParticipants","_sceneInitiator","_mainCharacter","_mode","_debugmode", "_shift"];

_razorParticipants 	= _this select 0;	//initiators group
_sceneInitiator 	= _this select 1;	//who talk
_mainCharacter		= _this select 2;	//who talk to
_mode			= _this select 3;	//formation "LINE", "CIRCLE", "HALFCIRCLE"	
_debugmode		= _this select 4;	//show markers?
_shift			= _this select 5;	//angle offset 

if(isNil("_shift")) then {_shift = 0;};


private["_UnitsInGroup", "_angle", "_distance", "_offset", "_newPos"];
_newPos = [];
switch (_mode) do
{
	case "LINE":
	{
		_UnitsInGroup = (count _razorParticipants)-1;
		_angle = 90;
		_distance = 1.5;
		_offset = 180;
		

		while{_UnitsInGroup >= 0} do 
		{
			if!((_razorParticipants select _UnitsInGroup) == _sceneInitiator) then 
			{
				_who2 = _razorParticipants select _UnitsInGroup;
				if((alive _who2) && (canStand _who2)) then
				{
					 
					Sleep 0.5;
					_newPos = [_angle, _distance, _sceneInitiator, _who2] call BIS_fnc_sceneGetPositionByAngle;
					_who2 setpos [_newPos select 0, _newPos select 1, 0];
					_eye = ((getdir _mainCharacter) - 180);
					_who2 setdir _eye;
					_who2 doWatch (getpos _mainCharacter);
					//_who2 lookAt _mainCharacter;
					if(_debugmode == 1) then
					{
						_marker = createMarker[str _who2, [_newPos select 0, _newPos select 1, 0]];
						_marker setMarkerShape "ICON";
						(str _who2) setMarkerType "Arrow";
						(str _who2) setMarkerDir _eye;
						(str _who2) setMarkerText (str _who2) + "Uhel: " + str(_eye);
					};
					Sleep 0.01;
					_who2 stop true;
				};
				_distance = _distance + (_distance/(_UnitsInGroup+1));
				_angle = _angle + _offset;
			};
			_UnitsInGroup = _UnitsInGroup - 1;
			_newPos = [];
		};
	};
	case "CIRCLE":
	{
		_UnitsInGroup = (count _razorParticipants)-1;
		_angle = (getdir _mainCharacter) - 180;
		_distance = 2.5;
		_offset = 360 /(_UnitsInGroup + 1);
		
		
		
		while{_UnitsInGroup >= 0} do 
		{
			_who2 = _razorParticipants select _UnitsInGroup;
			if((alive _who2) && (canStand _who2)) then
			{
				_osaX = 2;
				_osaZ = 2;
				_newPos = _newPos + [(getpos _mainCharacter select 0) + (_osaX * cos(_angle) - _osaZ * sin(_angle))];
				_newPos = _newPos + [(getpos _mainCharacter select 1) + (_osaX * sin(_angle) + _osaZ * cos(_angle))];
				_eye = 225 - _angle;
				
				_who2 setpos [_newPos select 0, _newPos select 1, 0];
				_who2 setdir _eye;
				if(!isNil"BIS_debugModules") then
				{
					textLogFormat["%1 setpos %2,%3 uhel %4",_who2, _newPos select 0, _newPos select 1, _eye];
				};
				if(_debugmode == 1) then
				{
					_marker = createMarker[str _who2, [_newPos select 0, _newPos select 1, 0]];
					_marker setMarkerShape "ICON";
					(str _who2) setMarkerType "Arrow";
					(str _who2) setMarkerDir _eye;
					(str _who2) setMarkerText (str _who2) + "Uhel: " + str(_eye);
				};
				Sleep 0.1;
				_who2 stop true;  
				_angle = _angle + _offset;
			};
			_UnitsInGroup = _UnitsInGroup - 1;
			_newPos = [];
		};
	};
	case "HALFCIRCLE":
	{
		_UnitsInGroup = (count _razorParticipants)-1;
		_angle = (getdir _mainCharacter) - 180;
		_distance = 2.5;
		_offset = 180 /(_UnitsInGroup + 1);
				
		
		while{_UnitsInGroup >= 0} do 
		{
			_who2 = _razorParticipants select _UnitsInGroup;
			if((alive _who2) && (canStand _who2)) then
			{
				_osaX = 2;
				_osaZ = 2;
				_newPos = _newPos + [(getpos _mainCharacter select 0) + (_osaX * cos(_angle) - _osaZ * sin(_angle))];
				_newPos = _newPos + [(getpos _mainCharacter select 1) + (_osaX * sin(_angle) + _osaZ * cos(_angle))];
				_eye = 225 - _angle;
				
				_who2 setpos [_newPos select 0, _newPos select 1, 0];
				_who2 setdir _eye;
				if(_debugmode == 1) then
				{
					_marker = createMarker[str _who2, [_newPos select 0, _newPos select 1, 0]];
					_marker setMarkerShape "ICON";
					(str _who2) setMarkerType "Arrow";
					(str _who2) setMarkerDir _eye;
					(str _who2) setMarkerText (str _who2) + "Uhel: " + str(_eye);
				};
				Sleep 0.1;
				_who2 stop true;  
				_angle = _angle + _offset;
			};
			_UnitsInGroup = _UnitsInGroup - 1;
			_newPos = [];
		};
	};
	case "HALFCIRCLE2":
	{
		_UnitsInGroup = (count _razorParticipants)-1;
		_angle = (getdir _mainCharacter) - 180 + _shift;
		_distance = 4.5;
		_offset = 180 /(_UnitsInGroup*2 + 1);
			
		
		while{_UnitsInGroup >= 0} do 
		{
			_who2 = _razorParticipants select _UnitsInGroup;
			if((alive _who2) && (canStand _who2)) then
			{
				_osaX = 2;
				_osaZ = 2;
				_newPos = _newPos + [(getpos _mainCharacter select 0) + (_osaX * cos(_angle) - _osaZ * sin(_angle))];
				_newPos = _newPos + [(getpos _mainCharacter select 1) + (_osaX * sin(_angle) + _osaZ * cos(_angle))];
				_eye = 225 - _angle;
				
				_who2 setpos [_newPos select 0, _newPos select 1, 0];
				_who2 setdir _eye;
				if(_debugmode == 1) then
				{
					_marker = createMarker[str _who2, [_newPos select 0, _newPos select 1, 0]];
					_marker setMarkerShape "ICON";
					(str _who2) setMarkerType "Arrow";
					(str _who2) setMarkerDir _eye;
					(str _who2) setMarkerText (str _who2) + "Uhel: " + str(_eye);
				};
				Sleep 0.1;
				_who2 stop true;  
				_angle = _angle + _offset;
			};
			_UnitsInGroup = _UnitsInGroup - 1;
			_newPos = [];
		};		
	};
	default
	{
		_UnitsInGroup = (count _razorParticipants)-1;
		_angle = 90;
		_distance = 1.5;
		_offset = 180;
	}
};

TRUE;