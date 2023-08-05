_smallBuildings = ["Land_Shed_W02", "Land_House_C_11_EP1", "Land_House_C_10_EP1"]; // Add your small building classnames
_largeBuildings = ["Land_Ind_Workshop01_04", "Land_Mil_Barracks", "Land_A_Castle_Bergfrit"]; // Add your large building classnames
_radius = 300; // Adjust to set the radius of random building placement

_buildingPlacement = {

  params ["_trigger", "_buildingSize"];
  
  _buildingsArray = switch (_buildingSize) do {
    case "small": {_smallBuildings};
    case "large": {_largeBuildings};
    default {hint "Invalid building size";};
  };
  
  if (count _buildingsArray > 0) then {

    _position = getPosATL _trigger;
    _randomPosition = [_position select 0, _position select 1, _radius] call BIS_fnc_randomPos;

    if (surfaceIsWater _randomPosition) then {
      hint "The location is unsuitable for building (Water surface)."
    } else {
      _randomBuilding = selectRandom _buildingsArray;
      _building = createVehicle [_randomBuilding, _randomPosition, [], 0, "CAN_COLLIDE"];
      _dir = direction _trigger;
      
      _building setDir _dir;
      
      _terrainHeight = ASLToATL (getPosASL _building) select 2;
      _building setPosATL [_randomPosition select 0, _randomPosition select 1, _terrainHeight];
    };
    
  };

};

btriggersmall setTriggerActivation ["WEST", "PRESENT", true];
btriggersmall setTriggerStatements ["this", format["[_thisTrigger, 'small'] call _buildingPlacement;"], ""];

btriggerlarge setTriggerActivation ["WEST", "PRESENT", true];
btriggerlarge setTriggerStatements ["this", format["[_thisTrigger, 'large'] call _buildingPlacement;"], ""];