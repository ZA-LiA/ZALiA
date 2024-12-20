/// Challenge_PushableMatching1_draw()


//if(!canDrawSelf) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i, _x,_y, _spr;



if (Door_state)
{
    pal_swap_set(p.palette_image, Blocks_PI);
    var _C1 = Door_state==1  ||  Door_timer >= DRAW_CUE1;
    for(_i=0; _i<Door_Blocks_COUNT; _i++)
    {
        _x  = Door_XL;
        _y  = Door_YT + (_i<<4);
        _x += 8;
        _y += 8;
        if (_C1)
        {
            draw_sprite_(Blocks_SPR,0, _x,_y);
        }
        
        if (Door_state==2)
        {
            if (inRange(Door_timer,8,23))
            {    _spr = spr_Explosion1B_1;  }
            else _spr = spr_Explosion1A_1;
            draw_sprite_(_spr,0, _x,_y, PI_MOB_ORG);
        }
    }
    pal_swap_reset();
}






if (g.can_draw_hb){             var _SIZE=$10;
    for(_i=ds_grid_width(dg_Switches)-1; _i>=0; _i--){
        _x = dg_Switches[#_i,0];
        _y = dg_Switches[#_i,1] -   _SIZE;
        draw_rect_(c_orange, _x,_y, _SIZE,_SIZE, 1, true);
    }
}





