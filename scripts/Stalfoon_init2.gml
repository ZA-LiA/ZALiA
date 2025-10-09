/// Stalfoon_init2()


GO_depth_init(DEPTH_FLYER);

BG_YOFF = 2;
sprBG = spr_Stalfoon_BG_1a;


projectile_OBJ = Bullet1;
projectile_VER = 2;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;


// if hspd was inc or maintained for the frame
hspd_impel = 0; 
HSPD_TO_HOME = 6; // 6
HSPD_MAX_TWRD = global.pc.HSPD_MAX - 2;
HSPD_MAX_AWAY = HSPD_MAX_TWRD - 2;
// HSPD_MAX_AWAY = global.pc.HSPD_MAX - max(1, global.pc.HSPD_MAX >>3);
// HSPD_MAX_TWRD = (global.pc.HSPD_MAX - (global.pc.HSPD_MAX >>2)) + 2;
// HSPD_MAX_AWAY = HSPD_MAX_TWRD - 1;
HSPD_PACE = 8;
DUR_PACE  = $50; // 


// 0: none, 1: Rebonack hover, 2: Ra wave
hover_type = 1;

// vspdDir = 1;
vspd = 0;
VSPD_MAX = $14; // verical center of wave
vspd_add_dir = 1; // 1 or -1
if (hover_type == 2) set_xlyt(id, xl, yt - 8);

// Dist from PC that enemy will return to
DIST_ATK = $60;

// The hspd dir last when hspd was adjusted to move toward/away
// hspdDir_react = facingDir;

is_aggro = 0;
// 0: moving, 1: still, waiting to turn around
// idle_bvr = 0;

SPAWN_HP = hp;




