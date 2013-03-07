#include "dialog\player_sys.sqf";
disableSerialization;

_switch = _this select 0;

_dialog = findDisplay playersys_DIALOG;
_itemList = _dialog displayCtrl item_list;

if(player getVariable "canfood" > 0) then {
	_itemListIndex = _itemList lbAdd format["%1x - Canned Food", player getVariable "canfood"];
	_itemList lbSetData [(lbSize _itemList)-1, "canfood"];
};

if(player getVariable "water" > 0) then {
	_itemListIndex = _itemList lbAdd format["%1x - Water bottle", player getVariable "water"];
	_itemList lbSetData [(lbSize _itemList)-1, "water"];
};

if(player getVariable "fuelFull" == 1) then {
	_itemListIndex = _itemList lbAdd "Fuel Can";
	_itemList lbSetData [(lbSize _itemList)-1, "fuelFull"];
};

if(player getVariable "fuelEmpty" == 1) then {
	_itemListIndex = _itemList lbAdd "Empty Fuel Can";
	_itemList lbSetData [(lbSize _itemList)-1, "fuelEmpty"];
};
if(player getVariable "camonet" > 0) then {
	if(player getVariable "camonet" > 1) then {
	    _str = format ["%1x - Camo Nets", player getVariable "camonet"];
	} else {
	    _str = "Camo Net";
	};
	_itemListIndex = _itemList lbAdd format["%1x - Camo Net", player getVariable "camonet"];
	_itemList lbSetData [(lbSize _itemList)-1, "camonet"];
};
if(player getVariable "repairkits" > 0) then {
	_str = "Repair Kit";
    
	if(player getVariable "repairkits" > 1) then 
    {
        _str = format ["%1x - Repair Kit", player getVariable "repairkits"];
    } else {
        _str = "Repair Kit"
    };
    
	_itemListIndex = _itemList lbAdd _str;
	_itemList lbSetData [(lbSize _itemList)-1, "repairkits"];
};

if(player getVariable "medkits" > 0) then {
	_str = "Medkit";
	if(player getVariable "medkits" > 1) then {
	    _str = format ["%1x - Medkit", player getVariable "medkits"];
	} else {
	    _str = "Medkit";
	};
	_itemListIndex = _itemList lbAdd _str;
	_itemList lbSetData [(lbSize _itemList)-1, "medkit"];
};

if(player getVariable "spawnBeacon" > 0) then {
	_itemListIndex = _itemList lbAdd "Spawn Beacon";
	_itemList lbSetData [(lbSize _itemList)-1, "spawnBeacon"];
};