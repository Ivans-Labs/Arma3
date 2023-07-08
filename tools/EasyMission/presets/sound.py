def generate_script(mission, file):
    return f"""
    // SQF Script generated for mission: {mission}
    private["_sound"];
    _sound = createSoundSource ["{file}", getPos player, [], 0];
    """