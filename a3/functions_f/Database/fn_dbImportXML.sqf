/*
	Author: Karel Moricky

	Description:
	Import XML file into Scripted Database

	Parameter(s):
	_this: STRING - path to .xml file

	Returns:
	ARRAY - database
*/

private ["_file","_input","_fnc_getSymbol","_symbolArrowLeft","_symbolArrowRight","_symbolBacketSqleft","_symbolBacketSqRight","_symbolAmp","_symbolEqual","_symbolSemicolon","_symbolSlash","_symbolQestion","_symbolExclamation","_symbolSpace","_symbolQuote","_symbolApost","_inputArray","_inputArrayCount","_outputArray","_outputArrayTemp","_pathClass","_pathClassCounter","_pathTag","_isClassname","_isClassNameEnd","_isString","_isBracketSq","_add","_addGlobal"];

_file = [_this,0,"",[""]] call bis_fnc_param;

_input = loadfile _file;

if (_input == "") exitwith {endloadingscreen; ["Cannot load file '%1'!",_this] call bis_fnc_error; []};

//--- Symbols
/*
9 - Tab
32 - Space
13,10 - Break
*/
_fnc_getSymbol = {toarray _this select 0};
_symbolArrowLeft =	"<" call _fnc_getSymbol;
_symbolArrowRight =	">" call _fnc_getSymbol;
_symbolBracketSqLeft =	"[" call _fnc_getSymbol;
_symbolBracketSqRight =	"]" call _fnc_getSymbol;
_symbolAmp = 		"&" call _fnc_getSymbol;
_symbolEqual = 		"=" call _fnc_getSymbol;
_symbolSemicolon = 	";" call _fnc_getSymbol;
_symbolSlash = 		"/" call _fnc_getSymbol;
_symbolQuestion = 	"?" call _fnc_getSymbol;
_symbolExclamation = 	"!" call _fnc_getSymbol;
_symbolSpace = 		" " call _fnc_getSymbol;
_symbolQuote = 		"""" call _fnc_getSymbol;
_symbolApost = 		"'" call _fnc_getSymbol;

//--- Recognize
_inputArray = toarray _input;
_inputArrayCount = count _inputArray;

_outputArray = [];
_outputArrayTemp = [];
_pathClass = []; //--- Unique tags, with counters in case of duplicity
_pathClassCounter = [];
_pathTag = []; //--- Real tags

_isClassName = false;
_isClassNameEnd = false;
_isString = false;
_isBracketSq = 0;
_add = true;
_addGlobal = true;

//--- Bypass Scripted Database converting to uppercase
{
	if !(_x in [9,10,13]) then {
		private ["_addSymbol"];

		_addSymbol = true;

		//--- " '
		if (_x in [_symbolQuote,_symbolApost]) then {_isString = !_isString;};
		if (_x == _symbolBracketSqLeft) then {_isBracketSq = _isBracketSq + 1};
		if (_x == _symbolBracketSqRight) then {_isBracketSq = _isBracketSq - 1};

		if (!_isString && _isBracketSq == 0) then {

			//--- <
			if (_x in [_symbolArrowleft] && !_isClassName) then {
				if (count _outputArrayTemp > 0 && count _pathClass > 0) then {
					_value = tostring _outputArrayTemp;
					_fnc_dbValueId_noUpper = true;
					_value = [_value] call bis_fnc_dbClassId;
					_value = [_value] call bis_fnc_dbValueId;
					_fnc_dbValueId_noUpper = false;
					[_outputArray,_pathClass,_value] call bis_fnc_dbValueSet;
					[_outputArray,_pathClass,_value] call bis_fnc_dbClassRemove;
				};

				_outputArrayTemp = [];
				_isClassName = true;
				_addSymbol = false;
			};

			//--- /
			if (_x in [_symbolSlash,_symbolExclamation,_symbolQuestion] && _isClassName) then {
				_isClassNameEnd = true;
				_addSymbol = false;
			};

			//--- >
			if (_x == _symbolArrowRight) then {_addSymbol = false};

			//--- Space
			if (_x == _symbolSpace && _isClassName) then {_addGlobal = false;};
		};

		//--- Add symbol
		if (_addSymbol && _addGlobal) then {
			_outputArrayTemp set [count _outputArrayTemp,_x];
		};

		if (!_isString && _isBracketSq == 0) then {

			//--- >
			if (_x in [_symbolArrowRight]) then {

				if (count _outputArrayTemp > 0) then {
					private ["_className"];
					_className = tostring _outputArrayTemp;
					_className = [_className] call bis_fnc_dbClassId;
					_className = [_className] call bis_fnc_dbValueId;
					_classNameParent = if (count _pathTag > 0) then {_pathTag select (count _pathTag - 1)} else {""};

					if (!_isClassNameEnd) then {
						private ["_pathTagLocal","_classCounterName","_classCounterId","_classCounter","_classCounterString","_classNameCounter"];

						//--- Start
						_pathTagLocal = +_pathClass + [_className];
						_pathTag set [count _pathTag,_className];
						_classCounterName = _fnc_scriptName + str _pathTagLocal;
						_classCounterId = _pathClassCounter find _classCounterName;
						_classCounter = if (_classCounterId >= 0) then {
							_classCounterId = _classCounterId + 1;
							_pathClassCounter set [_classCounterId,(_pathClassCounter select _classCounterId) + 1];
							(_pathClassCounter select _classCounterId) + 1
						} else {
							_classCounterId = count _pathClassCounter;
							_pathClassCounter set [_classCounterId,_classCounterName];
							_classCounterId = _classCounterId + 1;
							_pathClassCounter set [_classCounterId,0];
							0
						};
						_classCounterString = if (_classCounter > 0) then {"%" + str _classCounter} else {""};
						_classNameCounter = _className + _classCounterString;
						if ([_outputArray,_pathClass + [_classNameCounter]] call BIS_fnc_dbClassCheck) then {
							_className = _classNameCounter;
							[_classCounterName,1] call bis_fnc_counter;
						};
						_pathClass set [count _pathClass,_classNameCounter];
						[_outputArray,_pathClass] call bis_fnc_dbClassSet;
						//[4,_pathClass] call bis_fnc_log;
					} else {
						private ["_resize","_prev"];

						//--- End (/tag)
						_resize = (count _pathClass - 1);
						_prev = _inputArray select (_forEachIndex - 1);

						//--- Empty-element tag
						_isEnd = if (_prev in [_symbolSlash,_symbolExclamation,_symbolQuestion]) then {
							[_outputArray,_pathClass + [_className]] call bis_fnc_dbClassSet;
							_resize = count _pathClass;
							true
						} else {
							_className == _classNameParent
						};
						if (_resize >= 0 && _isEnd) then {
							_pathTag resize _resize;
							_pathClass resize _resize;
						} else {
							["No opening tag for %1",_className] call bis_fnc_error;
						};
					};
				};

				//--- Reset
				_outputArrayTemp = [];
				_isClassName = false;
				_isClassNameEnd = false;
				_addGlobal = true;
			};
		};

	} else {
		if (_addGlobal && (_isString || _isBracketSq > 0)) then {

			_outputArrayTemp set [count _outputArrayTemp,_x];
		};
	};


	progressloadingscreen (_forEachIndex / _inputArrayCount);

} foreach _inputArray;

//[_outputArray] call bis_fnc_dbPrint;

_outputArray