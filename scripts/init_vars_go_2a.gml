/// init_vars_go_2a()
// Some vars used by a combo or all pc, Entity, Proj


var _i;

stun_timer = 0; // 040E[eIndex]
STUN_DURATION1 = $30;

explosion_DURATION1     = $25;
explosion_can_draw_self = false;
explosion_count         = 0;
explosion_y             = 0;
explosion_yscale        = 1;
explosion_sprite        = 0;


spawn_xl = 0;
spawn_yt = 0;

// ocs: Off Camera State
// Includes certain bits if parts of the entity are off camera.
// $01: ogX + $18
// $02: ogX + $10
// $04: ogX + $08
// $08: ogX + $00
// $F0: ogY + $10 if < 0 or > $FF
ocs = 0; // 00C8, 00C9, 00CA
// ocs debug vars
for(_i=4; _i>=0; _i--) ocs_draw_x[_i]=0;
for(_i=2; _i>=0; _i--) ocs_draw_y[_i]=0;



view_xl_dist_og = 0; // cam_xl: xl - viewXL().  00CC, 00CD, 00CE
view_xl_dist    = 0; // cam_x:  x  - viewXL()
view_yt_dist_og = 0; // cam_yt: yt - viewYT()
view_yt_dist    = 0; // cam_y:  y  - viewYT()

facing_dir = 1; // 1: right, -1: left. 0060[eIndex]. 005F-0065, 0066-006F
behavior   = 0; // mostly 0080, 0081[eIndex]
counter    = 0; // mostly: 00AF[eIndex], 044C[pIndex]

dialogue_datakey = "";
dialogue_ver = "A";


pc_sword_collided_solid_body = false;




