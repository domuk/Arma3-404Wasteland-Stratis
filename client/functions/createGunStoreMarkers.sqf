//	@file Version: 1.0
//	@file Name: createGunStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

_gunStores = ["gs1", "gs2", "gs3", "gs4"];

//Creates the markers around general stores.
waitUntil {{!isNull(missionNamespace getVariable _x) && ((getPos(missionNamespace getVariable _x) distance [0,0,0]) > 100)} count _gunStores == count _gunStores};
{
	_unit = missionNamespace getVariable _x;

	// Gun store title    
    _markerName = format["marker_shop_title_%1",_x];
    deleteMarkerLocal _markerName;
	_marker = createMarkerLocal [_markerName, getPos _unit];
	_markerName setMarkerShapeLocal "ICON";
    _markerName setMarkerTypeLocal "Dot";
    _markerName setMarkerColorLocal "ColorRed";
	_markerName setMarkerSizeLocal [1,1];
	_markerName setMarkerTextLocal "Gun Store";

} forEach _gunStores;
