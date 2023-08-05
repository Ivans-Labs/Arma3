_spawnPos = getMarkerPos "ai_spawn_marker";
_unitType = selectRandom ["B_Soldier_F","B_Officer_F","B_Soldier_GL_F"];

switch (_unitType) do {
    case "B_Soldier_F": {
        _unit = createUnit ["B_Soldier_F", _spawnPos, [], 0, "NONE"];
        _unit addWeapon "arifle_MX_Black_F";
        _unit addMagazine "30Rnd_65x39_caseless_mag";
        _unit addUniform "U_B_CombatUniform_mcam";
        _unit addVest "V_PlateCarrier1_rgr";
        _unit addBackpack "B_AssaultPack_mcamo";
    };
    case "B_Officer_F": {
        _unit = createUnit ["B_Officer_F", _spawnPos, [], 0, "NONE"];
        _unit addWeapon "arifle_MX_Black_F";
        _unit addMagazine "30Rnd_65x39_caseless_mag";
        _unit addUniform "U_B_CombatUniform_mcam";
        _unit addVest "V_PlateCarrier2_rgr";
        _unit addItemToVest "ItemMap";
        _unit addItemToVest "ItemCompass";
        _unit addItemToVest "ItemWatch";
    };
    case "B_Soldier_GL_F": {
        _unit = createUnit ["B_Soldier_GL_F", _spawnPos, [], 0, "NONE"];
        _unit addWeapon "arifle_MX_GL_Black_F";
        _unit addMagazine "30Rnd_65x39_caseless_mag";
        _unit addMagazine "1Rnd_HE_Grenade_shell";
        _unit addUniform "U_B_CombatUniform_mcam";
        _unit addVest "V_PlateCarrierGL_rgr";
        _unit addBackpack "B_AssaultPack_mcamo";
    };
};

_unit setSkill 1;
_unit setPos _spawnPos;
_unit setDir getMarkerDir "ai_spawn_marker";