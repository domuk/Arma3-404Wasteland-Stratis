/**
 * English and French comments
 * Commentaires anglais et fran�ais
 * 
 * This file contains the configuration variables of the logistics system.
 * Fichier contenant les variables de configuration du syst�me de logistique.
 * 
 * Important note : All the classes names which inherits from the ones used in configuration variables will be also available.
 * Note importante : Tous les noms de classes d�rivant de celles utilis�es dans les variables de configuration seront aussi valables.
 */

/*
 * There are two ways to manage new objects with the logistics system. The first is to add these objects in the
 * folowing appropriate lists. The second is to create a new external file in the /addons_config/ directory,
 * according to the same scheme as the existing ones, and to add a #include at the end of this current file.
 * 
 * Deux moyens existent pour g�rer de nouveaux objets avec le syst�me logistique. Le premier consiste � ajouter
 * ces objets dans les listes appropri�es ci-dessous. Le deuxi�me est de cr�er un fichier externe dans le r�pertoire
 * /addons_config/ selon le m�me sch�ma que ceux qui existent d�j�, et d'ajouter un #include � la fin de ce pr�sent fichier.
 */

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of (ground or air) vehicles which can tow towables objects.
 * Liste des noms de classes des v�hicules terrestres pouvant remorquer des objets remorquables.
 */
R3F_LOG_CFG_remorqueurs = [
	"c_offroad",
	"O_Galkin_MG_F",
    "B_Hunter_F",
    "B_Hunter_RCWS_F",
    "B_Hunter_HMG_F",
    "O_Galkin_F",
    "O_Galkin_GMG_F"
];

/**
 * List of class names of towables objects.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_objets_remorquables = [
	"c_offroad",
	"O_Galkin_MG_F",
    "B_Hunter_F",
    "B_Hunter_RCWS_F",
    "B_Hunter_HMG_F",
    "O_Galkin_F",
    "O_Galkin_GMG_F"
];

/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 * Liste des noms de classes des v�hicules a�riens pouvant h�liporter des objets h�liportables.
 */
R3F_LOG_CFG_heliporteurs = [
	"O_Ka60_Unarmed_F",
	"B_MH9_F",
	"O_Ka60_F",
	"B_AH9_F"
];

/**
 * List of class names of liftables objects.
 * Liste des noms de classes des objets h�liportables.
 */
R3F_LOG_CFG_objets_heliportables = [

	"c_offroad",
	"O_Galkin_MG_F",
    "B_Hunter_F",
    "B_Hunter_RCWS_F",
    "B_Hunter_HMG_F",
    "O_Galkin_F",
    "O_Galkin_GMG_F"
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
 * This section use a quantification of the volume and/or weight of the objets.
 * The arbitrary referencial used is : an ammo box of type USVehicleBox "weights" 12 units.
 * 
 * Cette section utilise une quantification du volume et/ou poids des objets.
 * Le r�f�rentiel arbitraire utilis� est : une caisse de munition de type USVehicleBox "p�se" 12 unit�s.
 * 
 * Note : the priority of a declaration of capacity to another corresponds to their order in the tables.
 *   For example : the "Truck" class is in the "Car" class (see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   If "Truck" is declared with a capacity of 140 before "Car". And if "Car" is declared after "Truck" with a capacity of 40,
 *   Then all the sub-classes in "Truck" will have a capacity of 140. And all the sub-classes of "Car", excepted the ones
 *   in "Truck", will have a capacity of 40.
 * 
 * Note : la priorit� d'une d�claration de capacit� sur une autre correspond � leur ordre dans les tableaux.
 *   Par exemple : la classe "Truck" appartient � la classe "Car" (voir http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles).
 *   Si "Truck" est d�clar� avec une capacit� de 140 avant "Car". Et que "Car" est d�clar� apr�s "Truck" avec une capacit� de 40,
 *   Alors toutes les sous-classes appartenant � "Truck" auront une capacit� de 140. Et toutes les sous-classes appartenant
 *   � "Car", except�es celles de "Truck", auront une capacit� de 40.
 */

/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des v�hicules (terrestres ou a�riens) pouvant transporter des objets transportables.
 * Le deuxi�me �l�ment des tableaux est la capacit� de chargement (en relation avec le co�t de capacit� des objets).
 */
R3F_LOG_CFG_transporteurs = [
	["c_offroad", 30],
	["O_Galkin_MG_F", 20],
	["B_Hunter_F", 20],
	["B_Hunter_RCWS_F", 20],
	["B_Hunter_HMG_F", 20],
	["O_Galkin_F", 20],
	["O_Galkin_GMG_F", 20],
	["O_Ka60_Unarmed_F", 10],
	["B_MH9_F", 10],
	["O_Ka60_F", 10],
    ["O_Quadbike_F", 5],
    ["B_Quadbike_F", 5],
	["B_AH9_F", 10]
];

/**
 * List of class names of transportables objects.
 * The second element of the arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxi�me �l�ment des tableaux est le co�t de capacit� (en relation avec la capacit� des v�hicules).
 */
 
R3F_LOG_CFG_objets_transportables =  [
	["Box_East_Support_F", 5],
	["Box_East_Wps_F", 5],
	["Box_East_WpsSpecial_F", 5],
	["Box_NATO_Support_F", 5],
	["Box_NATO_Wps_F", 5],
	["Box_NATO_WpsSpecial_F", 5],
	["Land_Barrelwater_F", 5],
	["Land_Fireplace_F", 5],
	["Land_WoodenBox_F", 5],
	["Land_HBarrier_1_F", 1],
	["Land_HBarrierBig_F", 5],
	["Land_HBarrier_3_F", 5],
    ["Land_HBarrier_5_F", 5],
	["Land_CncBarrier_F", 5],
	["Land_Mound01_8m_F", 5],
	["Land_Scaffolding_F", 5],
	["Land_Razorwire_F", 1],
	["Land_CargoBox_V1_F", 5],
    ["O_Quadbike_F", 10],
    ["B_Quadbike_F", 10],
	["Land_Obstacle_Bridge_F", 5]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects moveables by player.
 * Liste des noms de classes des objets transportables par le joueur.
 */

R3F_LOG_CFG_objets_deplacables = [
	"Box_East_Support_F",
	"Box_East_Wps_F",
	"Box_East_WpsSpecial_F",
	"Box_NATO_Support_F",
	"Box_NATO_Wps_F",
	"Box_NATO_WpsSpecial_F",
	"Land_Barrelwater_F",
	"Land_Fireplace_F",
	"Land_WoodenBox_F",
	"Land_HBarrier_1_F",
	"Land_HBarrierBig_F",
	"Land_HBarrier_3_F",
    "Land_HBarrier_5_F",
//	"Land_CncBarrier_F",
//	"Land_Mound01_8m_F",
	"Land_Scaffolding_F",
//	"Land_Razorwire_F",
	"Land_CargoBox_V1_F",
    "O_Quadbike_F",
    "B_Quadbike_F",
	"Land_Obstacle_Bridge_F"
];

/*
 * List of files adding objects in the arrays of logistics configuration (e.g. R3F_LOG_CFG_remorqueurs)
 * Add an include to the new file here if you want to use the logistics with a new addon.
 * 
 * Liste des fichiers ajoutant des objets dans les tableaux de fonctionnalit�s logistiques (ex : R3F_LOG_CFG_remorqueurs)
 * Ajoutez une inclusion vers votre nouveau fichier ici si vous souhaitez utilisez la logistique avec un nouvel addon.
 */
//#include "addons_config\arma2_CO_objects.sqf"
