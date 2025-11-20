/// Ganon1_update_battle()


var _i;
var _damage_floor=false;

//Boss_HPBar_udp();


switch(BattleState)
{
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK1_INIT:{
    Attack1_counter++;
    Attack2_counter=0;
    
    //timer1      = 0;
    BattleState = BattleState_ATTACK1_IDLE;
    break;}
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK1_IDLE:{
    /*
    if (timer1==$20)
    {
        if (irandom(1)) projectile=PROJECTILE1;
        else            projectile=PROJECTILE2;
        
        if (projectile==PROJECTILE2)
        {
            var _YT = yb-($10+(irandom(1)<<4));
            with(GOC1_create(x,_YT, sign_(x<g.rm_w_), projectile,1, id, PI_MOB_RED))
            {
                var _X  = other.x + (other.ww_*facingDir);
                    _X += -$04;
                //var _X = other.x + ((other.ww_+ww_)*facingDir);
                set_xy(id, _X, y);
                hspd =($20*facingDir) &$FF;
                pal_flash_time = 1;
                
                ATK_LVL = 5;
                atk_lvl = ATK_LVL;
            }
        }
    }
    */
    if(!Ganon1_update_battle_3()) break;
    //if(!Ganon1_update_battle_1()) break; // updates y
    //if (off_ground_reason) break;
    /*
    if(!Ganon1_cs4())
    //if (off_ground_reason)
    {
        Ganon1_update_battle_1(); // updates y
        break;
    }
    */
    if (timer1) break;
    
    
    var _DIST0 = abs(x-global.pc.x);
    var _DIST1 = ww_+global.pc.ww_;
    var _DIST2 = _DIST1+($05<<3);
    var _DIST3 = _DIST1+($0C<<3);
    var                _HSPD = $60;
    if (_DIST0<_DIST3) _HSPD = $50;
    //if (_DIST0<_DIST2) _HSPD = $40;
    if (_DIST0<_DIST2) _HSPD = $30;
    if (_DIST0<_DIST1) _HSPD = $10;
    
    var _C1 = _DIST0<_DIST2;
    if (_C1) hspd = byte($60   * sign_(x<arena_x)); // go torward dir that has most arena space
    else     hspd = byte(_HSPD * sign_(x<global.pc.x));
    updateX();
    
    vspd_grav = 2;
    vspd = $D0-vspd_grav;
    updateY();
    off_ground_reason = OGR_JUMP;
    
    GO_update_cs();
    //sdm("hspd $"+hex_str(hspd)+", _HSPD $"+hex_str(_HSPD)+", _DIST0 $"+hex_str(_DIST0)+", _DIST1 $"+hex_str(_DIST1)+", _DIST2 $"+hex_str(_DIST2)+", _DIST3 $"+hex_str(_DIST3)+", ww_+global.pc.ww_+($04<<3) $"+hex_str(ww_+global.pc.ww_+($04<<3)));
    
    timer1 = 0;
    if (_C1) BattleState = BattleState_ATTACK1_JUMP2;
    else     BattleState = BattleState_ATTACK1_JUMP1;
    break;}
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK1_JUMP1:{
    if (timer1) break;
    updateX();
    
    if(!Ganon1_cs4() 
    &&   vspd<$80 )
    {    vspd_grav = 3;  }
    else vspd_grav = 0;
    Ganon1_update_battle_1(); // updates y, collision
    
    GO_update_cs();
    
    var      _DIFF = x-global.pc.x;
    if (     _DIFF==0 
    ||  sign(_DIFF)==sign8b(hspd) 
    //||  abs(x-arena_x) >= (arena_w>>1)-ww_ 
    ||  cs&$3 
    ||  yt < viewYT()-(ww-(ww>>3)) )
    //||  yt<viewYT()-$08 )
    {
        hspd = 0;
        vspd = 0;
        vspd_grav = 0;
        set_xy(id, clamp(x,arena_xl+ww_,arena_xr-ww_), y);
        GO_update_cs();
        
        //timer1 = $20; // hang in air before dropping
        timer1 = $18; // hang in air before dropping
        //timer1 = $10; // hang in air before dropping
        BattleState = BattleState_ATTACK1_THOMP;
        break;
    }
    
    
    if (vspd&$80 
    &&  yb < Ground_y-global.pc.hh )
    {
        Ganon1_update_battle_2(); // pc body-to-body damage
    }
    
    
    if!(g.counter1&$F)
    {
        with(GOC1_create(x-4,yb-8, 1, projectile,projectile_ver))
        {
            hspd = 0;
        }
    }
    break;}
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK1_THOMP:{
    if (timer1)
    {   // hang in air before dropping
        vspd = 0;
        break;
    }
    
    vspd_grav=3;
    if (Ganon1_update_battle_1()) // updates y, collision
    {   // landed this frame
        if (vspd >= TERMINAL_VELOCITY-(TERMINAL_VELOCITY>>2))
        {
            aud_play_combo1($F);
            _damage_floor=true;
            g.ScreenShake_timer=$20;
            g.ScreenShake_strength_y=1;
        }
        
        hspd      = 0;
        vspd      = 0;
        vspd_grav = 0;
        off_ground_reason = 0;
        
        timer1      = 0;
        BattleState = BattleState_DECIDE_ATTACK;
    }
    break;}
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK1_JUMP2:{
    if (timer1) break;
    
    updateX();
    GO_update_cs();
    set_xy(id, clamp(x,arena_xl+ww_,arena_xr-ww_), y);
    
    vspd_grav = 2;
    if (Ganon1_update_battle_1()) // updates y, collision
    {   // landed this frame
        //aud_play_combo1($F);
        
        g.ScreenShake_timer=$10;
        g.ScreenShake_strength_y=1;
        
        hspd      = 0;
        vspd      = 0;
        vspd_grav = 0;
        off_ground_reason = 0;
        
        timer1      = 0;
        BattleState = BattleState_DECIDE_ATTACK;
    }
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK2_INIT:{
    Attack1_counter=0;
    Attack2_counter++;
    
    Ganon1_update_battle_3();
    hspd = 0;
    hspd_impel = -sign_(x<global.pc.x);
    
    //timer1      = 0;
    BattleState = BattleState_ATTACK2_IDLE;
    break;}
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK2_IDLE:{
    if(!Ganon1_update_battle_3()) break;
    if (timer1) break;
    
    timer1      = $28;
    BattleState = BattleState_ATTACK2_TELL;
    break;}
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK2_TELL:{
    var _MAX = $20;
    hspd  = clamp(byte_to_int(hspd)+hspd_impel, -_MAX,_MAX);
    hspd &= $FF;
    set_hspd_dir();
    updateX();
    set_xy(id, clamp(x, arena_xl+ww_,arena_xr-ww_), y);
    GO_update_cs();
    if (timer1) break;
    
    
    hspd = 0;
    hspd_impel = sign_(x<global.pc.x);
    
    timer1      = $20;
    BattleState = BattleState_ATTACK2_POSITION;
    break;}
    
    
    
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK2_POSITION:{
    if (timer1) break;
    
    var _MAX = $60;
    hspd  = clamp(byte_to_int(hspd)+hspd_impel, -_MAX,_MAX);
    hspd &= $FF;
    set_hspd_dir();
    updateX();
    GO_update_cs();
    
    update_body_hb_1a();
    
    if (cs&$3)
    {
        aud_play_combo1($F);
        g.ScreenShake_timer=$20;
        g.ScreenShake_strength_x=1;
        hspd = 0;
        set_xy(id, clamp(x, arena_xl+ww_,arena_xr-ww_), y);
        GO_update_cs();
        
        timer1      = $C0 + (irandom($40)*sign_(irandom(1)));
        BattleState = BattleState_ATTACK1_INIT;
    }
    break;}
    
    
    
    /*
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK2_SHOOT:{
    if (timer1) break;
    
    var _DIR = sign_(x<g.rm_w_);
    with(GOC1_create(x+(ww_*_DIR),yb-$18, _DIR, Bullet1,1, id, PI_MOB_RED))
    {
        var _X = other.x + ((other.ww_+ww_)*facingDir);
        set_xy(id, _X, y);
        hspd =($20*facingDir) &$FF;
        pal_flash_time = 1;
        
        ATK_LVL = 5;
        atk_lvl = ATK_LVL;
    }
    
    timer1 = $80 + (irandom($40)*sign_(irandom(1)));
    BattleState = BattleState_ATTACK1_IDLE;
    //BattleState = BattleState_DECIDE_ATTACK;
    break;}
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK3_IDLE:{ // rise high up, move horizontal to other side, vomit someting while moving
    if (timer1) break;
    
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK3_POSITION:{
    if (timer1) break;
    
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK3_RISE:{
    if (timer1) break;
    
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK3_CROSS:{
    if (timer1) break;
    
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK3_DECEND:{
    if (timer1) break;
    
    break;}
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK4_IDLE:{ // rise high up, move to center, shoot a bunch of ThunderBird fireballs
    if (timer1) break;
    
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK4_RISE:{
    if (timer1) break;
    
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK4_SHOOT:{
    if (timer1) break;
    
    break;}
    
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_ATTACK4_DECEND:{
    if (timer1) break;
    
    break;}
    
    
    
    
    
    
    
    // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    // ==================================================================
    // -----------------------------------------------------------
    case BattleState_DECIDE_ATTACK:{
    if (timer1) break;
    
    var _RAND = irandom(99);
    //var _RAND = irandom(99)+1; // 1-100
    timer1 = $80 + (irandom($40)*sign_(irandom(1)));
    //timer1 = $C0 + (irandom($40)*sign_(irandom(1)));
    
    
    var _C1 = _RAND<85;
    var _C2 = !global.pc.ogr && global.pc.y<y; // pc standing on pillar
    var _C3 = Attack1_counter>=3 && !irandom(3); // in case attack2 not getting used enough
    
    if (_C2         // guarantee attack1 if pc standing on pillar
    || (_C1 && !_C3) )
    {
        BattleState = BattleState_ATTACK1_INIT;
        break;
    }
    else
    {
        BattleState = BattleState_ATTACK2_INIT;
        break;
    }
    break;}
}







/*
// Run into PC
if (BattleState==BattleState_ATTACK2_TELL 
||  BattleState==BattleState_ATTACK2_POSITION )
{
    if (sign_(global.pc.x>x)==hspd_dir 
    &&  GO_can_collide_this_frame(uIdx) 
    &&  hINh(global.pc.csRgt1Y,global.pc.csRgt2Y-global.pc.csRgt1Y, yt+4,hh-4) 
    //&&  hINh(global.pc.csRgt1Y,global.pc.csRgt2Y-global.pc.csRgt1Y, yt,hh) 
    &&  collide_pc_body(bodyX,bodyY, bodyW,bodyH) )
    {
        var _shift=2;
        
        if (hspd_dir)
        {
            if (collide_solid_grid(global.pc.csRgt1X,global.pc.csRgt1Y) 
            &&  global.pc.csLft1X < xr )
            {
                _shift=1;
            }
        }
        else
        {
            if (collide_solid_grid(global.pc.csLft1X,global.pc.csLft1Y) 
            &&  global.pc.csRgt1X > xl )
            {
                _shift=1;
            }
        }
        
        pc_take_dmg(id, get_stat_max(STR_Heart)>>_shift);
    }
}
*/
/*
// Squash PC against wall
if (BattleState==BattleState_ATTACK2_TELL 
||  BattleState==BattleState_ATTACK2_POSITION )
{
    if (sign_(global.pc.x>x)==hspd_dir 
    &&  GO_can_collide_this_frame(uIdx) 
    &&  hINh(global.pc.csRgt1Y,global.pc.csRgt2Y-global.pc.csRgt1Y, yt,hh) 
    &&  collide_pc_body(bodyX,bodyY, bodyW,bodyH) )
    {
        var _DAMAGE = get_stat_max(STR_Heart)>>2;
        
        if (hspd_dir)
        {
            if (collide_solid_grid(global.pc.csRgt1X,global.pc.csRgt1Y) 
            &&  global.pc.csLft1X < xr )
            {
                pc_take_dmg(id,_DAMAGE);
            }
        }
        else
        {
            if (collide_solid_grid(global.pc.csLft1X,global.pc.csLft1Y) 
            &&  global.pc.csRgt1X > xl )
            {
                pc_take_dmg(id,_DAMAGE);
            }
        }
    }
}
*/

if (Collision_VER==1)
{
    if (BattleState==BattleState_ATTACK2_TELL 
    ||  BattleState==BattleState_ATTACK2_POSITION )
    {
        if(!stun_timer 
        && !global.pc.iframes_timer 
        &&  sign_(global.pc.x>x)==hspd_dir 
        &&  GO_can_collide_this_frame(update_idx) 
        &&  hINh(global.pc.csRgt1Y,global.pc.csRgt2Y-global.pc.csRgt1Y, yt,hh) 
        &&  collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h) )
        {
            PC_take_damage(id);
        }
    }
}





/*
if (Ganon1_update_battle_1())
{
    if (BattleState != BattleState_ATTACK1_JUMP2
    &&  vspd >= TERMINAL_VELOCITY-(TERMINAL_VELOCITY>>2) )
    {
        _damage_floor=true;
        g.ScreenShake_timer=$20;
        g.ScreenShake_strength_y=1;
    }
    
    timer1      = 0;
    BattleState = BattleState_DECIDE_ATTACK;
    if(0){
    switch(  BattleState)
    {   case BattleState_ATTACK1_JUMP2:{
        timer1      = 0;
        BattleState = BattleState_ATTACK1_JUMP1;
        break;}
        
        case BattleState_ATTACK1_THOMP:{
        timer1      = 0;
        BattleState = BattleState_DECIDE_ATTACK;
        break;}
        
        case BattleState_ATTACK2_POSITION:{
        timer1      = $C0 + (irandom($40)*sign_(irandom(1)));
        BattleState = BattleState_ATTACK1_IDLE;
        break;}
    }
    }
}
*/


if (_damage_floor 
||  timer2==1 )
{
    var _will_change=false;
    var _CHANGE=0;
    var _COUNT=ds_grid_width(dg_Ground);
    for(_i=0; _i<_COUNT; _i++)
    {
        if(!dg_Ground[#_i,0]) continue;
        
        if (dg_Ground[#_i,1])
        {
                dg_Ground[#_i,1]--;
            if (dg_Ground[#_i,1]==Ground_HP2)
            {   // change tiles to cracked graphic
                dg_Ground[#_i,0]=2;
                _will_change=true;
            }
            if(!dg_Ground[#_i,1])
            {   // change tiles to crumbling graphic
                dg_Ground[#_i,0]=1;
                _will_change=true;
                if (_i+1==_COUNT)
                {   // DEFEATED
                    var _DATAKEY = get_defeated_dk()+dk_spawn;
                    f.dm_quests[?_DATAKEY] = val(f.dm_quests[?_DATAKEY])+1;
                }
            }
        }
        else if (timer2==1)
        {   // change tiles to nothing
            dg_Ground[#_i,0]=0;
            _will_change=true;
        }
        
        
        if (_will_change)
        {
            var _j,_k, _x,_y;
            var _TS,_TSRC,_tsrc, _SOLID;
            var _ROW = (GROUND_Y>>3)+(_i<<1);
            switch(dg_Ground[#_i,0])
            {
                case 2:{
                _TS    = ts_Man_made_7a_WRB; // cracked tile
                _TSRC  = TSRC_BREAK5_B; // $8E, $8F, $9E, $9F
                _SOLID = TID_SOLID1;
                aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                break;}
                
                case 1:{
                Ground_y = (_ROW+2)<<3;
                //if (_i<_COUNT-1) Ground_y = _ROW<<3;
                //Ground_y += $10;
                _TS    = ts_Man_made_1a_WRB; // crumbling tile
                _TSRC  = TSRC_BREAK1_C; // "4F5F4F5F";
                _SOLID = 0;
                timer2 = 9;
                aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                break;}
                
                case 0:{
                _TS    = 0; // no tile
                _TSRC  = "00000000";
                _SOLID = 0;
                break;}
            }
            
            if(!_SOLID) off_ground_reason = OGR_OTHR;
            
            for(_j=(arena_w>>4)-1; _j>=0; _j--)
            {
                for(_k=0; _k<4; _k++)
                {   // Ground_DEPTH: DEPTH_FG5
                    _tsrc = str_hex(_TSRC,_k);
                    //_tsrc =(_TSRC+(_k&1)) + ((_k>1)<<4); // $8E, $8F, $9E, $9F
                    _x  = ((_j<<1)+(_k&$1)) <<3;
                    _x += arena_xl;
                    _y  = (_ROW   +(_k>$1)) <<3;
                    tile_change_1a(Ground_DEPTH, _x,_y, _TS,_tsrc, _SOLID);
                }
            }
        }
        
        break;//for _i
    }
}




