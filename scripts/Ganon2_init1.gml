/// Ganon2_init1()


var _i;
var _layer_name;


Ganon_init_1();

Face_SPRITE = spr_Ganon_Form2_Face1a;
SPRITE1 = g.Ganon2_SPRITE1;
GO_sprite_init(SPRITE1);
GO_init_palidx(PALIDX2);

solid_type = TID_SOLID1;


GROUND_Y = get_ground_y(g.rm_w_, (g.rm_row0<<3)+$80,1, (g.rm_row0+$1B)<<3);
set_xy(id, g.rm_w+8+ww_, GROUND_Y-hh_);


MusicBattle_THEME = STR_Ganon+"2";
//MusicBattle_THEME = STR_Ganon+"1";
MusicBattle_BODY  = get_audio_theme_track(MusicBattle_THEME);
MusicBattle_INTRO = 0; // Sounds more urgent w/out the intro
//MusicBattle_INTRO = get_audio_theme_track_intro(MusicBattle_BODY);


                            _i=1;
sub_state_RM_ENTER        = _i++;
sub_state_DIALOGUE1       = _i++;
sub_state_INTRO1          = _i++;
sub_state_INTRO2          = _i++;
sub_state_INTRO3          = _i++;
sub_state_BATTLE          = _i++;
sub_state_POST_BATTLE1    = _i++;
sub_state_POST_BATTLE2    = _i++;
sub_state_POST_BATTLE3    = _i++;
sub_state_EXPLODE_BODY    = _i++;
sub_state_NextForm_FALL   = _i++;
sub_state_NextForm_LEAVE1 = _i++;
sub_state_NextForm_LEAVE2 = _i++;
sub_state_NextForm_LEAVE  = _i++;
sub_state_DIALOGUE2       = _i++;
sub_state_DONE            = _i++;
sub_state                 = sub_state_RM_ENTER;

                            _i=1;
BattleState_IDLE          = _i++;
BattleState_FADE_IN       = _i++;
BattleState_FADE_OUT      = _i++;
//                                          //
BattleState_Attack1_SHOOT = _i++;
//                                          //
BattleState_Attack2_SHOOT = _i++;
//                                          //
BattleState_DECIDE_ATTACK = _i++;
BattleState               = BattleState_IDLE;
//                                          //


projectile_OBJ = SpikeBall1;
projectile_VER = 2;
projectile     = projectile_OBJ;
projectile_ver = projectile_VER;



VSPD_GRAV = 2;
vspd_grav = VSPD_GRAV;


DURATION1   = $28;
DURATION2   = $28;
DURATION3   = DURATION2+$40;
DURATION4   = $40;
DURATION5   = $FF;
DURATION6   = $80;
DURATION7   = $10;
DURATION8   = $18;
DURATION9   = $80; // delay rm-enter screenshake
Fade_TIMING = $04;


HP = $09;
hp = HP;



