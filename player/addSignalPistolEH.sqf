player addEventHandler ["Fired",{
    params ['unit', '_weapon', '_muzzle','_mode','_ammo','_mag','_projectile'];
    _color = "random";

    switch (_ammo) do {
        case "Sub_F_Signal_Red": {_color = "red"}; // 6Rnd_RedSignal_F
        case "6Rnd_GreenSignal_F": {_color = "green"};
        default {};
    };

    _pos = getPosATLVisual _projectile;
    deletevehicle _projectile;
    _weaponVector = weaponDirection currentWeapon player;
    
    [_pos, _weaponVector, 'normal', _color] remoteExec ["callFireworks",2,false]; 
}];