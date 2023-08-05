// Defining the function createZeusModule
createZeusModule = {
  // Creating the Zeus Module
  private _curator = "ModuleCurator_F" createVehicle position player;

  // Setting the attributes of the Zeus Module
  _curator setVariable ["owner", "zeus", true];
  _curator setVariable ["Addons", 3, true]; // All (including unofficial ones)
  _curator setVariable ["CuratorInfoType", 0, true];

  // Setting the Event Handlers for the Zeus Module
  _curator addEventHandler ["CuratorObjectPlaced",
      {
          params ["_curatorLogic", "_type", "_pos"];
          if (_type == "mil_dot") then
          {
              hint _type;
          };
      }];
};

// Calling the function
[] call createZeusModule;