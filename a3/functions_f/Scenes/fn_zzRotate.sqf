/*********************************************************************
	Version:	1.6
	Name:		zzRotate 
	DESCRIPTION:	Rotate objects around given center about given angle  
	PARAMETERS:	center: [x,y,z]; angle: number; participants: [object, initPosX, initPosY, initPosZ, angle]
	RETURNED VALUE:	Nothing
**********************************************************************/

if(BIS_debugModules) then
{
	if(BIS_debugModules) then{DEBUGLOG "zzRotate: STARTED -----------------------------------"};
};

 BIS_zzRotateReady = false;
_SLEEPINGTIME = 0.001;

_buildingpos 		= _this select 0;				//center of building
_buildingangle 		= _this select 1;				//rotation of building
_participants 		= _this select 2;				//objects to rotate

_buildingposX = (_buildingpos select 0);
_buildingposZ = (_buildingpos select 1);
_buildingposY = (_buildingpos select 2);

if!(isNil"BIS_debug") then 
{
	//SHOW CENTER OF ROTATION
	deleteMarker "origin";	
	_marker = createMarker["origin", [_buildingposX, _buildingposZ, _buildingposY]];
	_marker setMarkerShape "ICON";
	"origin" setMarkerType "DOT";
	"origin" setMarkerColor "ColorGreen";
};	

_nrOfParticipants = count _participants;
_step = 0;
while{_step < _nrOfParticipants} do
{
	_participantSelected 	= (_participants select _step);
	_partSelected		= str(_participants select _step);
	_osaX 			= _participants select (_step + 1);
	_osaZ 			= _participants select (_step + 3);
	_osaY 			= _participants select (_step + 2);
	_eye			= _participants select (_step + 4);
	
	_newcoord = [_buildingpos, _buildingangle, _eye, [_osaX, _osaZ, _osaY]] call BIS_fnc_sceneRotate;
	_newPosition = _newcoord select 0;
	_newDir = _newcoord select 1;  	

	if!(isNil"BIS_debug") then 
	{
		textLogFormat["Creating Marker %1 on %2 in % degree", _partSelected, _newPosition, _newDir];		
		//SET MARKERS
		_marker = createMarker[_partSelected, _newPosition];
		_marker setMarkerShape "ICON";
		(_partSelected) setMarkerType "ARROW";
		(_partSelected) setMarkerPos _newPosition;
		(_partSelected) setMarkerColor "ColorRed";
		(_partSelected) setMarkerDir _newDir;
	};		
		//SET OBJECTS
		_participantSelected setPos _newPosition;
		//Sleep _SLEEPINGTIME;
		_nic = [nil, _participantSelected, rSETDIR, _newDir] call RE;
		//_participantSelected setdir _newDir;
		//Sleep _SLEEPINGTIME;
		
		(_partSelected) setMarkerText _partSelected + "Uhel: " + str(_newDir);
		(_partSelected) setMarkerText _partSelected + "Uhel: " + str(_newDir) +  "| Opravdovy uhel je: " + str(getdir _participantSelected);
		
			
	_step = _step + 5;
	//Sleep _SLEEPINGTIME;
	
};

BIS_zzRotateReady = true;
if(BIS_debugModules) then
{
	if(BIS_debugModules) then{DEBUGLOG "zzRotate: END -----------------------------------"};
};