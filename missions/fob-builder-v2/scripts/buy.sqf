fnc_buyItem = {
    params ["_player", "_itemArray"];

    _side = side _player;
    _price = _itemArray select 0;
    _side_points = switch (_side) do {
        case blufor: {blufor_points};
        case opfor: {opfor_points};
        // Add cases for other sides if needed
    };

    if (_side_points < _price) then {
        hint "Not enough points to purchase this item!";
    } else {
        // Deduct points and create the object
        _side_points = _side_points - _price;
        
        // Get necessary values from the array
        _className = _itemArray select 2;
        _rotation = _itemArray select 3;
        _explosive = _itemArray select 5;
        _invincible = _itemArray select 6;
        _hasAI = _itemArray select 7;

        // Create the object
        _object = createVehicle [_className, position _player, [], 0, "NONE"];
        _object setPos [getPos _player select 0, getPos _player select 1, 0]; // Set position to the player's position
        _object setDir _rotation; // Set direction
        
        // Set object as explosive if necessary
        if (_explosive == 1) then {
            _object addEventHandler ["Hit", {deleteVehicle _this select 0}];
        };

        // Set object as invincible if necessary
        if (_invincible == 1) then {
            _object allowDamage false;
        };

        // Add AI to the object if necessary
        if (_hasAI) then {
            // Implement AI adding logic here
        };

        hint format ["You have purchased %1!", _itemArray select 1];
    };
};