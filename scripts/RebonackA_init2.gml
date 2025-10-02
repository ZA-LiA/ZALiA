/// RebonackA_init2()


// ver 1: Normal
// ver 2: Dark Knight


var _i, _a, _idx, _val;
var _pi, _pi_permut;


Boss_init_2();


GO_init_palidx(global.PI_MOB_BLU);
if (ver==2) // dark knight
{
    GO_init_palidx(global.PI_MOB_PUR);
    
    var _PAL = build_pal(p.C_WHT1,p.C_BLK1,p.C_VLT4,p.C_BLK1,-2,-2,-2,-2);
    /*
    //var _PAL = p.CI_BLK1_ + p.CI_WHT2_ + p.CI_BLK1_ + p.CI_VLT4_;
    //var _PAL = p.CI_BLK1_ + p.CI_WHT2_ + p.CI_VLT4_ + p.CI_BLK1_;
    //var _PAL = p.CI_BLK1_ + p.CI_WHT2_ + p.CI_BLK1_ + p.CI_RED4_;
    //var _PAL = p.CI_BLK1_ + p.CI_WHT2_ + p.CI_RED4_ + p.CI_BLK1_;
    //var _PAL = p.CI_BLK1_ + p.CI_WHT1_ + p.CI_BLK1_ + p.CI_PUR4_;
    var _PAL = p.CI_BLK1_ + p.CI_WHT1_ + p.CI_BLK1_ + p.CI_VLT4_;
    //var _PAL = p.CI_BLK1_ + p.CI_WHT1_ + p.CI_BLK1_ + p.CI_GRY4_;
    */
    
    change_pal(strReplaceAt(p.pal_rm_new, get_pal_pos(palidx_def), string_length(_PAL), _PAL));
}


// phase(0081(X)). 1: on horse(00A1(X)=$20). 2: horse moving off screen. 
// 3: waiting for RebonackB defeat, 4: Building bridge, 
phase = 1;
reboB = 0; // RebonackB(IronKnuckle) instance

Turn_DURATION = $20;
Turn_timer    = 0;

Explode_DURATION = $20;
Explode_counter  = 0;



if (f.quest_num>1) HP_IDX += $4;
                   HP_IDX  = clamp(HP_IDX, 0,ds_list_size(g.dl_HP)-1);
hp     =  g.dl_HP[|HP_IDX];
HP_CUE =  g.dl_HP[|HP_IDX]>>1;



if (f.quest_num>1 
&&  ver==1 )
{
    XP_IDX += $02;
    xp = g.dl_XP[|XP_IDX];
}




hspd_SWAY = $04;
hspd_MAX  = $30 + ((ver==2)<<3); // $30,38




Front_SPRITE = spr_Rebonack_1a; // vehicle front graphic 
Front_xoff   = 0; // Horse head & body front (spr_Rebonack_1a)

Back_SPRITE1 = spr_Rebonack_2a; // vehicle rear  graphic (with rider)
Back_SPRITE2 = spr_Rebonack_2b; // vehicle rear  graphic (NO   rider)
Back_sprite  = Back_SPRITE1;
Back_xoff    = 0; // body back & Rider
XOFF_DATA    = "00FEFCFAF8FAFCFE" + "0002040608060402"; // B398-B3A7
// "00"+"FE"+"FC"+"FA" + "F8" + "FA"+"FC"+"FE" 
// "00"+"02"+"04"+"06" + "08" + "06"+"04"+"02"; // B398-B3A7

Rider_SPRITE = spr_Rebonack_Rider;
Rider_sprite = 0;
Rider_yoff   = 0;



// AF9F
var          _DIST = ($05<<3) * sign_(arena_w==PAGE_W);
             _DIST = (arena_w>>1) + _DIST;
Boss_init_2b(_DIST); // Determine & set the side of the arena to start on.
facing_dir = -sign_(x-arena_x);


set_xy(id, x,y-2); // MOD: Rebonack seems a little low and is drawing behind fg floor.


// target_side: for ver 2
target_side = facing_dir;


/* Body HB data --------------------------------------
id   = ed3&$1F = $00;
data = string_copy(g.BODY_HB_DATA, (id<<3)+1, 8)

dg_BODY_HB[#$02:
data         xOff    width   yOff    height
020C0317  -  $02     $0C     $03     $17

sprite_index = spr_Rebonack_1a(32x32)
*/

BodyHB_color   = c_blue;
BodyHB_IDX_LFT = $D; // xoff 18, yoff 3, wdth 12, hght 23
BodyHB_IDX_RGT = $2; // xoff  2, yoff 3, wdth 12, hght 23
BodyHB_idx     = BodyHB_IDX_LFT;


ShieldHB_color = c_white;
ShieldHB_IDX   = 5; // 5: xoffR=17,xoffL=1, yoff=5, w=16, h=33
ShieldHB_idx   = ShieldHB_IDX; // 


SwordHB_W = 14 + g.HB_ADJ_W; // 
SwordHB_H =  1 + g.HB_ADJ_H; // 
SwordHB_w = SwordHB_W;
SwordHB_h = SwordHB_H;






// ======================================================
// -----------------------------------------------
// Statue head will shoot fire each time Rebonack charges
    Proj_USE    = f.quest_num>1;
if (Proj_USE)
{
    Proj_OBJ    = Flame2;
    Proj_DEPTH  = DEPTH_BG2+1;
    Proj_tokens = 1;
    
    Proj_DIST1  = arena_x - (arena_xl+$08); // dist from arena center to center of stone head
    
              Proj_YT = (g.rm_row0+$0D)<<3;
    with(ArenaGate){
        other.Proj_YT = DOOR_Y - ($04<<3);
        break;
    }
}




