private [
	"_tag",
	"_varName",
	"_var",
	"_varR",
	"_varG",
	"_varB",
	"_varA",
	"_showError",
	"_colorR",
	"_colorG",
	"_colorB",
	"_colorA",
	"_colorPreset",
	"_colorPresetDefault",
	"_colorR_def",
	"_colorG_def",
	"_colorB_def",
	"_colorA_def"
];

_tag = [_this,0,"",["",true]] call bis_fnc_param;

//--- Initialize all
if (typename _tag == typename true) exitwith {

	with uinamespace do {
		_CfgUIColors = configfile >> "CfgUIColors";
		for "_t" from 0 to (count _CfgUIColors - 1) do {
			_tag = _CfgUIColors select _t;
			if (isclass _tag) then {

				_cfgVariables = _tag >> "Variables";
				for "_v" from 0 to (count _cfgVariables - 1) do {
					_variable = _cfgVariables select _v;
					if (isclass _variable) then {
						[configname _tag,configname _variable,false] call bis_fnc_displayColorGet;
					};
				};
			};
		};
	};
};

_varName = [_this,1,"",[""]] call bis_fnc_param;
if (_varName == "" || _tag == "") exitwith {["Missing variable name"] call bis_fnc_error};
_var = _tag + "_" + _varName;
_varR = _var + "_R";
_varG = _var + "_G";
_varB = _var + "_B";
_varA = _var + "_A";
_varPreset = _var + "_preset";
_varPresetDefault = _var + "_presetDefault";



//--- Load colors from profile
_colorR = profilenamespace getvariable _varR;
_colorG = profilenamespace getvariable _varG;
_colorB = profilenamespace getvariable _varB;
_colorA = profilenamespace getvariable _varA;
_colorPreset = profilenamespace getvariable _varPreset;

if !(isnil {_colorPreset}) then {
	_colorPresetDefault = profilenamespace getvariable [_varPresetDefault,_colorPreset];
	if (_colorPreset == _colorPresetDefault && getnumber (configfile >> "CfgUIColors" >> _tag >> "Presets" >> _colorPresetDefault >> "default") == 0) then {
		_colorR = nil;
		_colorG = nil;
		_colorB = nil;
		_colorA = nil;
		_colorPreset = nil;
	};
};

//--- Exit when all variables exist and default preset remains as it was
if ({isnil _x} count ["_colorR","_colorG","_colorB","_colorA","_colorPreset"] == 0) exitwith {[_colorR,_colorG,_colorB,_colorA]};

//--- Blank preset
profileNameSpace setvariable [_varPreset,""];

//--- Get default color
_colorPresetDefault = profilenamespace getvariable [_varPresetDefault,""];
_colorPresetDefaultDefault = [0,0,0,1];
if ({isnil _x} count ["_colorR","_colorG","_colorB","_colorA"] > 0) then {
	private ["_GUI_BCG_RGB"];
	_GUI_BCG_RGB = configfile >> "CfgUIColors" >> _tag >> "Presets";
	for "_i" from 0 to (count _GUI_BCG_RGB - 1) do {
		private ["_current"];
		_current = _GUI_BCG_RGB select _i;
		if (isclass _current) then {
			private ["_default"];
			_default = getnumber (_current >> "default");
			if (_default == 1) then {
				private ["_colorPresetDefaultLocal"];
				_colorPresetDefaultLocal = getarray (_current >> "Variables" >> _varName);
				if (count _colorPresetDefaultLocal > 0) then {

					//--- Set color
					_colorPresetDefault = _colorPresetDefaultLocal;

					//---  Save preset name
					profileNameSpace setvariable [_varPreset,configname _current];
					profileNameSpace setvariable [_varPresetDefault,configname _current];
				};
			};
		};
	};
};

//--- Assign default color. Only numbers will be stored
with uinamespace do {
	_colorR_def = [_colorPresetDefault,0,0,[0,""]] call bis_fnc_param;
	_colorG_def = [_colorPresetDefault,1,0,[0,""]] call bis_fnc_param;
	_colorB_def = [_colorPresetDefault,2,0,[0,""]] call bis_fnc_param;
	_colorA_def = [_colorPresetDefault,3,1,[0,""]] call bis_fnc_param;
};

//--- Save into profileNameSpace when not defined
private ["_saveProfile","_nilVars"];
_saveProfile = false;
_nilVars = [];
if (isnil "_colorR") then {
	_colorR = (_colorR_def) call bis_fnc_parsenumber;
	profilenamespace setvariable [_varR,_colorR];
	_nilVars = _nilVars + [_varR];
	_saveProfile = true;
};
if (isnil "_colorG") then {
	_colorG = (_colorG_def) call bis_fnc_parsenumber;
	profilenamespace setvariable [_varG,_colorG];
	_nilVars = _nilVars + [_varG];
	_saveProfile = true;
};
if (isnil "_colorB") then {
	_colorB = (_colorB_def) call bis_fnc_parsenumber;
	profilenamespace setvariable [_varB,_colorB];
	_nilVars = _nilVars + [_varB];
	_saveProfile = true;
};
if (isnil "_colorA") then {
	_colorA = (_colorA_def) call bis_fnc_parsenumber;
	profilenamespace setvariable [_varA,_colorA];
	_nilVars = _nilVars + [_varA];
	_saveProfile = true;
};
if (isnil "_colorPreset") then {
	_nilVars = _nilVars + [_varPreset];
	_saveProfile = true;
};
if (_saveProfile) then {saveProfileNamespace};

//--- Display error
_showError = [_this,2,true,[true]] call bis_fnc_param;
if (_showError) then {
	["Cannot load profile variables: %1.",_nilVars] call bis_fnc_error;
	["Default color %1 used instead.",[_colorR,_colorG,_colorB,_colorA]] call bis_fnc_error;
};

//--- Return
[_colorR,_colorG,_colorB,_colorA]