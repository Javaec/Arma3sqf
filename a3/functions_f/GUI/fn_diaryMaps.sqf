#define DIARY_CATEGORY	"BIS_fnc_diaryMaps"

disableserialization;
_param = [_this,0,objnull,[objnull,displaynull]] call bis_fnc_param;

if (typename _param == typename objnull) then {
	_player = _param;

	_displayName = [_this,1,"",[""]] call bis_fnc_param;
	_pos = [_this,2,[0,0,0]] call bis_fnc_param;
	_fov = [_this,3,0.7] call bis_fnc_param;

	if !(_player diarySubjectExists DIARY_CATEGORY) then {
		_subject = _player createDiarySubject [DIARY_CATEGORY,"Maps"];
		BIS_fnc_diaryMap_maps = [];
	};

	_record = _player createDiaryRecord [
		DIARY_CATEGORY,
		[_displayName,"AAA<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />"]
	];

	BIS_fnc_diaryMap_maps set [count BIS_fnc_diaryMap_maps,[_displayName,_pos,_fov]];

} else {
	_display = _param;
	_ctrlListboxItem = _display displayctrl 1002;
	_ctrlBackground = _display displayctrl 1023;
	_ctrlMap = _display displayctrl 1027;

	_cursel = lbcursel _ctrlListboxItem;
	if (_cursel < 0) exitwith {};
	_lbData = _ctrlListboxItem lbdata _cursel;

	_cursel = (count BIS_fnc_diaryMap_maps - 1 - _cursel);
	if (_cursel > count BIS_fnc_diaryMap_maps) exitwith {};

	//--- Get map data
	_map = BIS_fnc_diaryMap_maps select _cursel;
	_position = _map select 1;
	_position = _position call bis_fnc_position;
	_fov = _map select 2;

	_ctrlBackgroundPos = ctrlposition _ctrlBackground;
	_ctrlMapMargin = 0.02;
	_ctrlMapPos = [
		(_ctrlBackgroundPos select 0) + _ctrlMapMargin * 3/4,
		(_ctrlBackgroundPos select 1) + _ctrlMapMargin,
		(_ctrlBackgroundPos select 2) - _ctrlMapMargin * 3/4 * 2,
		0.725 - _ctrlMapMargin * 2//(_ctrlBackgroundPos select 3) - _ctrlMapMargin * 2
	];

	_ctrlMap ctrlsetposition _ctrlMapPos;
	_ctrlMap ctrlcommit 0;
	_ctrlMap ctrlenable false;
	_ctrlMap ctrlmapanimadd [0,_fov,_position];
	ctrlMapAnimCommit _ctrlMap;
};