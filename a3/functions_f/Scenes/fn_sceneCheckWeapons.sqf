
/**************************************************************************************************************************
	Version:	1.0
	Name:		CheckWeaponsBefore scene
	DESCRIPTION:	Checks if participants haven't missing weapon or haven't it selected before scene
			Function works as toggle - 
			1st run of script: running in SETUP mode - sets correct weapons for scene
			2nd run of script: running in RESTORE mode - restore origin weapons(delete weapons after scene if character hadn't any)
			There is default SETUP: [[BIS_Cooper, "primary"],[BIS_Ohara, "primary"],[BIS_Rodriguez, "primary"],[BIS_Sykes, "primary"],[BIS_Miles, "primary"]]
			   
	PARAMETERS:	_participants: ARRAY of arrays in format [[character1, "typeofweapon"],[character2, "typeofweapon"],..,[characterx, "typeofweapon"]]
			where character is for example BIS_Cooper and typeofweapon is one of primary/pistol		
	RETURNED VALUE:	nothing
****************************************************************************************************************************/

private["_neededWeapons", "_mode", "_missingWeaponsBeforeScene", "_LogicMissingWeaponsBeforeScene"];
_mode = "restore";
_neededWeapons = [];
if(!isNil "BIS_Miles") then {		_neededWeapons = _neededWeapons + [[BIS_Miles, "primary"]]};
if(!isNil "BIS_Sykes") then {		_neededWeapons = _neededWeapons + [[BIS_Sykes, "primary"]]};
if(!isNil "BIS_Rodriguez") then {	_neededWeapons = _neededWeapons + [[BIS_Rodriguez, "primary"]]};
if(!isNil "BIS_Ohara") then {		_neededWeapons = _neededWeapons + [[BIS_Ohara, "primary"]]};
if(!isNil "BIS_Cooper") then {		_neededWeapons = _neededWeapons + [[BIS_Cooper, "primary"]]};

if(BIS_debugModules) then {textLogFormat ["sceneCheckWeapons: Running"]};
if(isNil "BIS_sceneCheckWeaponsLogic") then
{
	BIS_sceneCheckWeaponsGroup = createGroup sideLogic;
	//WaitUntil{!isNil "BIS_sceneCheckWeaponsGroup"};
	"Logic" createUnit [[1000,10,0], BIS_sceneCheckWeaponsGroup, "BIS_sceneCheckWeaponsLogic = this"];
	//WaitUntil{!isNil "BIS_sceneCheckWeaponsLogic"};
	PublicVariable "BIS_sceneCheckWeaponsLogic";
	_mode = "setup";
	//textLogFormat ["LOGIC %1 created", BIS_sceneCheckWeaponsLogic];
};

if((count _this) > 0) then
{
	_neededWeapons = _this select 0;	
};

//DEBUGLOG str _neededWeapons;
private["_defaultPistol", "_defaultPistolAmmo", "_defaultPrimaryWeapon", "_defaultPrimaryWeaponAmmo", "_checkIfHasPistol"];

_defaultPistol = "M9SD";
_defaultPistolAmmo = "15Rnd_9x19_M9SD";
_defaultPrimaryWeapon = "M4A1_HWS_GL_camo";
_defaultPrimaryWeaponAmmo = "30Rnd_65x39_mag";
//Functions
_checkIfHasPistol = 
{
	private["_who", "_knownPistols", "_hasPistol"];
	_who = _this select 0;
	_knownPistols = ["M9", "M9SD", "Makarov", "MakarovSD", "Colt1911"];
	_hasPistol = "";
	{
		if(_x in (weapons _who)) then
		{
			_hasPistol = _x;
			if(BIS_debugModules) then {textLogFormat["%1 has pistol %2", _who, _x]};
		};
	}forEach _knownPistols;
	_hasPistol
};

switch(_mode) do
{
	case "setup":
	{
		private["_tmpMissingWeaponsBeforeScene", "_who", "_whatPistol"];
		if(BIS_debugModules) then {textLogFormat ["sceneCheckWeapons: Running in mode SETUP"]};
		_missingWeaponsBeforeScene = [];
		_participant = (count _neededWeapons) - 1; 
		while{_participant >= 0} do
		{
			_who = (_neededWeapons select _participant) select 0;			//who
			_neededWeapon = (_neededWeapons select _participant) select 1;		//which gun he needs
			
	
			
			textLogFormat["_who: %1", _who];
			textLogFormat["_neededWeapon: %1", _neededWeapon];
			textLogFormat["he has : %1", primaryWeapon _who];
			
			switch(_neededWeapon) do
			{
				case "primary":							//if he needs primary weapon...
				{
					if(primaryWeapon _who == "") then			//but if character has not primary weapon in his gear
					{
						_tmpMissingWeaponsBeforeScene = [];
						_tmpMissingWeaponsBeforeScene = _tmpMissingWeaponsBeforeScene + [_who];
						_tmpMissingWeaponsBeforeScene = _tmpMissingWeaponsBeforeScene + ["primary"];
						_missingWeaponsBeforeScene = _missingWeaponsBeforeScene + [_tmpMissingWeaponsBeforeScene];	//remember it
						_who addMagazine _defaultPrimaryWeaponAmmo;	//then give him the one
						_who addWeapon _defaultPrimaryWeapon;
					};
					
					_who selectWeapon primaryWeapon _who;			//...then give him the gun in his hands
				};
				case "pistol":							//if he needs primary weapon...
				{
					
					_whatPistol = [_who] call _checkIfHasPistol;
					if(_whatPistol == "") then				//but if character has not pistol in his gear
					{
						_tmpMissingWeaponsBeforeScene = [];
						_tmpMissingWeaponsBeforeScene = _tmpMissingWeaponsBeforeScene + [_who];
						_tmpMissingWeaponsBeforeScene = _tmpMissingWeaponsBeforeScene + ["pistol"];
						_missingWeaponsBeforeScene = _missingWeaponsBeforeScene + [_tmpMissingWeaponsBeforeScene];	//remember it
						_who addMagazine _defaultPistolAmmo;		//then give him the one
						_who addWeapon _defaultPistol;
					};

					_who selectWeapon _defaultPistol;
				};
			};
			_participant = _participant - 1;		
		};
		BIS_sceneCheckWeaponsLogic setVariable ["_LogicMissingWeaponsBeforeScene", _missingWeaponsBeforeScene];
	};//end case "SETUP"
	case "restore":								//get the remembered weapons(only if character hadn't the one) back
	{
		private["_currentCharacter", "_whatWeaponWasMissing"];
		if(BIS_debugModules) then {textLogFormat ["sceneCheckWeapons: Running in mode RESTORE"]};
		_missingWeaponsBeforeScene = BIS_sceneCheckWeaponsLogic getVariable "_LogicMissingWeaponsBeforeScene";
		{
			_currentCharacter = _x select 0;
			_whatWeaponWasMissing = _x select 1;
			 switch(_whatWeaponWasMissing) do
			 {
			 	case "primary":
			 	{
				 	_currentCharacter removeWeapon _defaultPrimaryWeapon;
					_currentCharacter removeWeapon _defaultPrimaryWeaponAmmo;	
				};
				case "pistol":
				{
					_currentCharacter removeWeapon _defaultPistol;
					_currentCharacter removeWeapon _defaultPistolAmmo;
				};	
			 };
			
		}forEach _missingWeaponsBeforeScene;
		
		deleteVehicle BIS_sceneCheckWeaponsLogic;
		BIS_sceneCheckWeaponsLogic = nil;
		deleteGroup BIS_sceneCheckWeaponsGroup;

	};//end case "RESTORE"
};