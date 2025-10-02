/// Mau_update()


// B8BB: JSR DE40
GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();


counter = (counter+1)&$FF;




// B8CD
if(!(counter&$3F)    // every 64 frames. 1.067s
&&  is_facing_pc(id) 
&&  avail_uidx_goc(MAX_GOC1) != UIDX_NULL )
{   // Bullet1
    GOC1_create(xl,yt, facing_dir, projectile,projectile_ver, id, global.PI_MOB_BLU);
}



/*
0000 0000  $00
0010 0000  $20
0100 0000  $40
0110 0000  $60

1000 0000  $80
1010 0000  $A0
1100 0000  $C0
1110 0000  $E0
*/
if (counter&$20) // For 0.533s.   $20-3F, $60-7F, $A0-BF, $E0-FF
{   // B8F0
    if (counter&$40) vspd = (-VSPD1) &$FF; // counter: $60-7F, $E0-FF
    else             vspd = ( VSPD1) &$FF; // counter: $20-3F, $A0-BF
    
    updateY();
}
else               // For 0.533s.   $00-1F, $40-5F, $80-9F, $C0-DF
{   // B8ED
    updateX();
}






if (ver==2 
// &&  byte_dir(hspd)==g.pc.facing_dir )
&&  facing_dir==g.pc.facing_dir )
{
    var _DIST  = abs(g.pc.x-x);
    if (_DIST >= MIN_DIST) // FLIP_DIST = $18;
    {
        facing_dir = -g.pc.facing_dir;
        hspd = (abs8b(hspd)*facing_dir) &$FF;
        
        var _X = g.pc.x + (_DIST * g.pc.facing_dir);
        //var _X = g.pc.x + (g.pc.x - x);
        set_xy(id, _X,y);
    }
}




