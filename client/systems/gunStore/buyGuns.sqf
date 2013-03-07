
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\gunstoreDefines.sqf";
disableSerialization;
if(gunStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

private ["_name"];

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_cartlist = _dialog displayCtrl gunshop_cart;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_size = lbSize _cartlist;

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;
			//0 = Primary, 1 = SideArm, 2= Secondary, 3= HandGun Mags, 4= MainGun Mags, 5= Binocular, 7=Compass Slots
			_playerSlots = [player] call BIS_fnc_invSlotsEmpty;
			
			{
				if(_itemText == _x select 0) then
				{
					_class = _x select 1;
					_weapon = (configFile >> "cfgWeapons" >> _class);
					_type = getNumber(_weapon >> "type");
					
					//Main Rifle
					if(_type == 1) then
					{
						if((_playerSlots select 0) >= 1) then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach weaponsArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];  
						};
					};
					
					//Side Arm
					if(_type == 2) then
					{
						if((_playerSlots select 1) >= 1) then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach weaponsArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];  
						};
					};
					
					//Rocket Launcher
					if(_type == 4) then
					{
						if((_playerSlots select 2) >= 1) then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach weaponsArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];  
						};
					};
					
					//LMG
					if(_type == 5) then
					{
						if(((_playerSlots select 2) >= 1) AND ((_playerSlots select 0) >= 1)) then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach weaponsArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];  
						};
					};
				};                    		
			}forEach weaponsArray;

			{
				if(_itemText == _x select 0) then
				{
					_class = _x select 1;
					_mag = (configFile >> "cfgMagazines" >> _class);
					_type = (getNumber(_mag >> "type"));
					
					//Check how many main mags you have
					if(_type == 256) then
					{
						if((_playerSlots select 4) >= 1) then
						{
							player addMagazine _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];
						};
					};
					
					if(_type == 512) then
					{
						if((_playerSlots select 4) >= 2) then
						{
							player addMagazine _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];
						};
					};
					
					if(_type == 768) then
					{
						if((_playerSlots select 4) >= 3) then
						{
							player addMagazine _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];
						};
					};
					
					if(_type == 1024) then
					{
						if((_playerSlots select 4) >= 4) then
						{
							player addMagazine _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];
						};
					};
					
					if(_type == 1280) then
					{
						if((_playerSlots select 4) >= 5) then
						{
							player addMagazine _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];
						};
					};
					
					if(_type == 1536) then
					{
						if((_playerSlots select 4) >= 6) then
						{
							player addMagazine _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];
						};
					};
					
					//Check how many side mags you have
					if(_type == 16) then
					{
						if((_playerSlots select 3) >= 1) then
						{
							player addMagazine _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
							gunStoreCart = gunStoreCart - _price;
							hint format["You do not have space for this item %1",_name];
						};
					};
				}
			}forEach ammoArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				if(_class == "Binocular_Vector" OR _class== "NVGoggles") then
				{
					if((_playerSlots select 5) >= 1) then
					{
						player addWeapon _class;
					}
					else
					{
						{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach accessoriesArray;
						gunStoreCart = gunStoreCart - _price;
						hint format["You do not have space for this item %1",_name];
					};
				}
				else
				{
					player addWeapon _class;
				};
			}}forEach accessoriesArray;
		};

		player setVariable["cmoney",_playerMoney - gunStoreCart,true];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
	
	//Buy To Crate
	case 1:
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				gsCrate addWeaponCargoGlobal [_class, 1];
			}}forEach weaponsArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				gsCrate addMagazineCargoGlobal [_class, 1];
			}}forEach ammoArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				gsCrate addWeaponCargoGlobal [_class, 1];
			}}forEach accessoriesArray;
		};
		
		player setVariable["cmoney",_playerMoney - gunStoreCart,true];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
		
		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
};
