#define DIARY_CATEGORY	"BIS_fnc_diaryHints"

disableserialization;
_param = [_this,0,objnull,[objnull,displaynull]] call bis_fnc_param;

if (typename _param == typename objnull) then {
	_player = _param;

	if !(_player diarySubjectExists DIARY_CATEGORY) then {
		_player createDiarySubject [DIARY_CATEGORY,"Hints"];
	};

	_cfgLoadingTexts = configfile >> "CfgLoadingTexts";
	_loadingTexts = [];
	for "_h" from 0 to (count _cfgLoadingTexts - 1) do {
		_hint = _cfgLoadingTexts select _h;
		if (isclass _hint) then {
			_isDiary = getnumber (_hint >> "isDiary");
			if (_isDiary > 0) then {
				_hintTitle = gettext (_hint >> "title");
				_hintText = getarray (_hint >> "text");
				_hintParams = getarray (_hint >> "params");

				if (_hintTitle != "" && count _hintText > 0) then {

					//--- Text lines
					_text = "";
					{
						_text = _text + format ([_x] + _hintParams) + "<br /><br />";
					} foreach _hintText;

					//--- Header
					//_text =  "<t size='1.5'>" + _hintTitle + "</t><br /><br />" + _text;	
					_loadingTexts set [count _loadingTexts,parsetext _text];

					//--- Add diary record
					_text = "<br /><br /><br /><br /><br /><br /><br /><br />";
					_player createDiaryRecord [
						DIARY_CATEGORY,
						[_hintTitle,_text]
					];
				};
			};
		};
	};

	BIS_loadingTexts = _loadingTexts;//uinamespace getvariable "BIS_loadingTexts";

} else {
	_display = _param;

	_ctrlListboxItem = _display displayctrl 1002;
	_ctrlBackground = _display displayctrl 1023;
	_ctrlStructuredText = _display displayctrl 1200;
	_ctrlGroupStructuredText = _display displayctrl 2300;

	_cursel = lbcursel _ctrlListboxItem;
	if (_cursel < 0) exitwith {};

	_loadingTexts = BIS_loadingTexts;
	_cursel = (count _loadingTexts - 1 - _cursel);
	_hintText = _loadingTexts select _cursel;

	//--- Text
	_ctrlPos = ctrlposition _ctrlStructuredText;
	_ctrlStructuredText ctrlsetstructuredtext _hintText;
	_ctrlPos set [3,ctrltextheight _ctrlStructuredText];
	_ctrlStructuredText ctrlsetposition _ctrlPos;
	_ctrlStructuredText ctrlcommit 0;

	//--- Text group (because of scrollbar)
	_ctrlPos = ctrlposition _ctrlGroupStructuredText;
	_ctrlPos set [1,(ctrlposition _ctrlBackground select 1) + 0.060];
	_ctrlPos set [3,(ctrltextheight _ctrlStructuredText) min (safezoneH - (_ctrlpos select 1) - 0.13)];
	_ctrlGroupStructuredText ctrlsetposition _ctrlPos;
	_ctrlGroupStructuredText ctrlsetfade 0;
	_ctrlGroupStructuredText ctrlcommit 0;

	//-- Background
	_ctrlPos = ctrlposition _ctrlBackground;
	_ctrlPos set [3,(ctrltextheight _ctrlStructuredText + 0.1) min (safezoneH - (_ctrlpos select 1) - 0.1)];
	_ctrlBackground ctrlsetposition _ctrlPos;
	_ctrlBackground ctrlcommit 0;
	_ctrlBackground ctrlsetposition _ctrlPos;
	_ctrlBackground ctrlcommit 99999;
};