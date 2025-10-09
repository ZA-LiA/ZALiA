/// GOC1_create(xx, yy, facing dir, object_index, *version, *src inst id, *palette idx)


var _ARGS   = argument_count;

var                    _arg = 0;
var _XL     = argument[_arg++];
var _YT     = argument[_arg++];
var _FACING = argument[_arg++];
var _OBJ    = argument[_arg++];

var             _VER      = -1;
if (_ARGS>_arg) _VER      = argument[_arg++];

var             _SRC_INST = -1;
if (_ARGS>_arg) _SRC_INST = argument[_arg++];

var             _PAL_IDX  = -1;
if (_ARGS>_arg) _PAL_IDX  = argument[_arg++];




//  ---------------------------------------------------------------------------------------
with(instance_create(_XL,_YT, _OBJ))
{
    // get scripts from data, run scr_vars, run scr_ini1
    GameObject_create_1a();
    
    var _OBJ_NAME = object_get_name(object_index);
    if (_VER) ver = _VER;
    var _OBJVER = _OBJ_NAME+hex_str(ver);
    
    
    state = state_NORMAL;
    
    if (_SRC_INST)      source_inst=_SRC_INST;
    if(!is_undefined(   source_inst) 
    &&  instance_exists(source_inst) 
    &&                  source_inst.state==source_inst.state_NORMAL )
    {   source_object = source_inst.object_index;  }
    
    
    
    // --------------------------------------------------------------------------------------
    var _PROP_DK = GO_set_prop_values();
    
    // set placement spr, set pi, 
    GameObject_create_3a(_PROP_DK);
    
    
    
    spawn_xl = _XL;
    spawn_yt = _YT;
    set_xlyt(id, _XL,_YT);
    
    facing_dir = _FACING;
    hspd = ($20*facing_dir) &$FF;
    vspd = 0;
    
    
    
    // --------------------------------------------------------------------------------------
    // Secondary initializations -----------------------------------------
    if(!is_undefined(  scr_init2))
    {   script_execute(scr_init2);  }
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------
    // pal_idx has been specified by the instance that spawned this instance
    if (_PAL_IDX!=-1) GO_init_palidx(_PAL_IDX);
    //sdm(_OBJ_NAME+', _PAL_IDX: $'+hex_str(_PAL_IDX)+', palidx_def $'+hex_str(palidx_def)+', palidx $'+hex_str(palidx));
    
    
    
    
    // --------------------------------------------------------------------------------------
    set_hspd_dir();
    hspd_dir_spawn = hspd_dir;
    
    set_vspd_dir();
    vspd_dir_spawn = vspd_dir;
    
    
    
    setCSOffsets();
    update_draw_xy();
    update_body_hb_1a();
    
    
    
    // --------------------------------------------------------------------------------------
    // Final initializations -----------------------------------------
    if(!is_undefined(  scr_init3))
    {   script_execute(scr_init3);  }
    
    
    
    
    
    // --------------------------------------------------------------------------------------
    // output spawn info
    //db_GO_create_1a(id);
    
    
    
    
    return id;
}




