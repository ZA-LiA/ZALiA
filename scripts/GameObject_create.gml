/// GameObject_create(XL, YT, object_index, version, *spawn datakey, *palette idx, *dlg datakey)


var _i, _val;

var                     _arg=0;
var _XL      = argument[_arg++];
var _YT      = argument[_arg++];
var _OBJECT  = argument[_arg++];
var _VERSION = argument[_arg++];

var                      _SPAWN_DATAKEY    = -1;
if (argument_count>_arg) _SPAWN_DATAKEY    = argument[_arg++];

var                      _PALETTE_IDX      = -1;
if (argument_count>_arg) _PALETTE_IDX      = argument[_arg++];

var                      _DIALOGUE_DATAKEY = -1;
if (argument_count>_arg) _DIALOGUE_DATAKEY = argument[_arg++];




//  ========================================================================================================
//  ---------------------------------------------------------------------------------------
with(instance_create(_XL,_YT, _OBJECT))
{
    // get scripts from data, run scr_vars, run scr_ini1
    GameObject_create_1a();
    ver = _VERSION;
    
    var _OBJ_NAME = object_get_name(object_index);
    var _OBJVER   = _OBJ_NAME+hex_str(ver);
    
    state = state_NORMAL;
    
    
    GameObject_create_2a(_SPAWN_DATAKEY); // set spawn_idx, set dk_spawn
    
    
    
    
    // --------------------------------------------------------------------------------------
    if(!is_undefined(dk_spawn))
    {   // _val examples: "010204", "01", "02"
        // This instance is qualified for ANY quest if there's no data
        _val = g.dm_spawn[?dk_spawn+STR_Qualified+STR_Quest+STR_Nums];
        if(!is_undefined(_val) 
        &&  is_string(   _val) 
        && !string_pos(hex_str(f.quest_num),_val) )
        {
            state = 0;
            return noone;
        }
    }
    
    
    
    
    // --------------------------------------------------------------------------------------
    // sets objver specific properties
    GO_set_prop_values();
    
    // sets sprite_index as a placement sprite so ogX/ogY can give an accurate answer
    // sets sprite, ar_spr[0], sprite_index, si_xoff,si_yoff, ww,ww_, hh,hh_
    // sets palidx_def, palidx_base, palidx, palidx_permut
    // The palette data is specific to this spawn or this area for this objver. palidx is defaulted as p.PI_MOB1.
    GameObject_create_3a(_OBJVER);
    
    
    
    
    // Dialogue for this spawn_dk
    if(!is_undefined(                dk_spawn) 
    && !is_undefined(    g.dm_spawn[?dk_spawn+STR_Dialogue+STR_Datakey]) ) 
    {   dialogue_datakey=g.dm_spawn[?dk_spawn+STR_Dialogue+STR_Datakey];  }
    
    
    
    spawn_x = _XL;
    spawn_y = _YT;
    set_xy(id, spawn_x+sprite_index_xoff, spawn_y+sprite_index_yoff);
    //setXY(id, spawn_x,spawn_y);
    
    
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------
    facing_dir = dir_to_pc_1();
    hspd = ($08*facing_dir) &$FF; // OG
    
    
    
    if (is_ancestor(object_index,Platform))
    {
        scr_step  = scr_update;
        
        facing_dir = 1;
        xScale    = facing_dir;
        hspd      = 0;
        vspd      = 0;
    }
    else if (is_ancestor(object_index,Challenge))
    {
        scr_step = scr_update;
        
        challenge_id = _OBJVER;
        
        facing_dir = 1;
        xScale    = facing_dir;
        hspd      = 0;
    }
    else if (is_ancestor(object_index,Item))
    {
        var _SPRITE = val(g.dm_ITEM[?_OBJVER+STR_Sprite], spr_Torch_1a);
        GO_sprite_init(_SPRITE);
        
        // object_index example: ItmK8, ItmC0
        ITEM_BIT     = val(g.dm_ITEM[?_OBJ_NAME+STR_Bit], ITEM_BIT);
        ITEM_TYPE    = val(g.dm_ITEM[?object_get_name(object_index)+STR_Item+STR_Type], "undefined");
        IS_HOLD_ITEM = val(g.dm_ITEM[?_OBJ_NAME+STR_Hold+STR_Item]);
        
        facing_dir = 1;
        xScale    = facing_dir;
        hspd      = 0;
        
        if(!IS_HOLD_ITEM) g.pc.Disguise_enabled = false; // So pc can stab item.
    }
    else if (is_ancestor(object_index,Boss))
    {
        facing_dir = dir_to_pc_(id);
    }
    
    
    
    if (is_ancestor(object_index,GOB1))
    {
            update_idx = add_to_update_list_b1(id);
        if (update_idx==UIDX_NULL 
        ||  g.encounter_type&g.ENC_FARY ) // No hostile GO for fairy encounter
        {
            state = 0;
            //if (g.mod_destroy_go_on_death && !state) GO_destroy_1a();
            return noone;
        }
        
        
        if (g.mod_REFLECT_more_obj)
        {   // dl_ProjVuln: Projectile Vulnerabilities
            var _DATAKEY = _OBJVER+STR_REFLECT+STR_Vulnerable;
                            dl_ProjVuln = ds_list_create();               _i=0;
            while(!is_undefined(         g.dm_go_prop[?_DATAKEY+hex_str(++_i)]))
            {   ds_list_add(dl_ProjVuln, g.dm_go_prop[?_DATAKEY+hex_str(  _i)]);  }
        }
    }
    else if (is_ancestor(object_index,GOB2))
    {
        var          _COUNT = ds_list_size(g.go_mgr.dl_gob2);
        for(_i=0; _i<_COUNT; _i++)
        {
            if (is_undefined(   g.go_mgr.dl_gob2[|_i]) 
            || !instance_exists(g.go_mgr.dl_gob2[|_i]) 
            || !g.go_mgr.dl_gob2[|_i].state )
            {
                g.go_mgr.dl_gob2[|_i] = id;
                break;
            }
        }
        
        if (ds_list_find_index(g.go_mgr.dl_gob2,id)==-1) 
        {   ds_list_add(       g.go_mgr.dl_gob2,id);  }
        
        update_idx = ds_list_find_index(g.go_mgr.dl_gob2,id);
        
        g.go_mgr.uIdxSwap_gob = UIDX_NULL;
        
        if (g.pc.Disguise_enabled)
        {
            if (is_ancestor(object_index,NPC_B)  // NPC_B: Minigame
            ||  is_ancestor(object_index,NPC_D) )// NPC_D: Shop
            {
                g.pc.Disguise_enabled = false;
            }
        }
    }
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------
    // Secondary initializations -----------------------------------------
    if(!is_undefined(  scr_init2))
    {   script_execute(scr_init2);  }
    // --------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------
    // set a depth specific to this spawn
    if(!is_undefined(             dk_spawn) 
    && !is_undefined( g.dm_spawn[?dk_spawn+STR_Depth]) )
    {
        GO_depth_init(g.dm_spawn[?dk_spawn+STR_Depth]); // set a depth specific to this spawn_datakey
    }
    
    
    
    
    
    
    // --------------------------------------------------------------------------------------
    //  _PALETTE_IDX has been specified by the instance that spawned this instance
    if (_PALETTE_IDX!=-1) GO_init_palidx(_PALETTE_IDX);
    
    
    if(!is_undefined(            dk_spawn) 
    && !is_undefined(g.dm_spawn[?dk_spawn+STR_Palette]) )
    {
        _val =       g.dm_spawn[?dk_spawn+STR_Palette];
        change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(palidx), string_length(_val), _val));
    }
    
    
    //  _DIALOGUE_DATAKEY has been specified by the instance that spawned this instance
    if (_DIALOGUE_DATAKEY!=-1) dialogue_datakey = _DIALOGUE_DATAKEY;
    
    
    
    
    // --------------------------------------------------------------------------------------
    set_hspd_dir();
    hspd_dir_spawn = hspd_dir;
    
    set_vspd_dir();
    vspd_dir_spawn = vspd_dir;
    
    
    
    setCSOffsets();
    update_draw_xy();
    update_body_hb_1a();
    
    
    if (g.town_name==STR_Bulblin 
    &&  g.pc.Disguise_enabled 
    //&&  f.items&ITM_MASK 
    &&  is_ancestor(object_index,GOB1) )
    {
        state = 0;
    }
    
    
    
    
    // --------------------------------------------------------------------------------------
    // Final initializations -----------------------------------------
    if(!is_undefined(  scr_init3))
    {   script_execute(scr_init3);  }
    
    
    
    
    // --------------------------------------------------------------------------------------
    if (DEV) db_GO_create_1a(id); // output spawn info
    
    return id;
}


return noone;





