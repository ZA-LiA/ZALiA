/// ArenaGateA_init2()


facing_dir = 1;


GROUND_Y  = (((spawn_yt>>8)+1)<<8) - ($3<<3);
GROUND_Y  = get_ground_y(x,GROUND_Y, -1,GROUND_Y);

spawn_yt   = find_row_solid(TID_SOLID1, xl>>3,(GROUND_Y>>3)-1, -1, 0, spawn_yt>>3);
spawn_yt   = (spawn_yt<<3) + 8;


DOOR_ROWS = (GROUND_Y - spawn_yt)>>3; // num of tiles to change solid value

DOOR_Y    = spawn_yt;

hh        = GROUND_Y - spawn_yt; // For death explosion positioning
set_xy(id, x, spawn_yt+8); // For death explosion positioning

//sdm("DOOR_ROWS $"+hex_str(DOOR_ROWS)+", spawn_yt $"+hex_str(spawn_yt)+", GROUND_Y $"+hex_str(GROUND_Y)+", hh $"+hex_str(hh));




