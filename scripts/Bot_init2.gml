/// Bot_init2()

// eID = $04, $05

init_vars_Bot();


// Original
SPR_NORM    = spr_Bot_Norm;
SPR_SQSH    = spr_Bot_Squish;
SPR_BALL    = spr_Bot_Ball;

SPR_EYE1    = spr_Bot_Eyes_1a;
SPR_EYE2    = spr_Bot_Eyes_1b;

spr_eyes    = 0;
eyes_yoff   = 0;


mouth_state = 0; // 0: no mouth, 1: norm mouth, 2: open mouth

mouth_yoff  = 0;
mouth_color = 0;


GROUND_Y = ((spawn_yt+hh)>>3)<<3;
GROUND_Y = get_ground_y(x,spawn_yt, 1, GROUND_Y, TID_SOLID1|TID_ONEWY1);


switch(ver)
{   // ----------------------------------------------------
    case 1:{ // Bot
    GO_init_palidx(global.PI_MOB_BLU);
    abilities |= ABL_WALK;
    abilities |= ABL_JUMP;
    break;}
    
    // ----------------------------------------------------
    case 2:{ // Bit
    GO_init_palidx(global.PI_MOB_RED);
    abilities |= ABL_WALK;
    abilities |= ABL_RUN_;
    break;}
    
    // ----------------------------------------------------
    case 3:{
    // ver 3 behavior is to only jump when PC is close enough.
    /*
    GO_pal_idx_init(PI_MOB_PUR); // Purple
    abilities |= ABL_JUMP;
    Cover_state = 1;
    Cover_SPR   = 0;
    Cover_PI    = PI_BGR_1;
    //Cover_PI    = PI_BGR_3;
    Cover_H     = hh;
    Cover_X     = (x>>3)<<3;
    Cover_YB    = GROUND_Y;
    Cover_xoff  = 1;
    Cover_yoff  = 1;
    Cover_DUR1  = $40;
    Cover_DUR2  = $100-Cover_DUR1;
    Cover_tmr   = 0; // For shaking
    
                                Cover_NUM  = 1;
    if(!is_undefined(dk_spawn)) Cover_NUM  = val(g.dm_spawn[?dk_spawn+STR_Data+"02"], Cover_NUM);
                                Hide_DEPTH = DEPTH_BG4+1;
    if(!is_undefined(dk_spawn)) Hide_DEPTH = val(g.dm_spawn[?dk_spawn+STR_Data+"01"], Hide_DEPTH);
    depth = Hide_DEPTH;
    */
    break;}
    
    // ----------------------------------------------------
    case 4:{  // v4: Nyb (same as Bit but all hspd is fast hspd)
    GO_init_palidx(global.PI_MOB_PUR);
    abilities |= ABL_WALK;
    abilities |= ABL_RUN_;
    /*
    GO_pal_idx_init(PI_MOB_BLU);
    abilities |= ABL_WALK;
    abilities |= ABL_RUN_;
    abilities |= ABL_JUMP;
    initVel    = INIT_VEL_HGH; // $9E. higher jump
    vspd_grav  = VSPD_INC_HGH;
    */
    break;}
}



if (object_index==Bot_A 
&&  ver==2 ) // red Bot(Bit) Bot_A v2. OG eID: $05
{
    // What number inst of spawned ver2 is this
    ver2_inst = 0;
    var _dl_uIdx=ds_list_create();
    with(Bot_A)
    {
        if (ver==2 
        &&  state )
        {     ds_list_add(       _dl_uIdx, update_idx);  }
    }
    
              ds_list_sort(      _dl_uIdx, true);
    ver2_inst=ds_list_find_index(_dl_uIdx, update_idx);
              ds_list_destroy(   _dl_uIdx); _dl_uIdx=undefined;
}
// ------------------------------------------------------------------------------------









switch(ver)
{
    // ---------------------------------------------------------
    case 1:{
    switch(g.area_name){
    case Area_WestA:{ATTACK_LEVEL=$01; attack_level=ATTACK_LEVEL; break;}
    case Area_PalcG:{ATTACK_LEVEL=$04; attack_level=ATTACK_LEVEL; break;}
    case Area_TownA:{ATTACK_LEVEL=$01; attack_level=ATTACK_LEVEL; break;}
    }
    
    switch(g.area_name){
    case Area_WestA:{HP_IDX=$03; hp=g.dl_HP[|HP_IDX]; break;}
    case Area_PalcG:{HP_IDX=$11; hp=g.dl_HP[|HP_IDX]; break;}
    case Area_TownA:{HP_IDX=$03; hp=g.dl_HP[|HP_IDX]; break;}
    }
    
    switch(g.area_name){
    case Area_PalcG:{XP_IDX=$0A; xp=g.dl_XP[|XP_IDX]; break;}
    }
    
    switch(g.area_name){
    case Area_TownA:{DROP_BITS=$00; drop_bits=DROP_BITS; break;}
    }
    break;}
    
    
    // ---------------------------------------------------------
    case 2:{
    switch(g.area_name){
    case Area_EastA:{HP_IDX=$04; hp=g.dl_HP[|HP_IDX]; break;}
    }
    break;}
}




