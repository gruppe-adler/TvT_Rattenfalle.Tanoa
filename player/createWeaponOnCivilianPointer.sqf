while {alive player} do {
     if (!weaponLowered player) then {
         if ( (side cursorTarget) == civilian && player distance cursorTarget < 50) then {
           _civ = cursorTarget;

           if (_civ getVariable ["GRAD_isPointedAtBy",0] == 0) then {
             if (isMultiplayer) then {
               [_civ] remoteExec ["GRAD_fnc_stopCiv", [2,0] select (isMultiplayer && isDedicated), false];
             } else {
               [_civ] remoteExec ["GRAD_fnc_stopCiv", [2,0] select (isMultiplayer && isDedicated), false];
             };
           };

           _pointCounter = _civ getVariable ["GRAD_isPointedAtBy",0];
           _civ setVariable ["GRAD_isPointedAtBy", _pointCounter + 1];

           waitUntil {sleep 1; (side cursorTarget) != civilian};
           _pointCounter = _civ getVariable ["GRAD_isPointedAtBy",0];
           _civ setVariable ["GRAD_isPointedAtBy", _pointCounter - 1];
         };
     };
sleep 1;
};
