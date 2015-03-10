private ["_type","_ctrl"];
_type = [_this,0,"",[""]] call bis_fnc_param;
_ctrl = [_this,1,controlnull,[controlnull]] call bis_fnc_param;

_br = "%0A";
_pid = "10302";
_issueType = 1;
_summary = "[DEV]+";
_priority = 4;
_components = [];
_assignee = "";
_environment = "";
_description = "";
_labels = ["dev"];
_name = "";
_fileNameFormat = "%1_%2%3_%4";

_fnc_removeSpaces = {
	private ["_this","_thisArray"];
	_thisArray = toarray _this;
	_this = "";
	{
		_char = if (_x == _symbolSpace) then {"+"} else {tostring [_x]};
		_this = _this + _char;	
	} foreach _thisArray;
	_this
};

//--- Process game version
_symbolSpace = toarray " " select 0;
_symbolEqual = toarray "=" select 0;
_cameras = allmissionobjects "Camera";
_cameraon = if (count _cameras > 0) then {_cameras select 0} else {cameraon};
_environment = if !(isnull _cameraon) then {
	format [
		"h3.+Data%1{code}cameraOn+setPosATL+%2;%1cameraOn+setDir+%3;{code}",
		_br,
		getposatl _cameraon,
		direction _cameraon
	]
} else {
	format ["h3.+Data%1",_br]
};
_version = "";
_lines = 0;
_line = "";
_currentTime = "";
{
	_char = switch true do {
		case (_x == _symbolSpace): {"+"};
		case (_x == _symbolEqual): {""};
		case (_x == 10): {_br};
		case (_x == 13): {
			if (_lines == 6) then {_currentTime = _line;};
			_line = "";
			_lines = _lines + 1;
			""
		};
		default {tostring [_x]};
	};
	_line = _line + _char;
	_version = _version + _char;
	if (_lines >= 13) exitwith {};
} foreach toarray diag_gameVersion;
_version = format ["%1h3.+Version%1{code}%2%1{code}",_br,_version];
_version = _version + _br + _br + "{color:grey}^Issue+generated+by+[BIS_fnc_diagJIRAlink|https://confluence.bistudio.com/display/ARMA3/In-game+Issue+Reporting]^{color}";

