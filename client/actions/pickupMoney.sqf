//	@file Version: 1.1
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Date modified: 07/12/2012 05:19
//	@file Args:

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith 
{
	player globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
};

_totalDuration = 2;
_lockDuration = _totalDuration;
_originalState = animationState player;
mutexScriptInProgress = true;

_moneyObject = (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
if((_moneyObject getVariable "owner") == "world") then
{
   	_moneyObject setVariable ["owner", getPlayerUID player, true];
};

for "_iteration" from 1 to _lockDuration do 
{	
	if((_moneyObject getVariable "owner") != getPlayerUID player) exitWith
	{
		player globalChat "This object is already in use.";
        mutexScriptInProgress = false;  
	};
    	
	if(vehicle player != player) exitWith 
	{
		player globalChat "You can't pick up money whilst in a car";
		player action ["eject", vehicle player];
		sleep 1;
		mutexScriptInProgress = false;
        
        _moneyObject setVariable ["owner", "world", true];
	};   
		    
	if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then 
	{
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
	};
		    
	_lockDuration = _lockDuration - 1;
	sleep 1;
    		    
	if(player distance (nearestobjects [player, ["EvMoney"],  5] select 0) > 5) exitWith 
	{
		mutexScriptInProgress = false;
        _moneyObject setVariable ["owner", "world", true];
	};
				    
	if (_iteration >= _totalDuration) exitWith 
	{
		sleep 1;
		_currMoneyTemp = (nearestObjects [getpos player, ["EvMoney"],  5]);
                    
		if(count _currMoneyTemp == 0) then 
		{
			player globalChat format["You failed to pick the money up"];
			mutexScriptInProgress = false;
            _moneyObject setVariable ["owner", "world", true];
		} else {
			_money = ((nearestobjects [getpos player, ["EvMoney"],  5] select 0) getVariable "money");
			deleteVehicle (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
			player setVariable["cmoney", (player getVariable "cmoney")+_money,true];          
			player globalChat format["You have picked up $%1",_money];
			mutexScriptInProgress = false;
			player switchMove _originalState;
		};      
	};     
};