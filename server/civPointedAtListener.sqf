GRAD_fnc_stopCiv = {
    _civ = _this select 0;

    doStop _civ;
    if (vehicle _civ != _civ) then {
      doGetOut _civ;
    };
    waitUntil {vehicle _civ == _civ};
    _civ disableAI "MOVE";
    _civ disableAI "FSM";
    _civ disableAI "CHECKVISIBLE";
    waitUntil {_civ getVariable ["GRAD_isPointedAtBy",0] == 0};
    _civ enableAI "MOVE";
    _civ enableAI "FSM";
    _civ enableAI "CHECKVISIBLE";
};
