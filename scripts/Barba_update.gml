/// Barba_update()


// B11F: JSR B20D
if(!Boss_update_1()) // check battle start/end/qualify
{
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// B125, B127: JSR 9C45
Boss_HPBar_udp();



if(!Boss_update_4()) // Arena gate
{
    update_EF11();
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
// B122: JSR B1DE, B1E3: JSR EF11
update_EF11();

// B1E6: JSR D6C1
if (cs&CS_BD1) enemy_collide_pc_body();

// B1F3: JSR DE40
if(!ocs) GOB_update_2();

// B1F6
Boss_update_5(); // check for and set pending death

// B12A: JSR DC91
facing_dir = dir_to_pc_(id);


// B12D
if (start_timer)
{   start_timer--;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}






// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
switch(sub_state)
{
    // ======================================================================
    // --------------------------------------------------------------
    case sub_state_HIDE:{ // B140
    if (timer) break;
    
    if (Attack1_Tokens)
    {    Pit_idx = 1 + irandom(ds_grid_width(dg_PITS)-3);  }
    else Pit_idx = 0 + ((ds_grid_width(dg_PITS)-1) * irandom(1)); // first or last
    //Pit_idx = 0 + ((ds_grid_width(dg_PITS)-1) * irandom(1)); // *** TESTING
    BounceAttack_y_dir = choose(1,-1);
    
    var  _X = 0;
    if (      dg_PITS[#Pit_idx,1] + (dg_PITS[#Pit_idx,2]>>1) < global.pc.x)
    {    _X = dg_PITS[#Pit_idx,1] +  dg_PITS[#Pit_idx,2] - min($10, dg_PITS[#Pit_idx,2]>>1);  }
    else _X = dg_PITS[#Pit_idx,1]                        + min($10, dg_PITS[#Pit_idx,2]>>1);
    
    set_xy(id, _X,y);
    sub_state = sub_state_RISE;
    break;}//case sub_state_HIDE:{
    
    
    
    
    
    
    
    // ======================================================================
    // --------------------------------------------------------------
    case sub_state_RISE:{ // B154
    if (( Attack1_Tokens && y>=Attack1_Y) 
    ||  (!Attack1_Tokens && yt>g.rm_h-(Segment_COUNT<<4)) ) // Bouncy Fireballs attack
    {   // B15A
        set_xy(id, x,y-3);
    }
    else
    {   // B161
        timer = Attack1_DURATION2; // OG: $A0
        sub_state = sub_state_ATTACK;
    }
    break;}//case sub_state_RISE:{
    
    
    
    
    
    
    
    // ======================================================================
    // --------------------------------------------------------------
    case sub_state_ATTACK:{ // B16A
    if (timer)
    {
        if(!pending_death) Boss_Roar_update();
        
        if!(timer&$1)
        {
            if (timer&$20) set_xy(id, x, y+1);
            else           set_xy(id, x, y-1);
        }
        
        // B180
        if (timer >= Attack1_CUE1 
        &&  timer <= Attack1_CUE1+Attack1_DURATION1-1 
        &&  is_facing_pc(id) 
        &&  g.counter1&$1 ) // new projectile every other frame
        {   // 9BEA
            var _DIST1 = abs(x-global.pc.x);
                _DIST1 = max(0, _DIST1-$10)>>4;
            //
            var _C1 = g.mod_BARBA_PROJ_BOUNCE && (!Pit_idx || Pit_idx==Pit_COUNT-1);
            
            if ((_DIST1<ds_grid_width(dg_PROJ_SPEED) || _C1) 
            &&  avail_uidx_goc(MAX_GOC1)!=UIDX_NULL )
            {
                var      projectile_ver = projectile_VER;
                if (_C1) projectile_ver = 3; // Bounces off walls
                
                
                // B195: JSR 9BE5, 9BE5: JSR DBCE
                with(GOC1_create(xl,yt, facing_dir, projectile,projectile_ver, id))
                {   // 9C10
                    if (_C1)
                    {
                        switch(1)
                        {
                            case 1:{
                            var _idx = (ds_grid_width(other.dg_PROJ_SPEED)-3) - irandom(2);
                            hspd  = other.dg_PROJ_SPEED[#_idx,0];
                            vspd  = other.dg_PROJ_SPEED[#_idx,1];
                            if(!facing_dir) hspd ^= $FF;
                            vspd ^= $FF; // shoot at ceiling
                            break;}
                            
                            
                            case 2:{
                            hspd  = choose($08,$10);
                            vspd  = choose($0C,$14);
                            //vspd  = choose($10,$18);
                            //var _h = 2 + irandom(1);
                            //var _v = (ds_grid_width(other.dg_PROJ_SPEED)-3) - irandom(1);
                            //hspd  = other.dg_PROJ_SPEED[#_h,0];
                            //vspd  = other.dg_PROJ_SPEED[#_v,1];
                            vspd ^= $FF;
                            //if (irandom(1)) vspd ^= $FF;
                            if(!facing_dir) hspd = byte_negate(hspd);
                            break;}
                            
                            
                            case 3:{
                            hspd = $0D;
                            vspd = $10;
                            if (irandom(1)) vspd -= $04;
                            if(!facing_dir) hspd = byte_negate(hspd);
                            if(!other.BounceAttack_y_dir) vspd = byte_negate(vspd);
                            break;}
                        }
                    }
                    else
                    {
                        hspd  = other.dg_PROJ_SPEED[#_DIST1,0];
                        vspd  = other.dg_PROJ_SPEED[#_DIST1,1];
                        if(!facing_dir) hspd ^= $FF;
                    }
                    
                    
                    // B19A
                    hspd = (hspd<<2)&$FF;
                    vspd = (vspd<<2)&$FF;
                    
                    
                    var _X  = other.x + ((other.ww_+ww_) * facing_dir);
                        _X += other.dl_xoff[|0]; // head xOff
                    var _Y  = other.y + 2;
                    
                    set_xy(id, _X,_Y);
                }
            }
        }
    }
    else
    {   // B1BF
             if (Attack1_Tokens) Attack1_Tokens--;
        else if(!Attacks_VER==3) Barba_refresh_Attack1_tokens();
        
        timer = $80;
        sub_state = sub_state_DECEND;
    }
    break;}//case sub_state_ATTACK:{
    
    
    
    
    
    
    
    // ======================================================================
    // --------------------------------------------------------------
    case sub_state_ATTACK3:{
    if (Attack3_timer) Attack3_timer--;
    
    if(!Attack3_timer)
    {
        if (Attack3_tokens)
        {
            Attack3_tokens--;
            
            var _x,_w;
            var _xl,_yt;
            var _dist;
            var _dist1=g.rm_w;
            var _dist2=_dist1;
            var _dl_pit_idx=ds_list_create();
            for(_i=0; _i<Pit_COUNT; _i++) ds_list_add(_dl_pit_idx,_i);
            ds_list_shuffle(_dl_pit_idx);
            
            var _pit_idx=0;
            var _pit_idx1=_dl_pit_idx[|0];
            var _pit_idx2=_dl_pit_idx[|1];
            
            _w=dg_PITS[#_pit_idx1,2];
            _x=dg_PITS[#_pit_idx1,1]+(_w>>1); // pit xc
            _dist1=abs(_x-global.pc.x)-(_w>>1);
            
            _w=dg_PITS[#_pit_idx2,2];
            _x=dg_PITS[#_pit_idx2,1]+(_w>>1);
            _dist2=abs(_x-global.pc.x)-(_w>>1);
            
            if (irandom($3)) _pit_idx=_pit_idx1;
            else             _pit_idx=_pit_idx2;
            
            _w=dg_PITS[#_pit_idx,2];
            _x=dg_PITS[#_pit_idx,1]+(_w>>1);
            _xl=_x-4; // projectile centered in pit
            var _dir=sign_(_x<global.pc.x);
            _xl += 4 * -_dir; // attempt to avoid hitting pit wall by backing away slightly from pc
            
            _yt=Liquid_YT;
            /*
            for(_i=0; _i<Pit_COUNT; _i++)
            {
                _w = dg_PITS[#_i,2];
                _x = dg_PITS[#_i,1] + (_w>>1);
                _dist = abs(_x-global.pc.x) - (_w>>1);
                if (_dist1>_dist)
                {
                    _dist1=_dist;
                    _pit_idx1=_i;
                }
                else if (_dist2>_dist)
                {
                    _dist2=_dist;
                    _pit_idx2=_i;
                }
            }
            */
            
            //sdm("arena_xl $"+hex_str(arena_xl)+", _xl $"+hex_str(_xl)+", _yt $"+hex_str(_yt));
            with(GOC1_create(_xl,_yt, _dir, Flame2,2, id))
            {
                HSPD1 = ($0E*facing_dir) &$FF;
                VSPD1 = $D4;
                vspd  = 0;
                hspd  = 0;
                //vspd = $D6;
                //hspd =($10*facing_dir) &$FF;
            }
            
            ds_list_destroy(_dl_pit_idx); _dl_pit_idx=undefined;
        }
        
        if (Attack3_tokens)
        {
            Attack3_timer  = $10;
            Attack3_timer += $8*(f.quest_num>=2);
            Attack3_timer += round_(hp/(HP/3)) * 2;
            Attack3_timer += irandom($20);
            //Attack3_timer  = $14+irandom($20);
        }
        else
        {
            Barba_refresh_Attack1_tokens();
            timer = Attack1_DURATION3; // Attack1_DURATION3=$60
            //timer = 2;
            sub_state = sub_state_HIDE;
        }
    }
    break;}
    
    
    
    
    
    
    
    // ======================================================================
    // --------------------------------------------------------------
    case sub_state_DECEND:{ // B1C8
    if (yt < YT_HIDE)
    {
        set_xy(id, x, y+2);
    }
    else
    {
        if (Attacks_VER==3 
        && !Attack1_Tokens )
        {
            Attack3_tokens  = $8;
            Attack3_tokens += $3*(f.quest_num>=2);
            Attack3_tokens += ((HP-hp) div (HP/3)) * 2;
            Attack3_tokens += irandom(round_(Attack3_tokens*.25));
            /*
            Attack3_tokens  = $8;
            Attack3_tokens += $8*(f.quest_num>=2);
            Attack3_tokens += ((HP-hp) div (HP/3)) * 3;
            Attack3_tokens += irandom(round_(Attack3_tokens*.3));
            */
            
            Attack3_timer = $40+irandom($40);
            
            timer = $00;
            sub_state = sub_state_ATTACK3;
        }
        else
        {   // B1D3
            timer = Attack1_DURATION3; // Attack1_DURATION3=$60
            sub_state = sub_state_HIDE;
        }
    }
    break;}//case sub_state_DECEND:{
}//switch(sub_state)




