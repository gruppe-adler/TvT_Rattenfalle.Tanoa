spawnRussianVehicle = {
	_vehicle = _this select 0;

	_spawnedVeh = createVehicle [_vehicle, russianSpawnPos, [], 0, "NONE"];

	_spawnedVeh allowDamage false;
	
	sleep 3;

	_spawnedVeh allowDamage true;
	
};