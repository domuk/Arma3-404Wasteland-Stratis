//	@file Version: 1.0
//	@file Name: loadGunStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

_gunshopDialog = createDialog "gunshopd";
gunStoreCart = 0;

_Dialog = findDisplay gunshop_DIALOG;
_playerMoney = _Dialog displayCtrl gunshop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format["Cash: $%1", _money];

gsLocation = str(_this select 0);

if(gsLocation == "gs1") then {gsCrate = g_ammo_1;};
if(gsLocation == "gs2") then {gsCrate = g_ammo_2;};
if(gsLocation == "gs3") then {gsCrate = g_ammo_3;};
if(gsLocation == "gs4") then {gsCrate = g_ammo_4;};