
//	@file Version: 1.0
//	@file Name: sellItems.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\genstoreDefines.sqf";
disableSerialization;

//Initialize Values
_playerMoney = player getVariable "cmoney";
_size = 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_cartlist = _dialog displayCtrl genstore_cart;
_totalText = _dialog displayCtrl genstore_total;
_playerMoneyText = _Dialog displayCtrl genstore_money;
_size = lbSize _cartlist;

for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_itemText = _cartlist lbText _x;
	if(_itemText == "Water") then {player setVariable["water",(player getVariable "water") - 1,false];};
	if(_itemText == "Canned Food") then {player setVariable["canfood",(player getVariable "canfood") - 1,false];};
	if(_itemText == "Medical Kit") then {player setVariable["medkits",(player getVariable "medkits") - 1,false];};
	if(_itemText == "Repair Kit") then {player setVariable["repairkits",(player getVariable "repairkits") - 1,false];};
    if(_itemText == "Jerry Can (Full)") then {player setVariable["fuelFull",(player getVariable "fuelFull") - 1,false];};
    if(_itemText == "Jerry Can (Empty)") then {player setVariable["fuelEmpty",(player getVariable "fuelEmpty") - 1,false];};
    if(_itemText == "Spawn Beacon") then {player setVariable["spawnBeacon",(player getVariable "spawnBeacon") - 1,false];};
	if(_itemText == "Camo Net") then {player setVariable["camonet",(player getVariable "camonet") - 1,false];};
};

player setVariable["cmoney",_playerMoney + genStoreCart,true];
_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

genStoreCart = 0;
_totalText CtrlsetText format["Total: $%1", genStoreCart];
lbClear _cartlist;