//--- Set params based on issue type
switch _type do {
	case "map": {
		_name = worldname;
		_components = [11003];
		_summary = _summary + _name + "+-+<INSERT+TITLE>";
		_labels = _labels + [_name];
	};
	case "mission": {
		_name = missionname;
		_components = [11005];
		_briefingName = gettext (missionconfigfile >> "onLoadName");
		if (_briefingName == "") then {_briefingName = briefingName};
		if (_briefingName == _name) then {_briefingName = "";};
		_briefingName = _briefingName call _fnc_removeSpaces;
		if (_briefingName != "") then {_briefingName = format ["+(%1)+",_briefingName];};
		_summary = _summary + _name + _briefingName + "+-+<INSERT+TITLE>";
		_dev = tolower gettext (missionconfigfile >> "dev");
		if (_dev != "") then {_assignee = format ["&amp;assignee=%1",_dev];};
		_tasks = "";
		{
			_descArray = (_x call bis_fnc_taskdescription) select 1;
			_descArray set [0,(_descArray select 0) call bis_fnc_localize];
			_desc = (format _descArray) call _fnc_removeSpaces;
			_tasks = _tasks + format ["*+{{%2}}+_(%3)_+-+%4%1",_br,_x,_desc,_x call bis_fnc_taskstate];
		} foreach (player call bis_fnc_tasksUnit);
		_gameType = if (ismultiplayer) then {
			_mainscope = missionnamespace getvariable ["bis_functions_mainscope",objnull];
			_server = if (_mainscope getvariable ["isDedicated",false]) then {"Dedicated+MP"} else {"Hosted+MP"};
			_server + (if (isserver) then {"+(Server)"} else {if (_mainscope getvariable ["didJIP",false]) then {"+(JIP+Client)"} else {"+(Client)"}})
		} else {
			"SP"
		};
		_environment = _environment + format [
			"%1{panel:bgColor=%2f5f5f5}*Type*:+%3%1*Duration:*+%4%1*Reloads:*+%5%1*Tasks:*%1%6%1{panel}%1",
			_br,
			"%23",
			_gameType,
			[time / 3600] call bis_fnc_timetostring,
			profileNamespace getvariable [_name + "_reloads_" + str ismultiplayer,0], // BIS_fnc_missionHandlers_reloads
			_tasks
		];
		_labels = _labels + [_name];
	};
	case "object": {
		_target = cursortarget;
		if (isnull _target || count _cameras > 0) then {
			_targets = lineIntersectsObjs [atltoasl (positionCameraToWorld [0,0,0]),atltoasl (screentoworld [0.5,0.5]),objnull,objnull,true,2];
			_target = [_targets,0,objnull] call bis_fnc_paramin;
		};
		if (isnull _target) then {_target = cameraon;};
		if !(isnull _target) then {
			_class = typeof _target;
			_model = "N/A";
			if (_class == "") then {
				_class = "N/A";
				_targetArray = [str _target," "] call bis_fnc_splitstring;
				_name = _targetArray select (count _targetArray - 1);
				_model = _name;
			} else {
				_name = _class;
				_labels = _labels + unitaddons _class;
				_model = gettext (configfile >> "cfgvehicles" >> _class >> "model");
			};
			_cfg = configfile >> "cfgvehicles" >> _class;
			_editor = if (getnumber (_cfg >> "scope") == 2) then {
				format [
					if (_class iskindof "allvehicles") then {"%1 > %2 > %3 > %4"} else {"Empty > %3 > %4"},
					(getnumber (_cfg >> "side")) call bis_fnc_sidename,
					gettext (configfile >> "cfgfactionclasses" >> gettext (_cfg >> "faction") >> "displayname"),
					gettext (configfile >> "cfgvehicleclasses" >> gettext (_cfg >> "vehicleclass") >> "displayname"),
					gettext (_cfg >> "displayname")
				]
			} else {
				"N/A"
			};
			_components = [11000,11002];
			_summary = _summary + _name + "+-+<INSERT+TITLE>";
			_environment = _environment + format [
				"%1{panel:bgColor=%2f5f5f5}%1*Class:*+{{%3}}%1*Model:*+{{%4}}%1*Editor:*+%5%1*Position*+(%6):+{{\%7}}%1{panel}%1",
				_br,
				"%23",
				_class,
				_model,
				_editor,
				worldname,
				getposatl _target
			];
		} else {
			_summary = "!!!NO OBJECT FOUND!!!";
		};
	};
	default {
		_name = "issue";
		_fileNameFormat = "%1%3";
	};
};

//--- Add image link
_fileName = "";
if !(isnull ([] call bis_fnc_displayMission)) then {
	_currentTimeArray = toarray _currentTime;
	reverse _currentTimeArray;
	_currentTimeArray resize 19;
	reverse _currentTimeArray;
	_currentTimeArray = [tostring _currentTimeArray,"/+:"] call bis_fnc_splitstring;
	_currentTime = "";
	{
		_separator = if (_foreachindex in [0,3]) then {"_"} else {"-"};
		_currentTime = _currentTime + _separator + _x;
	} foreach _currentTimeArray;
	_fileName = format [_fileNameFormat,productVersion select 1,_type,_currentTime,_name];
	_environment = format ["h3.+Image%1{color:grey}^!%2.jpg|thumbnail!^{color}%1%1",_br,_fileName] + _environment;
};
_environment = _environment + _version;

//--- Process arrays
_labelsText = "";
{
	_labelsText = _labelsText + format ["&amp;labels=%1",_x];
} foreach _labels;

_componentsText = "";
{
	_componentsText = _componentsText + format ["&amp;components=%1",_x];
} foreach _components;

//--- Compose link
_link = format [
	"https://jira.bistudio.com/secure/CreateIssueDetails!init.jspa?pid=%1&amp;issuetype=%2&amp;summary=%3&amp;priority=%4%5%6&amp;environment=%7&amp;description=%8%9",
	_pid,
	_issueType,
	_summary,
	_priority,
	_componentsText,
	_assignee,
	_environment,
	_description,
	_labelsText
];
_ctrl ctrlsetstructuredtext parsetext format ["<a href='%2'>%1</a>",toupper ctrltext _ctrl,_link];
if (_fileName != "") then {
	_ctrl ctrladdeventhandler ["htmlLink",format ["diag_screenshot ((profilenamespace getvariable ['BIS_fnc_diagJIRAlink_path','']) + '%1.jpg');",_fileName]];
};
_link