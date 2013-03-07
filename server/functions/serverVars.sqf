//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
#include "setup.sqf"
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
                  
"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
civilianVehicles = ["c_offroad","B_Quadbike_F", "O_Quadbike_F"];

//Military Vehicle List - Random Spawns
militaryVehicles = ["c_offroad","O_Galkin_F","B_Hunter_F"];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = ["O_Galkin_MG_F",
                            "B_Hunter_F",
                            "B_Hunter_RCWS_F",
                             "B_Hunter_HMG_F",
                            "O_Galkin_F",
                            "O_Galkin_GMG_F"];

//Object List - Random Spawns.
objectList = ["Land_Barrelwater_F",
			"Land_Fireplace_F",
			"Land_WoodenBox_F",
			"Land_HBarrier_1_F",
			"Land_HBarrier_1_F",
			"Land_HBarrier_5_F",
			"Land_HBarrier_5_F",
			"Land_HBarrierBig_F",
			"Land_HBarrierBig_F",
			"Land_HBarrier_3_F",
			"Land_CncBarrier_F",
			"Land_Mound01_8m_F",
			"Land_Mound02_8m_F",
			"Land_Scaffolding_F",
//			"Land_Razorwire_F", //isnt currently able to be picked up
			"Land_HBarrierBig_F",
			"Land_CargoBox_V1_F",
			"RampConcrete",
			"Land_Obstacle_Bridge_F"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["B_MK6"];

//Object List - Random Helis.
staticHeliList = ["O_Ka60_Unarmed_F",
					"B_MH9_F"];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = ["arifle_SDAR_F",
				"arifle_MXM_F",
				"arifle_TRG21_F",
				"arifle_TRG20_F",
				"arifle_MXC_F",
                "arifle_MX_SW_F",
                "arifle_MX_GL_F",
                "arifle_TRG21_GL_F",
                "arifle_MX_F",
                "arifle_Khaybar_F",
                "arifle_Khaybar_C_F",
                "arifle_Khaybar_GL_F",
                "arifle_SDAR_F",
                "srifle_EBR_F",
                "LMG_Mk200_F",
                "hgun_P07_F",
                "hgun_Rook40_F"];

vehicleAddition = [
			"Zasleh2",
			"muzzle_snds_H",
			"muzzle_snds_L",
			"muzzle_snds_B",
			"muzzle_snds_H_MG",
			"optic_Arco",
			"optic_Hamr", 
			"optic_Aco", 
			"optic_ACO_grn", 
			"optic_Holosight", 
			"acc_flashlight", 
			"acc_pointer_IR",
			"Medikit",
            "FirstAidKit",
            "ToolKit"
];

vehicleAddition2 = [
	"Chemlight_blue",
	"Chemlight_green"
];
 
                
MissionSpawnMarkers = [
            ["Mission_1",false],
            ["Mission_2",false],
            ["Mission_3",false],
            ["Mission_4",false],
            ["Mission_5",false],
            ["Mission_6",false],
            ["Mission_7",false],
            ["Mission_8",false],
            ["Mission_9",false],
            ["Mission_10",false],
            ["Mission_11",false],
            ["Mission_12",false],
            ["Mission_13",false],
            ["Mission_14",false],
            ["Mission_15",false],
            ["Mission_16",false],
            ["Mission_17",false],
            ["Mission_18",false],
            ["Mission_19",false],
            ["Mission_20",false]
];