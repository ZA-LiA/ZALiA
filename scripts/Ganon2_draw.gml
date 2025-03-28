/// Ganon2_draw()


var _i, _x,_y;
var _sprite, _pi;
var _Crystal_depth = depth-1;
var _DEPTH = depth;


// ---------------------------------------------------------------
if (Crystal_can_draw 
&&  Crystal_detatched )
{
    Crystal_can_draw = false;
    _Crystal_depth = depth+1;
    
    _x  = Crystal_x;
    _y  = Crystal_y;
    draw_sprite_(Crystal_sprite,0, _x,_y, Crystal_pi);
}



if (Form3_can_draw)
{
    Form3_can_draw = false;
    
    var _idx = 1;
    switch(sub_state)
    {
        case sub_state_NextForm_FALL:{
        _idx = 1;
        break;}
        
        case sub_state_NextForm_LEAVE1:{
        var _TIMING = 1 + (timer2<=(Form3_DURATION1>>2));
            _TIMING = _TIMING<<3;
        _idx = !!(timer2&_TIMING);
        break;}
        
        case sub_state_NextForm_LEAVE2:{
        _idx = 0;
        break;}
        
        case sub_state_NextForm_LEAVE:{
        _idx = !(g.counter1&$10);
        break;}
    }
    _sprite = dg_Form3_SPRITES[#Form3_sprite_idx, _idx];
    
    if (Form3_sprite_idx==1  // transparent spr
    &&  stun_timer )
    {    _pi = p.dg_PI_SEQ[#0,(stun_timer>>1)&$3] + p.PI_LIT1;  }
    else _pi = PI_BGR_1;
    
    
    if (Form3_sprite_idx==1) // transparent spr
    {   draw_skull_1a(x,y,1,1, PI_MOB_RED, 1);  }
    
    draw_sprite_(_sprite,0, x,y, _pi);
}



// ---------------------------------------------------------------
if (can_draw_self)
{
    pal_swap_set(p.palette_image, palidx);
    draw_sprite_(sprite,0, drawX,drawY);
    draw_sprite_(Face_SPRITE,0, drawX,drawY);
    
    _x = x + dg_Positions[#0,$0]; // Home x
    _y = y + dg_Positions[#0,$1]; // Home y
    draw_sprite_(CrystalSlot_SPRITE,0, _x,_y);
    pal_swap_reset();
}


if (Crystal_can_draw 
&&  Crystal_sprite_state )
{
    Crystal_can_draw = false;
    
    _x = x + dg_Positions[#Crystal_position,$00];
    _y = y + dg_Positions[#Crystal_position,$01];
    
    if (Crystal_position       // is attacking
    &&  Crystal_fade_state!=1  // NOT fading-in
    &&  g.counter1&$1 )
    {
        draw_sprite_(CrystalAura_SPRITE,0, _x,_y-1, CrystalAura_pi);
    }
    
    draw_sprite_(Crystal_sprite,0, _x,_y, Crystal_pi);
}








if (DEV 
&&  state )
{
    GameObjectB_debug_draw_1a(); // body hb, shield hb, sword hb, cs points, ocs
    GO_debug_draw_1a(); // xl/yt point, spr outline
    GOB_draw_hp();      // Toggle with 'V'
}




