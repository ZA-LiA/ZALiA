/// update_change_room()


// NextLifeScreen: if (counter1==ROOM_CHANGE_CUE) ChangeRoom_timer = DUR_CHANGE_ROOM_ENTER_1 + 1;


var _EXITING_RM = is_exiting_rm();
var _EXITING_OW = is_exiting_ow();

var _RETURN = (ChangeRoom_timer>0) || _EXITING_RM || _EXITING_OW;




// ---------------------------------------------------------------------
if (ChangeRoom_timer<=0)
{
    if (_EXITING_RM)
    {
        leave_rm_x = global.pc.xl;
        leave_rm_y = global.pc.yt;
        
        // MOD. To prevent GO's from drawing during room change
        set_go_can_draw_self(false); 
    }
    
    
    
    if (_EXITING_RM 
    ||  _EXITING_OW )
    {   // Start room change process
        var _C1 = qual_fall_scene();
        //if(_EXITING_OW && ow.exit_grid_xy==$61D3) sdm("get_fs_type(): "+string(get_fs_type())+", _C1: "+string(_C1)+", is_undefined(g.ow.enc_reen): "+string(is_undefined(g.ow.enc_reen)));
        
        if (_C1) ChangeRoom_timer = ChangeRoom_LEAVE_DURATION2; // $05. Falling scene
        else     ChangeRoom_timer = ChangeRoom_LEAVE_DURATION1; // $09
        
        if(!_C1) // Falling scene will NOT occur
        {
            if (_EXITING_OW)
            {
                if(!is_undefined(global.OVERWORLD.enc_reen)  // Entering encounter
                || !is_undefined(global.OVERWORLD.dm[?hex_str(global.OVERWORLD.pcrc)+STR_Special+STR_Encounter]) ) // PC is on Dark Forest Kakusu tile
                {
                    Audio.encounter_sound_inst = aud_play_sound(get_audio_theme_track(STR_Encounter+STR_Enter));
                }
            }
            else if (_EXITING_RM)
            {
                if (rm_get_encounter_types(rm_name))
                {
                    Audio.encounter_sound_inst = aud_play_sound(get_audio_theme_track(STR_Encounter+STR_Leave));
                }
            }
        }
    }
}






// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
if (ChangeRoom_timer<=0)
{
    ChangeRoom_timer = 0;
    return _RETURN;
}





// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
if (FallScene_timer) FallScene_timer--;





// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
    ChangeRoom_timer -= 1*global.delta_multiplier;
