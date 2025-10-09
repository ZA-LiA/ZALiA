/// Kakusu_update()


var _RAND = irandom($FF);



if (object_index==Kakusu009) // Kakusu009: Darunia Teleporting Kakusu
{
    if (stun_timer)
    {   // Invulnerable while stunned.
        react_sword   = 0;
        react_proj    = 0;
        react_thunder = 0;
    }
    else
    {
        react_sword   = REACT_SWORD;
        react_proj    = REACT_PROJ;
        react_thunder = REACT_THUNDER;
    }
    
    
    if (stun_timer == 1)
    {   // Teleport after taking damage.
        stun_timer  = 0;
        
        var _clm=0;
        var _row=0;
        with(BlckB){_clm=xl>>3; _row=yt>>3; break;}
        var _COUNT=ds_grid_width(dg_sequence);
        sequence_idx = (sequence_idx+1+_COUNT) mod _COUNT;
        _x = dg_sequence[#sequence_idx,1];
        _y = dg_sequence[#sequence_idx,2];
        set_xy(id, _x,_y);
    }
}






// ---------------- JUMPING --------------------------
if (abilities&ABL_JUMP 
&&  cs&$4 
&& !(_RAND & (jump_chance-1)) ) // JUMP_CHANCE1=$80, JUMP_CHANCE2=$40
{
    facing_dir = dir_to_pc_(id);
    hspd = byte(hspd_jump*facing_dir);
    vspd = byte(vspd_jump + ((_RAND<$10)<<4)); // Jump!
    //sdm("xl $"+hex_str(xl)+", yt $"+hex_str(yt)+", cs $"+hex_str(cs)+", ogr "+string(ogr)+", _RAND $"+hex_str(_RAND));
    ogr = OGR_JUMP;
}



var _VSPD =    vspd;
updateY();
if (_VSPD<$80) vspd = min(vspd, term_vel);




// ------------------------------------------------------------
GO_update_cs();

GOB_update_2();
if (cs&CS_BD1) enemy_collide_pc_body();




// ------------------------------------------------------------
if (object_index==Kakusu009) // Kakusu009: Darunia Teleporting Kakusu
{
    if (hp < g.dl_HP[|HP_IDX])
    {
        if (cs&(CS_SW1|CS_PR1) 
        ||  spell_last_used()&SPL_THUN )
        {
            hp = g.dl_HP[|HP_IDX];
            stun_timer = STUN_DURATION1>>1; // STUN_DURATION1 = $30
            state = state_NORMAL;
        }
    }
    
    
    // Falling blocks will kill.
    with(BlckB)
    {
        if (vspd 
        &&  body_collide_body(id,other) )
        {
            with(other)
            {
                damage_gob(id, max(hp,0), false);
                Kakusu_update_defeated();
            }
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
}




// ------------------------------------------------------------
if (cs&$4)
{
    solid_clip_correction(vspd && vspd<$80);
    vspd = 0;
}


if (cs&$8 
&&  vspd&$80 )
{   // Top hit cieling
    vspd=0;
}


if (cs&$8 
&&  cs&$4 
&&  cs&$3 )
{   // Stuck in wall?
    var _XL = ((xl>>3) + (hspd<$80)) <<3;
    set_xlyt(id, _XL,yt);
}



if (cs&$4)
{
    ogr = 0;
}
else if(!ogr)
{
    ogr = OGR_OTHR;
}







// ------------------------------------------------------------
// Drop Flame --------------------------------
if (abilities&ABL_SHOT 
&&  projectile 
&& !(cs&$4) 
&&  ocsH3(id)         // if ALL w in ocs area
&&  ogr  == OGR_JUMP  // off ground bc jumped
&&  vspd >= $F0 
&&  vspd <  $F0+vspd_grav 
&&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
{
    var _XL  = x-4;
        _XL += 6*byte_dir(hspd); // Without this, the flame doesn't look like its coming from the center
    with(GOC1_create(_XL,yt+4, 1, projectile,projectile_ver))
    {
        GO_depth_init(other.depth+1);
        hspd =   0;
        vspd = $10;
    }
}







// ------------------------------------------------------------
if (cs&$4)
{
    if (abilities&ABL_WALK)
    {
        if(!is_idle)
        {
            if(!(cs&$3) 
            &&  isVal(counter&$F, $F,$3) )
            {
                if (abilities&ABL_RUN_ 
                &&  ((g.counter1-RPB)&$FF) < $80 )
                {    hspd = (HSPD_WALK2*walk_dir) &$FF;  }
                else hspd = (HSPD_WALK1*walk_dir) &$FF;
                
                // Prevent clip into wall
                if ((hspd<$80 && !(csRgtColliding()&TID_SOLID1)) 
                ||  (hspd&$80 && !(csLftColliding()&TID_SOLID1)) )
                {
                    updateX();
                }
            }
            
            counter = (counter+1)&$FF;
        }
        
        
        
        if(!timer)
        {
                is_idle = !is_idle;
            if (is_idle) timer = MIN_DUR_IDLE | (_RAND&$3F); // $C0-FF. Idle period
            else         timer = MIN_DUR_WALK | (_RAND&$3F); // $40-7F. walk period
            
            walk_dir = sign_(_RAND&$1);
        }
    }
}
else
{   // Off ground
    if!(cs&$3) updateX();
    else       hspd = 0; // MOD
}









// ---------------------------------------------------------------------------
if (object_index==Kakusu003) // Kakusu003: Only a downthrust from high enough will kill
{   // TODO: Change stun reaction if not a killing strike.
    // TODO: Track PC.drop_y(or drop dist?) through multiple rms.
    stun_timer = 0;
    hspd = 0;
    
    hp = g.dl_HP[|hp_idx];
    
    if (cs&CS_SW1 
    &&  global.pc.behavior==global.pc.behavior_STAB_DOWN  // if PC downthrusting
    &&  global.pc.y-global.pc.drop_y >= drop_dist )       // if PC has fallen far enough
    {
        damage_gob(id, max(hp,0), false);
    }
}




// ---------------------------------------------------------------------------
Kakusu_update_defeated();




