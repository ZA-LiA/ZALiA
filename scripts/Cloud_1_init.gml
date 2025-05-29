/// Cloud_1_init()


var _i,_j,_idx, _a, _val, _count,_num,_num_;
var _x,_y, _w,_h, _dist;
var _str, _datakey1,_datakey2;
var _tsrc;
var _spr;



GO_depth_init(g.DEPTH_CLOUD);


GO_init_palidx(global.PI_CLOUD_1); // PI_CLOUD_1==PI_BGR_4(@040921).


var                      _SCENE_BGR_COLOR = p.C_BLK1;
if (g.room_type=="A")    _SCENE_BGR_COLOR = val(g.dm_rm[?g.rm_name+dk_BackgroundColor], _SCENE_BGR_COLOR); // ** `global.BackgroundColor_scene` has not been set yet because `p_Room_Start()` has not happened yet.
//if (g.room_type=="A")    _SCENE_BGR_COLOR = global.BackgroundColor_scene; // ** Currently `global.BackgroundColor_scene` is its final value from the previous scene because `p_Room_Start()` has not happened yet.
if (get_color_brightness(_SCENE_BGR_COLOR)<$40) palidx_permut = 5; // 5: SMH/BRW


if(!is_undefined(dk_spawn))
{
    if(!is_undefined(   g.dm_rm[?dk_spawn+STR_Data+"01"]))
    {   palidx_permut = g.dm_rm[?dk_spawn+STR_Data+"01"];  }
}


if (palidx_permut)
{
    var _pi = palidx_def;
    switch(palidx_permut){
    case 1:{_pi=add_pi_permut(_pi, "WBRGYKMC", "cloud permut "+"WBRGYKMC"); break;}
    case 2:{_pi=add_pi_permut(_pi, "RWBGMYKC", "cloud permut "+"RWBGMYKC"); break;}
    case 3:{_pi=add_pi_permut(_pi, "RBWGMKYC", "cloud permut "+"RBWGMKYC"); break;}
    case 4:{_pi=add_pi_permut(_pi, "BWRGKYMC", "cloud permut "+"BWRGKYMC"); break;}
    case 5:{_pi=add_pi_permut(_pi, "BRWGKMYC", "cloud permut "+"BRWGKMYC"); break;}
    }
    
    GO_init_palidx(_pi);
}
//sdm("Cloud_1_init(). palidx_def $"+hex_str(palidx_def)+", palidx_permut "+string(palidx_permut)+", p.PAL_PER_SCENE $"+hex_str(p.PAL_PER_SCENE)+", global.PI_CLOUD_1 $"+hex_str(global.PI_CLOUD_1));


scr_update   = Cloud_1_Step;
scr_draw     = Cloud_1_Draw;
scr_inst_end = Cloud_1_end;


_val = val(g.dm_rm[?dk_spawn+"_xy"], $0000);
xl = ((_val>>0)&$FF)<<3;
yt = ((_val>>8)&$FF)<<3;

DRAW_XOFF += xl;
DRAW_YOFF += yt;




DIST1 = $02<<8; // Dist to travel from start x before reseting to start x.
DIST2 = $01<<8; // For v1. Vertical dist between yt of each set
DIST3 = $03<<3; // For v2. Vertical dist between each set


can_move = !!g.mod_CLOUD_MOVEMENT;


hspd = -1; // 


// num of same cloud gets drawn, each 2 pages apart
COPY_COUNT  = g.rm_pages_x + (g.rm_pages_x&$1);


// Lower the value, the faster.
var _DELAY_MOVE_1 = 2; // 1
var _DELAY_MOVE_2 = 3; // 2
var _DELAY_MOVE_3 = 4; // 4, 3
var _DELAY_MOVE_4 = 5;
var _DELAY_MOVE_5 = 6;
//if(1){_DELAY_MOVE_2=_DELAY_MOVE_1; _DELAY_MOVE_3=_DELAY_MOVE_1;}


// ----------------------------------------------------------
SPR_1A = spr_cloud_1a; // short
SPR_2A = spr_cloud_2a; // long


CLOUD_COUNT = 6;
dg_cloud = ds_grid_create(CLOUD_COUNT,9);
//                                                              // 
          _a=0;
