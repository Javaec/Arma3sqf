/*
	Author: Karel Moricky

	Description:
	Read positions from KLM file.
	Recommended to execute in loading screen.

	Parameter(s):
	_this: STRING - path to .kml file

	Returns:
	ARRAY of ARRAYs in format [positionXYZ, folder, name, description]
*/
_file = [_this,0,"hsim\Doc_H\GoogleEarth\Missions\" + missionname + ".kml",[""]] call bis_fnc_param;

_xml = _file call bis_fnc_dbImportXML;

_listPos = [];
_folder = "";

_fnc_point = {
	_pathTemp = +_path;
	_folderTemp = _folder;
	private ["_path","_folder"];
	_path = _pathTemp + [_this];
	_folder = _folderTemp;

	_point = [_xml,_path + ["POINT","COORDINATES"]] call bis_fnc_dbValueReturn;
	_linestring = [_xml,_path + ["LINESTRING","COORDINATES"]] call bis_fnc_dbValueReturn;
	_polygon = [_xml,_path + ["POLYGON","OUTERBOUNDARYIS","LINEARRING","COORDINATES"]] call bis_fnc_dbValueReturn;
	if (!isnil "_point" || !isnil "_linestring" || !isnil "_polygon") then {

		//--- Name
		_name = [_xml,_path + ["name"],""] call bis_fnc_dbValueReturn;
		_description = [_xml,_path + ["description"],""] call bis_fnc_dbValueReturn;
		_description = str (parsetext _description);
		_type = -1;
		_pos = [0,0,0];

		if (!isnil "_point") then {

			//--- Point
			_type = 0;
			_pos = call compile format ["[%1]",_point];
			_posX = _pos select 0;
			_posY = _pos select 1;
			_posZ = _pos select 2;

			//--- On ground
			_altitudeMode = [_xml,_path + ["POINT","ALTITUDEMODE"],""] call bis_fnc_dbValueReturn;
			if (_altitudeMode == "relativeToGround") then {_posZ = 0;};

			_pos = ([_posX,_posY] call bis_fnc_posDegToWorld) + [_posZ];
		} else {

			_posArray = [];

			//--- Line
			if (!isnil "_linestring") then {
				_type = 1;
				_posArray = toarray _linestring;
			};

			//--- Polygon
			if (!isnil "_polygon") then {
				_type = 2;
				_posArray = toarray _polygon;
			};

			{if (_x == 32) then {_posArray set [_foreachIndex,44]}} foreach _posArray;
			_posArray = call compile format ["[%1 0]",tostring _posArray];
			_pos = [];
			for "_i" from 0 to (count _posArray - 3) step 3 do {
				_posX = _posArray select (_i);
				_posY = _posArray select (_i+1);
				_posZ = _posArray select (_i+2);
				_pos = _pos + [([_posX,_posY] call bis_fnc_posDegToWorld) + [_posZ]];
			};	

		};


		//--- Save
		_listPos set [
			count _listPos,
			[
				_type,
				_pos,
				_folder,
				_name,
				_description
			]
		];

		//[111,_pos,_name,_folder,_description] call bis_fnc_log;

	} else {

		//--- We need to go deeper
		_folder = [_xml,_path + ["name"],_folder] call bis_fnc_dbValueReturn;
		{
			_x call _fnc_point;
		} foreach ([_xml,_path] call bis_fnc_dbClassList);
	};
};


_path = ["kml","document"];
_document = [_xml,_path] call bis_fnc_dbClassList;

{
	_x call _fnc_point;
} foreach _document;

//--- Output
_listPos call bis_fnc_log;
_listPos