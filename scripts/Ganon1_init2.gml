/// Ganon1_init2()


var _i, _a, _datakey;

Boss_init_2();

add_to_solid_inst_list(id);
//solid_type = TID_SOLID1|TID_ONEWY1;
//solid_type = TID_ONEWY1;
//solid_type = TID_SOLID1;

GO_sprite_init(g.Ganon1_SPRITE1);
GO_init_palidx(PALIDX1);
set_xy(id, x, g.rm_h-hh_);

facing_dir = 1;
xScale     = facing_dir;

GROUND_Y = get_ground_y(x,yt,1, (g.rm_row0+$1A)<<3);
Ground_y = GROUND_Y;


Bottle_x       = x;
Bottle_y       = yt-$0C;
Bottle_yt      = Bottle_y-$08;
Bottle_yb      = Bottle_y+$08;
Bottle_y_MIN   = Bottle_y-$14;

Blood_can_draw = false;
Blood_COLOR    = p.C_ORG4;
Blood_x        = x;
Blood_yt       = 0;
Blood_yb       = 0;
Blood_yb_MAX   = yt+$04;
Blood_h        = 2;



Door_xl          = arena_xl-$10;
Door_yt          =(GROUND_Y>>3)-$06;
Door_yt          = find_row_solid(TID_SOLID1, (Door_xl>>3)+1, (GROUND_Y>>3)-1, -1, $FF,Door_yt);
Door_yt          =(Door_yt+1)<<3;
DoorBlocks_COUNT =(GROUND_Y-Door_yt)>>4; // 
DoorBlocks_count = 0; // number placed so far



pc_offset1 = global.pc.csLft1_xoff-global.pc.ww_;
pc_offset2 = global.pc.csRgt1_xoff-global.pc.ww_;
pc_x_min   = (arena_xl-2)+abs(pc_offset1);
pc_x_max   = (arena_xr+2)-abs(pc_offset2)-1;
//pc_x_min   = (arena_xl-2)+abs(global.pc.x-global.pc.csLft1X);
//pc_x_max   = (arena_xr+2)-abs(global.pc.x-global.pc.csRgt1X)-1;


if(!is_undefined(dk_spawn))
{
    //sdm("val(f.dm_quests[?get_defeated_dk_1a()+dk_spawn]):  "+hex_str(val(f.dm_quests[?get_defeated_dk_1a()+dk_spawn])));
    if (val(f.dm_quests[?get_defeated_dk()+dk_spawn]))
    {
        set_xy(id, x,g.rm_h+hh);
        
        timer = $18;
        sub_state = sub_state_REMOVE_FLOOR1;
    }
    else if (val(f.dm_quests[?dk_spawn+Fought_DATAKEY])) // not defeated but has been fought
    {
        Bottle_can_draw      = false;
        Crystal_sprite_state = 2; // 2: full
        set_xy(id, x,Ground_y-hh_);
        
        timer = 0;
        sub_state = sub_state_PC_POSITION2;
    }
}




