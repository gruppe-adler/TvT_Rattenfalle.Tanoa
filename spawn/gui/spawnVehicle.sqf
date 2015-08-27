spawnRussianVehicle = {
	_vehicle = _this select 0;

	[_vehicle, russianSpawnPos] call spawnSupplyDrop;

	_spawnedVeh allowDamage false;
	
	sleep 3;

	_spawnedVeh allowDamage true;
	
};