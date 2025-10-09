/// Gellzem_init2()

// GlzmA


var _i;


Geldarm_init2();

// 1: use timer, 2: PC not attacking
revive_type = 1;
eye_hit     = false; // true if any eye hit on current frame


SND_HIT_EYE  = get_audio_theme_track(dk_StrikeEnemy);
// TODO: Find proper sound for hitting body
SND_HIT_BDY  = get_audio_theme_track(dk_HitShield);
// SND_HIT_BDY  = g.SND_BLOK_BRK1;
// SND_HIT_BDY  = g.SND_BRDG_CRBL;
// SND_HIT_BDY  = g.SND_WLK_WTR1A;
// SND_HIT_BDY  = g.SND_WLK_WTR1B;
// SND_HIT_BDY  = g.SND_BOOMERANG;
// SND_HIT_BDY  = g.SND_ELEV_MVE1;


SEGMENT_SPR  = spr_Geldarm2_WRB;
   HEAD_SPR  = spr_Geldarm1_WRB;


EYE_OPEN_SPR = spr_Eye_2a;
EYE_CLSD_SPR = spr_Eye_2b;
EYE_W        = sprite_get_width(  EYE_OPEN_SPR);
EYE_H        = sprite_get_height( EYE_OPEN_SPR);
EYE_SPR_XOFF = sprite_get_xoffset(EYE_OPEN_SPR);
EYE_SPR_YOFF = sprite_get_yoffset(EYE_OPEN_SPR);


EYE_CNT = 3 + (ver==2); // 3,4. (4 was pretty difficult)
//EYE_CNT = 2 + (rand()&$1); // 2 or 3

EYES_PAD    = 0;
EYE_SPACING = EYE_H + EYES_PAD;

EYE_BASE_Y  = GROUND_Y - ($3<<3);
EYE_BASE_Y -= (EYE_SPACING * (EYE_CNT-1));


REVIVE_DELAY_0 = $FF;
REVIVE_DELAY_1 = $30;



EYE_SPACING = EYE_H + EYES_PAD;

EYE_BASE_Y  = GROUND_Y - ($3<<3);
EYE_BASE_Y -= (EYE_CNT-1) * EYE_SPACING;


DUR_EYE_REMOVE_SPACING = 8;
DELAY_EXPL = EYE_CNT * DUR_EYE_REMOVE_SPACING;




    dl_tmr_revive = ds_list_create();
    dl_eye_spr    = ds_list_create();
    dl_pal_idx    = ds_list_create();
    dl_xx         = ds_list_create();
    dl_yy         = ds_list_create();
    dl_xscale     = ds_list_create();
    dl_hb_x       = ds_list_create();
    dl_hb_y       = ds_list_create();
for(_i=EYE_CNT-1; _i>=0; _i--){
    dl_tmr_revive[|_i]  = 0;
    dl_eye_spr[|_i]     = EYE_OPEN_SPR;
    dl_pal_idx[|_i]     = palidx_def;
    dl_xx[|_i]          = 0;
    dl_yy[|_i]          = 0;
    dl_xscale[|_i]      = sign_(~_i & 1) * xScale;
    dl_hb_x[|_i]        = 0;
    dl_hb_y[|_i]        = 0;
}



canDraw_eye_hb  = true;
EYE_HB_COLOR    = c_red;
EYE_HB_W    = 4;
EYE_HB_H    = 4;
EYE_HB_XOFF = 1; // off from the center
EYE_HB_YOFF = (EYE_H-EYE_HB_H) >>1;
eye_hb_xoff = EYE_HB_XOFF;
eye_hb_yoff = EYE_HB_YOFF;



canDrawScrunchHB = false;

BodyHB_IDX = BODY_HB_IDX_DYNAMIC;
BodyHB_idx = BodyHB_IDX;

BODY_XOFF   = 1;
BODY_YOFF   = 4;
BODY_W      = ww - (BODY_XOFF<<1);
BODY_H      = (GROUND_Y-MIN_Y) - (BODY_YOFF<<1);

BodyHB_xoff    = BODY_XOFF;
BodyHB_yoff    = BODY_YOFF;
BodyHB_w       = BODY_W
BodyHB_h       = BODY_H

BodyHB_xl       = x-(BodyHB_w>>1);
BodyHB_yt       = MIN_Y+BODY_YOFF;




