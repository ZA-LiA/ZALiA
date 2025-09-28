/// PC_Room_Start()

show_debug_message(" PC_Room_Start()");
dev_start_pc_with(); // Add items, spells, etc..


var _i,_j,_k, _idx, _count1;
var _char, _pos;


depth = depth_def;
//GO_set_sprite(id,dg_SPRITES[#0,behavior]);
GO_init_palidx(global.PI_PC1);




// Add cucco spell flash palettes. cucco spell flash permut: B W R . . . . . .
var _color_order = "BWRGKYMC"; // permut color order
if (_color_order!=global.PAL_BASE_COLOR_ORDER)
{
    var _parent_pi = global.PI_SPELL_PC1;
    var _new_pi = _parent_pi;
    _count1 = val(global.dm_pi[?"SPELL_PC"+STR_Count]);
    for(_i=0; _i<_count1; _i++)
    {
        _parent_pi = global.PI_SPELL_PC1+_i;
        _new_pi = add_pi_permut(_parent_pi, _color_order, "cucco spell flash "+string(_i+1));
        
        for(_j=ds_grid_height(p.dg_PI_SEQ)-1; _j>=0; _j--)
        {
            if (p.dg_PI_SEQ[#$04,_j]-global.PI_SPELL_PC1==_i)
            {
                p.dg_PI_SEQ[#$05,_j] = _new_pi;
            }
        }
    }
    
    
    _color_order = "RWBGMYKC"; // permut color order
    for(_i=1; _i<4; _i++)
    {   // _i=1: MOB ORG, _i=2: MOB RED, _i=3: MOB BLU
        p.dg_PI_SEQ[#$01,_i] = add_pi_permut(p.dg_PI_SEQ[#$00,_i], _color_order, "cucco stun flash "+string(_i));
    }
}




ds_grid_clear(dg_UwU_,0);
for(_i=ds_grid_width(dg_UwU_)-1; _i>=0; _i--)
{   // _i is each behavior
    dg_UwU_[#_i,0]=choose(1,-1); // xscale
    dg_UwU_[#_i,1]=choose(1,-1); // yscale
    dg_UwU_[#_i,2]=global.PI_PC1+irandom(val(global.dm_pi[?"PC"+STR_Count])-1); // palidx
    //dg_UwU_[#_i,2]=PI_PC_1+irandom(PI_PC_3-PI_PC_1); // palidx
    //dg_UwU_[#_i,3]=irandom(PI_PERMUTATIONS-1); // palix_permut
    dg_UwU_[#_i,4]=irandom(3)*90; // rotation
}


ds_list_shuffle(dl_UwU_); // shuffle behaviors
if (Disguise_enabled)
{
    var _SIZE = ds_list_size(dl_UwU_);
    var _dl1 = ds_list_create();
    var _dl2 = ds_list_create();
    var _ds1 = ds_stack_create();
    var _ds2 = ds_stack_create();
    ds_list_add(_dl1,behavior_WALK1,behavior_WALK2,behavior_WALK3,behavior_IDLE,behavior_CROUCH);
    
    for(_i=_SIZE-1; _i>=0; _i--)
    {
        if (ds_list_find_index(_dl1,dl_UwU_[|_i])!=-1) ds_stack_push(_ds1,dl_UwU_[|_i]);
        else                                           ds_stack_push(_ds2,dl_UwU_[|_i]);
    }
    
    for(_i=0; _i<_SIZE; _i++)
    {
        if (ds_list_find_index(_dl1,_i)!=-1) ds_list_add(_dl2,ds_stack_pop(_ds1));
        else                                 ds_list_add(_dl2,ds_stack_pop(_ds2));
    }
    
    if (ds_list_size(_dl2)==_SIZE) ds_list_copy(dl_UwU_,_dl2);
    
    //ds_list_insert
    //ds_list_delete
    //ds_list_replace
    ds_list_destroy(_dl1); _dl1=undefined;
    ds_list_destroy(_dl2); _dl2=undefined;
    ds_stack_destroy(_ds1); _ds1=undefined;
    ds_stack_destroy(_ds2); _ds2=undefined;
}




state = state_NULL; // 00B5



Disguise_Head_idx = irandom(Disguise_Head_COUNT-1);

Cucco_disguise_sprite = 0;
dg_Cucco_DISGUISE_SPRITES_idx1 = irandom(ds_grid_width(dg_Cucco_DISGUISE_SPRITES)-1);
dg_Cucco_DISGUISE_SPRITES_idx2 = irandom(1);

RescueFairy_sprite = 0;
RescueDropOff_x = 0;
RescueDropOff_y = 0;
Rescue_move_x = 0;
Rescue_move_y = 0;


PC_set_behavior(behavior_IDLE); // 0080




fairy_sprite = 0; // The fairy sprite to draw
xScale       = 1; // 009F

Shadow_can_draw = false;

//HoldItem_can_draw = false;
HoldItem_timer    = 0; // 049C
HoldItem_inst     = noone; // 
HoldItem_object   = 0; // 049D
HoldItem_sprite   = 0;
HoldItem_palidx   = global.PI_MOB_ORG;

walk_frame    = 0; // $00AE
landing_timer = 0; // 0497

WalkTo_active = false;


hspd_dir        = xScale;   // 005F. // 
hspd_dir_spawn  = hspd_dir;
x_change        = 0;        // 0014
x_change_prev   = 0;        // FOR DEBUG. previous frame hChange

vspd_dir        = 1; // 
vspd_dir_spawn  = vspd_dir;
y_change        = 0; // 
y_change_prev   = 0; // FOR DEBUG. previous frame vChange

vspd_bounce     = VSPD_BOUNCE1;  // BV: Base Velocity
vspd_grav       = GRAVITY2; // $03E6

ogr = 0; // $0479. ogr: Off Ground Reason



attack_phase = 0; // $0400
stab_type    = 0; // 0495 stabType. 0: low, 1: high

// So various updates can happen, like during stun timer, but death is ensured
// Ensures that death will occur no matter what updates
is_dead          = false; // 0494. true when pending death
in_restore_house = false; // 048D

g.pc_lock = 0;


colliding_elevator    = noone; // 0754
colliding_locked_door = $00; // 05E7

Input.dHeld = 0; // 0: down NOT held, 1: down held


control           = 0; // control is flags for various purposes
DrownLiquid_y     = 0;
DrownLiquid_depth = 0;


Cucco_damage_taken  = 0;
Cucco_damaged_count = 0;

Cucco_rage_state    = 0;
Cucco_rage_timer    = 0;
Cucco_rage_tokens   = 0;
ds_grid_clear(dg_Cucco_rage,0);


TransformHumanClipCorrect_timer = 0;

// ------------------------------------------------------------
// ------------------------------------------------------------


cs_btm_inst = noone;
setCSOffsets();



// shield hb
PC_update_shield_hb();

// sword hb
SwordHB_collidable = false;
SwordHB_can_draw   = SwordHB_collidable;
SwordHB_x_base     = 0; // 047E
SwordHB_y_base     = 0; // 0480
SwordHB_xoff       = 0;
SwordHB_yoff       = 0;
SwordHB_x          = 0;
SwordHB_y          = 0;
SwordHB_w          = SwordHB_W;
SwordHB_h          = SwordHB_H;


// SCS: Sword Collide Solid
SCS_can_draw = false;
SCS_x        = 0; // 005D
SCS_y        = 0; // 0039
SCS_draw_x   = 0;
SCS_draw_y   = 0;




