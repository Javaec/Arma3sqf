/*--------------------------------------------------------------------------------------------------

	DENNY FLEEING

--------------------------------------------------------------------------------------------------*/
private["_enemy"];

_enemy = (allMissionObjects "Man") - [player];

{
	(group _x) allowFleeing 0;
}
forEach _enemy;

/*--------------------------------------------------------------------------------------------------

	CREATE WALKING BOTS

--------------------------------------------------------------------------------------------------*/

if (isNil "BIS_DebugMode") then
{
	BIS_DebugMode = false;
};

private["_center","_radius","_group","_class","_pairs","_poi"];

{
	_pairs = [];

	if (true) then
	{
		_poi	= _x;
		_center = ["POIs",_poi,"center"] call BIS_fnc_getCfgData;

		if (_center == "auto") then
		{
			_center = format["BIS_%1_%2",_poi,"center"];
		};

		if (typeName _center == typeName "") then
		{
			_center	= missionNamespace getVariable [_center,objNull];
		};

		_radius = ["POIs",_poi,"size"] call BIS_fnc_getCfgData;

		{
			if (true) then
			{
				_group = format ["BIS_%1_group%2",_poi,_x];
				_class = format ["Sign_Arrow_%1_F",_x];

				_group = missionNamespace getVariable [_group,grpNull];

				if (isNull _group) exitWith {};

				_pairs = _pairs + [[_group,_class]];

			};

		}
		forEach ["Yellow","Blue","Pink","Green","Cyan"];

		[_pairs,_center,_radius,BIS_DebugMode] call BIS_fnc_camp_patrol;

		//draw circle showing the waypoint detection radius
		if (BIS_DebugMode) then
		{
			private["_circle"];

			_circle = format["WpDetectionRadiusMarker%1",(["CircleMarkerCounter",1] call BIS_fnc_counter)];

			createMarker [_circle, getPos _center];
			_circle setMarkerShape "ELLIPSE";
			_circle setMarkerBrush "Border";
			_circle setMarkerColor "ColorRed";
			_circle setMarkerSize [_radius,_radius];
			_circle setMarkerDir 0;
			_circle setMarkerAlpha 0.5;
		};
	};
}
forEach BIS_POIs;