//
if (ChangeRoom_timer<=0)
{
    ChangeRoom_timer = 0;
    
    if (_EXITING_RM 
    ||  _EXITING_OW )
    {
        if (qual_fall_scene())
        {   // Trigger Falling Scene -----------------------------------------
            ChangeRoom_timer = FallScene_DURATION1; // $6D(109)
            FallScene_timer  = floor(ChangeRoom_timer)+1;
            //sdm("`update_change_room()`. fall scene triggered. FallScene_timer="+string(FallScene_timer)+", get_fall_scene_type()=$"+hex_str(get_fall_scene_type()));
            
            var _dk0,_dk1, _pi;
            
            var _FALL_DIR   = get_fall_scene_type(); // $1: RIGHT, $2: LEFT, $4: DOWN, $8: UP
            var _DIR        = sign_(_FALL_DIR&($1|$4)); // $1: RIGHT, $4: DOWN
            var _TYPE_      = string(1 + ((_FALL_DIR&($1|$2))!=0)); // The type/id of this fall scene. "1": Classic blue vertical fall, "2": Fast travel red horizontal fall
            var _FALL_SPEED = val(global.FallScene_dm[?STR_Current+STR_Fall+STR_Speed],1) * _DIR;
            var _Image_W    = val(global.FallScene_dm[?_TYPE_+STR_Image+STR_Width]);
            var _Image_H    = val(global.FallScene_dm[?_TYPE_+STR_Image+STR_Height]);
            
            
            global.FallScene_dm[?STR_Counter] = 1;
            global.FallScene_dm[?STR_Current+STR_Type]               = _TYPE_;
            global.FallScene_dm[?STR_Current+STR_Fall+STR_Direction] = _FALL_DIR;
            global.FallScene_dm[?STR_Current+STR_Fall+STR_Speed]     = _FALL_SPEED;
            
            
            global.FallScene_dm[?STR_Current+"_x"] = viewXC();
            global.FallScene_dm[?STR_Current+"_y"] = viewYC();
            
            if (_FALL_DIR&($1|$2)) // Horizontal fall with red vertical stripes. $1: RIGHT, $2: LEFT
            {   // Red vertical stripes. Fast travel fall scene
                if (_DIR) global.FallScene_dm[?STR_Current+"_x"]  = viewXL(); // falling RIGHT
                else      global.FallScene_dm[?STR_Current+"_x"]  = viewXR(); // falling LEFT
                          global.FallScene_dm[?STR_Current+"_x"] += val(global.FallScene_dm[?STR_Base+"_X"]) * _DIR;
                          global.FallScene_dm[?STR_Current+"_x"] -= _FALL_SPEED; // So that x/y coords can update in `FallScene_update()` instead of in the draw
            }
            else if (_FALL_DIR&($4|$8)) // Vertical fall with blue horizontal stripes. $4: DOWN, $8: UP
            {   // Blue horizontal stripes. Normal fall scene
                if (_DIR) global.FallScene_dm[?STR_Current+"_y"]  = viewYT(); // falling DOWN
                else      global.FallScene_dm[?STR_Current+"_y"]  = viewYB(); // falling UP
                          global.FallScene_dm[?STR_Current+"_y"] += val(global.FallScene_dm[?STR_Base+"_Y"]) * _DIR;
                          global.FallScene_dm[?STR_Current+"_y"] -= _FALL_SPEED; // So that x/y coords can update in `FallScene_update()` instead of in the draw
            }
            
            
            
            
            _dk0 = STR_Current+STR_Image; // image that will be used for this fall scene
            _dk1 = _TYPE_+STR_Image;      // image that this `_TYPE_` of fall scene uses
            if(!surface_exists(val(global.FallScene_dm[?_dk0],-1))) global.FallScene_dm[?_dk0] = surface_create(_Image_W,_Image_H);
            if (surface_exists(val(global.FallScene_dm[?_dk1],-1))) surface_copy(global.FallScene_dm[?_dk0], 0,0, global.FallScene_dm[?_dk1]);
            global.FallScene_dm[?STR_Current+STR_Image+STR_Width]  = surface_get_width( global.FallScene_dm[?_dk0]);
            global.FallScene_dm[?STR_Current+STR_Image+STR_Height] = surface_get_height(global.FallScene_dm[?_dk0]);
            
            
            
            
            _dk0  = _TYPE_+dk_PI;
            _dk0 += hex_str(val(global.FallScene_dm[?dk_PI+STR_Sequence+STR_Index]) + 1);
            global.FallScene_dm[?STR_Current+dk_PI] = val(global.FallScene_dm[?_dk0], global.PI_GUI2);
            
            // Change palette colors for the fall scene
            var _PARENT_PI = val(global.FallScene_dm[?_dk0+"_Parent"], global.PI_GUI2);
            var _PALETTE   = val(global.FallScene_dm[?_TYPE_+STR_Palette], p.PAL_GUI2);
            change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(_PARENT_PI), string_length(_PALETTE), _PALETTE));
            
            
            
            
            // This is to prevent a couple frames of a bright bgr color drawing clear before transitioning to the bgr color of the next scene
            global.BackgroundColor_scene = p.C_BLK1;
            
            
            
            
            // delete all room tiles so falling scene has a clear screen to draw on
            tile_delete_all();
            
            audio_group_stop_all(audiogroup_mus);
            Audio.can_play_mus_rm_body = false;
            Audio.can_play_boss_music  = false;
            aud_play_sound(get_audio_theme_track(dk_FallScene+STR_Sound));
        }
        else
        {   // Triggers room_goto() ------------------------------------------
            //sdm("`update_change_room()`. no fall scene. FallScene_timer="+string(FallScene_timer)+", get_fall_scene_type()=$"+hex_str(get_fall_scene_type()));
            ChangeRoom_timer = ChangeRoom_ENTER_DURATION1; // $22
            update_change_room_1a();
        }
    }
    else
    {   // --------------------------------------------------------------------------------------------------
        // --------------------  FINISHED CHANGING ROOMS  ------------------------------------------------------------------------------------
        FallScene_timer  = FallScene_INACTIVE;
        ChangeRoom_timer = 0;
        if (room_type=="A") counter1 = $26; // simulating OG
        
        Audio.can_play_mus_rm_body = true;
        show_debug_message("update_change_room(). FINISHED CHANGING ROOMS");
    }
}



return _RETURN; // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$




