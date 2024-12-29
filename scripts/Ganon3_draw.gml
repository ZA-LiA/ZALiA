/// Ganon3_draw()


var _i, _x,_y, _idx,_idx2, _val;
var _rotation  = 0;
var _sprite = 0;
var _shine  = 0;


     if (stun_timer)             var _PI = p.dg_PI_SEQ[#0,(stun_timer>>1)&$3] + p.PI_LIT1;
else if (p.SpellFlash_GOB_timer) var _PI = p.dg_PI_SEQ[#4,max(0,p.SpellFlash_GOB_timer-1)&$3];
else                             var _PI = 0;

var _pi = PI_MOB_RED;




// Skull ------------------------------------------------
if (SkullAura_can_draw)
{
    SkullAura_can_draw=false;
    /* permutations
    (0)HMS,(1)HSM
    (2)MHS,(3)MSH
    (4)SHM,(5)SMH */
    _pi = p.dg_PI_SEQ[#0,(g.counter1>>1)&$3] + p.PI_LIT1;
    draw_sprite_(SkullAura_SPRITE,0, Skull_x,Skull_y, _pi);
}
if (Skull_can_draw)
{
    Skull_can_draw=false;
    if (_PI) _pi = _PI;
    else     _pi = Skull_PI;
    
    if (audio_is_playing(Audio.SND_BOSS_ROAR) 
    || !hp 
    ||  (stun_timer && SkullClingState==SkullClingState_FREE) )
    {    _val = 3;  } // mouth fully open
    else _val = 1+(SkullClingState==SkullClingState_FREE);
    
    draw_skull_1a(Skull_x,Skull_y,1,1, _pi, _val);
}






// Crystal ---------------------------------------------------
if (Crystal_can_draw)
{
    Crystal_can_draw=false;
    Crystal_pi = PI_MOB_ORG + ((g.counter1>>1)&$3);
    Crystal_x  = Skull_x;
    Crystal_y  = Skull_y-5;
    draw_sprite_(Crystal_sprite,0, Crystal_x,Crystal_y, Crystal_pi);
}





// Slime body ------------------------------------------------
if (can_draw_self)
{
    _x = drawX;
    _y = drawY;
    
    if (Tell1_timer)
    {   // Tell1_DURATION1=$20
             if (Tell1_timer>=Tell1_DURATION1-$4)   _idx = 1; // 1: squished(horizontal)
        else if (Tell1_timer>=Tell1_DURATION1-$8)   _idx = 0; // 0: normal
        else                                        _idx = 2; // 2: squished(vertical)
    }
    else if (SkullClingState==SkullClingState_FREE) _idx = 0; // 0: normal
    else                                            _idx = !(g.counter1&$10);
    
    _sprite = dg_SPRITES[#SPRITES_idx, _idx];
    _shine  = dg_SPRITES[#SPRITES_idx, dg_SPRITES_H-1];
    
    
    if (sub_state==sub_state_PHASE2)
    {
        _pi=Slime_PI1;
    }
    else if (_PI 
    &&  Attack_id!=Attack1_ID )
    //&&  SkullClingState==SkullClingState_CLING )
    {
        _pi=_PI; // spell flash & stun flash
    }
    else
    {
        _pi=Slime_PI2;
    }
    
    var _XSCALE = 1;
    if (BattleState==BattleState_Attack4_JUMP_DELAY)
    {   // Clinging on wall
         _rotation  = $3>>(x>arena_x); // $1,3
         _rotation *= 90; // 90,270
         _XSCALE = sign_(_rotation!=90);
    }
    else _rotation  = 0;
    
    draw_sprite_(_sprite,0, _x,_y, _pi,  xScale,yScale,   c_white,1, _rotation);
    draw_sprite_(_shine,0,  _x,_y,  -1, _XSCALE,yScale, p.C_WHT1, 1, _rotation);
}





// Projectile Rain ------------------------------------------
pal_swap_set(p.palette_image, ProjRain_PI);
for(_i=ds_grid_width(dg_ProjRain)-1; _i>=0; _i--)
{
    if(!dg_ProjRain[#_i,$4]) continue;
    
    _x = dg_ProjRain[#_i,$0];
    _y = dg_ProjRain[#_i,$1];
    
    if (dg_ProjRain[#_i,$5]) // $5: dicintigrate timer
    {
        if (dg_ProjRain[#_i,$5]&$8)
        {    _sprite = spr_Projectile_Disintegrate2;  } // 
        else _sprite = spr_Projectile_Disintegrate1; // 
    }
    else     _sprite = spr_Rock1; // 
    
    _val = g.counter1 + (_i<<1);
    _val = ((_val>>1)&$3) ^ $3;
    draw_sprite_(_sprite,0, _x,_y, -1, sign_(_val&$1),sign_(_val&$2));
}
pal_swap_reset();





/*
// Body Fire ------------------------------------------
pal_swap_set(p.palette_image, PI_MOB_ORG);
for(_i=ds_grid_width(dg_fire)-1; _i>=0; _i--)
{
    if(!dg_fire[#_i,$3])
    {   continue;  }
    
    if (dg_fire[#_i,$3]<min($10,Fire_DURATION3) 
    &&!(dg_fire[#_i,$3]&$1) ) // fade out
    {   continue;  }
    
    
    // Fire_DURATION2=$C, Fire_DURATION3=$C
    if (inRange(dg_fire[#_i,$3], Fire_DURATION3,Fire_DURATION1-Fire_DURATION2))
    {    _sprite = spr_Flame1;  }
    else _sprite = spr_Flame_Small_1a;
    
    _x = dg_fire[#_i,$0];
    _y = dg_fire[#_i,$1];
    draw_sprite_(_sprite,0, _x,_y, -1, sign_(dg_fire[#_i,$3]&1));
}
pal_swap_reset();
*/











// -------------------------------------------------------------
if (SkullHB_can_draw)
{
    SkullHB_can_draw=false;
    if (g.DevTools_state 
    &&  g.can_draw_hb )
    {
        if (SkullHB_R) draw_circ_(BodyHB_color, SkullHB_x,SkullHB_y, SkullHB_R,           1, true);
        else           draw_rect_(BodyHB_color, SkullHB_x,SkullHB_y, SkullHB_W,SkullHB_H, 1, true);
    }
}




