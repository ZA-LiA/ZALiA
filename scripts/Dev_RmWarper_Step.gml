/// Dev_RmWarper_Step()


// 2024/09/12. Anyone can use. This is useful if the player is making custom content and needs to get somewhere fast.
//if(!DEV 
//|| !g.DevTools_state 
if (g.room_type != "A" 
||  g.gui_state != g.gui_state_PAUSE )
{
    //timer = $80;
    state = STATE_IDLE;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}



// --------------------------------------------------------------------------------
// -------------------------------------------------------------------------
var _i,_j, _idx, _a, _val, _num, _diff;
var _count;
var _mapkey, _area, _rm_name, _exit_name;



if (timer) timer--;






// ----------------------------------------------------------------------------------------------------
//  UPDATE INPUT  ----------------------------------------------------------------
var _QUAL_STATE = isVal(state, STATE_AREA,STATE_RM1,STATE_EXIT);



// Pressed
var _xbox_ap = Input.Jump_pressed;
var _xbox_bp = Input.GP_Other1_pressed;
//var _xbox_xp = Input.GP_Attack_pressed;
var _xbox_yp = Input.GP_Face4_pressed;
//var _xbox_yp = Input.GP_Other2_pressed;


// Held
var _xbox_ah = Input.Jump_held;
//var _xbox_bh = Input.GP_Other1_held;
//var _xbox_xh = Input.GP_Attack_held;
//var _xbox_yh = Input.GP_Other2_held;


var _HORZ_QUAL = 0;
var _VERT_QUAL = 0;
if (_QUAL_STATE         // if is a qualified state
&& !timer 
&&  Input.heldHV )
{
    _HORZ_QUAL = gui_tmr_cursor_h();
    _VERT_QUAL = gui_tmr_cursor_v();
}



//                      Hold SELECT                    &&  Press xbox Y
var _RQST_OPEN_APP   = (Input.Magic_held || Input.GP_Select_held)  && _xbox_yp; // Hold SELECT  &&  Press xbox Y


// FWRD: FORWARD (RIGHT. state += 1)
var _RQST_STATE_FWRD  =  _HORZ_QUAL && (Input.Right_pressed || _xbox_ap);
// BWRD: BACKWARD (LEFT.  state -= 1)
var _RQST_STATE_BWRD  =  _HORZ_QUAL && (Input.Left_pressed || keyboard_check_pressed(vk_backspace));
    _RQST_STATE_BWRD |=  _HORZ_QUAL && _xbox_bp && isVal(state, STATE_RM1,STATE_EXIT);

var _CANCEL           =  keyboard_check_pressed(vk_escape) || _RQST_OPEN_APP;
    _CANCEL          |=  _xbox_bp && state==STATE_IDLE;
// var _CANCEL           =  _xbox_bp  || keyboard_check_pressed(vk_escape);
var _CONFIRM          =  Input.Pause_held || keyboard_check_pressed(vk_enter);







