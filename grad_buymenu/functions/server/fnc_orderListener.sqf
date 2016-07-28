// server

fnc_addOrderListener = {

	[] spawn {
		while {true} do {
		 waitUntil {count ordersBlufor > 0};
		  
		  _nextorder = ordersBlufor select 0;
		  diag_log format ["ordersBlufor has received an order for %1",_nextorder select 2];
		  ordersBlufor deleteAt 0;
		  publicVariable "ordersBlufor";
		  diag_log format ["ordersOpfor is now reduced to %1",ordersBlufor];
		  

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
		};
	};

	[] spawn {
		while {true} do {
		 waitUntil {count ordersOpfor > 0};
		  
		 _nextorder = ordersOpfor select 0;
		 diag_log format ["ordersOpfor has received an order for %1",_nextorder select 2];
		 ordersOpfor deleteAt 0;
		 publicVariable "ordersOpfor";
	 	 diag_log format ["ordersOpfor is now reduced to %1",ordersOpfor];
		 

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
		};
	};
};
