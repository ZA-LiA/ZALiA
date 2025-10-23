/// SpikeTrapD_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


if(!surface_exists(Spike_surf))
{
    Spike_surf = surface_create(ww,hh);
    surface_set_target(Spike_surf);
    draw_clear_alpha(c_black,0);
    
    var _i, _x,_y;
    if (Attack_x_direction!=0)
    {
        var _TSRC_BASE = $D1;
        var _TSRC_TIP  = _TSRC_BASE - 1;
    }
    else
    {
        var _TSRC_BASE = $F0;
        var _TSRC_TIP  = _TSRC_BASE - $10;
    }
    
    for(_i=0; _i<Spike_count; _i++)
    {
        _x=$0;
        switch(Attack_x_direction){
        case  0:{_x=_i<<3; break;}
        case  1:{_x=$8; break;} // Because need to flip tile
        case -1:{_x=$8; break;}
        }
        _y=$0;
        switch(Attack_y_direction){
        case  0:{_y=_i<<3; break;}
        case  1:{_y=$8; break;} // Because need to flip tile
        case -1:{_y=$8; break;}
        }
        draw_background_part_ext(ts_Man_made_3a_WRB, ((_TSRC_BASE>>0)&$F)<<3, ((_TSRC_BASE>>4)&$F)<<3, $8,$8, _x,_y, sign_(Attack_x_direction!=1),sign_(Attack_y_direction!=1), c_white,1);
        
        switch(Attack_x_direction){
        case  1:{_x+=$8; break;}
        case -1:{_x=$0; break;}
        }
        switch(Attack_y_direction){
        case  1:{_y+=$8; break;}
        case -1:{_y=$0; break;}
        }
        draw_background_part_ext(ts_Man_made_3a_WRB, ((_TSRC_TIP>>0)&$F)<<3, ((_TSRC_TIP>>4)&$F)<<3, $8,$8, _x,_y, sign_(Attack_x_direction!=1),sign_(Attack_y_direction!=1), c_white,1);
    }
    
    surface_reset_target();
}


pal_swap_set(global.palette_image, palidx);
draw_surface(Spike_surf, xl,yt);
//draw_surface(Spike_surf, drawX-ww_, drawY-hh_);
pal_swap_reset();




