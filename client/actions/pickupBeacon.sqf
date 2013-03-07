
//	@file Version: 1.0
//	@file Name: pickupBecon.sqf
//	@file Author: [404] Costlyy
//	@file Created: 7/12/2012 23:30
//	@file Args:[,,,int (1 = destroy | 0 = steal)]

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat localize "STR_WL_Errors_InProgress";
};

private["_stringEscapePercent","_totalDuration","_lockDuration","_iteration","_iterationPercentage","_currSpawnBeaconFaction", "_destroyOrSteal", "_currBeaconOwnerUID", "_currBeaconTemp"];

if(vehicle player != player) exitWith {
	player globalChat localize "STR_WL_Errors_InVehicle";
};

_currSpawnBeaconFaction = ((nearestobjects [getpos player, ["Satelit"],  5] select 0) getVariable "faction");

if(isNil{_currSpawnBeaconFaction}) exitWith {
	diag_log "There was a problem finding a spawn beacon.";
};

_currSpawnBeacon = (nearestobjects [getpos player, ["Satelit"],  5] select 0);
_destroyOrSteal = _this select 3;
_stringEscapePercent = "%"; // Required to get the % sign into a formatted string.
_iteration = 0;

if(_destroyOrSteal == 0 AND (player getVariable "spawnBeacon") > 0) exitWith {
	player globalChat localize "STR_WL_Errors_BeaconTooMany";
}; 
	
player switchMove "AinvPknlMstpSlayWrflDnon_medic"; // Begin the full medic animation...

switch (_destroyOrSteal) do {
    case 0:{ // Steal
    
    	_totalDuration = 60; // This will NOT be easy >:)
		_lockDuration = _totalDuration;
     	mutexScriptInProgress = true;
    
		for "_iteration" from 1 to _lockDuration do {
			
           	if(vehicle player != player) exitWith { // A little inspiration from R3F
				player globalChat localize "STR_WL_Errors_BeaconInVehicle";
        		player action ["eject", vehicle player];
				sleep 1;
				mutexScriptInProgress = false;
			};  
            
            if (doCancelAction) exitWith {// Player selected "cancel action".
    			2 cutText ["", "PLAIN DOWN", 1];
        		doCancelAction = false;
    			mutexScriptInProgress = false;
			}; 
            
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Steal spawn beacon interrupted...", "PLAIN DOWN", 1];
                mutexScriptInProgress = false;
			};
                
			if(player distance _currSpawnBeacon > 5) exitWith { // If the player leaves, revert state.
				2 cutText ["Steal spawn beacon interrupted...", "PLAIN DOWN", 1];
		        mutexScriptInProgress = false;
			}; 
		    
		    if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the steal.
		        player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		    };
		    
            _lockDuration = _lockDuration - 1;
			_iterationPercentage = floor (_iteration / _totalDuration * 100);
				    
			2 cutText [format["Steal spawn beacon %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
			sleep 1;
				    
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that steal has completed.
				sleep 1;
		        2 cutText ["", "PLAIN DOWN", 1];
		            
                _currBeaconOwnerUID = _currSpawnBeacon getVariable "ownerUID"; 
                _currBeaconTemp = (nearestObjects [getpos player, ["Satelit"],  5]);
                    
		        if(count _currBeaconTemp == 0) then { // Check if the beacon has been removed since curr player started interacting with it.
                	hint "Your attempt to steal the enemy spawn beacon was unsuccessful.";
                    mutexScriptInProgress = false;
                } else {
	               	deleteVehicle (nearestobjects [getpos player, ["Satelit"],  5] select 0);
	                player setVariable["spawnBeacon",1,true];           
	                hint "You have successfully stolen the enemy spawn beacon.";
			        mutexScriptInProgress = false;
                    
	                [_currBeaconOwnerUID] execVM "client\functions\cleanBeaconArrays.sqf"; // Now that the previous instance of the spawn beacon has been technically removed, remove it from the spawn locations list.
                };      
			};     
		};
    };
    case 1:{ // Destroy
                          
   	 	_totalDuration = 30; // This will NOT be easy >:)
		_lockDuration = _totalDuration;
        mutexScriptInProgress = true;
    
		for "_iteration" from 1 to _lockDuration do {
 
            if(vehicle player != player) exitWith { // A little inspiration from R3F
				player globalChat localize "STR_WL_Errors_BeaconInVehicle";
        		player action ["eject", vehicle player];
				sleep 1;
				mutexScriptInProgress = false;
			};  
             
            if (doCancelAction) exitWith {// Player selected "cancel action".
    			2 cutText ["", "PLAIN DOWN", 1];
        		doCancelAction = false;
    			mutexScriptInProgress = false;
			}; 
            
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Destroy spawn beacon interrupted...", "PLAIN DOWN", 1];
                mutexScriptInProgress = false;
			};    
						    
			if(player distance _currSpawnBeacon > 5) exitWith { // If the player leaves, revert state.
				2 cutText ["Destroy spawn beacon interrupted...", "PLAIN DOWN", 1];
		        mutexScriptInProgress = false;
			};
		    
		    if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the destroy.
		        player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		    };    
            
            _lockDuration = _lockDuration - 1;
			_iterationPercentage = floor (_iteration / _totalDuration * 100);
            
            2 cutText [format["Destroy spawn beacon %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
			sleep 1;
				    
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that destroy has completed.
				sleep 1;
		        2 cutText ["", "PLAIN DOWN", 1];
		        
                _currBeaconOwnerUID = _currSpawnBeacon getVariable "ownerUID";
                _currBeaconTemp = (nearestObjects [getpos player, ["Satelit"],  5]);
                
		        if(count _currBeaconTemp == 0) then { // Check if the beacon has been removed since curr player started interacting with it.
                	hint "Your attempt to destroy the spawn beacon was unsuccessful.";
                    mutexScriptInProgress = false;
                } else {
	               	deleteVehicle (nearestobjects [getpos player, ["Satelit"],  5] select 0);
	                hint "You have successfully destroyed the spawn beacon.";
			        mutexScriptInProgress = false;	
                                    
	                [_currBeaconOwnerUID] execVM "client\functions\cleanBeaconArrays.sqf"; // Now that the previous instance of the spawn beacon has been technically removed, remove it from the spawn locations list.
                };                                                                                                                                                                                                                                       		        
			};     
		};
    };
};
             
player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation. 