/// Wizard_update()


// AE4F
behavior = 0; // SoundWave checks this

facing_dir = dir_to_pc(id);

counter = (counter-1)&$FF;




if (counter >= $C0) // $FF-C0
{
    if (counter&1) update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// --------------------------------------------------------------------------
// AE64
if (counter == $B0 
&& !ocs 
&&  avail_uidx_goc(MAX_GOC1) != UIDX_NULL )
{
    var            _XX = xl +  $D;
    if(!facing_dir) _XX = xl + -$6;
    var            _YY = yt + $10;
    
    
    with(GOC1_create(_XX,_YY, facing_dir, projectile,projectile_ver, id))
    {
        counter = 1 + !facing_dir; // 1,2
    }
}



// --------------------------------------------------------------------------
// AE6D
if (counter & $80) // $BF-80
{
    behavior = 1; // SoundWave checks this
    
    GOB_body_collide_pc_body_1a();
    if (cs&CS_BD1) enemy_collide_pc_body();
    
    update_EF11();
}
else if (counter >= $40) // $7F-40
{   // AEBA
    if!(counter&$1) update_EF11();
}
else if (counter <  $40) // $3F
{   // AEBD
    stun_timer = 0;
    counter    = 0;
    
    switch(g.mod_Wizard_TELEPORT_AREA)
    {
        case 0:{
        // OG: Wizards only teleport inside map page 1...
        var           _xl  = rand();
        if (_xl>=$E0) _xl  = _xl>>1;
                      _xl += $100;
        set_xy(id,    _xl+sprite_index_xoff, yt);
        break;}
        
        
        case 1:{
        var _x = g.view_xl_og + irandom($100); // MOD.  Using rand() can make Wizards group together
            _x = clamp(_x, cam_xl_min()+sprite_index_xoff, cam_xr_max()-sprite_index_xoff);
        set_xy(id, _x,y);
        
        prevent_spawn_in_pc(id);
        _x = clamp(_x, cam_xl_min()+sprite_index_xoff, cam_xr_max()-sprite_index_xoff);
        set_xy(id, _x,y);
        break;}
        
        
        case 2:{
        var _PAD = PAGE_W>>2;
        var _x = max(cam_xl_min()+_PAD, g.view_xl_og);
        var _W = min(_x+PAGE_W, cam_xr_max()-_PAD) - _x;
        _x += irandom(_W);
        set_xy(id, _x,y);
        prevent_spawn_in_pc(id);
        break;}
    }
}




