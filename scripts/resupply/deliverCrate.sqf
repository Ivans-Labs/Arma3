// Called when the player uses the "Deliver Crate" action
params ["_player", "_crate"];

// Retrieve the information
_zoneInfo = missionNamespace getVariable "zoneInfo";
_currentPoints = _zoneInfo select 3;

// Update points
_newPoints = _currentPoints + 100; // Increment points by 100, need to add based on crate points.
_zoneInfo set [3, _newPoints]; // Update the points in the zone info
missionNamespace setVariable ["zoneInfo", _zoneInfo]; // set Namespace var

hint "Crate delivered";
