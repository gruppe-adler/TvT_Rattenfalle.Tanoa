_bluforWinsListener = {
  if (!_this) exitWith {};
  if (side player == west || side player == independent) then {
      ["US troops safely brought their pilot home.",true,true] call BIS_fnc_endMission;
  } else {
      ["US troops safely brought their pilot home.",false,true] call BIS_fnc_endMission;
  };
};

_opforWinsListener = {
  if (!_this) exitWith {};
  if (side player == west || side player == independent) then {
      ["Rebels eliminated the pilot.",false,true] call BIS_fnc_endMission;
  } else {
      ["Rebels eliminated the pilot.",true,true] call BIS_fnc_endMission;
  };
};


BLUFOR_WINS addPublicVariableEventHandler _bluforWinsListener;
OPFOR_WINS addPublicVariableEventHandler _opforWinsListener;