#define DISPLAY		(uinamespace getvariable 'hsim_RscClouds')
#define CONTROL		(DISPLAY displayctrl _idc)
#define RSC_LAYER	759

disableserialization;
_display = [_this,0,displaynull,[displaynull]] call bis_fnc_param;
_mode = [_this,1,0,[0]] call bis_fnc_param;

if (_mode == 1) then {
	with uinamespace do {

		if (isnil "hsim_RscCloudsCode" || isnull _display/* || true /*ToDo: Remove debug*/) then {
			hsim_RscCloudsCode = {
				_displaySet = {

					//--- Create
					RSC_LAYER cutrsc ['RscClouds','plain'];
					waituntil {!isnil {DISPLAY}};
					waituntil {!isnull DISPLAY};
					_fadein = 0.2;
/*
					//--- Blue background
					if (!isnull player) then {
						_idc = _idcBase - 2;
						CONTROL ctrlsettext "A3\ui_f\data\ui_gradient_top_ca.paa";
						CONTROL ctrlsettextcolor [
							0.470588,	//100/255 * 1.2,
							0.611765,	//130/255 * 1.2,
							0.847059,	//180/255 * 1.2,
							1
						];
						CONTROL ctrlsetposition [safezoneX,safezoneY,safezoneW,safezoneH];
						CONTROL ctrlsetfade 1;
						CONTROL ctrlcommit 0;
						CONTROL ctrlsetfade 0;
						CONTROL ctrlcommit _fadein;
					};

					//--- Easter Egg - Sun ;)
					if (_jokeCartoon) then {
						_idc = _idcBase - 1;
						CONTROL ctrlsettext "A3\ui_f\data\editor_jasno.paa";
						_sizeH = safezoneH / 5;
						CONTROL ctrlsetposition [safezoneX,safezoneY,_sizeH * 3/4,_sizeH];
						CONTROL ctrlsettextcolor [1,1,0,1];
						CONTROL ctrlsetfade 1;
						CONTROL ctrlcommit 0;
						CONTROL ctrlsetfade 0;
						CONTROL ctrlcommit _fadein;
					};
*/

					//--- Logo
					_idc = _idcBase + _countClouds + 1;
					CONTROL ctrlsettext "\HSim\UI_H\data\helisim_logo_ca.paa";
					_sizeH = safezoneH / 3;
					_sizeW = _sizeH * 3/4;
					CONTROL ctrlsetposition [
						safezoneX + safezoneW - _sizeW * 1.2,
						safezoneY - _sizeH * 0.2,
						_sizeW,
						_sizeH
					];
					CONTROL ctrlsetfade 1;
					CONTROL ctrlcommit 0;
					CONTROL ctrlsetfade 0;
					CONTROL ctrlcommit _fadein;
/*

					for "_i" from 0 to (_countClouds - 1) do {
						_ii = _i % 4;
						_i1 = 1 + _i;
						_idc = _idcBase + _ii;
						_pos = ctrlposition CONTROL;

						//--- Create
						_path = 'A3\Data_F\data\mrak_0%1_ca.paa';
						_size =  _i + 1;
						_sizeH = (safezoneH) * sqrt(_i1);
						if (_jokeCartoon) then {
							_sizeH = _sizeH / 3;
							_path = "A3\ui_f\data\editor_zatazeno.paa";
						};
						_sizeW = _sizeH * 3/4;
						_pos = [
							safezoneX + ((-safezoneW/2) + random (safezoneW)),
							safezoneY - _sizeH + (safezoneH / _countClouds)*2 + ((safezoneH / 8 / _countClouds) * (_countClouds - _i)),
							_sizeW,
							_sizeH
						];

						//--- Calculate color based on weather and time
						_color = 1 - (overcast - 0.5)/2 - random 0.1;
						if (daytime > 20.3 || daytime < 3.8) then {_color = 1 - _color};
						_alpha = ((1 / (_size / 4)) max 0.1) * (overcast * 2) max 0.1;

						//--- Apply
						CONTROL ctrlsetposition _pos;
						CONTROL ctrlsettext format [_path,(_i + _iadd) % 4 + 1];
						CONTROL ctrlsettextcolor [_color,_color,_color+0.05,_alpha];
						//CONTROL ctrlsettext format ["#(argb,8,8,3)color(%1,%2,%3,0.5)",random 1,random 1,random 1];
						CONTROL ctrlsetfade 1;
						CONTROL ctrlcommit 0;
						CONTROL ctrlsetfade 0;
						CONTROL ctrlcommit _fadein;
					};
*/
				};
				disableserialization;
				_dX = (_this select 1) min 0.4 max -0.4;
				//_dx = (sqrt (abs _dx) * _dx);
				_dY = 0;//_this select 2;
				_countClouds = 4;
				_idcBase = 1200 + 2;
				_iadd = floor random 4;

				//--- Easter Egg - Cartoon Clouds (0.1% chance)
				//_jokeCartoon = random 1 < 0.0001;

				//--- Exists?
				if (isnil {DISPLAY}) then {
					[] call _displaySet;
				} else {
					if (isnull DISPLAY) then {
						[] call _displaySet;
					};
				};
/*
				if (isnil {DISPLAY}) exitwith {};
				if (isnull DISPLAY) exitwith {};

				//--- Not enough movement - terminate
				_autoMove = false;
				_delay = if ((abs _dX) < 0.2) then {
					_autoMove = true;
					_dX = -1 + random 2;
					64
				} else {
					32
				};


				for "_i" from 0 to (_countClouds - 1) do {
					_ii = _i % 4;
					_idc = _idcBase + _ii;

					if (ctrlcommitted CONTROL || !_autoMove) then {

						//--- Refresh
						_pos = ctrlposition CONTROL;
						_posX = _pos select 0;
						_posY = _pos select 1;
						_posW = _pos select 2;
						_posH = _pos select 3;
						_posXx = _posX;
						_pos = [
							(_posXx - _dx) max (safezoneX - _posW/2) min (safezoneX + safezoneW - _posW/2),
							_posY,
							_posW,
							_posH
						];
						CONTROL ctrlsetposition _pos;
						CONTROL ctrlcommit (_delay / (_countClouds - _ii+1));
					};
					if (_jokeCartoon) then {
						_idc = _idcBase - 1;
						CONTROL ctrlsetfade random 0.2;
						CONTROL ctrlcommit 0.01;
					};
				};
*/
			};
		};
	};
	_display displayaddeventhandler ["mousemoving","_this call (uinamespace getvariable 'hsim_RscCloudsCode')"];
	_display displayaddeventhandler ["mouseholding","_this call (uinamespace getvariable 'hsim_RscCloudsCode')"];
} else {
	if (_mode < 0) then {

		//--- Show / Hide
		for "_idc" from 1200 to 1210 do {
			CONTROL ctrlsetfade ((ctrlfade CONTROL + 1) % 2);
			CONTROL ctrlcommit 0.2;
		};
	} else {

		//--- Terminate
		RSC_LAYER cuttext ['','plain'];
	};
};