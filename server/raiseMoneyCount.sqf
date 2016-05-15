_moneyRaiseDelay = 10;
_moneyRaiseValue = 100;

while {true} do {
	_currentMoney = russianSupplies select 0;
	russianSupplies set [0,_currentMoney + _moneyRaiseValue];
	publicVariable "russianSupplies";

	_currentMoney = mudschahedinSupplies select 0;
	mudschahedinSupplies set [0,_currentMoney + _moneyRaiseValue];
	publicVariable "mudschahedinSupplies";

	sleep _moneyRaiseDelay;
};