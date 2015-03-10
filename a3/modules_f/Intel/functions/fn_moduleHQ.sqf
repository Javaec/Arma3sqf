/*
	Author: Karel Moricky

	Description:
	Register or return side HQ speaker
	
	Parameter(s):
		0:
			OBJECT - register the HQ
			SIDE - return HQ of the side
	
	Returns:
	OBJECT - the HQ
*/


private ["_logic"];
_logic = [_this,0,objnull,[objnull,sideunknown]] call bis_fnc_param;

if (typename _logic == typename objnull) then {
	private ["_sideID"];
	_sideID = (_logic getvariable ["side",(side group _logic) call bis_fnc_sideID]) call bis_fnc_parsenumber;
	if (_sideID in [0,1,2,3]) then {
		private ["_callsign","_callsignCustom","_side","_HQs","_logicGrp","_sideGrp"];

		//--- Join the module to desired side
		_side = _sideID call bis_fnc_sideType;
		if (isserver) then {
			_logicGrp = group _logic;
			_logicGrpDummy = _logicGrp createunit ["logic",[99,99,99],[],0,"none"];
			createcenter _side;
			_sideGrp = creategroup _side;
			[_logic] join _sideGrp;
			deletevehicle _logicGrpDummy;

			//--- Register the HQ module
			_HQs = missionnamespace getvariable ["BIS_fnc_moduleHQ_HQs",[objnull,objnull,objnull,objnull]];
			_HQs set [_sideID,_logic];
			missionnamespace setvariable ["BIS_fnc_moduleHQ_HQs",_HQs];
			publicvariable "BIS_fnc_moduleHQ_HQs";
		};

		//--- Assign the callsign
		_callsign = _logic getvariable ["callsign","STR_A3_CfgHQIdentities_Base_0"];
		_callsignCustom = _logic getvariable ["callsignCustom",""];
		if (_callsignCustom != "") then {_callsign = _callsignCustom;};
		if (islocalized _callsign) then {_callsign = localize _callsign;};
		group _logic setgroupid [_callsign];

		//--- Set identity
		_identities = [
			["Male01PER"],
			["Male06ENG","Male07ENG","Male08ENG","Male09ENG"],
			["Male02GRE","Male03GRE"],
			["Male02GRE","Male03GRE"]
		];

		_identityID = _logic getvariable ["identity",0];
		_identitiesSide = _identities select _sideID;
		_identity = _identitiesSide select (_identityID % (count _identitiesSide));
		_logic setidentity _identity;	
	};
	_logic
} else {
	private ["_side","_sideID"];
	_side = _logic;
	_sideID = _side call bis_fnc_sideID;
	if (_sideID in [0,1,2,3]) then {

		//--- Load and assign the callsign
		private ["_HQs","_data","_logic"];
		_HQs = missionnamespace getvariable ["BIS_fnc_moduleHQ_HQs",[objnull,objnull,objnull,objnull]];
		_logic = _HQs select _sideID;
		_logic
	} else {
		["%1 not supported, must be %2, %3, %4 or %5",_side,west,east,resistance,civilian] call bis_fnc_error;
		objnull
	};
};