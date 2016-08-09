//initial definition of variables
WAVERESPAWNBLU = false;
publicVariable "WAVERESPAWNBLU";
WAVERESPAWNOPF = false;
publicVariable "WAVERESPAWNOPF";

WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE;
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE;
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";

WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
publicVariable "WAVERESPAWNTIMELEFTBLU";
WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
publicVariable "WAVERESPAWNTIMELEFTOPF";


deadPlayersBlu = [];
deadPlayersOpf = [];

//FUNCTIONS ====================================================================
mcd_fnc_waveTimeLeftBlu = {
  while {WAVERESPAWNTIMELEFTBLU > 0} do {
    WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIMELEFTBLU - 1;
    publicVariable "WAVERESPAWNTIMELEFTBLU";
    sleep 1;
  };
};

mcd_fnc_waveTimeLeftOpf = {
  while {WAVERESPAWNTIMELEFTOPF > 0} do {
    WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIMELEFTOPF - 1;
    publicVariable "WAVERESPAWNTIMELEFTOPF";
    sleep 1;
  };
};



//WAVE RESPAWN BLU =============================================================
[] spawn {
  while {true} do {
    waitUntil {!WAVERESPAWNBLU};

    //start wave timer
    if (count deadPlayersBlu >= 1 && WAVERESPAWNTIMELEFTBLU == WAVERESPAWNTIME) then {
      [] spawn mcd_fnc_waveTimeLeftBlu;
    };

    //check current dead players
    if (count deadPlayersBlu >= BLUFORWAVESIZE && WAVERESPAWNTIMELEFTBLU <= 0) then {
      newBluSpawns = [];
      WAVERESPAWNBLU = true;
      publicVariable "WAVERESPAWNBLU";
      diag_log "waveRespawn.sqf - Respawning now possible for Blufor.";

      sleep (RESPAWNWAVEEXTRATIME max 7);

      WAVERESPAWNBLU = false;
      publicVariable "WAVERESPAWNBLU";
      WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
      publicVariable  "WAVERESPAWNTIMELEFTBLU";
      diag_log "waveRespawn.sqf - Respawning no longer possible for Blufor.";
      newBluSpawns = [];

      sleep 3;
    };
    sleep 2;
  };
};

//WAVE RESPAWN OPF =============================================================
[] spawn {
  while {true} do {
    waitUntil {!WAVERESPAWNOPF};

    //start wave timer
    if (count deadPlayersOpf >= 1 && WAVERESPAWNTIMELEFTOPF == WAVERESPAWNTIME) then {
      [] spawn mcd_fnc_waveTimeLeftOpf;
    };

    //check current dead players
    if (count deadPlayersOpf >= OPFORWAVESIZE && WAVERESPAWNTIMELEFTOPF <= 0) then {
      newOpfSpawns = [];
      WAVERESPAWNOPF = true;
      publicVariable "WAVERESPAWNOPF";
      diag_log "waveRespawn.sqf - Respawning now possible for Opfor.";

      sleep (RESPAWNWAVEEXTRATIME max 7);

      WAVERESPAWNOPF = false;
      publicVariable "WAVERESPAWNOPF";
      WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
      publicVariable "WAVERESPAWNTIMELEFTOPF";
      diag_log "waveRespawn.sqf - Respawning no longer possible for Opfor.";
      newOpfSpawns = [];

      sleep 3;
    };
    sleep 2;
  };
};
