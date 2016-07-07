GRAD_civInterrogationAnimations = [
    "AidlPercSnonWnonDnon_talk1",
    "AmovPercMstpSsurWnonDnon",
    "ACE_AmovPercMstpScapWnonDnon",
    "Acts_Kore_Introducing"
];

GRAD_fnc_stopCiv = {
    _civ = _this select 0;

    doStop _civ;
    if (vehicle _civ != _civ) then {
      doGetOut _civ;
      waitUntil {vehicle _civ == _civ};
    };
    _civ disableAI "MOVE";
    _civ disableAI "FSM";
    _civ disableAI "CHECKVISIBLE";
    _civ playMoveNow (selectRandom GRAD_civInterrogationAnimations);
    _civ disableAI "ANIM";
    waitUntil {_civ getVariable ["GRAD_isPointedAtBy",0] == 0};
    _civ enableAI "MOVE";
    _civ enableAI "FSM";
    _civ enableAI "CHECKVISIBLE";
    _civ enableai "ANIM";
};
