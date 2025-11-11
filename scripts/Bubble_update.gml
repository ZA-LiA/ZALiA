/// Bubble_update()


if (is_dormant)
{
    updateX();
    updateY();
    
    GO_update_cs();
    
    if (cs&$3)
    {
        hspd = 0;
    }
    
    if (cs&$8 
    &&  vspd&$80 )
    {
        vspd = 0;
    }
    
    if (cs&$4)
    {
        solid_clip_correction(vspd && vspd<$80);
        vspd = 0;
    }
    
    
    GOB_update_2();
    
    
    update_body_hb_1a();
    with(Flame1)
    {
        if (rectInRect(BodyHB_xl,BodyHB_yt,BodyHB_w,BodyHB_h, other.BodyHB_xl,other.BodyHB_yt,other.BodyHB_w,other.BodyHB_h))
        {
            state = 0;
            
            with(other)
            {
                is_dormant = false;
                
                hspd = ( spdBase * sign_(irandom(1))) &$FF;
                vspd = (-spdBase) &$FF;
                vspd_grav = 0;
                
                react_sword   = REACT_SWORD;
                react_proj    = REACT_PROJ;
                react_thunder = REACT_THUNDER;
                react_spell   = REACT_SPELL;
                xp_drain      = XP_DRAIN;
                cs_off_idx    = CS_OFF_IDX;
                //setCSOffsets();
            }
            
            break;//with(Flame1)
        }
    }
    
    
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// ---------------------------------------------------------------
// 99D1
if (stun_timer)
{
    GOB_update_2();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






// ---------------------------------------------------------------
// 99D4
updateX();
updateY();

GO_update_cs();





// ---------------------------------------------------------------
if (ver&VER_BIT_CLNG)
{
    Bubble_cling_update_1a();
    // exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




// ---------------------------------------------------------------
GOB_update_2();
if (cs&CS_BD1)
{
    enemy_collide_pc_body();
        mp_drain_counter++; // to keep mp an even number
    if!(mp_drain_counter&$1) adjust_stat(0,-2);
}





if (ver&VER_BIT_CLNG)
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






// ---------------------------------------------------------------
// A09F Bubble $15 & GiantBubble
if (ver&VER_BIT_GIAN 
&&  hp<g.dl_HP[|$1B] ) // $17, ver 3: GiantBubble
//&&  hp<$C0 ) // $17, ver 3: GiantBubble
{
    state = 0; // this should happen 1st
    
    
    var _x,_y, _DIR_H,_DIR_V, _SPEED, _VER;
    _DIR_H = byte_dir(hspd);
    _DIR_V = byte_dir(vspd);
    _SPEED = SPEED2;
    _VER   = (ver&VER_BIT_STAB) | VER_BIT_FAST;
    
    
    _x = x - $10;
    _y = y - $10;
    with(GameObject_create(_x,_y, BubbA,_VER)) // Bubble fast
    {
        hspd = byte( _SPEED*_DIR_H);
        vspd = byte( _SPEED*_DIR_V);
    }
    
    
    _x = x;
    _y = y + (vspd>=$80);
    with(GameObject_create(_x,_y, BubbA,_VER)) // Bubble fast
    {
        hspd = byte( _SPEED*_DIR_H);
        vspd = byte((_SPEED*_DIR_V) ^ $FF);
    }
}






// ---------------------------------------------------------------
if (ver&VER_BIT_STAB 
&&  cs&(CS_SW1|CS_PR1) )
{
    if(!stab_changed_dir)
    {
        stun_timer = 0;
        
        if (isVal(global.pc.behavior, global.pc.behavior_STAB_UP,global.pc.behavior_STAB_DOWN))
        {
            if (  global.pc.behavior==global.pc.behavior_STAB_UP)
            {    vspd = -abs8b(vspd) &$FF;  }
            else vspd =  abs8b(vspd) &$FF;
            
            updateY();
        }
        else
        {
            if (global.pc.xScale)
            {    hspd =  abs8b(hspd) &$FF;  }
            else hspd = -abs8b(hspd) &$FF;
            
            hspd_dir   = byte_dir(hspd);
            facing_dir = hspd_dir;
            
            updateX();
        }
        
        
        stab_changed_dir = $F;
    }
}
else    stab_changed_dir = 0;



// 99FB, A0FB
// Both sprite_index are 16x16. GiantBubble's 4-16x16 parts 
// are drawn equal distances around it.
// Giant Bubble: bounce when 4 pixels of sprite is off screen
//   Reg Bubble: bounce when 8 pixels of sprite is off screen

var                   _OCS = ocs&$04; // at least half w is out of ocs area
if (ver&VER_BIT_GIAN) _OCS = ocs&$1F; // any           w is out of ocs area

if (_OCS 
||  cs&$3 )
{   // 9A07
    hspd       = byte_negate(hspd);
    hspd_dir   = byte_dir(   hspd);
    facing_dir = hspd_dir;
    updateX();
}

// 9A0D, A10D
if(!ocsV1(id)  // if NO height w/in ocs area
||  cs&$C )
{
    vspd     = byte_negate(vspd);
    //vspd_dir = byte_dir(vspd);
    updateY();
}




