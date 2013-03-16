// TODO: Fix that convoy get sometimes stuck ob objects on the road.

private ["_missionMarkerName","_missionType","_picture","_vehicleName","_hint","_waypoint","_waypoints","_group","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader"];

#include "mainMissionDefines.sqf"

_missionMarkerName = "Convoy_Marker";
_missionType = "Convoy";

diag_log format["WASTELAND SERVER - Main Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1", _missionType];
[mainMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1", _missionType];

_group = createGroup civilian;

// Factory function for vehicle creation
_createVehicle = {
    private ["_type","_position","_direction","_group","_vehicle","_soldier"];
    
    _type = _this select 0;
    _position = _this select 1;
    _direction = _this select 2;
    _group = _this select 3;
    
    _vehicle = _type createVehicle _position;
    _vehicle setDir _direction;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    _group addVehicle _vehicle;
    
    // Spawn crew
    _soldier = [_group, _position] call createRandomSoldier; 
    _soldier moveInDriver _vehicle;
    _soldier = [_group, _position] call createRandomSoldier; 
    _soldier moveInCargo [_vehicle, 0];
    _soldier = [_group, _position] call createRandomSoldier; 
    _soldier moveInCargo [_vehicle, 1];
    _soldier = [_group, _position] call createRandomSoldier; 
    if (_vehicle isKindOf "B_Hunter_F") then {
        _soldier moveInCargo [_vehicle, 2];
    } else {
        _soldier moveInTurret [_vehicle, [0]];
    };
    
    _vehicle
};

// Create vehicles
_vehicles = [];
_vehicles set [0, ["B_Hunter_HMG_F", [3272.0862, 6818.0166, 4.1839767], 110, _group] call _createVehicle];
_vehicles set [1, ["B_Hunter_F", [3256.6409, 6823.4746, 3.8003173], 110, _group] call _createVehicle];
_vehicles set [2, ["B_Hunter_RCWS_F", [3240.3447, 6829.6089, 4.275979], 110, _group] call _createVehicle];

// Set the driver of the first vehicle as leader
_leader = driver (_vehicles select 0);
_group selectLeader _leader;
_leader setRank "LIEUTENANT";

// Set default group behaviour
_group setCombatMode "GREEN";
_group setBehaviour "SAFE";
_group setFormation "STAG COLUMN";
_group setSpeedMode "LIMITED";

// Add waypoints
_waypoints = [
    [4376.2495,6777.9741,129.06226],
    [4093.5972,6355.2212,124.87359],
    [4795.2671,6547.9424,122.12956],
    [4989.0015,6177.1587,157.54677],
    [4650.4116,5920.8677,140.14188],
    [5209.6572,5804.0298,159.34062],
    [5355.2534,5447.2158,172.12018],
    [5179.1089,5317.814,190.49104],
    [5332.6191,4984.7158,205.06071],
    [5034.1582,4551.7168,178.10799],
    [4453.8467,4265.6416,192.45946],
    [4256.2026,3987.7041,203.7189],
    [4278.4458,3617.1807,216.10374],
    [3811.5823,3352.3765,168.52522],
    [3782.2229,2991.4355,163.68361],
    [2796.7263,1814.6265,150.85146],
    [3121.2034,1679.9956,107.86488],
    [2620.1548,612.56152,64.304039]
];
{
    _waypoint = _group addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointCombatMode "GREEN"; // Defensiv behaviour
    _waypoint setWaypointBehaviour "SAFE"; // Force convoy to normaly drive on the street.
    _waypoint setWaypointFormation "STAG COLUMN";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

// Create marker
_marker = createMarker [_missionMarkerName, position leader _group];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Convoy";

// Display mission message
_picture = getText (configFile >> "CfgVehicles" >> "B_Hunter_F" >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> "B_Hunter_F" >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> is convoyed by two armored vehicles. Stop them!</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Main Mission Waiting to be Finished: %1", _missionType];

_failed = false;
_startTime = floor(time);
_numWaypoints = count waypoints _group;
waitUntil
{
    private ["_unitsAlive"];
    
    sleep 10; 
    
    _marker setMarkerPos (position leader _group);
    
    if ((floor time) - _startTime >= mainMissionTimeout) then { _failed = true };
    if (currentWaypoint _group >= _numWaypoints) then { _failed = true }; // Convoy got successfully to the target location
    _unitsAlive = { alive _x } count units _group;
    
    _unitsAlive == 0 || _failed
};

if(_failed) then
{
    // Mission failed
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
    // Mission complete

    // Spawn loot at last marker position
    _ammobox = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox;
    clearWeaponCargoGlobal _ammobox;
    // TODO: Fine tune and balance loot.
    // Rocket launchers
    [_ammobox, "launch_NLAW_F", 2] call BIS_fnc_addWeapon;
    [_ammobox, "launch_NLAW_F", 2] call BIS_fnc_addWeapon;
    // Guns
    [_ammobox, "arifle_TRG21_GL_F", 3] call BIS_fnc_addWeapon;
    [_ammobox, "arifle_TRG21_F", 3] call BIS_fnc_addWeapon;
    [_ammobox, "arifle_MX_SW_F", 3] call BIS_fnc_addWeapon;
    [_ammobox, "arifle_MX_GL_F", 3] call BIS_fnc_addWeapon;
    // Grenades
    _ammobox addMagazine ["HandGrenade", 5];
    
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The convoy has been sucessfully stopped. Now the weapons and cars are yours.</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};

deleteMarker _marker;
