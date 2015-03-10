_mrkrName = ("BIS_site_" + str ((BIS_missionScope getVariable "sites") find _this));
_mrkrName setMarkerPos _centerPos;

//Set area marker
_sectorArea = triggerArea (_this getVariable "visitedTrg");
_ringName = ("BIS_sectorRing_" + str ((BIS_missionScope getVariable "sites") find _this));
createMarkerLocal [_ringName, position _this];
_ringName setMarkerShapeLocal "ELLIPSE"; 
_ringName setMarkerSizeLocal [200,200];
_ringName setMarkerBrushLocal "Border";