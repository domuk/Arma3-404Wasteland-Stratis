rem run once to copy x_setup.sqf and x_macros.sqf to all directories that need it
copy setup.sqf server /Y
copy setup.sqf server\functions /Y
copy setup.sqf server\spawning /Y
copy setup.sqf server\missions /Y
copy setup.sqf server\missions\mainMissions /Y
copy setup.sqf server\missions\otherMissions /Y
copy setup.sqf server\missions\sideMissions /Y
copy setup.sqf server\missions\factoryMethods /Y
rem cd ..