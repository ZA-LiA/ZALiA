/// BurnableMgr_Create()


init_vars_go_1a(); // ver, state, xl,xc,xr, yt,yc,yb, ww,hh, 


g.burnable_mgr = id;


dg_RmTile_Burnable     = ds_grid_create(0,0); // 8x8 room grid. Values represent burnables
dg_RmTile_Burnable_def = ds_grid_create(0,0); // 8x8 room grid. Values represent burnables
dg_Burnable            = ds_grid_create(0,9); // 


Burnable_DUR1   = $B0;
//Burnable_DUR1   = $C0;
Burnable_DUR2   = $10;
Burnable_DUR3   = min($20+Burnable_DUR2, Burnable_DUR1-Burnable_DUR2) - Burnable_DUR2;
//Burnable_DUR3   = min($30+Burnable_DUR2, Burnable_DUR1-Burnable_DUR2) - Burnable_DUR2;
//Burnable_DUR3   = min($40+Burnable_DUR2, Burnable_DUR1-Burnable_DUR2) - Burnable_DUR2;
//FireSound_CUE   = $20;
FireSound_DUR   = $14;
//FireSound_tmr = 0;

SMALL_SPR_CUE = $20;
FIRE_SPR1 = spr_Flame1;
FIRE_SPR2 = spr_Flame2;
FIRE_SPR3 = spr_Flame_Small_1a;
FIRE_PI   = global.PI_MOB_ORG;
FIRE_YOFF = -((sprite_get_height(FIRE_SPR1)-8)>>1);
FIRE_YOFF--;


can_draw = false;
scene_has_burnable = false;

Burnable_PI = global.PI_BGR4;
Burnable_pi = Burnable_PI;

Burnable_COLOR_W = $3CBCF0; // NES plain yellow
Burnable_COLOR_R = $1F281F; // Extra dark green
Burnable_COLOR_B = $336667; // Light dull yellow-green
Burnable_COLOR_G = p.C_BLK1;
Burnable_COLOR_Y = Burnable_COLOR_W;
Burnable_COLOR_M = Burnable_COLOR_R;
Burnable_COLOR_K = Burnable_COLOR_B;
Burnable_COLOR_C = Burnable_COLOR_G;
Burnable_PAL = build_pal(Burnable_COLOR_W,Burnable_COLOR_R,Burnable_COLOR_B,Burnable_COLOR_G, Burnable_COLOR_Y,Burnable_COLOR_M,Burnable_COLOR_K,Burnable_COLOR_C);


depth = DEPTH_NPC;




