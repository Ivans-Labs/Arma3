# Resupply Script

```
Category: Script
MP Compatible: Yes
Author: Ivan
```

<image here>

## Description

Custom script to mimick air control resupply mission from reaction forces.

1. **Checking Variable Values**

To see the value of a global variable, simply type the variable name and execute the command. For example, to check the current points:
```
missionNamespace getVariable "points"
```

2. **Setting Variable Values**

If you want to manually set the value of a variable to test how your script reacts, you can do so by typing:
```
missionNamespace setVariable ["points", 100];  // Sets points to 100
```

3. **Monitoring Changes to a Variable**

To continuously monitor a variable, you can use a loop that repeatedly outputs its value. This is useful for observing changes over time:
```
[] spawn {
    while {true} do {
        hint format ["Current Points: %1", missionNamespace getVariable "points"];
        sleep 1;  // Checks the variable every second
    };
};
```

4. **Debugging with Logs**

For more complex debugging, especially in multiplayer scenarios, logging information to the RPT file can be invaluable:
```
diag_log format ["Current Points: %1", missionNamespace getVariable "points"];
```
