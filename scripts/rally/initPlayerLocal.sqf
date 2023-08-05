//AceGrassCutter to all players
_AceGrassCut = ["grass_cut", "Cut Grass", "",
	{
		[player] call ace_common_fnc_goKneeling; 
		[player, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;
		[10, [], {
			_cutter = "Land_ClutterCutter_large_F" createVehicle [0, 0, 0];
			_cutter setPos (getPos player);
			hint "Grass Cut";
		}, {
			hint "Cutting interrupted";
		}, "Cutting Grass"] call ace_common_fnc_progressBar;
	},
	{true}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _AceGrassCut] call ace_interact_menu_fnc_addActionToObject;

// Adds Squad Rally Point deployment ability and respawn creation for the West side when players become team lead.
_WsquadRP = ["Wsquad_rp", "Deploy Squad RP", "",
	{
		_num = player nearEntities ['Man', 15];
		if (leader player == player) then {
			if (count _num > 1) then {
				[player] call ace_common_fnc_goKneeling; 
				[player, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;
				[20, [], {
					RP_west setVehiclePosition [(player modelToWorld[0, 2, 0]), [], 0.5, "CAN_COLLIDE"];
					deployedRP setVehiclePosition [(player modelToWorld[1.5, 0, 0]), [], 0.2, "CAN_COLLIDE"];
					hint "Rally Point Deployed";
					// playSound "deploy.ogg"; // Added sound effect
					"RPMARK_1" setMarkerPos player;
				}, {
					hint "Deploying interrupted";
				}, "Deploying Rally Point"] call ace_common_fnc_progressBar;

				// Create Respawn for West side
				respawnPosWest = [player] call BIS_fnc_respawnTickets_createRespawn;
				respawnPosWest setMarkerPos (player modelToWorld [0, 2, 0]);

			} else {
				hint 'Need more allies nearby to deploy Rally Point';
			}
		} else {
			hint 'Become the Team leader via ACE interactions and try again';
		}
	},
	{true}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _WsquadRP] call ace_interact_menu_fnc_addActionToObject;