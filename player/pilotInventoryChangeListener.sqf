// FILE CURRENTLY NOT IN USE


// add eventhandler to check if
player addEventHandler ["InventoryOpened", {
      if (!("Land_Document_01_F" in (getItemCargo uniformContainer player))) then {

      _holder = createVehicle ["GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE"];
      _container = uniform player;
      _holder addItemCargoGlobal [_container, 1];
      _droppedContainer = (((everyContainer _holder) select 0) select 1);
      {
      _droppedContainer addItemCargoGlobal [_x, 1];
      }forEach (uniformItems player);
      {player removeItemFromUniform _x} forEach (uniformItems player);

          player addItemToUniform "Land_Document_01_F";
      };
}];
