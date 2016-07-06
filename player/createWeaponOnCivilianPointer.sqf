while {alive player} do {
             if (!weaponLowered player) then {
               if ( (side cursorTarget) == civilian) then
            {
                _trg = cursorTarget;

                ["Stop", [_trg]] call CBA_fnc_globalEvent;
               };
             };

sleep 2;
};
