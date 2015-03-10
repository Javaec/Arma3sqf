private ["_lbId","_control","_category","_categoryDB","_categoryList","_conditionEnable","_conditionShow"];

disableserialization;
_control = [_this,0,controlnull,[controlnull]] call bis_fnc_param;
_category = [_this,1,configfile,[configfile]] call bis_fnc_param;
_categoryDB = [_this,2,[],[[]]] call bis_fnc_param;
_conditionEnable = [_this,3,{true},[{}]] call bis_fnc_param;
_conditionShow = [_this,4,{true},[{}]] call bis_fnc_param;
_lbId = -1;

if (!isnil "cheat0") then {
	if (cheat0) then {
		_conditionShow = {true};
	};
};

_categoryParents = [_category] call bis_fnc_returnparents;
_categoryBlacklist = [];

//--- Read config
_categoryList = [[],[]]; //--- [Owned,Available]
{
	for "_c" from 0 to (count _x - 1) do {
		private ["_item"];
		_item = _x select _c;
		if (isclass _item) then {

			//--- Not used yet
			if !(_item in _categoryBlacklist) then {

				//--- Scope
				private ["_scope"];
				_scope = getnumber (_item >> "scope");
				if (_scope == 0) then {_scope = 2;};
				if (_scope > 1 && (_item call _conditionShow)) then {
					private ["_show"];

					//--- Check display condition
					_show = [_item,"show"] call bis_fnc_heliportCondition;
					_hide = [_item,"hide"] call bis_fnc_heliportCondition;
					if ((call compile _show) && !(call compile _hide)) then {
						private ["_isOwned"];

						//--- Add to correct list
						_isOwned = [hsim_heliportDB,_categoryDB + [configname _item]] call BIS_fnc_dbClassCheck;

						_list = _categoryList select !_isOwned;
						_list set [count _list,_item];
						_categoryBlacklist = _categoryBlacklist + ([_item] call bis_fnc_returnparents);
					};
				};
			};
		};
	};
} foreach _categoryParents;

//--- ToDo: Sort owned items by time of purchase?

//--- Add to menu
{
	private ["_isOwned"];
	_isOwned = _foreachindex < 1;

	//--- Fill the menu
	{
		private ["_item","_configName","_displayName","_libTextDesc","_enable","_enableText","_forced","_price"];

		_item = _x;
		_configName = configname _item;
		_displayName = _item call bis_fnc_displayName;
		_libTextDesc = gettext (_item >> "libTextDesc");
		_enable = [_item,"enable"] call bis_fnc_heliportCondition;
		_enableText = gettext (_item >> "enableText");
		_forced = getnumber (_item >> "forced");
		_price = getnumber (_item >> "price");
		_default = getnumber (_item >> "default");

		//--- Add item
		_lbId = _control lbadd _displayName;
		_control lbsetdata [_lbId,_configName];
		_control lbsetvalue [_lbId,[0,1] select _isOwned];

		//--- Icon
		if (_isOwned) then {
			private ["_active"];
			_control lbsetpicture [_lbId,"hsim\UI_H\data\icons\checkbox\ok.paa"];

			_active = [hsim_heliportDB,_categoryDB + [configname _item,"active"],true] call BIS_fnc_dbValueReturn;
			if !(isnil "_active") then {
				if !(_active) then {
					_control lbsetpicture [_lbId,"hsim\UI_H\data\icons\checkbox\ok_faded.paa"];
				};
			};
		} else {
			_control lbsetpicture [_lbId,"hsim\UI_H\data\icons\checkbox\empty.paa"];
		};

		//--- Disable item
		if (
			(
				!(call compile _enable)
				||
				(call BIS_fnc_heliportMoney) + _price < 0
				||
				!(_item call _conditionEnable)
			)
			&&
			!_isOwned
		) then {
			_lbcolor = _control lbcolor _lbId;
			_lbcolor set [3,(_lbColor select 3) / 2];
			_control lbsetcolor [_lbId,_lbcolor];
			_control lbsetpicture [_lbId,"hsim\UI_H\data\icons\checkbox\fail.paa"];
			_control lbsetvalue [_lbId,-1];
		};

		//--- Auto-select
		if (_default > 0 && !_isOwned) then {
			_control lbsetcursel _lbId;
			_control lbsetpicture [_lbId,"hsim\UI_H\data\icons\checkbox\active.paa"];
		};

	} foreach _x;
} foreach _categoryList;
_lbId