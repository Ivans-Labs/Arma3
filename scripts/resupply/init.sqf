_zoneName = "Zone1";
_zonePos = [1500, 2500, 0];
_zoneRadius = 50;
_markerName = "marker_zone1";

_marker = createMarker [_markerName, _zonePos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [_zoneRadius, _zoneRadius];
_marker setMarkerColor "ColorBlue";
_marker setMarkerText format ["%1: 0 Points", _zoneName]; // Initial marker text showing 0 points

missionNamespace setVariable ["zoneInfo", [_zoneName, _zonePos, _markerName, 0]]; // Last 0 is initial points

_crate = crate1;
_crate addAction ["Deliver Crate", "deliverCrate.sqf"]; // Adds action to crates.