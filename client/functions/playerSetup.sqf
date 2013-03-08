
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

_player = _this;
//Player initialization
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;

//Default case means something fucked up.
_player unassignItem "NVGoggles"; 
_player removeItem "NVGoggles";
removeAllWeapons _player;
_player addBackpack "B_AssaultPack_Base";
_player addMagazine "16Rnd_9x21_Mag";
_player addMagazine "16Rnd_9x21_Mag";
_player addWeapon "hgun_P07_F";
_player selectWeapon "hgun_P07_F";

if(str(playerSide) in ["WEST"]) then
{
   	_player unassignItem "NVGoggles"; 
	_player removeItem "NVGoggles";
	removeAllWeapons _player;
    _player addBackpack "B_AssaultPack_Base";
	_player addMagazine "16Rnd_9x21_Mag";
	_player addMagazine "16Rnd_9x21_Mag";
	_player addWeapon "hgun_P07_F";
	_player selectWeapon "hgun_P07_F"; 
};

if(str(playerSide) in ["EAST"]) then
{
    _player unassignItem "NVGoggles"; 
	_player removeItem "NVGoggles";
	removeAllWeapons _player;
    _player addBackpack "B_AssaultPack_Base";
    _player addMagazine "16Rnd_9x21_Mag";
    _player addMagazine "16Rnd_9x21_Mag";
	_player addWeapon "hgun_P07_F";
	_player selectWeapon "hgun_P07_F";
};

if(str(playerSide) in ["GUER"]) then
{
    _player unassignItem "NVGoggles"; 
	_player removeItem "NVGoggles"; 
	removeAllWeapons _player;
	removeUniform _player;
	_uniform = ["U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Commoner1_3","U_C_Commoner1_2"] call BIS_fnc_selectRandom;
	_player addUniform _uniform;
    _player addBackpack "B_AssaultPack_Base";
    _player addMagazine "16Rnd_9x21_Mag";
    _player addMagazine "16Rnd_9x21_Mag";
	_player addWeapon "hgun_P07_F";
	_player selectWeapon "hgun_P07_F";
};

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100;

_player setVariable["cmoney",100,true];
_player setVariable["canfood",1,false];
_player setVariable["medkits",0,false];
_player setVariable["water",1,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 0, false];
_player setVariable["fuelEmpty", 1, false];
//_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];

[] execVM "client\functions\playerActions.sqf";

_player groupChat format["Player Initialization Complete"];
playerSetupComplete = true;