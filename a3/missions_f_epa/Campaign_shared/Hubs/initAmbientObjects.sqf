scriptName "initAmbientObjects.sqf";

/*------------------------------------------------------------------------------------------

	BACKUP THE POOL GLOBALS

------------------------------------------------------------------------------------------*/
private["_weaponBackup","_magazineBackup","_attachmentBackup"];

//["[AmbObjects] Before vizualization: %1",BIS_PER_POOL_weapon] call BIS_fnc_logFormat;

_weaponBackup 	  =+ BIS_PER_POOL_weapon;
_magazineBackup   =+ BIS_PER_POOL_magazine;
_attachmentBackup =+ BIS_PER_POOL_attachment;

/*--------------------------------------------------------------------------------------------------

	PROCESS OBJECTS

--------------------------------------------------------------------------------------------------*/
private["_surfaceObjects"];

//gather all surface objects
_surfaceObjects = [] call BIS_fnc_camp_getSurfaceObjects;

{
	_x enableSimulation false;
}
forEach _surfaceObjects;


//process all surface objects
private["_new","_all"];

_all = [];

{
	_new = [_x] call BIS_fnc_camp_setupSurfaceObject;
	_all = _all + [_new];
}
forEach _surfaceObjects;

/*------------------------------------------------------------------------------------------

	RESTORE THE POOL GLOBALS

------------------------------------------------------------------------------------------*/
BIS_PER_POOL_weapon 	=+ _weaponBackup;
BIS_PER_POOL_magazine 	=+ _magazineBackup;
BIS_PER_POOL_attachment =+ _attachmentBackup;

//["[AmbObjects] After vizualization: %1",BIS_PER_POOL_weapon] call BIS_fnc_logFormat;