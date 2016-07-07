while {alive player} do {
     if (!weaponLowered player) then {
         if ( (side cursorTarget) == civilian) then {
           _civ = cursorTarget;
           _pointCounter = _civ getVariable ["GRAD_isPointedAtBy",0];
           _civ setVariable ["GRAD_isPointedAtBy", _pointCounter + 1];
           [_civ, str player] remoteExec ["GRAD_fnc_stopCiv", 2, false];

           waitUntil {(side cursorTarget) != civilian};
           _pointCounter = _civ getVariable ["GRAD_isPointedAtBy",0];
           _civ setVariable ["GRAD_isPointedAtBy", _pointCounter - 1];
         };
     };
sleep 1;
};
