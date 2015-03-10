_mrkrName = ("BIS_site_" + str ((BIS_missionScope getVariable "sites") find _this));
_mrkrName setMarkerPos _centerPos;

_this call BIS_siteInteraction;

private ["_occupation"];