dg_cloud[#_a,0]  = $00<<3;               // x (left edge of image)
dg_cloud[#_a,1]  = $00<<3;               // y (top  edge of image)
dg_cloud[#_a,2]  = _DELAY_MOVE_2;        // timer reset(speed)
dg_cloud[#_a,3]  = dg_cloud[#_a,2];      // timer
dg_cloud[#_a,4]  = SPR_2A;               // sprite
dg_cloud[#_a,5]  = sprite_get_width( dg_cloud[#_a,4]); // cloud width
dg_cloud[#_a,6]  = sprite_get_height(dg_cloud[#_a,4]); // cloud height
dg_cloud[#_a,7]  = dg_cloud[#_a,0]; // start x
dg_cloud[#_a,8]  = dg_cloud[#_a,1]; // start y
//                                                              // 
/*
          _a++;
dg_cloud[#_a,0]  = $30<<3;               // x (left edge of image)
dg_cloud[#_a,1]  = $02<<3;               // y (top  edge of image)
dg_cloud[#_a,2]  = _DELAY_MOVE_2;        // timer reset(speed)
dg_cloud[#_a,3]  = dg_cloud[#_a,2];      // timer
dg_cloud[#_a,4]  = SPR_1A;               // sprite
dg_cloud[#_a,5]  = sprite_get_width( dg_cloud[#_a,4]); // cloud width
dg_cloud[#_a,6]  = sprite_get_height(dg_cloud[#_a,4]); // cloud height
dg_cloud[#_a,7]  = dg_cloud[#_a,0]; // start x
dg_cloud[#_a,8]  = dg_cloud[#_a,1]; // start y
*/
//                                                              // 
          _a++;
dg_cloud[#_a,0]  = $08<<3;               // x (left edge of image)
dg_cloud[#_a,1]  = $06<<3;               // y (top  edge of image)
dg_cloud[#_a,2]  = _DELAY_MOVE_3;        // timer reset(speed)
dg_cloud[#_a,3]  = dg_cloud[#_a,2];      // timer
dg_cloud[#_a,4]  = SPR_2A;               // sprite
dg_cloud[#_a,5]  = sprite_get_width( dg_cloud[#_a,4]); // cloud width
dg_cloud[#_a,6]  = sprite_get_height(dg_cloud[#_a,4]); // cloud height
dg_cloud[#_a,7]  = dg_cloud[#_a,0]; // start x
dg_cloud[#_a,8]  = dg_cloud[#_a,1]; // start y
//                                                              // 
          _a++;
dg_cloud[#_a,0]  = $0C<<3;               // x (left edge of image)
dg_cloud[#_a,1]  = $0A<<3;               // y (top  edge of image)
dg_cloud[#_a,2]  = _DELAY_MOVE_2;        // timer reset(speed)
dg_cloud[#_a,3]  = dg_cloud[#_a,2];      // timer
dg_cloud[#_a,4]  = SPR_1A;               // sprite
dg_cloud[#_a,5]  = sprite_get_width( dg_cloud[#_a,4]); // cloud width
dg_cloud[#_a,6]  = sprite_get_height(dg_cloud[#_a,4]); // cloud height
dg_cloud[#_a,7]  = dg_cloud[#_a,0]; // start x
dg_cloud[#_a,8]  = dg_cloud[#_a,1]; // start y
//                                                              // 
          _a++;
dg_cloud[#_a,0]  = $1C<<3;               // x (left edge of image)
dg_cloud[#_a,1]  = $08<<3;               // y (top  edge of image)
dg_cloud[#_a,2]  = _DELAY_MOVE_1;        // timer reset(speed)
dg_cloud[#_a,3]  = dg_cloud[#_a,2];      // timer
dg_cloud[#_a,4]  = SPR_2A;               // sprite
dg_cloud[#_a,5]  = sprite_get_width( dg_cloud[#_a,4]); // cloud width
dg_cloud[#_a,6]  = sprite_get_height(dg_cloud[#_a,4]); // cloud height
dg_cloud[#_a,7]  = dg_cloud[#_a,0]; // start x
dg_cloud[#_a,8]  = dg_cloud[#_a,1]; // start y
//                                                              // 
          _a++;
dg_cloud[#_a,0]  = $28<<3;               // x (left edge of image)
dg_cloud[#_a,1]  = $04<<3;               // y (top  edge of image)
dg_cloud[#_a,2]  = _DELAY_MOVE_3;        // timer reset(speed)
dg_cloud[#_a,3]  = dg_cloud[#_a,2];      // timer
dg_cloud[#_a,4]  = SPR_1A;               // sprite
dg_cloud[#_a,5]  = sprite_get_width( dg_cloud[#_a,4]); // cloud width
dg_cloud[#_a,6]  = sprite_get_height(dg_cloud[#_a,4]); // cloud height
dg_cloud[#_a,7]  = dg_cloud[#_a,0]; // start x
dg_cloud[#_a,8]  = dg_cloud[#_a,1]; // start y
//                                                              // 
          _a++;
dg_cloud[#_a,0]  = $38<<3;               // x (left edge of image)
dg_cloud[#_a,1]  = $0C<<3;               // y (top  edge of image)
dg_cloud[#_a,2]  = _DELAY_MOVE_1;        // timer reset(speed)
dg_cloud[#_a,3]  = dg_cloud[#_a,2];      // timer
dg_cloud[#_a,4]  = SPR_2A;               // sprite
dg_cloud[#_a,5]  = sprite_get_width( dg_cloud[#_a,4]); // cloud width
dg_cloud[#_a,6]  = sprite_get_height(dg_cloud[#_a,4]); // cloud height
dg_cloud[#_a,7]  = dg_cloud[#_a,0]; // start x
dg_cloud[#_a,8]  = dg_cloud[#_a,1]; // start y
//                                                              // 

// CLOUD_COUNT = ds_grid_width(dg_cloud);



CloudArea_W    = DIST1;
CloudArea_H    = 0;
CloudArea_XL   = 0;
CloudArea_XR   = CloudArea_XL + CloudArea_W;
CloudArea_YT   = g.rm_h;
CloudArea_YB   = 0;
// Y_HIGH  = 0;
// Y_LOW   = $100;
for(_i=0; _i<CLOUD_COUNT; _i++) // each cloud
{
    if (CloudArea_YT > dg_cloud[#_i,1])
    {   CloudArea_YT = dg_cloud[#_i,1];  }
    
    if (CloudArea_YB < dg_cloud[#_i,1]+dg_cloud[#_i,6])
    {   CloudArea_YB = dg_cloud[#_i,1]+dg_cloud[#_i,6];  }
}

CloudArea_H     = CloudArea_YB-CloudArea_YT;
CloudArea_YT    = ((g.rm_pages_y-1)<<8) + (CloudArea_YT&$FF);
CloudArea_YB    = CloudArea_YT + CloudArea_H;




/*
// ----------------------------------------------------------
//  USE TILES -----------------------------
COPY_COUNT  = g.rm_pages_x + (g.rm_pages_x&1);
COPY_COUNT  = (COPY_COUNT>>1) + 1;
TS1 = ts_Natural_1a_WRB;
//                      top half            btm half
var _TS_DATA_CLOUD_1 = "0708"+  "0C"   +   "09"  +"0A0B";
var _TS_DATA_CLOUD_2 = "0708"+"080C"   +   "090A"+"0A0B";


_count = max(string_length(_TS_DATA_CLOUD_1)>>1,string_length(_TS_DATA_CLOUD_2)>>1);

dg_cloud = ds_grid_create(5,7+_count);
//                                                              // 
dg_cloud[# 0,0] = $140;                 // x
dg_cloud[# 0,1] = $020;                 // y
dg_cloud[# 0,2] = _DELAY_MOVE_3;        // timer reset
dg_cloud[# 0,3] = dg_cloud[# 0,2];      // timer
dg_cloud[# 0,4] = _TS_DATA_CLOUD_1;     // ts grid xy
// dg_cloud[# 0,5] = (string_length(dg_cloud[# 0,4]) >>2) <<3; // cloud width
//                                                              // 
dg_cloud[# 1,0] = $040;                 // x
dg_cloud[# 1,1] = $030;                 // y
dg_cloud[# 1,2] = _DELAY_MOVE_3;        // timer reset
dg_cloud[# 1,3] = dg_cloud[# 1,2];      // timer
dg_cloud[# 1,4] = _TS_DATA_CLOUD_2;     // ts grid xy
// dg_cloud[# 1,5] = (string_length(dg_cloud[# 1,4]) >>2) <<3; // cloud width
//                                                              // 
dg_cloud[# 2,0] = $0E0;                 // x
dg_cloud[# 2,1] = $040;                 // y
dg_cloud[# 2,2] = _DELAY_MOVE_1;        // timer reset
dg_cloud[# 2,3] = dg_cloud[# 2,2];      // timer
dg_cloud[# 2,4] = _TS_DATA_CLOUD_2;     // ts grid xy
// dg_cloud[# 2,5] = (string_length(dg_cloud[# 2,4]) >>2) <<3; // cloud width
//                                                              // 
dg_cloud[# 3,0] = $060;                 // x
dg_cloud[# 3,1] = $050;                 // y
dg_cloud[# 3,2] = _DELAY_MOVE_2;        // timer reset
dg_cloud[# 3,3] = dg_cloud[# 3,2];      // timer
dg_cloud[# 3,4] = _TS_DATA_CLOUD_1;     // ts grid xy
// dg_cloud[# 3,5] = (string_length(dg_cloud[# 3,4]) >>2) <<3; // cloud width
//                                                              // 
dg_cloud[# 4,0] = $1C0;                 // x
dg_cloud[# 4,1] = $060;                 // y
dg_cloud[# 4,2] = _DELAY_MOVE_1;        // timer reset
dg_cloud[# 4,3] = dg_cloud[# 4,2];      // timer
dg_cloud[# 4,4] = _TS_DATA_CLOUD_2;     // ts grid xy
// dg_cloud[# 4,5] = (string_length(dg_cloud[# 4,4]) >>2) <<3; // cloud width
//                                                              // 

            CLOUD_COUNT = ds_grid_width(dg_cloud);
for (_i=0; _i<CLOUD_COUNT; _i++)
{
    _a      = 4;
    _str    = dg_cloud[#_i,_a++];
    _count  = string_length(_str)>>1;
    
    // set cloud width
    dg_cloud[#_i,_a++] = (_count>>1)<<3;
    
    // set cloud tile count
    dg_cloud[#_i,_a++] = _count;
    
    // add tsrc data
    for (_j=0; _j<_count; _j++) // each tile
    {
        dg_cloud[#_i,_a++] = str_hex(_str,_j);
        // _tsrc = str_hex(_str,_j);
    }
}
*/




