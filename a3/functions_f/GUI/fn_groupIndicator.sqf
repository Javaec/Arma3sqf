//--- Function called before display - create display and terminate
if (count _this == 0) exitwith {([] call bis_fnc_rscLayer) cutrsc ["RscGroupIndicator","plain",0,false];};

disableserialization;
_mode = [_this,0,"Init",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;

switch _mode do {

	case "Init": {
		disableserialization;
		_display = _this select 0;
		_map = _display displayctrl 13302;
		_map ctrlmapanimadd [0,0.1,[500,50,0]];
		ctrlmapanimcommit _map;

		//--- Calculate map size
		_size = (_map ctrlmapscreentoworld [0,0] select 1) - (_map ctrlmapscreentoworld [0,1] select 1);
		_sizeUI = ((ctrlposition _map select 2) * 3/4) max (ctrlposition _map select 3);
		bis_fnc_groupIndicator_sizeCoef = _size / 1000;
		bis_fnc_groupIndicator_sideColors = [
			sideunknown call bis_fnc_sidecolor,	//--- UNKNOWN
			east call bis_fnc_sidecolor,		//--- OPFOR
			west call bis_fnc_sidecolor,		//--- BLUFOR
			resistance call bis_fnc_sidecolor,	//--- INDEPENDENT
			civilian call bis_fnc_sidecolor		//--- CIVILIAN
		];
		bis_fnc_groupIndicator_iconSelect = gettext (configfile >> "cfgmarkers" >> "select" >> "icon");

		//--- Fill the user defined area
		_sizeUI = (ctrlposition _map select 2) min ((ctrlposition _map select 3) * 3/4);
		_map ctrladdeventhandler ["draw","with uinamespace do {['Draw',_this] call bis_fnc_groupIndicator;};"];
		//_map ctrlmapanimadd [0,0.0008 / (_sizeUI * bis_fnc_groupIndicator_sizeCoef),[50,50]];
		_map ctrlmapanimadd [0,0.00074 / (_sizeUI * bis_fnc_groupIndicator_sizeCoef),[50,50]];
		ctrlmapanimcommit _map;
	};


	#define colorTexture	"#(argb,8,8,3)color(1,1,1,0.15)"
	#define colorOutline	[0,0,0,0.75]
	case "Draw": {
		disableserialization;
		_map = _this select 0;

		_dirPlayer = direction player;
		//_dirPlayer = [[0,0,0],eyeDirection player] call bis_fnc_dirto;
		_map drawellipse [[50,50],1,1,0,[1,1,1,1],colorTexture];
		_map drawellipse [[50,50],2,2,0,[1,1,1,1],colorTexture];
		_map drawellipse [[50,50],3,3,0,[1,1,1,1],colorTexture];
		_map drawellipse [[50,50],1,1,0,colorOutline,""];
		_map drawellipse [[50,50],2,2,0,colorOutline,""];
		_map drawellipse [[50,50],3,3,0,colorOutline,""];

		//--- Draw compass lines
		_map drawline [[[50,50,0],0,-_dirPlayer] call bis_fnc_relpos,[[50,50,0],3,-_dirPlayer] call bis_fnc_relpos,[0,0,0,1]];
		{
			_map drawline [[[50,50,0],2,-_dirPlayer + _x] call bis_fnc_relpos,[[50,50,0],3,-_dirPlayer + _x] call bis_fnc_relpos,[0,0,0,1]];
		} foreach [90,180,270];

		{
			_map drawline [[[50,50,0],2.75,-_dirPlayer + _x] call bis_fnc_relpos,[[50,50,0],3,-_dirPlayer + _x] call bis_fnc_relpos,[0,0,0,1]];
		} foreach [45,135,225,315];

		//--- Draw units
		{
			_unit = vehicle _x;

			//--- Calculate relative positions
			_pos = [
				[50,50],
				([player,_unit] call bis_fnc_distance2D) / 10,
				([player,_unit] call bis_fnc_dirto) - _dirPlayer
			] call bis_fnc_relpos;
			_posLeader = [
				[50,50],
				([player,leader _unit] call bis_fnc_distance2D) / 10,
				([player,leader _unit] call bis_fnc_dirto) - _dirPlayer
			] call bis_fnc_relpos;

			//--- Select team color
			_team = assignedteam _unit;
			_teamID = ["MAIN","RED","GREEN","BLUE","YELLOW"] find _team;
			_colorTeam = [[0,0,0,0],[1,0,0,0.5],[0,1,0.5,0.5],[0,0.5,1,0.5],[1,1,0,0.5]] select _teamID;

			_map drawEllipse [_pos,.4,.4,0,_colorTeam,"#(argb,8,8,3)color(1,1,1,1)"];

			//--- Select side color
			_sideId = [east,west,resistance,civilian] find (side _unit);
			_colorSide = bis_fnc_groupIndicator_sideColors select (_sideId + 1);

			//--- Draw line to leader
			_map drawline [
				_pos,
				_posLeader,
				[0,1,1,0.5]
			];

			//--- Draw unit icon
			_map drawIcon [
				gettext (configfile >> "cfgvehicles" >> (typeof _unit) >> "icon"),
				_colorSide,
				_pos,
				20,
				20,
				direction _unit - _dirPlayer,
				"",
				false
			];
		} foreach units player;
	};

	case "Exit": {
		([] call bis_fnc_rscLayer) cuttext ["","plain"];
		bis_fnc_groupIndicator_onLoad call bis_fnc_onload;

		bis_fnc_groupIndicator_onLoad = nil;
		bis_fnc_groupIndicator_sizeCoef = nil;
		bis_fnc_groupIndicator_sideColors = nil;
	};
};