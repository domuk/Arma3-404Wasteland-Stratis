
//	@file Version: 1.0
//	@file Name: pickupBecon.sqf
//	@file Author: [404] Costlyy
//	@file Created: 7/12/2012 23:30
//	@file Args:

// PRECONDITION: Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_stringEscapePercent","_totalDuration","_lockDuration","_iteration","_iterationPercentage","_playerPos","_placedBeacon", "_lockDuration", "_beaconOwner", "_placedBeaconPos", "_playerSide", "_playerUID", "_activeBeacon"];

// PRECONDITION: Check that a player is not currently a car (driving)
if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

_stringEscapePercent = "%"; // Required to get the % sign into a formatted string.
_totalDuration = 30; // This will NOT be easy >:)
_lockDuration = _totalDuration;
_iteration = 0;
_beaconOwner = name vehicle player;
_playerSide = str(playerSide);
_playerUID = getPlayerUID player;
_activeBeacon = false;

// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (BLU).
{
	if(str(_playerUID) == str(_x select 3)) then {
    	_activeBeacon = true;
    };
    
}forEach pvar_beaconListBlu;
// PRECONDITION: Check that the player does not have a currently deployed spawn beacon (RED).
{
    if(str(_playerUID) == str(_x select 3)) then {
    	_activeBeacon = true;	
    };
}forEach pvar_beaconListRed;

// Due to the 'Undefined behaviour' of exitWith inside loops, this is the workaround.
if (_activeBeacon) exitWith {
	player globalChat localize "STR_WL_Errors_BeaconActive";
};
		
player switchMove "AinvPknlMstpSlayWrflDnon_medic"; // Begin the full medic animation...

mutexScriptInProgress = true;

for "_iteration" from 1 to _lockDuration do {
		
	if(vehicle player != player) exitWith {
		player globalChat localize "STR_WL_Errors_BeaconInVehicle";
        player action ["eject", vehicle player];
	};  
    
    if (doCancelAction) exitWith {// Player selected "cancel action".
    	2 cutText ["", "PLAIN DOWN", 1];
        doCancelAction = false;
    	mutexScriptInProgress = false;
	}; 
    
    if (!(alive player)) exitWith {// If the player dies, revert state.
		2 cutText ["Place spawn beacon interrupted...", "PLAIN DOWN", 1];
    	mutexScriptInProgress = false;
	};	
    		    
	if(player distance _currObject > 5) exitWith { // If the player dies, revert state.
		2 cutText ["Place spawn beacon interrupted...", "PLAIN DOWN", 1];
		mutexScriptInProgress = false;
	};                  
                                                        	    
	if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the placement.
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};
    	    
	_lockDuration = _lockDuration - 1;
	_iterationPercentage = floor (_iteration / _totalDuration * 100);
					    
	2 cutText [format["Placing spawn beacon %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
	sleep 1;
					    
	if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that place has completed.
		sleep 1;
		2 cutText ["", "PLAIN DOWN", 1];
				            
		player setVariable["spawnBeacon",0,true];
				
		_playerPos = getPosATL player;
		_placedBeacon = "Satelit" createVehicle (position player); _placedBeacon setPos _playerPos;
		_placedBeacon addEventHandler["handleDamage", {false}];
		_placedBeacon setVariable["R3F_LOG_disabled", true];      
		_placedBeacon setVariable["faction",_playerSide,true];
	    _placedBeacon setVariable["ownerName",_beaconOwner,true];
	    _placedBeacon setVariable["ownerUID",_playerUID,true]; 
		_placedBeacon enableSimulation false;	
	    _placedBeaconPos = getPos _placedBeacon;
	   
	    if(_playerSide == "WEST") then {
	    	pvar_beaconListBlu set [count pvar_beaconListBlu,[_beaconOwner, _placedBeaconPos, 100, _playerUID]];
	    	publicVariable "pvar_beaconListBlu";
	    };
	    
	    if(_playerSide == "EAST") then {
	    	pvar_beaconListRed set [count pvar_beaconListRed,[_beaconOwner, _placedBeaconPos, 100, _playerUID]];
	    	publicVariable "pvar_beaconListRed";
	    };
	                  
		mutexScriptInProgress = false;
	};     
};        		

player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation. 
