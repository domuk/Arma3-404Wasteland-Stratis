
//	@file Version: 1.0
//	@file Name: getInventory.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\genstoreDefines.sqf";
disableSerialization;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemlisttext = _dialog displayCtrl genstore_item_TEXT;
_totalText = _dialog displayCtrl genstore_total;
_itempicture = _dialog displayCtrl genstore_item_pic;
_itemlist = _dialog displayCtrl genstore_item_list;
_cartlist = _dialog displayCtrl genstore_cart;
_itemInfo = _dialog displayCtrl genstore_item_Info;

//Clear the list
genStoreCart = 0;
lbClear _itemlist;
lbClear _cartlist;
_itemlist lbSetCurSel -1;
_itempicture ctrlSettext "";
_itemlisttext ctrlSettext "";
_totalText CtrlsetText format["Total: $%1", genStoreCart];
_itemInfo ctrlSetStructuredText parseText "";

playerInventory = [];

_amount = 0;
_index = 0;

_amount = (player getVariable "canfood");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Canned Food"];
	_index = _index + 1;
};

_amount = (player getVariable "water");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Water"];
	_index = _index + 1;
};

_amount = (player getVariable "medkits");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Medical Kit"];
	_index = _index + 1;
};

_amount = (player getVariable "repairkits");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Repair Kit"];
	_index = _index + 1;
};

_amount = (player getVariable "fuelFull");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Jerry Can (Full)"];
	_index = _index + 1;
};

_amount = (player getVariable "fuelEmpty");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Jerry Can (Empty)"];
	_index = _index + 1;
};

_amount = (player getVariable "spawnBeacon");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Spawn Beacon"];
	_index = _index + 1;
};
_amount = (player getVariable "camonet");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Camo Net"];
	_index = _index + 1;
};

{
	_itemlistIndex = _itemlist lbAdd format["%1",_x];
} forEach playerInventory;