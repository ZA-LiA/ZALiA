/// Blaze_init2()


//data_go_scr(o_name,  Blaze_init1, Blaze_init2, Blaze_update, Blaze_udp, Blaze_draw);
var _i, _val, _len, _pos;


switch(ver)
{
    // ========================================
    // -----------------------------------
    case 1:{ // OG. Stationary Flame
    GO_sprite_init(spr_Flame1);
    HostileFire_init_1(global.PI_MOB_RED);
    ANIM_SPEED = ANIM_SPEED;
    hspd = 0;
    //set_xy(id, x+4,y);
    break;}
    
    
    
    
    
    // ========================================
    // -----------------------------------
    case 2:{ // Jumping Flame
    GO_sprite_init(spr_Flame1);
    HostileFire_init_1(global.PI_MOB_ORG);
    ANIM_SPEED = ANIM_SPEED;
    
    abilities |= ABL_JUMP;
    
    SPR_KID  = spr_Flame_Small_1a;
    DUR_KID  = $40;
    KID_CUE1 = (DUR_KID>>3) * 3;
    dg_kids  = ds_grid_create(3,3);
    
    //set_xy(id, x+4,y);
    break;}
    
    
    
    
    
    // ========================================
    // -----------------------------------
    case 3:{
    GO_sprite_init(spr_Fire_1a_2);
    break;}
    
    
    
    
    
    // ========================================
    // -----------------------------------
    case 4:{
    GO_sprite_init(spr_Flame1);
    break;}
    
    
    
    
    
    // ========================================
    // -----------------------------------
    case 5:{
    GO_sprite_init(spr_Flame_Small_1b);
    break;}
    
    
    
    
    
    // ========================================
    // -----------------------------------
    case 6:{ // Fires in Old Kasuto
    size=2;
    
    var _spawn_datakey = dk_spawn;
    if(!is_undefined(    dk_spawn))
    {   _spawn_datakey = val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawn+dk_spawn+STR_Spawn+STR_Datakey+STR_Randomized], dk_spawn);  }
    
    
    if(!is_undefined(_spawn_datakey))
    {
        for(_i=$1; _i<=$F; _i++)
        {
            _val=val(g.dm_spawn[?_spawn_datakey+STR_Data+hex_str(_i)]);
            if (is_string(_val))
            {
                    _pos =string_pos(   STR_Size,_val);
                if (_pos)
                {   _pos+=string_length(STR_Size);
                    _val =string_copy(_val, _pos, string_length(_val)-(_pos-1));
                    size =str_hex(_val);
                    break;//_i
                }
            }
        }
    }
    
    
    size = clamp(size,1,3);
    
    
    
    switch(size)
    {
        case 1:{
        GO_sprite_init(spr_Flame_Small_1b);
        BodyHB_IDX=$56;
        break;}
        
        case 2:{
        GO_sprite_init(spr_Flame1);
        BodyHB_IDX=$30;
        break;}
        
        case 3:{
        GO_sprite_init(spr_Fire_1a_2);
        BodyHB_IDX=$01;
        break;}
    }//switch(size)
    
    set_xlyt(id, spawn_xl,spawn_yt);
    GO_depth_init(DEPTH_BG4+1);
    BodyHB_idx=BodyHB_IDX;
    hspd=0;
    ATTACK_LEVEL=0;
    attack_level=ATTACK_LEVEL;
    break;}//case 6:
}//switch(ver)


if (ver==3 
||  ver==4 
||  ver==5 )
{
    //GO_depth_init(DEPTH_BG4+1);
    ANIM_SPEED = $08;
    hspd = 0;
    vspd = 0;
    set_xlyt(id, spawn_xl,spawn_yt);
}



DRAW_YOFF = 0; // MOD. No +1 in ground

DRAW_CUE1 = (DUR_FADE1>>3) * 3;

can_leave_kid = variable_instance_exists(id,"dg_kids");




