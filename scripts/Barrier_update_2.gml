/// Barrier_update_2()


var _i, _idx;
var _datakey;


Anim_yoff = (g.counter1>>1)&$7;


if (!global.pc.is_dead 
&& !(global.pc.ocs&$4)   // $4: pc center x is on screen
&&  state==state_NORMAL 
&&  GO_can_collide_this_frame(update_idx) )
{
    if (dg_barrier[#0,0] < BARRIER_COUNT) // 0: raised count
    {   // A269: JSR E4D9
        for(_i=0; _i<BARRIER_COUNT; _i++)
        {
            if (dg_barrier[#_i+1,0]) continue; // Already raised
            
            
            BodyHB_w  = BARRIER_W;
            BodyHB_h  = BARRIER_H;
            BodyHB_xl = spawn_xl + ((BARRIER_W+BARRIER_PAD) * _i);
            BodyHB_xr = BodyHB_xl + BodyHB_w;
            BodyHB_yt = spawn_yt;
            BodyHB_yb = BodyHB_yt + BodyHB_h;
            if (collide_pc_body(BodyHB_xl,BodyHB_yt, BodyHB_w,BodyHB_h))
            {    cs |=  CS_BD1;  }
            else cs &= ~CS_BD1;
            
            BodyHB_can_draw = true;
            
            // A26C: JSR D6C1
            if (cs&CS_BD1)
            {
                global.pc.iframes_timer = 0; // So the following scripts will run.
                enemy_collide_pc_body();
                
                // PC damage bounce AWAY from barrier.
                global.pc.hspd = (abs8b(global.pc.hspd)*facing_dir) &$FF;
                break; // _i
            }
        }
        
        
        
        // A26F
        if (cs&CS_BD1)
        {
            if (pc_is_cucco()  
            ||  pc_is_fairy() )
            {
                global.pc.is_dead = 1;
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
        }
    }
}





if (sub_state==SUB_STATE_IDLE 
|| (sub_state==SUB_STATE_RAISING && !(counter&$3)) )
{
    for(_i=1; _i<dg_barrier_W; _i++) dg_barrier[#_i,3]=true; // barrier can draw
}


















switch(sub_state)
{
    // ---------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------
    case SUB_STATE_IDLE:{
    if (timer) break;
    if(!rectInViewAll(spawn_xl,spawn_yt, BARRIER_AREA_W,BARRIER_H)) break;
    
    var _DIST  = abs((xl+(BARRIER_AREA_W>>1)) - global.pc.x);
        _DIST -=          BARRIER_AREA_W>>1;
    if (_DIST >= $30 
    ||  global.pc.y< yt 
    ||  global.pc.y>=yt+BARRIER_H )
    {
        break;
    }
    
        dg_barrier[#0,0]  = 0; // 0: raised count
    for(_i=1; _i<dg_barrier_W; _i++)
    {   dg_barrier[#0,0] += dg_barrier[#_i,0]==3;  } // 3: raise complete
    if (dg_barrier[#0,0] >= bitCount(f.crystals)) break;
    
    
    // A249
    //set_pc_bvr(global.pc.BVR_IDLE); // OG
    dg_barrier[#0,1] = 0; // 0:Will trigger next barrier raise. dg_barrier[#0,1] (curr barrier num being raised)
    counter = 0;
    
    g.pc_lock = PC_LOCK_ALL; // Lock all
    
    
    timer     = $C; // Delay SUB_STATE_RAISING
    sub_state = SUB_STATE_RAISING; // 
    break;}
    
    
    
    
    
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------
    case SUB_STATE_RAISING:{
    //if (timer) break;
    
    var _num = dg_barrier[#0,1]; // dg_barrier[#0,1] (curr barrier num being raised)
    if (_num)
    {
        var    _STATE = dg_barrier[#_num,0];
        switch(_STATE)
        {
            // --------------------------------------------------------
            // --------------------------------------------
            case 1:{ // 1:Crystals' greeting
            if (timer 
            &&  audio_is_playing(SND_CRYSTAL) )
            {   // Whichever ends first prgresses the barrier to its next state.
                break;
            }
            
            
            if(!Anim_VER 
            || !Anim_yoff )
            {
                aud_play_sound(get_audio_theme_track(dk_RaiseBarrier));
                dg_barrier[#_num,0] = barrier_state_RAISING; // set to 2:Raising
            }
            break;}
            
            
            
            // --------------------------------------------------------
            // --------------------------------------------
            case 2:{ // 2:Raising
            if(!dg_barrier[#_num,2]) // if no more rows (fully raised)
            {
                counter = 0;
                //dg_barrier[#0,0]++;
                dg_barrier[#0,1]    = 0; // 0:Will trigger next barrier raise
                dg_barrier[#_num,0] = barrier_state_COMPLETE; // 3: Raise Complete
                break;
            }
            
            
            // A2C4 -------------------------
                dg_barrier[#_num,3] = false; // barrier can draw
                counter++;
            if!(counter&$3)
            {   // A303
                dg_barrier[#_num,3] = true; // barrier can draw
                dg_barrier[#_num,2]--; // decrement rows
            }
            break;} // case 2
        } // switch(_STATE){
    }
    
    
    
    
    
    // --------------------------------------------------
        _num = dg_barrier[#0,1];
    if(!_num) // No barrier currently set to raise
    {
        Barrier_update_2a(); // set dg_barrier[#0,1] (curr barrier num being raised)
        
            _num = dg_barrier[#0,1]; // dg_barrier[#0,1] (curr barrier num being raised)
        if (_num)
        {
            dg_barrier[#_num,0] = barrier_state_GREETING; // 1: Crystals' greeting.  TRIGGERS RAISE.
            aud_play_sound(snd_Sword_Beam_1a, $FF, false, .8); // playing this a little louder than normal(.6) to hear it over other sounds
            timer = $24;
        }
        else // barrier num currently raising(Couldn't find any that qualify)
        {
            g.pc_lock = 0;
        }
        
    }
    
    
    break;} // case SUB_STATE_RAISING:{
    
    
    
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------------------------
    // ---------------------------------------------------------------------------
    case SUB_STATE_COMPLETE:{
    if (timer) break;
    g.pc_lock = 0;
    break;}
}





/*
if!(g.timer0&$7F){
    var _str1;
    var _str  =   "sub_state==SUB_STATE_IDLE "   +string(sub_state==SUB_STATE_IDLE);
        _str += ", sub_state==SUB_STATE_RAISING "+string(sub_state==SUB_STATE_RAISING);
        _str += ",  timer "+string(timer);
    sdm(_str);
    
    for(_i=0; _i<ds_grid_width(dg_barrier); _i++){
            _str  = "";
        for(_j=0; _j<ds_grid_height(dg_barrier); _j++){
            _str1 = "dg_barrier[#"+string(_i)+","+string(_j)+"] = "+string(dg_barrier[#_i,_j]);
            _str += _str1;
            _str += ", ";
        }
        sdm(_str);
    }
    sdm("");
}
*/








can_draw_self = true;

if (sub_state==SUB_STATE_RAISING)
{
            dg_barrier[#0,0]  = 0;
    for(_i=1; _i<dg_barrier_W; _i++)
    {
            dg_barrier[#0,0] += sign(dg_barrier[#_i,0]); // as long as it has started raising
        if (dg_barrier[#_i,0]==barrier_state_COMPLETE) // if it has finished raising
        {
                         _datakey  = g.rm_name+STR_Barrier+hex_str(_i)+STR_State;
            f.dm_quests[?_datakey] = dg_barrier[#_i,0];
        }
    }
}




