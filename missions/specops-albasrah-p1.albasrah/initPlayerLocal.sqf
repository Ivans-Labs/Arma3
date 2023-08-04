//AceGrassCutter to all players
_AceGrassCut = ["grass_cut","Cut Grass","",
	{[player] call ace_common_fnc_goKneeling; [player, "AinvPknlMstpSnonWnonDnon_medic_1",1] call ace_common_fnc_doAnimation;
	[10,[],{_cutter = "Land_ClutterCutter_large_F" createVehicle [0,0,0];
	 _cutter setPos (getPos player); hint "Grass Cut"},{hint "Cutting interupted"},"Cutting Grass"] call ace_common_fnc_progressBar
	},{true}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _AceGrassCut] call ace_interact_menu_fnc_addActionToObject;

// Adds Platoon Rally Point deployment ability to all players when they become team lead.
_WplatoonRP = ["Wplatoon_rp","Deploy Platoon RP","",
	{
	_num = player nearEntities ['Man',15];
	if(leader player == player) then
		{
			if(count _num >1) then
				{
					[player] call ace_common_fnc_goKneeling; [player, "AinvPknlMstpSnonWnonDnon_medic_1",1] call ace_common_fnc_doAnimation;
					[20,[],{RP_west setVehiclePosition [(player modelToWorld[0,2,0]), [],0.5, "CAN_COLLIDE"]; wsquadRP1 setVehiclePosition [(player modelToWorld[1.5,1.5,0]), [],0.2, "CAN_COLLIDE"]; wsquadRP2 setVehiclePosition [(player modelToWorld[-1.5,3,0]), [],0.2, "CAN_COLLIDE"]; wsquadRP3 setVehiclePosition [(player modelToWorld[-1.5,1,0]), [],0.2, "CAN_COLLIDE"]; hint "Rally Point Deployed";"RPMARK_1" setmarkerpos player;},{hint "Deploying interrupted"},"Deploying Rally point"] call ace_common_fnc_progressBar
				}
			else
				{
					hint 'Need more allies nearby to deploy Rally Point'
				}
		}
	else
		{
			hint 'Become the Team leader via ACE interactions and try again'
		}
	},{true}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _WplatoonRP] call ace_interact_menu_fnc_addActionToObject;
