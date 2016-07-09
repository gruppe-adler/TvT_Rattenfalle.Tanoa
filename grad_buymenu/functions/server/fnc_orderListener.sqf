// server

fnc_addOrderListener = {

	[] spawn {
		while {true} do {
		 waitUntil {count ordersBlufor > 0};
		  diag_log format ["ordersBlufor has received an order"];
		  _nextorder = ordersBlufor select 0;

		 // sleep (_nextorder select 0); // wait until eta is over
		 // diag_log format ["ordersBlufor eta is over"];
		 [
		 _nextorder select 1,
		 _nextorder select 2,
		 _nextorder select 3,
		 _nextorder select 4,
		 _nextorder select 5,
		 _nextorder select 6,
		 west
		 ] call fnc_spawnVehicleManager;
		 sleep 5;
		 ordersBlufor deleteAt 0;
		};
	};

	[] spawn {
		while {true} do {
		 waitUntil {count ordersOpfor > 0};
		  diag_log format ["ordersOpfor has received an order"];
		 _nextorder = ordersOpfor select 0;

		 // sleep (_nextorder select 0); // wait until eta is over
		 // diag_log format ["ordersOpfor eta is over"];
		 [
		 _nextorder select 1,
		 _nextorder select 2,
		 _nextorder select 3,
		 _nextorder select 4,
		 _nextorder select 5,
		 _nextorder select 6,
		 east
		 ] call fnc_spawnVehicleManager;
		 sleep 5;
	 	ordersOpfor deleteAt 0;
		};
	};
};
