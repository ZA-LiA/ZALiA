/// ShadowBoss_init2()

// ShLiA


var _val;


Boss_init_2();

GO_depth_init(g.pc.depth+1);
//GO_init_palidx(global.PI_MOB_PUR);
GO_init_palidx(global.PI_MOB_RED);

GROUND_Y = g.rm_h - ($03<<3);
GROUND_Y = get_ground_y(arena_x,GROUND_Y, 1, spawn_y + hh);


behavior  = 0; // 0081
behavior_at_udp = behavior;
sub_state = 0; // 0063
attack_phase = 0; // 0401


walk_frame = 0; // 0064
down_held = 0; // 0018
is_blocking_attack = false;

// Make sure hp not using potentially randomized hp in g.dl_HP
HP_IDX = $06; // g.dl_HP_DEFAULT[|$06] = $08
hp = g.dl_HP_DEFAULT[|HP_IDX];
//hp=3; // testing

to_pc_dir_x = -1; // 0060
to_pc_dir_y = -1;
facing_dir  = to_pc_dir_x;

//image_xscale    = -1; // 00A0
xScale       = to_pc_dir_x; // 00A0
x_scale_prev = xScale;
x_prev       = x;
y_prev       = y;


hspd_dir_next = to_pc_dir_x; // 0061

// ogr: Off Ground Reason
ogr               = 0; // 0062
GRAV_ADD          = $3C;
TERMINAL_VELOCITY = 4;
uses_vspd_sub     = false;


timer1 = 0;
timer2 = 0;
timer3 = 0;



if (f.quest_num==1) _val = dk_ShadowBoss+"01";
else                _val = dk_ShadowBoss+"02";
Boss_set_MusicBattle_props(_val);

//sdm("ShadowBoss_init2(): "+"MusicBattle_THEME: "+MusicBattle_THEME+", MusicBattle_BODY: "+audio_get_name(MusicBattle_BODY)+", MusicBattle_INTRO: "+audio_get_name(MusicBattle_INTRO)); sdm("");
//Fanfare_MUSIC = get_audio_theme_track(dk_GameClear);
//fanfare_failsafe_timer = round(audio_sound_length(Fanfare_MUSIC)*ROOM_SPEED_BASE);




BodyHB_color = c_yellow;



ShieldHB_IDX_LOW = $9; // low
ShieldHB_IDX_HGH = ShieldHB_IDX_LOW+1;
ShieldHB_IDX     = ShieldHB_IDX_HGH;
ShieldHB_idx     = ShieldHB_IDX; // 0444,X
GOB_update_shield_offsets();
update_shield_hb();



SwordHB_collidable = false;
SwordHB_W          = 14+g.HB_ADJ_W;
SwordHB_H          =  2+g.HB_ADJ_H;
SwordHB_w          = SwordHB_W;
SwordHB_h          = SwordHB_H;
SwordHB_x_base     =  0;
SwordHB_y_base     =  0;
SwordHB_x          =  0;
SwordHB_y          =  0;




