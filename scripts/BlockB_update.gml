/// BlockB_update()


var _CS4 = cs&$4;

GO_update_cs();

if (Chain_hang)
{
    if (Chain_connected_prev 
    && !Chain_connected )
    {
        Fall_delay_timer = Fall_delay_DURATION;
    }
}
else
{
    if (_CS4 
    && !(cs&$4) )
    {
        Fall_delay_timer = Fall_delay_DURATION;
    }
}
/*
if (_CS4 
&& !(cs&$4) )
{
    Fall_delay_timer = Fall_delay_DURATION;
}
*/


if (Fall_delay_timer)
{
    Fall_delay_timer--;
    if(!Fall_delay_timer 
    && !Chain_hang )
    {   // Starting to fall. Change tiles to non-solid.
        var _i, _x,_y;
        for(_i=0; _i<4; _i++)
        {
            _x = xl + ((_i&1)<<3);
            _y = yt + ((_i>1)<<3);
            tile_change_1a(0, _x,_y, -1,0, 0);
        }
    }
}




BodyHB_idx = BODY_HB_IDX2;


if(!Fall_delay_timer 
&& !(cs&$4) )
{
    if(!Chain_hang 
    || !Chain_connected )
    {
        updateY();
        if (vspd<$80 
        &&  vspd>VSPD_MAX )
        {   vspd=VSPD_MAX;  }
        
        GO_update_cs();
        
        
        BodyHB_idx = BODY_HB_IDX1;
        
        if (cs&$4)
        {   // Landed!
            Chain_hang = false;
            
            BodyHB_idx = BODY_HB_IDX2;
            solid_clip_correction(false);
            vspd = 0;
            
            // Change tiles to solid.
            var _i, _x,_y;
            for(_i=0; _i<4; _i++)
            {
                _x = xl + ((_i&$1)<<3);
                _y = yt + ((_i>$1)<<3);
                tile_change_1a(0, _x,_y, -1,0, TID_SOLID1);
            }
            
            aud_play_sound(get_audio_theme_track(dk_BridgeCrumble));
        }
        else if (vspd>=$10)
        {
            GOB_body_collide_pc_body_1a();
            
            if (cs&CS_BD1 
            &&  global.pc.yt+global.pc.hh>=yt+8 )
            {
                enemy_collide_pc_body();
            }
        }
    }
}


if (yt>=cam_yb_max()+$18)
{
    GOB_despawn(id);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


update_EF11();
update_body_hb_1a(); // body hb is the "solid" area of the object




Chain_connected_prev = Chain_connected;




