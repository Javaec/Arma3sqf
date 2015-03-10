private ["_mode","_logic","_sideA","_sideB","_curator","_showNotification","_sides","_otherSide","_otherSideName","_iconEnemy","_iconFriend"];

_mode = [_this,0,"init",[""]] call bis_fnc_param;
_logic = [_this,1,objnull,[objnull]] call bis_fnc_param;
_sideA = [_this,2,sideUnknown,[sideUnknown]] call bis_fnc_param;
_sideB = [_this,3,sideUnknown,[sideUnknown]] call bis_fnc_param;
_curator = [_this,4,objnull,[objnull]] call bis_fnc_param;
_showNotification = [_this,5,true,[true]] call bis_fnc_param;

_sides = [_sideA,_sideB];
_sides = _sides - [playerside];
_otherSide = if (count _sides == 1) then {_sides select 0} else {sideunknown};
_otherSideName = _otherSide call bis_fnc_sideName;

_iconEnemy = format ["<img image='%1' width='18px' /> ",gettext (configfile >> "CfgNotifications" >> "TridentEnemies" >> "iconPicture")];
_iconFriend = format ["<img image='%1' width='18px' /> ",gettext (configfile >> "CfgNotifications" >> "TridentFriendly" >> "iconPicture")];

switch _mode do {
	case "init": {

		//--- Add damage detection handler to all units
		{
			_side = _x call bis_fnc_objectside;
			if (_side in [_sideA,_sideB]) then {
				_x call bis_fnc_tridentHandleDamage;
			};
		} foreach ((entities "allvehicles") - (entities "animal"));

		//--- Vehicle respawn
		[missionnamespace,"respawn",{[[_this select 0],"bis_fnc_tridentHandleDamage"] call bis_fnc_mp;}] call bis_fnc_addscriptedeventhandler;

		//--- Explain Trident for player
		if (_otherSide in _sides) then {
			private ["_description","_areFriendly","_mode"];
			_description = _logic getvariable ["description",""];
			if (_description == "") then {_description = localize "str_a3_cfgvehicles_moduletrident_f_description";};

			player creatediarysubject ["bis_fnc_tridentClient",localize "str_a3_cfgvehicles_moduletrident_f_subject"];
			player creatediaryrecord ["bis_fnc_tridentClient",[_otherSideName,format [_description,_otherSideName,_iconEnemy,_iconFriend]]];

			_areFriendly = [_sideA,_sideB] call bis_fnc_areFriendly;
			_mode = ["enemy","friend"] select _areFriendly;
			[_mode,_logic,_sideA,_sideB,objnull,false] call bis_fnc_tridentClient;
		};

		//--- Add custom channels
		_channels = _curator getvariable ["BIS_fnc_moduleTrident_channels",[]];
		if (count _channels == 3) then {
			if (playerside == _sideA) then {(_channels select 0) radiochanneladd [player]; (_channels select 2) radiochanneladd [player];};
			if (playerside == _sideB) then {(_channels select 1) radiochanneladd [player]; (_channels select 2) radiochanneladd [player];};
			[
				_curator,
				"curatorUnitAssigned",
				{
					_curator = _this select 0;
					_channels = _curator getvariable ["BIS_fnc_moduleTrident_channels",[]];
					if (count _channels == 3) then {
						(_channels select 0) radiochanneladd [player];
						(_channels select 1) radiochanneladd [player];
					};
				}
			] call bis_fnc_addscriptedeventhandler;
		};
	};

	case "friend": {
		if (_showNotification) then {
			["TridentFriendly",[_sideA call bis_fnc_sideName,_sideB call bis_fnc_sideName,_otherSide]] call bis_fnc_showNotification;
		};

		private ["_text","_record"];
		_text = gettext (configfile >> "CfgNotifications" >> "TridentFriendly" >> "description");
		_record = _iconFriend + format [_text,_sideA call bis_fnc_sideName,_sideB call bis_fnc_sideName];
		player creatediaryrecord ["bis_fnc_tridentClient",[localize "str_a3_diary_situation_title",_record]];
	};

	case "enemy": {
		if (_showNotification) then {
			["TridentEnemies",[_sideA call bis_fnc_sideName,_sideB call bis_fnc_sideName,_otherSide]] call bis_fnc_showNotification;
		};

		private ["_text","_record"];
		_text = gettext (configfile >> "CfgNotifications" >> "TridentEnemies" >> "description");
		_record = _iconEnemy + format [_text,_sideA call bis_fnc_sideName,_sideB call bis_fnc_sideName];
		player creatediaryrecord ["bis_fnc_tridentClient",[localize "str_a3_diary_situation_title",_record]];
	};
};