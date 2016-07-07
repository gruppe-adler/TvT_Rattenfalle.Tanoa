while {alive player} do {
     if (!weaponLowered player) then {
         if ( (side cursorTarget) == civilian) then {
           _civ = cursorTarget;
            if (!((str player) in (_civ getVariable ["GRAD_isPointedAtBy",0]))) then {

                _civ setVariable ["GRAD_isPointedAtBy",
                  _civ getVariable ["GRAD_isPointedAtBy",0] +
                    1
                ];
                [_civ, str player] remoteExec ["GRAD_fnc_stopCiv", 2, false];
                waitUntil {(side cursorTarget) != civilian)};
                _civ setVariable ["GRAD_isPointedAtBy",
                  _civ getVariable ["GRAD_isPointedAtBy",0] -
                    1
                ];
            };
         };
     };
sleep 1;
};
