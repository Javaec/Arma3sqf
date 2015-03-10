_farmer = _this select 0;
_farmerGrp = group _farmer;
_site = _farmer getVariable "inSite";
_dist = 100;

_wp1 = _farmerGrp addWaypoint [position _site, random _dist];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "SAFE";
_wp1 setWaypointTimeout [5, 10, 15];

_wp2 = _farmerGrp addWaypoint [position _site, random _dist];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointBehaviour "SAFE";
_wp2 setWaypointTimeout [5, 10, 15];

_wp3 = _farmerGrp addWaypoint [position _site, random _dist];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "LIMITED";
_wp3 setWaypointBehaviour "SAFE";
_wp3 setWaypointTimeout [5, 10, 15];

_wp4 = _farmerGrp addWaypoint [position _site, random _dist];
_wp4 setWaypointType "MOVE";
_wp4 setWaypointSpeed "LIMITED";
_wp4 setWaypointBehaviour "SAFE";
_wp4 setWaypointTimeout [5, 10, 15];

_wp5 = _farmerGrp addWaypoint [waypointPosition _wp1, 0];
_wp5 setWaypointType "CYCLE";
_wp5 setWaypointSpeed "LIMITED";
_wp5 setWaypointBehaviour "SAFE";