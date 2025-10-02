/// Atta_update()


var                          _DUR = $30;
if ( counter == DUR_COOLDOWN+_DUR)
{    counter = _DUR;  }
else counter = (counter+1)&$FF;

if ( counter == DUR_COOLDOWN)
{
    for(var _i=0; _i<2; _i++)
    {
        if (avail_uidx_goc(MAX_GOC1)==UIDX_NULL) continue; // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        with(GOC1_create(x-4, yt-4, sign_(_i), projectile,projectile_ver))
        {
            vspd = $E0;
            hspd = ($10*facing_dir) &$FF;
        }
    }
}




if (cs&CS_BD1) enemy_collide_pc_body();
GO_update_cs(); // solids collision
GOB_update_2(); // body/shield/sword collision
GO_update_cs();



if!(g.counter1&$7)
{                                  var _Y_OFF=1;
    if (g.counter1&$20) set_xy(id, x,y-_Y_OFF);
    else                set_xy(id, x,y+_Y_OFF);
}




