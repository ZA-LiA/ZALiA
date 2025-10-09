/// Blaze_update()


// B485: JSR D959: JSR DE3D
GO_update_cs();

// ------------------------------------------------------------
if (can_leave_kid)
{
    for(var _i=ds_grid_width(dg_kids)-1; _i>=0; _i--)
    {
        if (dg_kids[#_i,0])
        {   dg_kids[#_i,0]--;  }
        
        if(!dg_kids[#_i,0]) continue;
        
        if(!global.pc.ogr 
        &&  rectInRect(dg_kids[#_i,1]-2,dg_kids[#_i,2]-2,4,4, global.pc.x-6,global.pc.yt,12,global.pc.hh))
        {   // PC can put out flame.
            dg_kids[#_i,0] = 0;
        }
    }
}


// ===================================================================
// ------------------------------------------------------------
if (ver==1 
||  ver==2 )
{
    GOB_update_2();
    
    // D95C
    if (cs&$4)
    {
        solid_clip_correction(vspd && vspd<$80);
        
        if (vspd>$0E)
        {
            if (abs8b(hspd)==hspd_jump)
            {
                hspd = (hspd>>1) | (hspd&$80);
            }
            
            
            // BOUNCE -------
            set_xy(id, x,y-1);
            if (vspd>$30) vspd = $F1;
            else          vspd = $F8;
        }
        else
        {
            hspd = 0;
            vspd = 0;
            
            if (abilities & ABL_JUMP 
            && !timer 
            && !ogr )
            {
                hspd = (hspd_jump*dir_to_pc_(id)) &$FF;
                vspd =  vspd_jump;
                
                if (can_leave_kid)
                {
                    for(var _i=ds_grid_width(dg_kids)-1; _i>=0; _i--)
                    {
                        if (dg_kids[#_i,0]) continue;
                        
                        // Leave a little flame behind each jump.
                        dg_kids[#_i,0] = DUR_KID;
                        dg_kids[#_i,1] = x;
                        dg_kids[#_i,2] = yt + hh - 2;
                        break;//_i
                    }
                }
                
                ogr = OGR_JUMP;
            }
            else
            {
                if (abilities&ABL_JUMP 
                &&  ogr )
                {
                        timer  = DUR_DELAY_JUMP;
                    if (ogr==OGR_OTHR)
                    {   timer -= $20;  }
                    else if!(rand()&$3) // 25% chance
                    {   timer += $20*sign_(g.counter1&$1);  }
                }
                
                ogr = 0;
            }
        }
    }
    else
    {
        if(!ogr) ogr = OGR_OTHR;
        
        vspd = (vspd+1)&$FF;
        
        // Prevent from doing endless wave
        if (abs8b(vspd)&$7F >= vspd_MAX) vspd = byte(vspd_MAX*sign_(vspd<$80));
    }
    
    if (cs&$3 
    &&  vspd<$80 )
    {
        hspd=$0;
    }
    
    
    if!(cs&$3) updateX();
               updateY();
    //
    
    
    // B488: JMP D6C1
    if (cs&CS_BD1) enemy_collide_pc_body();
    
    GO_vspd_update1(); // if (cs8() && vspd&$80) vspd=$0;
}






// ===================================================================
// ------------------------------------------------------------
if (ver==3 
||  ver==4 
||  ver==5 )
{
    if (timer)
    {
        update_EF11();
        
        if (timer==1)
        {
            hp    = 0;
            state = 0;
        }
    }
    else
    {
        var _PC_REACT = 2;
        var _PC_VSPD = global.pc.vspd;
        
        GOB_update_2();
        stun_timer = 0;
        
        
        if (cs&(CS_BD1|CS_SW1|CS_PR1))
        {   timer = DUR_FADE1;  }
        
        if (isVal(ver, 3,4) 
        &&  cs&(CS_SW1|CS_PR1) )
        {   aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));  }
        
        if (isVal(ver, 3,4) 
        &&  cs&CS_BD1 )
        {   enemy_collide_pc_body();  }
        
        if (_PC_REACT==2 
        || (_PC_REACT==1 && ver==5) )
        {
            if (cs&CS_SW1 
            &&  isVal(global.pc.behavior, global.pc.behavior_STAB_UP,global.pc.behavior_STAB_DOWN) )
            {
                global.pc.vspd = _PC_VSPD;
            }
        }
    }
    
    
    hp = $FF;
}



if (ver==6)
{
    if (size!=1) GOB_update_2();
    else         update_EF11();
    
    hspd=0;
    
    if (cs&CS_BD1)
    {
        if (size==1) state=0;
        else enemy_collide_pc_body();
    }
}




