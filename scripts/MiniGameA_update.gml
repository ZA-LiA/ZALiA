/// MiniGameA_update()


switch(sub_state)
{
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Waiting for PC to get in position
    case ST_SUB1_PRE1:{
    // *** TARGET GAME ***
    points = 0;
    
    
    if (pc_is_fairy() 
    ||  pc_is_cucco() )
    {
        g.spells_active &= ~SPL_FARY;
        
        var                     _DURATION = p.SpellFlash_DURATION1; // SpellFlash_DURATION1=$20. bit $80 mean flash bgr
        p.Flash_Pal_timer     = _DURATION;
        p.SpellFlash_PC_timer = _DURATION;
    }
    
    if(!g.pc.ogr)
    {
        with(g.pc) set_xy(id, x, yb-($10>>pc_is_cucco()));
        g.pc_lock   = PC_LOCK_ALL; // Lock all
        
        sub_state   = ST_SUB1_PRE2;
    }
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Adjusting PC into position
    case ST_SUB1_PRE2:{
    g.pc_lock            = PC_LOCK_ALL; // Lock all
    g.pc.WalkTo_active   = true;
    g.pc.WalkTo_x        = PC_START_GAME_X;
    g.pc.WalkTo_hspd_max = g.pc.HSPD_MAX1;
    
    if (g.pc.x==PC_START_GAME_X)
    {
        g.pc.WalkTo_active = false;
        g.pc.hspd          = 0;
        g.pc.attack_phase  = 0;
        g.pc_lock          = PC_LOCK_ALL^pc_allow;
        
        set_camera_xy(x-viewW_(), viewYT()); // Center cam on game center
        g.view_lock = $3 | g.view_lock_rm;
        
        timer = 1; // Delay game start sound
        //timer = DUR_DELAY_START;
        sub_state = ST_SUB1_PRE3;
    }
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Waiting for start timer
    case ST_SUB1_PRE3:{
    if (timer)
    {
        timer--;
        break;
    }
    
    
    aud_play_sound(SND_GAME_START);
    audio_group_stop_all(audiogroup_mus);
    Audio.can_play_mus_rm_body = false;
    Audio.can_play_boss_music  = false;
    
    timer  = round(audio_sound_length(SND_GAME_START)*room_speed);
    timer += 2;
    //timer  = audio_sound_length(SND_GAME_START)*room_speed;
    sub_state = ST_SUB1_PRE4;
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Waiting for enter battle sound to finish
    case ST_SUB1_PRE4:{
    if (timer) timer--;
    
    if (timer 
    &&  audio_is_playing(SND_GAME_START) )
    {
        break;
    }
    timer = 0;
    //if (audio_is_playing(SND_GAME_START)) break;
    
    
    aud_play_sound(MUS_GAME_PLAY, Audio.PRIORITY_TOP, true,-1, MUS_GAME_THEME);
    
    tmr_next  = DUR_DELAY_FIRST;
    sub_state = ST_SUB1_PLY1;
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    case ST_SUB1_PLY1:{ // -------------- GAME TIME -----------------
    points_can_draw = true;
    
    if (tmr_next)
    {
        tmr_next--;
        break;
    }
    
        seq_idx++;
    if (seq_idx < ds_grid_width(dg_SEQ))
    {
        switch(ver)
        {   // --------------------------------------------------
            // --------------------------------------------------
            case 1:{
            var _DIR  = sign_(dg_SEQ[#seq_idx,1]); // Target movement direction
            
            var _XL   =  viewXC();
                _XL  += (viewW_()+(TARGET_W>>1)) * -_DIR;
                _XL  -= TARGET_W>>1;
                _XL  += _DIR;
            //
            var _YT   = dg_SEQ[#seq_idx,2];
            
            var _HSPD = dg_SEQ[#seq_idx,3];
            var _VSPD = dg_SEQ[#seq_idx,4];
            
                 dg_SEQ[#seq_idx,0] = GameObject_create(_XL,_YT, TARGET_OBJ,TARGET_VER, -1,global.PI_MOB_PUR);
            with(dg_SEQ[#seq_idx,0])
            {
                /*
                var _X  =  viewXC();
                    _X += (viewW_()+ww_) * -_DIR;
                    _X += _DIR;
                set_xy(id, _X,y);
                */
                
                hspd   = (_HSPD*_DIR) &$FF;
                //hspd   = (_HSPD*dir_to_pc_(id)) &$FF;
                vspd   =  _VSPD;
                source_inst =  other;
                
                set_hspd_dir();
                hspd_dir_spawn  = hspd_dir;
                
                facingDir = hspd_dir;
                
                if(!ds_list_size(dl_sprites)){
                    ds_list_add( dl_sprites,spr_Moby1);
                    ds_list_add( dl_sprites,spr_Moby2);
                }
                //dl_sprites[|1] = spr_Moby2;
                //dl_sprites[|0] = spr_Moby1;
                
                TARGET_NUM=other.seq_idx+1;
            }
            break;}
            
            
            
            // --------------------------------------------------
            // --------------------------------------------------
            case 2:{
            var _DIR  =  dg_SEQ[#seq_idx,1];
            
            var _PAD  = 5; // min tiles from pc
            var _XL   = (dg_SEQ[#seq_idx,2] + _PAD) <<3;
                _XL   =  x + (_XL * _DIR);
                _XL  -=  8;
            
            var _YT   =  $D8;
            
            var _HSPD = (dg_SEQ[#seq_idx,3] * -_DIR) &$FF;
            var _VSPD =  dg_SEQ[#seq_idx,4];
            
            
                 dg_SEQ[#seq_idx,0] = GameObject_create(_XL,_YT, TARGET_OBJ,TARGET_VER);
            with(dg_SEQ[#seq_idx,0])
            {
                // hspd   = 0;
                // vspd   = $C0;
                hspd   = _HSPD;
                vspd   = _VSPD;
                source_inst = other;
                
                set_hspd_dir();
                hspd_dir_spawn  = hspd_dir;
                
                facingDir = hspd_dir;
                dl_sprites[|1] = spr_Bagin_1b;
                dl_sprites[|0] = spr_Bagin_1a;
                
                TARGET_NUM=other.seq_idx+1;
            }
            break;}
            
            
            
            // --------------------------------------------------
            // --------------------------------------------------
            case 3:{
            
            break;}
        }
        
        
        tmr_next = dg_SEQ[#seq_idx,5];
    }
    else
    {
        sub_state = ST_SUB1_PLY2;
    }
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // All Targets spawned. Checking if game finished
    case ST_SUB1_PLY2:{
    points_can_draw = true;
    
    
    var _i, _inst;
    for(_i=ds_grid_width(dg_SEQ)-1; _i>=0; _i--)
    {
        _inst = dg_SEQ[#_i,0];
        if(!is_undefined(   _inst) 
        &&  instance_exists(_inst) 
        && !_inst.target_hit 
        &&  isVal(_inst.behavior, _inst.BVR_STRT,_inst.BVR_VULN) )
        {
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    
    
    timer     = 8; // Delay game done sound
    sub_state = ST_SUB1_PST1;
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Game finished
    case ST_SUB1_PST1:{
    points_can_draw = true;
    
    
    if (timer)
    {
        timer--;
        break;
    }
    
    
    aud_play_sound(      SND_GAME_DONE);
    aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
    audio_group_stop_all(audiogroup_mus);
    // Sound.can_play_mus_rm_body = false;
    
    timer  = round(audio_sound_length(SND_GAME_DONE)*room_speed);
    timer += 2;
    //timer  = audio_sound_length(SND_GAME_DONE)*room_speed;
    sub_state = ST_SUB1_PST2;
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Game finished
    case ST_SUB1_PST2:{
    points_can_draw = true;
    
    if (timer) timer--;
    if (timer 
    &&  audio_is_playing(SND_GAME_DONE) )
    {
        break;
    }
    timer = 0;
    
    timer = $10; // $10: 0.267s Let rm music play some before opening dlg
    sub_state = ST_SUB1_PST3;
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Delay restart rm music
    case ST_SUB1_PST3:{
    points_can_draw = true;
    
    if (timer)
    {
        timer--;
        break;
    }
    
    
    Audio.can_play_mus_rm_body = true;
    
    timer = 4; // Give chance for dlg to open
    sub_state = ST_SUB1_NPC1; // will trigger npc to open dlg
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Result dlg
    case ST_SUB1_NPC1:{
    points_can_draw = true;
    
    
    if (timer)
    {
        timer--;
        break;
    }
    
    
    if (g.gui_state==g.gui_state_NONE)
    {
        sub_state = ST_SUB1_END1;
    }
    break;}
    
    
    
    
    
    
    
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    // Clean up
    case ST_SUB1_END1:{
    with(Target)
    {
        state = 0;
        
        if (g.mod_destroy_go_on_death && !state) GO_destroy_1a();
    }
    
    g.view_lock &= ~$3;
    //g.view_lock &= ~g.view_lock_boss;
    g.view_lock |=  g.view_lock_rm;
    
    g.pc_lock   = 0;
    
    state = 0;
    instance_destroy(); // bc is Challege obj
    break;}
}