dg_Form3_SPRITES= ds_grid_create(0,4);
ds_grid_resize(dg_Form3_SPRITES, ds_grid_width(dg_Form3_SPRITES)+1, ds_grid_height(dg_Form3_SPRITES));
dg_Form3_SPRITES[#ds_grid_width(dg_Form3_SPRITES)-1,0] = spr_Slime_Body1_Large1a; // reg
dg_Form3_SPRITES[#ds_grid_width(dg_Form3_SPRITES)-1,1] = spr_Slime_Body1_Large1b; // squished
dg_Form3_SPRITES[#ds_grid_width(dg_Form3_SPRITES)-1,2] = spr_Slime_Body1_Large1a_Shine1a;
ds_grid_resize(dg_Form3_SPRITES, ds_grid_width(dg_Form3_SPRITES)+1, ds_grid_height(dg_Form3_SPRITES));
dg_Form3_SPRITES[#ds_grid_width(dg_Form3_SPRITES)-1,0] = spr_Slime_Body1_Large2a; // reg
dg_Form3_SPRITES[#ds_grid_width(dg_Form3_SPRITES)-1,1] = spr_Slime_Body1_Large2b; // squished
dg_Form3_SPRITES[#ds_grid_width(dg_Form3_SPRITES)-1,2] = spr_Slime_Body1_Large2a_Shine1a;
Form3_sprite_idx    = 0;
Form3_sprite        = dg_Form3_SPRITES[#Form3_sprite_idx,0];
Slime_W_            = sprite_get_width( Form3_sprite)>>1;
Slime_H_            = sprite_get_height(Form3_sprite)>>1;
Form3_Skull_PI      = global.PI_MOB_PUR;
Form3_DURATION1     = $40;
Form3_DURATION2     = $20;
Form3_can_draw      = false;



dg_Positions = ds_grid_create($4,$05);
              _i=0;
dg_Positions[#_i,$00]= $0;                    // x offset current
dg_Positions[#_i,$01]= -(($05<<3)+$4);        // y offset current
dg_Positions[#_i,$02]= 1;     // state. 
dg_Positions[#_i,$03]= 0;     // timer
              _i++;               //
dg_Positions[#_i,$00]= -(sprite_get_width( SPRITE1)>>1) + $4;              // x offset attack
dg_Positions[#_i,$01]= -(sprite_get_height(SPRITE1)>>1) + (($03<<3)+$8);   // y offset attack
//dg_Positions[#_i,$01]= -(sprite_get_height(SPRITE1)>>1) + (($03<<3)+$4);   // y offset attack
dg_Positions[#_i,$02]= 1;     // state. 
dg_Positions[#_i,$03]= 0;     // timer
dg_Positions[#_i,$04]= SpikeBall1;
              _i++;              //
dg_Positions[#_i,$00]= dg_Positions[#$1,$00];                 // x offset attack
dg_Positions[#_i,$01]= dg_Positions[#_i-1,$01] + ($09<<3);    // y offset attack
dg_Positions[#_i,$02]= 1;     // state. 
dg_Positions[#_i,$03]= 0;     // timer
dg_Positions[#_i,$04]= Flame2;
              _i++;              //
dg_Positions[#_i,$00]= dg_Positions[#$1,$00];             // x offset attack
dg_Positions[#_i,$01]= dg_Positions[#_i-1,$01] + ($06<<3);// y offset attack
dg_Positions[#_i,$02]= 1;     // state. 
dg_Positions[#_i,$03]= 0;     // timer
dg_Positions[#_i,$04]= Rock1;


Crystal_state        = 1; // 0: dead, 1: normal
Crystal_sprite_state = 3; // 0: can't draw, 1: empty spr, 2: full, 3: full & flashing spr
Crystal_fade_state   = 0; // 0: Opaque, 1: Fade In, 2: Fade Out, 
Crystal_position     = 0; // 0: home, 1: attack1, 2: attack2, 3: attack3
Crystal_xoff         = dg_Positions[#Crystal_position,$00];
Crystal_yoff         = dg_Positions[#Crystal_position,$01];
Crystal_x            = x + Crystal_xoff;
Crystal_y            = y + Crystal_yoff;
Crystal_vspd         = 0;
Crystal_TERM_VEL     = $5<<4;
Crystal_Y1           = GROUND_Y-Slime_H_;
Crystal_TIMING1      = $4;
Crystal_detatched    = false;



timer1 = (DURATION1<<irandom(1)) + (irandom(DURATION1)*sign_(irandom(1)));





EXPLOSION_DUR1  = $90;
EXPLOSION_DUR2  = EXPLOSION_DUR1+$10;
EXPLOSION_DUR3  = $50;
EXPLOSION_DUR4  = EXPLOSION_DUR3+$30;

EXPLOSION_CUE1  = $40;
EXPLOSION_CUE2  = EXPLOSION_DUR1-$18; // $78
EXPLOSION_CUE3  = EXPLOSION_DUR1-$30; // $60
EXPLOSION_CUE4  = EXPLOSION_CUE2-$18; // $60
EXPLOSION_CUE5  = EXPLOSION_CUE4-$30; // $30
EXPLOSION_CUE6  = $30;
EXPLOSION_CUE7  = EXPLOSION_CUE6+$18; // $48




var _depth_wall  = DEPTH_BG2; // solid wall bgr
var _depth_break = DEPTH_BG3; // break blocks
for(_i=ds_list_size(g.dl_TILE_DEPTH_NAMES)-1; _i>=0; _i--)
{
    _layer_name = g.dm_tile_file[?g.dl_TILE_DEPTH_NAMES[|_i]+STR_Depth+STR_Layer+STR_Name];
    if(!is_undefined(_layer_name))
    {
             if (string_pos("FGWALL",_layer_name)) _depth_wall  = val(g.dm_tile_file[?_layer_name+STR_Depth], _depth_wall);
        else if (string_pos("BREAK", _layer_name)) _depth_break = val(g.dm_tile_file[?_layer_name+STR_Depth], _depth_break);
    }
}
DEPTH_WALL  = _depth_wall;  // solid wall bgr
DEPTH_BREAK = _depth_break; // break blocks




StartBattle_X = (g.rm_w-($A<<3)) + ww_;

PC_LOCK = PC_LOCK_ALL & ~PC_LOCK_VSPD;
//PC_LOCK = 0;



f.dm_quests[?"_Has_Reached"+STR_Ganon+"2"] = true;




