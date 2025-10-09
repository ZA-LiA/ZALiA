/// Cutscene_GameEnd_1A_update()


if (g.cutscene != g.CUTSCENE_GAME_END_1A 
||  g.ChangeRoom_timer > 0 )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}





var _i;


with(global.pc)
{
    g.pc_lock       = PC_LOCK_ALL;
    // g.pc_lock       = PC_LOCK_A1;
    xScale          = 1;
    
    // HoldItem_timer   = $FF;
    // hold_item_oi     = ItmH0; // 049D 
    // hold_item_pi     = p.triforce_pi;
    
    PC_set_behavior(behavior_HOLD_ITEM5); // back towards screen, both arms raised
}


triforce_pal_update();


with(Zelda) xScale = 1;





var IDX_X = 1;
var IDX_Y = IDX_X+1;



// ------------------------------------------------------------------------
if(!g.cutscene_part)
{
    // var _SPR = val(g.dm_ITEM_SPR[? object_get_name(hold_item_oi)]);
    var _X = global.pc.spawn_xl + global.pc.ww_;
    var _Y = global.pc.spawn_yt - 8; // OG
    // var _Y = global.pc.spawn_y - (3<<3); // MOD. Looks better $10 higher?
    //     _Y -= 3; // MOD
    
    for(_i=ds_grid_width(dg_triforce)-1; _i>=0; _i--)
    {
        dg_triforce[#_i,0]     = TRIFORCE_SPR;  // can draw
        dg_triforce[#_i,IDX_X] = _X;
        dg_triforce[#_i,IDX_Y] = _Y;
    }
    
    
    audio_stop_sound(Audio.mus_rm_inst);
                     Audio.mus_rm_intr = 0;
                     Audio.mus_rm_body = 0;
    
    
    g.cutscene_timer  = DUR1; // DUR1: $5F 1.583s
    g.cutscene_part = 1;
}








// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
switch(g.cutscene_part)
{
    // ===================================================================================
    // ------------------------------------------------------------------------
    case 1:{
    if (g.cutscene_timer) break;
    
    if (f.quest_num>=2) var _THEME = dk_WakeZelda+"02";
    else                var _THEME = dk_WakeZelda;
    
                   Audio.mus_rm_body = get_audio_theme_track(_THEME);
    aud_play_sound(Audio.mus_rm_body,  Audio.PRIORITY_TOP, true, -1, _THEME);
    
    g.cutscene_timer = DUR1; // DUR1: $5F 1.583s
    g.cutscene_part++;
    break;}
    
    
    
    
    
    
    
    // ===================================================================================
    // ------------------------------------------------------------------------
    case 2:{ // MOVE TRIFORCE
    if (g.cutscene_timer) break;
    if (g.counter1&$7)  break; // Every 8 frames
    
    
    // TODO: Find better triforce resting position
    var _C1  = !(g.counter1&$1F) 
            &&  dg_triforce[#1,IDX_Y] > global.pc.yt-($03<<3)-4;
    // 
    
    for(_i=2; _i>=0; _i--)
    {
        // one moves vertical, the others move horizontal
        if (_i)  dg_triforce[#_i,IDX_X] += sign_(_i&$01); // move RGT/LFT
        else     dg_triforce[#_i,IDX_Y]--;                // move UP
        
        if (_C1) dg_triforce[#_i,IDX_Y]--; // MOD.        move UP
    }
    
    
    if (abs(global.pc.x-dg_triforce[#1,IDX_X]) >= $4C) // (OG: >= $40).  if triforce has moved far enough
    {
        g.cutscene_timer = DUR1; // DUR1: $5F 1.583s. Delay spell flash.
        g.cutscene_part++;
    }
    break;}
    
    
    
    
    
    
    
    // ===================================================================================
    // ------------------------------------------------------------------------
    case 3:{ // DELAY WAKE UP ZELDA SPELL FLASH
    if (g.cutscene_timer) break;
    
    
    //p.pal_flash_tmr = $E0;
    var                     _DURATION = $60;
    p.Flash_Pal_timer     = _DURATION;
    p.Flash_Bgr_timer     = _DURATION;
    p.SpellFlash_PC_timer = _DURATION;
    aud_play_sound(get_audio_theme_track(STR_Cast+STR_Spell));
    
    g.cutscene_part++;
    break;}
    
    
    
    
    
    
    
    // ===================================================================================
    // ------------------------------------------------------------------------
    case 4:{ // WAKE UP ZELDA SPELL FLASH
    if (p.Flash_Bgr_timer) break;
    if (g.cutscene_timer)  break;
    
    
    g.cutscene_timer = DUR1; // DUR1: $5F 1.583s. Zelda Sit Up delay.
    g.cutscene_part++;
    break;}
    
    
    
    
    
    
    
    // ===================================================================================
    // ------------------------------------------------------------------------
    case 5:{ // DELAY ZELDA SIT UP
    if (g.cutscene_timer) break;
    
    
    with(Zelda) sub_state = SUB_STATE_WAKE; // wake up
    
    
    g.cutscene_timer = DUR1; // DUR1: $5F 1.583s
    g.cutscene_part++;
    break;}
    
    
    
    
    
    
    
    // ===================================================================================
    // ------------------------------------------------------------------------
    case 6:{ // ZELDA AWAKE, SITS UP
    if (g.cutscene_timer) break;
    
    
    g.cutscene_timer = DUR1; // DUR1: $5F 1.583s. Delay change rm.
    g.cutscene_part++;
    break;}
    
    
    
    
    
    
    
    // ===================================================================================
    // ------------------------------------------------------------------------
    case 7:{ // CHANGE RM
    if (g.cutscene_timer) break;
    
    
    with(Exit)
    {
        if (exitNum != $01)
        {
            continue;
        }
        
        
        g.exit_leave = id;
        sdm("exit door");
        
        
        global.pc.HoldItem_timer = 0;
        
        g.cutscene_part = 0;
        g.cutscene      = 1;
        // g.cutscene      = g.CUTSCENE_GAME_END_1B;
        
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}
}
//








