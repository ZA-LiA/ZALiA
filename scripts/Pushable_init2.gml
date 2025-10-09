/// Pushable_init2()

// object_index: PushA


var _i, _a, _val;


switch(ver){
default:{GO_sprite_init(g.Pushable_SPR1); break;}// graphic height 45 (spr_Statue_4b)
case  1:{GO_sprite_init(g.Pushable_SPR1); break;}// graphic height 45 (spr_Statue_4b)
case  2:{GO_sprite_init(g.Pushable_SPR1); break;}// graphic height 45 (spr_Statue_4b)
case  3:{GO_sprite_init(g.Pushable_SPR2); break;}// graphic height 48 (spr_Statue_4d)
}//switch(ver)





var _pi = global.PI_BGR4;
if(!is_undefined(              dk_spawn))
{       _val = val(g.dm_spawn[?dk_spawn+STR_pal_idx],-1);
    if (_val) _pi = _val;
}
GO_init_palidx(_pi);


spawn_xl = (spawn_xl>>3)<<3;
set_xlyt(id, spawn_xl,spawn_yt);
if(!is_undefined(dk_spawn))
{   // Remember last xy
    var _XL = f.dm_quests[?dk_spawn+"_XL"];
    var _YT = f.dm_quests[?dk_spawn+"_YT"];
    if(!is_undefined(_XL) 
    && !is_undefined(_YT) )
    {
        // This also makes sure the data is aligned with grid.
        _XL = (_XL>>3)<<3;
        //_YT = (_YT>>3)<<3;
        f.dm_quests[?dk_spawn+"_XL"] = _XL;
        f.dm_quests[?dk_spawn+"_YT"] = _YT;
        set_xlyt(id,_XL,_YT);
    }
}

if(!is_undefined(dk_spawn))
{
    f.dm_quests[?dk_spawn+STR_Rm] = g.rm_name;
    f.dm_quests[?dk_spawn+"_XL"]  = xl;
    f.dm_quests[?dk_spawn+"_YT"]  = yt;
}


Y_DESPAWN = cam_yb_max()+($3<<3);


switch(ver)
{
    // --------------------------------------------------
    case 1:{
    
    break;}//case 1
    
    
    // --------------------------------------------------
    case 2:{
    if (yt>=Y_DESPAWN)
    {
        instance_destroy();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    break;}//case 2
    
    
    // --------------------------------------------------
    case 3:{
    /*
    // ver 3 can move to diff rooms for puzzle reasons
    if(!is_undefined(    dk_spawn) 
    &&  val(f.dm_quests[?dk_spawn+STR_Rm])!=g.rm_name )
    {   // has moved to diff room
        instance_destroy();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    */
    break;}//case 3
}//switch(ver)









switch(hh>>3){
case $04:{CS_OFF_IDX=$08; break;}
case $05:{CS_OFF_IDX=$18; break;}
case $06:{CS_OFF_IDX=$17; break;}
}
cs_off_idx=CS_OFF_IDX;



facing_dir = 1;


BodyHB_w    =  ww;
BodyHB_h    =  hh;
BodyHB_xoff = -sprite_index_xoff;
BodyHB_yoff = -sprite_index_yoff;
if (isVal(sprite_index, spr_Statue_4a,spr_Statue_4b,spr_Statue_5a,spr_Statue_5b,spr_Statue_7a,spr_Statue_8a))
{   // because graphic is shorter than image
    if (sprite_index==spr_Statue_5a)
    {    BodyHB_yoff += 1;}
    else BodyHB_yoff += 3;
}
// 3: 8a,7a,5b,4b,4a,
// 1: 5a, 


solid_type  = TID_SOLID1;
add_to_solid_inst_list(id);

vspd_grav = 4;
//vspd_grav = 2;
VSPD_MAX  = $70;
TERMINAL_VELOCITY = $70;



// ---------------------------------------------------------
// PUSH_DUR: the value push_ctr must reach to move obj
PUSH_DUR     = $16;
// num of frames PC has pushed against
push_counter = 0;

// 0: NOT moving, 1: right, 2: left, 4: down, 8: up
moving_dir = 0;
// max dist each move
MOVE_DIST1 = $10;

//HSPD1 = $0C;
HSPD1 = $08;
//HSPD1 = $04;

// x coord when last idle
home_xl = xl;




