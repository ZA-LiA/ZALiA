/// RebonackA_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _can_draw_self = false;
switch(phase)
{
    case 1:{
    _can_draw_self = true;
    break;}
    
    case 2:{
    if (ocsH1(id)  // true if any width is w/in ocs area width
    &&  reboB 
    &&  instance_exists(reboB) )
    {
        if (reboB.state==state_NORMAL)
        {
            _can_draw_self = true;
            break;
        }
        
        if (reboB.state==state_EXPLODE 
        &&  reboB.timer >= g.BOSS_DEATH_FLASH_CUE )
        {
            _can_draw_self = true;
            break;
        }
    }
    break;}
}

if (_can_draw_self 
&&  Explode_counter<(Explode_DURATION>>1) )
{
    pal_swap_set(p.palette_image, palidx);
    
    draw_sprite_(Rider_sprite,0,  drawX+ Back_xoff, drawY+Rider_yoff, -1, xScale);
    draw_sprite_( Back_sprite,0,  drawX+ Back_xoff, drawY,            -1, xScale);
    draw_sprite_(Front_SPRITE,0,  drawX+Front_xoff, drawY,            -1, xScale);
    
    pal_swap_reset();
}

// --------------------------------------
if (phase==2 
&&  Explode_counter<Explode_DURATION 
&&  reboB 
&&  instance_exists(reboB) 
&&  reboB.state==state_EXPLODE )
{
    var _x,_y;
    var _is_exploding=false;
    with(BossExplosion)
    {
        if (state 
        &&  source_inst 
        &&  instance_exists(source_inst) )
        {
            _is_exploding=true;
            _x = other.x - (x-source_inst.x);
            _y = other.y - (y-source_inst.y);
            with(other)
            {
                draw_sprite_(other.sprite,0, _x,_y, other.palidx,  1);
                draw_sprite_(other.sprite,0, _x,_y, other.palidx, -1);
            }
        }
    }
    
    Explode_counter += _is_exploding;
}




