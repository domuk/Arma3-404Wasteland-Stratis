
//	@file Version: 1.0
//	@file Name: spawnOnBeacons.sqf
//	@file Author: [404] Costlyy
//	@file Created: 08/12/2012 18:30
//	@file Args: [int(0 = button 0 etc)]

#define respawn_Town_Button0 3403
#define respawn_Town_Button1 3404
#define respawn_Town_Button2 3405
#define respawn_Town_Button3 3406
#define respawn_Town_Button4 3407
disableSerialization;

private ["_respawnPosition", "_switch", "_display", "_buttonZero", "_buttonOne", "_buttonTwo", "_buttonThree", "_buttonFour"];

_switch = _this select 0;

_display = uiNamespace getVariable "RespawnSelectionDialog";
_buttonZero = _display displayCtrl respawn_Town_Button0;
_buttonOne = _display displayCtrl respawn_Town_Button1;
_buttonTwo = _display displayCtrl respawn_Town_Button2;
_buttonThree = _display displayCtrl respawn_Town_Button3;
_buttonFour = _display displayCtrl respawn_Town_Button4;

switch(_switch) do 
{
    case 0:{ // Button 0     
		{
			if(ctrlText _buttonZero == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListBlu;
		
		{
			if(ctrlText _buttonZero == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListRed;
        
        2 cutText ["HALO jump activated. Open your chute before you hit the ground!", "PLAIN DOWN", 5];
        player setPos [_respawnPosition select 0, _respawnPosition select 1, 1000]; // Stop the player appearing on the ground for a split second before the HALO 
        [player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";    
        respawnDialogActive = false;
		closeDialog 0;
    };
    case 1:{ // Button 1
		{
			if(ctrlText _buttonOne == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListBlu;
		
		{
			if(ctrlText _buttonOne == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
                
		    };
		}forEach pvar_beaconListRed;
		
        2 cutText ["HALO jump activated. Open your chute before you hit the ground!", "PLAIN DOWN", 5];   
		player setPos [_respawnPosition select 0, _respawnPosition select 1, 1000]; // Stop the player appearing on the ground for a split second before the HALO 
        [player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";   
        respawnDialogActive = false;
		closeDialog 0;
    };
    case 2:{ // Button 2			    
		{
			if(ctrlText _buttonTwo == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListBlu;
		
		{
			if(ctrlText _buttonTwo == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListRed;
		    
        2 cutText ["HALO jump activated. Open your chute before you hit the ground!", "PLAIN DOWN", 5];
		player setPos [_respawnPosition select 0, _respawnPosition select 1, 1000]; // Stop the player appearing on the ground for a split second before the HALO 
        [player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";   
        respawnDialogActive = false;
		closeDialog 0;
    };
    case 3:{ // Button 3
		{
			if(ctrlText _buttonThree == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListBlu;
		
		{
			if(ctrlText _buttonThree == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListRed;
		
        2 cutText ["HALO jump activated. Open your chute before you hit the ground!", "PLAIN DOWN", 5];
		player setPos [_respawnPosition select 0, _respawnPosition select 1, 1000]; // Stop the player appearing on the ground for a split second before the HALO  
        [player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";   
        respawnDialogActive = false;
		closeDialog 0;
    };
    case 4:{ // Button 4
		player setPos _respawnPosition;		{
			if(ctrlText _buttonFour == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListBlu;
		
		{
			if(ctrlText _buttonFour == _x select 0) then {
				_respawnPosition = _x select 1;
		        _respawnPosition = [_respawnPosition,1,75,1,0,0,0] call BIS_fnc_findSafePos;
		    };
		}forEach pvar_beaconListRed;
		    
        2 cutText ["HALO jump activated. Open your chute before you hit the ground!", "PLAIN DOWN", 5];
		player setPos [_respawnPosition select 0, _respawnPosition select 1, 1000]; // Stop the player appearing on the ground for a split second before the HALO 
        [player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";   
        respawnDialogActive = false;
		closeDialog 0;
    };
};

sleep 5;

_mins = floor(60 * (daytime - floor(daytime)));
[
	"404 Wasteland","Spawn Beacon",
	format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;
