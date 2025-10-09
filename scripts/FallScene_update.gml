/// FallScene_update()


if (g.FallScene_timer)
{
    var _ANIM_SPEED = $3; // OG is every 2 frames but that looks too fast in ZALiA. Every 4 frames looks too slow, but 3 looks fine.
    var _TYPE_      =  val(global.FallScene_dm[?STR_Current+STR_Type], "1"); // "1": vertical fall, "2": horizontal fall
    var _FALL_DIR   =  val(global.FallScene_dm[?STR_Current+STR_Fall+STR_Direction], $1<<(2*(_TYPE_=="1")));
    var _FALL_SPEED =  val(global.FallScene_dm[?STR_Current+STR_Fall+STR_Speed], sign_(_FALL_DIR&($1|$4)));
    
    if (_FALL_DIR&($1|$2)) global.FallScene_dm[?STR_Current+"_x"] = val(global.FallScene_dm[?STR_Current+"_x"]) + _FALL_SPEED;
    if (_FALL_DIR&($4|$8)) global.FallScene_dm[?STR_Current+"_y"] = val(global.FallScene_dm[?STR_Current+"_y"]) + _FALL_SPEED;
    var _FALL_X     =  val(global.FallScene_dm[?STR_Current+"_x"]);
    var _FALL_Y     =  val(global.FallScene_dm[?STR_Current+"_y"]);
    
    
    //fs_pal_state += g.tmr_change_room&$1; // OG
    //if!(g.counter0 mod _ANIM_SPEED)
    if!(val(global.FallScene_dm[?STR_Counter]) mod _ANIM_SPEED)
    {
        var _ANIM_DIR = sign_(_FALL_DIR&$5); // $5: RIGHT | DOWN
        
        var _COUNT = val(global.FallScene_dm[?_TYPE_+dk_PI+STR_Count], 3);
        var _idx   = val(global.FallScene_dm[?dk_PI+STR_Sequence+STR_Index]);
            _idx   = (_idx+_ANIM_DIR+_COUNT) mod _COUNT;
        global.FallScene_dm[?dk_PI+STR_Sequence+STR_Index] = _idx;
        global.FallScene_dm[?STR_Current+dk_PI] = val(global.FallScene_dm[?_TYPE_+dk_PI+hex_str(_idx+1)], global.PI_GUI2);
        //if(global.FallScene_dm[?STR_Current+dk_PI]==global.PI_GUI2)sdm("FallScene_update(). `global.FallScene_dm[?'"+_TYPE_+"'+dk_PI+'"+string(_idx+1)+"']` is undefined");
    }
    
    global.FallScene_dm[?STR_Counter] = val(global.FallScene_dm[?STR_Counter]) + 1;
    
    
    
    
    global.FallScene_dm[?STR_Current+STR_ScaleX] = 1;
    if (_FALL_DIR&($4|$8)) // if vertical fall. $4: DOWN, $8: UP
    {
        if (g.room_type=="A") global.FallScene_dm[?STR_Current+STR_ScaleX] = global.pc.xScale;
        else                  global.FallScene_dm[?STR_Current+STR_ScaleX] = 1;
    }
    else if (_FALL_DIR&($1|$2)) // if horizontal fall. $1: RIGHT, $2: LEFT
    {
        global.FallScene_dm[?STR_Current+STR_ScaleX] = -sign_(_FALL_SPEED);
    }
    
    
    
    
    global.FallScene_dm[?STR_PC+dk_can_draw] = false;
    if ((_FALL_DIR&$4 && _FALL_Y>viewYT()+val(global.FallScene_dm[?STR_Base+"_Y"]))   // most likely
    ||  (_FALL_DIR&$1 && _FALL_X>viewXL()+val(global.FallScene_dm[?STR_Base+"_X"])) 
    ||  (_FALL_DIR&$2 && _FALL_X<viewXR()-val(global.FallScene_dm[?STR_Base+"_X"])) 
    ||  (_FALL_DIR&$8 && _FALL_Y<viewYB()-val(global.FallScene_dm[?STR_Base+"_Y"])) ) // least likely
    {
        global.FallScene_dm[?STR_PC+dk_can_draw] = true;
        
        var _pi = global.PI_PC1;
        if (pc_is_cucco())
        {
            switch(sign(g.spells_active&SPL_PRTC)+sign(f.items&ITM_RING)){
            default:{_pi=global.PI_CUCCO1; break;}
            case  1:{_pi=global.PI_CUCCO2; break;}
            case  2:{_pi=global.PI_CUCCO3; break;}
            }
        }
        else
        {
            switch(sign(g.spells_active&SPL_PRTC)+sign(f.items&ITM_RING)){
            default:{_pi=global.PI_PC1; break;}
            case  1:{_pi=global.PI_PC2; break;}
            case  2:{_pi=global.PI_PC3; break;}
            }
        }
        
        global.FallScene_dm[?STR_PC+dk_PI] = _pi;
    }
}




