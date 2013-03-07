//	@file Version: 1.1
//	@file Name: pickupcamonet.sqf
//	@file Author: Sixty8 Pulse
//	@file Date modified: 17/12/2012 20:19
//	@file Args:

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
};

mutexScriptInProgress = true;
_camonet = (nearestobjects [getpos player, ["Land_CamoNet_NATO"],  5] select 0);

deleteVehicle _camonet;
player playmove "AinvPknlMstpSlayWrflDnon";

sleep 2.9;

player setVariable ["camonet",+1,true]; 
hint format["You have picked up " + getText (configFile >> "CfgVehicles" >> (typeOf _camonet) >> "displayName")];
player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation. 
sleep 1;
mutexScriptInProgress = false;

