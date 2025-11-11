/// SpikeTrapD_update()


switch(sub_state)
{
    case sub_state_IDLE:{
    
    break;}//case sub_state_IDLE
    
    
    
    
    case sub_state_COOLDOWN:{
    if (Cooldown_timer)
    {
        Cooldown_timer--;
        if(!Cooldown_timer)
        {
            x_move = 0;
            y_move = 0;
            aud_play_sound(Attack_SOUND);
            Attack_timer = Attack_duration;
            sub_state = sub_state_ATTACKING;
        }
        else
        {
            if (xl!=spawn_xl 
            ||  yt!=spawn_yt )
            {
                if (xl!=spawn_xl)
                {
                    x_move += Attack_SPEED;
                    xl += min(abs(xl-spawn_xl), floor(x_move)) * sign(xl<spawn_xl);
                }
                
                if (yt!=spawn_yt)
                {
                    y_move += Attack_SPEED;
                    yt += min(abs(yt-spawn_yt), floor(y_move)) * sign(yt<spawn_yt);
                }
                
                x_move = frac(x_move);
                y_move = frac(y_move);
                
                set_xlyt(id, xl,yt);
            }
        }
    }
    break;}//case sub_state_COOLDOWN
    
    
    
    
    case sub_state_ATTACKING:{
    var _i;
    
    if (Attack_timer)
    {
        Attack_timer--;
        if(!Attack_timer)
        {
            x_move = 0;
            y_move = 0;
            
            if (ds_grid_width(g.dg_RmTile_Spike))
            {
                var _clm,_row;
                for(_i=0; _i<Spike_count; _i++)
                {
                    _clm = (xl>>3) + (_i*(Attack_y_direction!=0));
                    _row = (yt>>3) + (_i*(Attack_x_direction!=0));
                    g.dg_RmTile_Spike[#_clm,_row] = 0;
                }
            }
            
            Cooldown_timer = Cooldown_duration;
            sub_state = sub_state_COOLDOWN;
        }
        else
        {
            if ((Attack_x_direction!=0 && abs(xl-spawn_xl)<Attack_DIST) 
            ||  (Attack_y_direction!=0 && abs(yt-spawn_yt)<Attack_DIST) )
            {
                if (Attack_x_direction!=0)
                {
                    x_move += Attack_SPEED;
                    xl += floor(x_move) * Attack_x_direction;
                    xl  = clamp(xl, spawn_xl-Attack_DIST, spawn_xl+Attack_DIST);
                }
                
                if (Attack_y_direction!=0)
                {
                    y_move += Attack_SPEED;
                    yt += floor(y_move) * Attack_y_direction;
                    yt  = clamp(yt, spawn_yt-Attack_DIST, spawn_yt+Attack_DIST);
                }
                
                x_move = frac(x_move);
                y_move = frac(y_move);
                
                set_xlyt(id, xl,yt);
                
                if ((Attack_x_direction!=0 && abs(xl-spawn_xl)==Attack_DIST) 
                ||  (Attack_y_direction!=0 && abs(yt-spawn_yt)==Attack_DIST) )
                {
                    var _clm,_row;
                    for(_i=0; _i<Spike_count; _i++)
                    {
                        _clm = (xl>>3) + (_i*(Attack_y_direction!=0));
                        _row = (yt>>3) + (_i*(Attack_x_direction!=0));
                        g.dg_RmTile_Spike[#_clm,_row] = SpikeGrid_value;
                    }
                }
            }
            else
            {
                // check for pc collision?
            }
        }
    }
    break;}//case sub_state_ATTACKING
}//switch(sub_state)




update_EF11();