// --------------------------------------------------------------------------------
// -------------------------------------------------------------------------
// --------------------------------------------------------------------------------
// -------------------------------------------------------------------------
if (_QUAL_STATE     // if right state
&& !timer )
{
    // --------------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    if (_CONFIRM)
    {
        if (dl_area[|area_idx]==Area_Title)
        {
            state = STATE_IDLE;
            goto_title_rm();
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
        
        
        
        if(!is_undefined(g.dm_rm[?ExitName_goto+STR_Num]))
        {
            Dev_RmWarper_update_3a(); // sets ExitName_goto
            
                 g.exit_leave   = Exit_construct(EXIT_NAME_GAME_START); // triggers rm change
            with(g.exit_leave)
            {
                goToExitName    = other.ExitName_goto;
                goToExitNum     = string_copy(goToExitName,  RmName_LEN-1, 2);
                goToExitNum     = str_hex(    goToExitNum);
                goToRoom        = string_copy(goToExitName,1,RmName_LEN);
            }
            
            sdm("area_idx $"+hex_str(area_idx)+", dl_area[|area_idx] "+dl_area[|area_idx]+", rm_id $"+hex_str(rm_id)+", ExitID $"+hex_str(ExitID));
            
            aud_play_sound(SND_OPTION_CONFIRM);
            aud_play_sound(SND_OPTION_SELECT1);
            state = STATE_IDLE;
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
    
    
    // --------------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    if (_CANCEL 
    || (_xbox_bp && state==STATE_IDLE) )
    {
        aud_play_sound(SND_OPTION_CANCEL);
        aud_play_sound(get_audio_theme_track(STR_PC+STR_Damage));
        //aud_play_sound(Audio.SND_PC_GRUNT1);
        state = STATE_IDLE;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    if (_RQST_STATE_FWRD 
    ||  _RQST_STATE_BWRD )
    {
        aud_play_sound(SND_OPTION_CHANGE2);
        
        timer  = DUR2; // Delay any input reaction in next state.
        
        var _DIR = sign_(_RQST_STATE_FWRD);
        
        state += _DIR;
        
        if(!isVal(state, STATE_AREA,STATE_RM1,STATE_EXIT))
        {
            if (_DIR) state = STATE_AREA;
            else      state = STATE_EXIT;
            
            
            _area    = dl_area[|area_idx];
            _rm_name = _area + hex_str(rm_id);
        }
        
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------
    // -------------------------------------------------------------------------
    if (_VERT_QUAL)
    {
        var _DIR  = sign_(bit_dir(_VERT_QUAL&$C)); //  1: DWN pressed,  -1: UP  pressed
        
        switch(state)
        {
            // -------------------------------------------------------------------------------------------
            case STATE_AREA:{ // -----------------------------------------------------------------
            area_idx  = area_idx  +  AREA_COUNT;
            area_idx += _DIR;
            area_idx  = area_idx mod AREA_COUNT;
            
            for(_i=0; _i<RmID_COUNT; _i++){
                rm_id    = _i;
                _area    = dl_area[|area_idx];
                _rm_name = _area + hex_str(rm_id);
                if(!is_undefined(g.dm_rm[?_rm_name+STR_Rm+STR_Num+STR_Game]))
                {
                    Dev_RmWarper_update_1a(_rm_name); // populates dl_Rm_ExitIDs
                    if (ds_list_size(dl_Rm_ExitIDs))
                    {   ExitID = dl_Rm_ExitIDs[|0];  }
                    break; // _i
                }
            }
            break;}
            
            
            
            
            // -------------------------------------------------------------------------------------------
            case STATE_RM1:{ // -----------------------------------------------------------------
            
            if (_xbox_ah) _diff  = $08*_DIR;
            else          _diff  = _DIR;
            
            _area    = dl_area[|area_idx];
            _rm_name = _area + hex_str(rm_id);
            
            _count   = val(g.dm_rm[?_area   +STR_Rm+STR_Count]); // area rm count
            
            _num     = val(g.dm_rm[?_rm_name+STR_Rm+STR_Num+STR_Area]);
            _num     = (_num+_count) - 1;
            _num     = (_num+_diff) mod _count;
            _num++;
            
            rm_id    = val(g.dm_rm[?_area   +STR_Rm+hex_str(_num)+STR_ID], rm_id);
            _rm_name = _area + hex_str(rm_id);
            // sdm("_diff "+string(_diff)+", _RM_ID $"+hex_str(_RM_ID)+", rm_id $"+hex_str(rm_id)+", area rm count $"+hex_str(_count)+", _num $"+hex_str(_num));
            
            Dev_RmWarper_update_1a(_rm_name); // populates dl_Rm_ExitIDs
            if (ds_list_size(dl_Rm_ExitIDs))
            {   ExitID = dl_Rm_ExitIDs[|0];  }
            break;}
            
            
            
            
            // -------------------------------------------------------------------------------------------
            case STATE_EXIT:{ // ---------------------------------------------------------------
            if (_xbox_ah) _diff  = $08*_DIR;
            else          _diff  = _DIR;
            ExitID = Dev_RmWarper_update_2a(_diff); // sets ExitID
            break;}
        } // switch(state){
        
        
        
        //Dev_RmWarper_update_3a(); // sets ExitName_goto
        
        
        if (_DIR) aud_play_sound(SND_OPTION_CHANGE_DWN); // down pressed
        else      aud_play_sound(SND_OPTION_CHANGE_UP);  // up   pressed
    }
}















// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------
// For boss/scene rando
//var _DUNGEON_NUM = dungeon_num;
//    _DUNGEON_NUM = val(f.dm_rando[?rm_name+STR_Dungeon+STR_Num], _DUNGEON_NUM);
//
//scene_data_scene_name = rm_name;
//scene_data_scene_name = val(f.dm_rando[?rm_name+STR_Scene+STR_Name], rm_name);
//dm_save_data[?_c_scene_name+STR_Dungeon+STR_Area]
switch(state)
{
    // ------------------------------------------------------------------------------
    // -----------------------------------------------------------------
    case STATE_IDLE:{
    if (timer) break;
    
    if (_RQST_OPEN_APP              // SELECT held && xbox_B pressed
    //&&  g.DevTools_state 
    //&& !g.dev_rm_warper_active 
    &&  g.room_type == "A" 
    &&  g.gui_state == g.gui_state_PAUSE  // While in the pause menu.
    &&  can_update_frame() )
    {
        //var _AREA_NAME = g.area_name;
        //    _AREA_NAME = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Area], _AREA_NAME);
        //
        var _SCENE_NAME = val(f.dm_rando[?g.rm_name+STR_Scene+STR_Name], g.rm_name);
        var _AREA_NAME = string_copy(_SCENE_NAME,1,AreaID_LEN);
        var _RM_NUM = str_hex(string_copy(_SCENE_NAME,AreaID_LEN+1,2));
        area_idx = max(0,ds_list_find_index(g.dl_AREA_NAME, _AREA_NAME));
        rm_id    = _RM_NUM;
        //area_idx = max(0,ds_list_find_index(g.dl_AREA_NAME, g.area_name));
        //rm_id    = g.rm_num;
        _rm_name = dl_area[|area_idx] + hex_str(rm_id);
        
        if (is_undefined(f.reen) 
        ||  area_is_ow(  f.reen) )
        {
            with(Exit)
            {
                other.ExitID = exitNum;
                break;//with(Exit)
            }
        }
        else
        {
            ExitID = str_hex(string_copy(f.reen, string_length(f.reen)-1, 2));
        }
        
        exit_idx = bitNum((ExitID>>4)&$F);      // 0,1,2,3,4
        exit_idx = (exit_idx<<4) | (ExitID&$F); // $00-4F
        
        Dev_RmWarper_update_1a(_rm_name); // populates dl_Rm_ExitIDs
        ExitID = Dev_RmWarper_update_2a(0); // sets ExitID
        //Dev_RmWarper_update_3a(); // sets ExitName_goto
        
        //g.dev_rm_warper_active = true;
        //g.dev_rm_warper_active = !g.dev_rm_warper_active;
        
        aud_play_sound(SND_OPEN_APP);
        
        timer  = DUR1;
        state  = STATE_AREA;
    }
    break;}
    
    
    
    
    // ------------------------------------------------------------------------------
    // -----------------------------------------------------------------
    case STATE_AREA:{
    if (timer) break;
    // state  =  ((state+STATE_COUNT)+_DIR)  mod  STATE_COUNT;
    break;}
    
    // ------------------------------------------------------------------------------
    // -----------------------------------------------------------------
    case STATE_RM1:{
    if (timer) break;
    // timer   = 0;
    // state   = STATE_EXIT;
    break;}
    
    // ------------------------------------------------------------------------------
    // -----------------------------------------------------------------
    case STATE_EXIT:{
    if (timer) break;
    // timer   = 0;
    // state   = STATE_IDLE;
    break;}
    
    // ------------------------------------------------------------------------------
    // -----------------------------------------------------------------
    case STATE_GOTO:{
    if (timer) break;
    // timer   = 0;
    // state   = STATE_IDLE;
    break;}
    
    // ------------------------------------------------------------------------------
    // -----------------------------------------------------------------
    // case STATE_IDLE:{break;}
}









/*
if (keyboard_check_pressed(vk_space)){
    var _str, _mapkey, _area;
    var _idx, _val, _count, _rm_count, _exit_count;
    sdm("");
    
    _mapkey = STR_Rm+STR_Count;
    _rm_count = val(g.dm_rm[?_mapkey]);
    _str  = "Game  rm count:  $"+hex_str(_rm_count);
    _str += "("+string(_rm_count)+")";
    sdm(_str);
    
    for(_i=0; _i<AREA_COUNT; _i++){
        sdm("");
        _str  = "";
        _area = dl_area[|_i];
        
        _mapkey = _area + STR_Rm   + STR_Count; // This area's rm count
        _rm_count = val(g.dm_rm[?_mapkey]);
        _str += _area+"  rm count:  $"+hex_str(_rm_count);
        _str += "("+string(_rm_count)+")";
        _str += ",  ";
        
        _mapkey = _area + STR_Exit + STR_Count; // This area's exit count
        _exit_count = val(g.dm_rm[?_mapkey]);
        _str +=     "  exit count:  $"+hex_str(_exit_count);
        _str += "("+string(_exit_count)+")";
        _str += ",  ";
        
        sdm(_str);
        
        for(_j=1; _j<=_rm_count; _j++){
            _str  = "   ";
            _mapkey = _area + STR_Rm + hex_str(_j) + STR_ID;
            _val = val(g.dm_rm[?_mapkey], -1);
            _str += "Rm $"+hex_str(_j)+" id:  $"+hex_str(_val);
            sdm(_str);
        }
        sdm("");
    }
    // sdm("Game rm count:  $");
    sdm("");
}
*/

/*
_mapkey = _RM_NAME + STR_Exit + STR_ID + STR_List;



_mapkey = area + STR_Rm + STR_Count; // This area's rm count
_mapkey = area + STR_Rm + hex_str(_count) + STR_ID;

_mapkey =        STR_Rm + STR_Count; // Game rm count
_mapkey =        STR_Rm + hex_str(_count) + STR_ID;



_mapkey = rm_name + STR_Exit + STR_Count; // This rm's exit count
_mapkey = rm_name + STR_Exit + hex_str(_count) + STR_Name;

_mapkey = area    + STR_Exit + STR_Count; // This area's exit count
_mapkey = area    + STR_Exit + hex_str(_count) + STR_Name;

_mapkey =          STR_Exit + STR_Count; // Game exit count
_mapkey =          STR_Exit + hex_str(_count) + STR_Name;



_mapkey = _RM_NAME + STR_Rm + STR_Num + STR_Game;
_mapkey = _RM_NAME + STR_Rm + STR_Num + STR_Area;

_mapkey = _exit_name + STR_Exit + STR_Num + STR_Rm;
_mapkey = _exit_name + STR_Exit + STR_Num + STR_Area;
_mapkey = _exit_name + STR_Exit + STR_Num + STR_Game;
*/




