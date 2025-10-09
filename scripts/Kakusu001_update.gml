/// Kakusu001_update()


switch(sub_state)
{
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHLG_1A:{
    if (global.pc.ogr) break;
    
    
    // var _CLM = global.pc.x       >>3;
    var _ROW = global.pc.csBtm1Y>>3;
    
    if (wINw(global.pc.csBtm1X,global.pc.csBtm2X-global.pc.csBtm1X, dg_platform[#0,1]<<3,$02<<3) 
    &&  _ROW == dg_platform[#0,2] )
    {
        for(var _i=0; _i<Platform_COUNT; _i++) dg_platform[#_i,0] = 0;
        
                     PlatformNext_idx = 0;
        dg_platform[#PlatformNext_idx,0] = 1;
        
        aud_play_combo1(3);
        sub_state = SUB_STATE_CHLG_1B;
    }
    break;}//case SUB_STATE_CHLG_1A:{
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHLG_1B:{
    if ( global.pc.ogr 
    || !(global.pc.cs&CS_BTM) )
    {
        break;//case SUB_STATE_CHLG_1B:{
    }
    
    var _i, _idx, _x,_y;
    
    
    /*
    if!(g.counter1&$7F){
        var _str  = "TID_ONEWY1 $"+hex_str(TID_ONEWY1)+", ";
            _str += "global.pc.csBtm1X>>3 $"+hex_str(global.pc.csBtm1X>>3)+", ";
            _str += "global.pc.csBtm2X>>3 $"+hex_str(global.pc.csBtm2X>>3)+", ";
            _str += "global.pc.csBtm1Y>>3 $"+hex_str(global.pc.csBtm1Y>>3)+", ";
            _str += "global.dg_solid[#global.pc.csBtm1X>>3,global.pc.csBtm1Y>>3] $"+hex_str(global.dg_solid[#global.pc.csBtm1X>>3,global.pc.csBtm1Y>>3])+", ";
            _str += "global.dg_solid[#global.pc.csBtm2X>>3,global.pc.csBtm1Y>>3] $"+hex_str(global.dg_solid[#global.pc.csBtm2X>>3,global.pc.csBtm1Y>>3])+", ";
            sdm(_str);
        for(_i=0; _i<Platform_COUNT; _i++){
            _str  = string(_i)+": ";
            _str += "state "+string(dg_platform[#_i,0])+", ";
            _str += "clm $"+hex_str(dg_platform[#_i,1])+", ";
            _str += "row $"+hex_str(dg_platform[#_i,2])+", ";
            sdm(_str);
        }
        sdm("");
    }*/
    
    
    
    
    var _ROW  = global.pc.csBtm1Y>>3;
    var _CLM1 = global.pc.csBtm1X>>3;
    var _CLM2 = global.pc.csBtm2X>>3;
    
    var _c1 = is_in_grid(_CLM1,_ROW, g.rm_clms,g.rm_rows);
    var _c2 = is_in_grid(_CLM2,_ROW, g.rm_clms,g.rm_rows);
    
    var      _SOLID1 = 0;
    if (_c1) _SOLID1 = global.dg_solid[#_CLM1,_ROW];
    var      _SOLID2 = 0;
    if (_c2) _SOLID2 = global.dg_solid[#_CLM2,_ROW];
    
    if((!_c1 || !_SOLID1) 
    && (!_c2 || !_SOLID2) )
    {
        break;//case SUB_STATE_CHLG_1B:{.  NOT in solids grid or NOT on a solid
    }
    
    
    
    
    // PC confirmed on top of solid tile -------------------------------------------
    // --------------------------------------------------------------------
    if (_SOLID1&TID_ONEWY1 
    ||  _SOLID2&TID_ONEWY1 )
    {
        var _W = 2<<3;
        _x  = global.pc.x-(_W>>1);
        _y  = _ROW<<3;
        
        for(_i=1; _i<Platform_COUNT; _i++)
        {
            if (dg_platform[#_i,0]) continue;//_i
            
            
                _c1 = rectInRect(_x,_y,_W,$1<<3, dg_platform[#_i  ,1]<<3,dg_platform[#_i  ,2]<<3, 2<<3,1<<3);
                _c2 = rectInRect(_x,_y,_W,$1<<3, dg_platform[#_i-1,1]<<3,dg_platform[#_i-1,2]<<3, 2<<3,1<<3);
            if (_c1   // PC is on next platform in the sequence
            ||  _c2 ) // PC is on curr platform in the sequence
            {
                if (_c1) // PC is on next platform in the sequence
                {
                    dg_platform[#_i,0] = 1;
                    
                    if (_i+1 == Platform_COUNT)
                    {
                        facing_dir = -1;
                        hspd = (hspd_jump*facing_dir) &$FF;
                        vspd = VSPD_REVEAL; // Jump!
                        
                        ogr  = OGR_JUMP;
                        stun_timer = STUN_DURATION1;
                        
                        aud_play_sound(get_audio_theme_track(dk_StrikeEnemy));
                        aud_play_sound(SND_REVEAL);
                        
                        sub_state = SUB_STATE_ACTV;
                    }
                    else
                    {
                        PlatformNext_idx = _i+1;
                        aud_play_combo1(3);
                    }
                }
                
                
                // PC is on qualified platform, skip the reset.
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
            
            break;//_i.  PC on wrong platform. Reset challenge.
        }
    }
    
    
    // PC NOT on qualified platform. Reset challenge.
    for(_i=0; _i<Platform_COUNT; _i++) dg_platform[#_i,0] = 0;
    
    aud_play_combo1(3);
    sub_state = SUB_STATE_CHLG_1A;
    break;}//case SUB_STATE_CHLG_1B:{
    
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV:{
    Kakusu_update();
    break;}//case SUB_STATE_ACTV:{
}//switch(sub_state)




