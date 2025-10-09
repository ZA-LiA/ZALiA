/// PC_init()

show_debug_message("PC_init()");


var _i,_j,_k, _a, _idx,_idx1,_idx2, _val, _count1,_count2;
var _datakey, _name, _creator, _char, _str, _pos, _len;


init_vars_draw_1a();

init_vars_phys_1a();

init_vars_coll_1a(); // body hb
init_vars_coll_1b(); // shield hb
init_vars_coll_1c(); // sword hb
init_vars_coll_2a(); // cs: Colliding Sides

init_vars_go_1a(); // ver, state, xl,xc,xr, yt,yc,yb, ww,hh, 
init_vars_go_2a(); // counter, ocs, camX, facingDir, behavior, spawn_xy, tmr_stun, uIdx, spawn_idx, pc_sword_collided_solid_body
init_vars_go_4a(); // scr_vars, scr_ini1/2, scr_step, scr_updt, scr_udp, scr_draw, scr_rmen, scr_dstr, scr_iend

GO_depth_init(DEPTH_PC_MAIN);
GO_sprite_init(PC_PLACEMENT_SPR);

// default GameObject draw YOff
DRAW_YOFF = 1; // +1 for 1 pixel in ground


// get scripts from data, run scr_vars, run scr_ini1
GameObject_create_1a();
scr_draw     = PC_draw;
scr_inst_end = PC_end;




// ---------------------------------------------------------------------------------------------
                       _a=0;
behavior_WALK1       = _a++;  //  0 spr_Link_walk3
behavior_WALK2       = _a++;  //  1 spr_Link_walk1
behavior_WALK3       = _a++;  //  2 spr_Link_walk2
behavior_IDLE        = _a++;  //  3 spr_Link_idle, spr_Link_fairy

behavior_DRAWBACK    = _a++;  //  4 spr_Link_Drawback
behavior_STAB_STAND  = _a++;  //  5 spr_Link_Stab_high
behavior_CROUCH      = _a++;  //  6 spr_Link_crouch, spr_Link_jump_up
behavior_STAB_CROUCH = _a++;  //  7 spr_Link_Stab_low

behavior_STAB_UP     = _a++;  //  8 spr_Link_up_thrust
behavior_STAB_DOWN   = _a++;  //  9 spr_Link_down_thrust
behavior_DAMAGE      = _a++;  // 10 spr_Link_damage
behavior_HOLD_ITEM4  = _a++;  // 11 spr_Link_Hold_3a. Hold triforce after ShadowLink

behavior_HOLD_ITEM1  = _a++;  // 12 cave/encounter:  spr_Link_get_item2
behavior_HOLD_ITEM2  = _a++;  // 13 town:            spr_Link_get_item2
behavior_HOLD_ITEM3  = _a++;  // 14 palace:          spr_Link_get_item
behavior_HOLD_ITEM5  = _a++;  // 15 game end:        Hold Triforce, back to screen. spr_Link_Hold_4a_WRB

behavior_POSE1       = _a++;  // 16 Pose 1. Used in game end kiss cutscene.

behavior_LAST        = _a-1;
behavior             = behavior_IDLE;   // 0080


dg_UwU_ = ds_grid_create(behavior_LAST+1,8);
dl_UwU_ = ds_list_create();
for(_i=0; _i<=behavior_LAST; _i++) ds_list_add(dl_UwU_,_i);











//skins_palettes_are_set = false; // so it only happens once

Spritesheet_W = $40;
Spritesheet_H = Spritesheet_W;

dm_skins = ds_map_create();
dm_skins[?STR_Current+STR_Idx] = 0;

dm_skins[?STR_Frame+STR_Width]  = Spritesheet_W;
dm_skins[?STR_Frame+STR_Height] = Spritesheet_H;

dm_skins[?STR_Clm+hex_str(behavior_WALK1)]       = $02;
dm_skins[?STR_Clm+hex_str(behavior_WALK2)]       = $03;
dm_skins[?STR_Clm+hex_str(behavior_WALK3)]       = $04;
dm_skins[?STR_Clm+hex_str(behavior_IDLE)]        = $00;
dm_skins[?STR_Clm+hex_str(behavior_DRAWBACK)]    = $05;
dm_skins[?STR_Clm+hex_str(behavior_STAB_STAND)]  = $06;
dm_skins[?STR_Clm+hex_str(behavior_CROUCH)]      = $01;
dm_skins[?STR_Clm+hex_str(behavior_STAB_CROUCH)] = $07;
dm_skins[?STR_Clm+hex_str(behavior_STAB_UP)]     = $09;
dm_skins[?STR_Clm+hex_str(behavior_STAB_DOWN)]   = $08;
dm_skins[?STR_Clm+hex_str(behavior_DAMAGE)]      = $0A;
dm_skins[?STR_Clm+hex_str(behavior_HOLD_ITEM4)]  = $0D;
dm_skins[?STR_Clm+hex_str(behavior_HOLD_ITEM1)]  = $0C;
dm_skins[?STR_Clm+hex_str(behavior_HOLD_ITEM2)]  = $0C;
dm_skins[?STR_Clm+hex_str(behavior_HOLD_ITEM3)]  = $0B;
dm_skins[?STR_Clm+hex_str(behavior_HOLD_ITEM5)]  = $0E;
dm_skins[?STR_Clm+hex_str(behavior_POSE1)]       = $0F;

dm_skins[?STR_Row+STR_Shield+"01"] = $00;
dm_skins[?STR_Row+STR_Shield+"02"] = $01;
dm_skins[?STR_Row+STR_Body  +"01"] = $02;
dm_skins[?STR_Row+STR_Body  +"02"] = $03; // Disguise
dm_skins[?STR_Row+STR_Sword +"01"] = $04;
dm_skins[?STR_Row+STR_Sword +"02"] = $05;


PCSkin_DEFAULT_SPRITE = spr_PCSkin_KazunobuShimizu_Link01;
PC_init_add_spritesheet(spr_PCSkin_KazunobuShimizu_Link01,               "Link",                "Kazunobu Shimizu");

// UNCOMMENT WHICH SKINS YOU WILL USE HERE
PC_init_add_spritesheet(spr_PCSkin_Broomietunes_GamelonZelda01,          "Gamelon Zelda",       "Broomietunes");
PC_init_add_spritesheet(spr_PCSkin_Broomietunes_MikeJones01,             "Mike Jones",          "Broomietunes");
PC_init_add_spritesheet(spr_PCSkin_EpsilonTheDragon_WolfLink01,          "Wolf Link",           "Epsilon The Dragon");

PC_init_add_spritesheet(spr_PCSkin_EpsilonTheDragon_OverworldLink01,     "Overworld Link",      "Epsilon The Dragon");
PC_init_add_spritesheet(spr_PCSkin_wolf0s_Basil01,                       "Basil",               "wolf0s");
PC_init_add_spritesheet(spr_PCSkin_HoverBat_Nyus01,                      "Nyus",                "HoverBat");
PC_init_add_spritesheet(spr_PCSkin_HoverBat_Stalfos01,                   "Stalfos",             "HoverBat");

PC_init_add_spritesheet(spr_PCSkin_HoverBat_DarkLink01,                  "Dark Link",           "HoverBat");
PC_init_add_spritesheet(spr_PCSkin_HoverBat_Scribbles01,                 "Scribbles",           "HoverBat");
PC_init_add_spritesheet(spr_PCSkin_Cryonisis_SimonBelmont01,             "Simon Belmont",       "Cryonisis");
PC_init_add_spritesheet(spr_PCSkin_mattforce2_Wario01,                   "Wario",               "Wyng");

PC_init_add_spritesheet(spr_PCSkin_mattforce2_Meat01,                    "Meat",                "Wyng");
PC_init_add_spritesheet(spr_PCSkin_SnowyAndMattforce2_SuccubusHunter01,  "Succubus Hunter",     "Snowy, Wyng");
PC_init_add_spritesheet(spr_PCSkin_LoriAndRed3445_Cornelius01,           "Cornelius",           "Lori, Red3445");
PC_init_add_spritesheet(spr_PCSkin_RippedSnorlax_Mipha01,                "Mipha",               "RippedSnorlax");

PC_init_add_spritesheet(spr_PCSkin_OkImpala_AmidaLink01,                 "Amida Link",          "Ok Impala, Revility, Falchion22, dartvaderx");
PC_init_add_spritesheet(spr_PCSkin_Link580_Marth01,                      "Marth",               "Link580");
PC_init_add_spritesheet(spr_PCSkin_Artisano_DiddyKong01,                 "Diddy Kong",          "Artisano");
PC_init_add_spritesheet(spr_PCSkin_Kowalth_Erdrick01,                    "Erdrick",             "Kowalth");

PC_init_add_spritesheet(spr_PCSkin_Kowalth_Orpheus01,                    "Orpheus",             "Kowalth");
PC_init_add_spritesheet(spr_PCSkin_Charade_Banjo01,                      "Banjo",               "Charade");
PC_init_add_spritesheet(spr_PCSkin_NightmareJames_ShadowLink01,          "Shadow Link",         "Nightmare James");
PC_init_add_spritesheet(spr_PCSkin_SteelCrescent_PleasingLinkColors01,   "Pleasing Link Colors", SteelCrescents_NAME);

PC_init_add_spritesheet(spr_PCSkin_Anarkhya_Stonuckle01,                 "Stonuckle",           "anarkhya");
PC_init_add_spritesheet(spr_PCSkin_Broomietunes_Popolon01,               "Popolon",             "Broomietunes");
PC_init_add_spritesheet(spr_PCSkin_RetroFrito_CharaChimera01,            "CharaChimera",        "RetroFrito");
PC_init_add_spritesheet(spr_PCSkin_RetroFrito_Roy01,                     "Roy",                 "RetroFrito");

PC_init_add_spritesheet(spr_PCSkin_HoverBat_Caelius01,                   "Caelius",             "HoverBat");
PC_init_add_spritesheet(spr_PCSkin_MisterMikeAndSteelCrescent_Bokoblin01,"Bokoblin",            "Mister Mike, "+SteelCrescents_NAME);
PC_init_add_spritesheet(spr_PCSkin_4IFalcon_Lonk01,                      "Lonk",                "4IFalcon");
PC_init_add_spritesheet(spr_PCSkin_Crim_PrincessZelda01,                 "Princess Zelda",      "Crim");

PC_init_add_spritesheet(spr_PCSkin_Crim_Rygar01,                         "Rygar",               "Crim");
PC_init_add_spritesheet(spr_PCSkin_Crim_LeeBrothers01,                   "Lee Brothers",        "Crim");
PC_init_add_spritesheet(spr_PCSkin_Glottal_Hepper01,                     "Hepper",              "Glottal");
PC_init_add_spritesheet(spr_PCSkin_Irenepunmaster_Shadow01,              "Shadow",              "Irenepunmaster");

PC_init_add_spritesheet(spr_PCSkin_Broomietunes_Gail01,                  "Gail",                "Broomietunes");
PC_init_add_spritesheet(spr_PCSkin_MisterMike_Ganondorf01,               "Ganondorf",           "MisterMike");
PC_init_add_spritesheet(spr_PCSkin_Debilitante_Jason01,                  "Jason",               "Debilitante");
PC_init_add_spritesheet(spr_PCSkin_JarachiKid_VaseLady01,                "Vase Lady",           "Jarachi Kid");


Skin_image = PCSkin_DEFAULT_SPRITE;


// Users can add their own PC spritesheets by putting the image file 
// in %localappdata%\ZALiA\custom_playercharacter_graphics.
var _DIRECTORY="custom_playercharacter_graphics";
if(!directory_exists(_DIRECTORY))
{
    directory_create(_DIRECTORY);
    sdm(_DIRECTORY+" created!"+"  -  PC_init()");
}
else
{
    _i=0;
    var _file_name,_file_ext, _img_name,_char_name,_creator_name;
    var _PATH = working_directory+_DIRECTORY+"\";
    var _file = file_find_first(_PATH+"*", 0);
    while (_file!="" && _i<4) // Limit to 4. Each one generates a new texture page because of sprite_add().
    {
        //sdm(string(_file));
        _file_ext = string_lower(filename_ext(_file));
        
        // Make sure it is an image file
        if(_file_ext==".png" 
        || _file_ext==".jpg" 
        || _file_ext==".jpeg" 
        || _file_ext==".gif" )
        {
            _i++;
            _file_name = filename_name(_file);
            _img_name = string_copy(_file_name,1,string_length(_file_name)-string_length(_file_ext));
            _pos = string_pos("_",_img_name);
            _char_name = string_copy(_img_name,1,_pos-1);
            _creator_name = string_copy(_img_name,_pos+1,string_length(_img_name)-_pos);
            PC_init_add_spritesheet(sprite_add(_PATH+_file_name,1, false,false, 0,0), _char_name,_creator_name, -1, true);
        }
        
        _file = file_find_next();
    }
    file_find_close();
}


var _dm_FILE_DATA = -1;
var _FILE_NAME = UserPrefFileName;
//var _FILE_NAME = STR_Game+STR_Preferences+"01"+".txt";
if (file_exists(_FILE_NAME))
{
    var _FILE    = file_text_open_read(working_directory+_FILE_NAME);
    var _ENCODED = file_text_read_string(_FILE);
                   file_text_close(_FILE);
    //
    _dm_FILE_DATA = json_decode(_ENCODED);
    if (_dm_FILE_DATA!=-1) // `json_decode` returns -1 if it fails
    {
        _val = _dm_FILE_DATA[?STR_PC+STR_Sprite+STR_Set];
        if(!is_undefined(_val))
        {
            dm_skins[?STR_Current+STR_Idx] = clamp(_val, 0,val(dm_skins[?STR_Set+STR_Count])-1);
            
            _idx       = val(dm_skins[?STR_Current+STR_Idx]);
            _datakey   = val(dm_skins[?hex_str(_idx)+STR_Datakey], STR_undefined);
            Skin_image = val(dm_skins[?_datakey+STR_Sprite], PCSkin_DEFAULT_SPRITE);
        }
        
        ds_map_destroy(_dm_FILE_DATA); _dm_FILE_DATA=undefined;
    }
}

if(!file_exists(_FILE_NAME) 
||  _dm_FILE_DATA==-1 )
{
    show_debug_message("");
    show_debug_message("!!!! WARNING! PC_init(). Either file '"+_FILE_NAME+"' does not exist, or `_dm_FILE_DATA` failed to get data !!!!");
    show_debug_message("");
}
/*
var _FILE_NAME = STR_Game+STR_Preferences+"01"+".txt";
if (file_exists(_FILE_NAME))
{
    var _FILE    = file_text_open_read(working_directory+_FILE_NAME);
    var _ENCODED = file_text_read_string(_FILE);
                   file_text_close(_FILE);
    //
    var _dm_FILE_DATA = json_decode(_ENCODED);
    if (_dm_FILE_DATA!=-1) // `json_decode` returns -1 if it fails
    {
        _val = _dm_FILE_DATA[?STR_PC+STR_Sprite+STR_Set];
        if(!is_undefined(_val))
        {
            dm_skins[?STR_Current+STR_Idx] = clamp(_val, 0,val(dm_skins[?STR_Set+STR_Count])-1);
            
            _idx       = val(dm_skins[?STR_Current+STR_Idx]);
            _datakey   = val(dm_skins[?hex_str(_idx)+STR_Datakey], STR_undefined);
            Skin_image = val(dm_skins[?_datakey+STR_Sprite], PCSkin_DEFAULT_SPRITE);
        }
        
        ds_map_destroy(_dm_FILE_DATA); _dm_FILE_DATA=undefined;
    }
}
*/















Disguise_enabled    = false;
Disguise_Head_idx   = 0; // which disguise head graphic to draw
Disguise_Head_COUNT = 2;
            Disguise_dl_behaviors = ds_list_create();
ds_list_add(Disguise_dl_behaviors,behavior_IDLE);
ds_list_add(Disguise_dl_behaviors,behavior_WALK1);
ds_list_add(Disguise_dl_behaviors,behavior_WALK2);
ds_list_add(Disguise_dl_behaviors,behavior_WALK3);
ds_list_add(Disguise_dl_behaviors,behavior_CROUCH);






GO_set_sprite(id, dl_sprites[|behavior]);
GO_init_palidx(global.PI_PC1);




if (g.mod_PC_CUCCO_1)
{
    Cucco_SPRITE_BODY1     = spr_chicken_1a_body_1a_1_WRB; // Idle
    //Cucco_SPRITE_BODY2     = spr_chicken_1a_body_2a_1_WRB;     // Head frwd v1
    //Cucco_SPRITE_BODY2     = spr_chicken_1a_body_2a_1_v2_WRB;  // Head frwd v2
    Cucco_SPRITE_BODY2     = spr_chicken_1a_body_2a_1_v3_WRB;  // Head frwd v3
    Cucco_SPRITE_BODY3     = spr_chicken_1a_body_3a_1_WRB; // Atk high & low 1
    Cucco_SPRITE_BODY4     = spr_chicken_1a_body_4a_1_WRB; // Crouch, NOT moving
    Cucco_SPRITE_BODY5     = spr_chicken_1a_body_5a_1_WRB; // Crouch, NOT moving, head frwd
    Cucco_SPRITE_BODY6     = spr_chicken_1a_body_6a_1_WRB; // Atk-high Draw
    Cucco_SPRITE_BODY7     = spr_chicken_1a_body_7a_1_WRB; // Crouch, moving
    Cucco_SPRITE_BODY8     = spr_chicken_1a_body_7b_1_WRB; // Crouch, moving, head frwd
    Cucco_SPRITE_LEGS1     = spr_chicken_1a_legs_1a_1_WRB; // Idle
    //Cucco_SPRITE_LEGS2     = spr_chicken_1a_legs_1a_2_WRB; // Walk 3
    Cucco_SPRITE_LEGS2     = spr_chicken_1a_legs_1a_2_v2_WRB; // Walk 3 v2
    //Cucco_SPRITE_LEGS3     = spr_chicken_1a_legs_1a_3_WRB; // Walk 2 v1
    //Cucco_SPRITE_LEGS3     = spr_chicken_1a_legs_1a_3_v2_WRB; // Walk 2 v2
    Cucco_SPRITE_LEGS3     = spr_chicken_1a_legs_1a_3_v3_WRB; // Walk 2 v2
    Cucco_SPRITE_LEGS4     = spr_chicken_1a_legs_1a_4_WRB; // Walk 1
    //Cucco_SPRITE_LEGS4     = spr_chicken_1a_legs_1a_4_v2_WRB; // Walk 1 v2
    Cucco_SPRITE_WING1     = spr_chicken_1a_wing_1a_1_WRB; // wing down
    Cucco_SPRITE_WING2     = spr_chicken_1a_wing_1a_2_WRB; // wing up
    Cucco_sprite_body      = 0;
    Cucco_sprite_legs      = 0;
    Cucco_sprite_wing      = 0;
    Cucco_sprite_wing_yoff = 0;
    Cucco_sprite_is_whole  = false; // if Cucco_sprite_body includes all pieces of cucco
    Cucco_legs_draw_first  = false; // certain cucco states need the legs drawn first
    
    Cucco_eye_can_draw = 1;
    Cucco_eye_color    = p.C_BLK1;
    Cucco_eye_xoff     = 0;
    Cucco_eye_yoff     = 0;
    
    Cucco_counter1 = 0;
    Cucco_counter2 = 0;
    Cucco_counter3 = 0;
    Cucco_counter4 = 0;
    
    Cucco_is_slowfalling      = 0;
    Cucco_is_slowfalling_prev = 0;
    Cucco_crouching_state     = 0; // 0:NOT crouching, 1:any crouch, 2:low crouch
    
    
    /*
    // For charge stab skill
    Cucco_SPRITE_BODY1_BEAK = spr_chicken_1a_body_1a_1_WRB_Beak;
    Cucco_SPRITE_BODY2_BEAK = spr_chicken_1a_body_2a_1_v3_WRB_Beak;
    Cucco_SPRITE_BODY3_BEAK = spr_chicken_1a_body_3a_1_WRB_Beak;
    Cucco_SPRITE_BODY4_BEAK = spr_chicken_1a_body_4a_1_WRB_Beak;
    Cucco_SPRITE_BODY5_BEAK = spr_chicken_1a_body_5a_1_WRB_Beak;
    Cucco_SPRITE_BODY6_BEAK = spr_chicken_1a_body_6a_1_WRB_Beak;
    Cucco_SPRITE_BODY7_BEAK = spr_chicken_1a_body_7a_1_WRB_Beak;
    Cucco_SPRITE_BODY8_BEAK = spr_chicken_1a_body_7b_1_WRB_Beak;
    */
    
                   dg_Cucco_DISGUISE_SPRITES=ds_grid_create(0,2);
    ds_grid_resize(dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)+1,2);
    ds_grid_add(   dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)-1,0, spr_Octorok_Idle);
    ds_grid_add(   dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)-1,1, spr_Octorok_Mouth);
    ds_grid_resize(dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)+1,2);
    ds_grid_add(   dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)-1,0, spr_Aneru1);
    ds_grid_add(   dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)-1,1, spr_Aneru2);
    ds_grid_resize(dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)+1,2);
    ds_grid_add(   dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)-1,0, spr_Lowder1);
    ds_grid_add(   dg_Cucco_DISGUISE_SPRITES,ds_grid_width(dg_Cucco_DISGUISE_SPRITES)-1,1, spr_Lowder2);
    dg_Cucco_DISGUISE_SPRITES_idx1 = 0;
    dg_Cucco_DISGUISE_SPRITES_idx2 = 0;
    Cucco_disguise_sprite = 0;
    
    //CuccoSpellFlash_pi = PI_SPELL_FLASH1; // Will be set in PC_Room_Start
    
    
    Cucco_W = sprite_get_width( Cucco_SPRITE_BODY1);
    Cucco_H = sprite_get_height(Cucco_SPRITE_BODY1);
    
    
    CuccoFallScene_SPRITE_BODY = Cucco_SPRITE_BODY1;
    CuccoFallScene_SPRITE_LEGS = Cucco_SPRITE_LEGS4;
    CuccoFallScene_SPRITE_WING = Cucco_SPRITE_WING2;
    
    
    Cucco_damage_taken  = 0;
    Cucco_damaged_count = 0;
    
    Cucco_RAGE_CUCCO_MAX = $10;
    dg_Cucco_rage = ds_grid_create(Cucco_RAGE_CUCCO_MAX+1, 8);
    // ** dg_Cucco_rage[# 0,_i]: 1st clm for general rage atk info.
    
                             _a=1;
    Cucco_RAGE_STATE_STRT1 = _a++;
    Cucco_RAGE_STATE_STRT2 = _a++;
    Cucco_RAGE_STATE_ATK1  = _a++;
    Cucco_RAGE_STATE_ATK2  = _a++;
    Cucco_RAGE_STATE_END1  = _a++;
    Cucco_RAGE_STATE_END2  = _a++;
    Cucco_RAGE_STATE_CNT   = _a;
    Cucco_rage_state       = 0;
    
    //cucco_rage_phase  = 0;
    Cucco_RAGE_DUR1   = $100;
    Cucco_RAGE_DUR2   = $80;
    Cucco_RAGE_DUR3   = $20;
    Cucco_rage_timer  = 0;
    Cucco_rage_tokens = 0;
    
    
    Cucco_vspd      = 0;
    Cucco_vspd_sub  = 0;
    Cucco_vspd_grav = 0;
    
    
    TransformHumanClipCorrect_timer = 0;
}






Sword2_SpriteTesting1 = true;
Sword2_SpriteTesting1 = false; // Only use Sword2 graphics for ATK1,ATK2,DWTH,UPTH

GraphicSwordPoint_DIST = $18; // Dist from PC.xc to the tip of the sword's graphic.


Draw_can_rando1 = false;
Draw_can_rando2 = false;
Draw_behavior   = behavior;
Draw_palidx = 0;

Draw_surface_w    = Spritesheet_W;
Draw_surface_h    = Spritesheet_H;
Draw_surface_size = max(Draw_surface_w,Draw_surface_h);
Draw_surface_xl   = 0;
Draw_surface_yt   = 0;

Draw_xscale1 = 1;
Draw_xscale2 = 1;

Draw_yscale1 = 1;
Draw_yscale2 = 1;

Draw_rotation1 = 0;
Draw_rotation2 = 0;





walk_frame = 0; // $00AE. Walk Animation Frame

fairy_sprite = 0; // The fairy sprite to draw

xScale       = 1; // 009F
x_scale_prev = xScale;

x_prev = 0;
y_prev = 0;
drop_y = 0;


RescueFairy_sprite = 0;
RescueFairy_draw_x = 0;
RescueFairy_draw_y = 0;
// The row & clm of the ground where Rescue Fairy will place PC.
RescueDropOff_rc         = -1;
RescueDropOff_elevator   = noone;
RescueDropOff_solid_inst = noone;
//RescueDropOff_x = 0;
//RescueDropOff_y = 0;
Rescue_SPEED_X = 8.00;
Rescue_SPEED_Y = 8.00;
//Rescue_move_x  = 0;
//Rescue_move_y  = 0;
Rescue_DIST1   = PC_W * 2;

// For using ease algo
Rescue_duration_MIN = $10;
//Rescue_duration_MIN = $18;
Rescue_duration_MAX = $30;
Rescue_DIST2      = $3; // Move rate Rescue_DIST2 per frame
Rescue_x_duration = 0;
Rescue_y_duration = 0;
Rescue_x_time     = 0; // number of frames since Rescue start
Rescue_y_time     = 0; // number of frames since Rescue start
Rescue_x_start    = 0;
Rescue_y_start    = 0;
Rescue_x_end      = 0;
Rescue_y_end      = 0;
Rescue_x_dist     = 0;
Rescue_y_dist     = 0;


//  The elevator instance pc entered the rm on.
RmEnter_elevator = noone;

Shadow_can_draw = false; // during boss explosions
Shadow_DEPTH    = DEPTH_BG1-1;
Shadow_xoff     = 8;











//  State ---------------------------
state_NULL   =  -1; // Not spawned
state_SPAWN  = $00; // 1st frame of PC spawn = 0
state_NORMAL = $01; // 
state_RESCUE = $10; // Being moved to safety by Rescue Fairy
state_DROWN  = $E0; // Collided insta-death liquid
state_DEAD   = $FF; // 
state        = state_NULL; // 00B5


// 0494: So various updates can happen, like during stun timer, 
// but ensures that death will occur no matter what updates
is_dead = false; // 0494. true when pending death



// ------------------------------------------------------
// ------------------------------------------------------
// $01. high stab
// $02. low  stab
// $04. down thrust
// $08. up   thrust
attack_bits = 0; // bits representing the current attack behavior
stab_type   = 0; // 0495 stabType. 0: low, 1: high
//                      // 
attack_phase_DURATION1 = $06;
attack_phase_DURATION2 = $20;
attack_timer = 0; // 050A
attack_phase = 0; // $0400
//                      // 
StabFrenzy_charge_counter = 0;
StabFrenzy_charge_counter_DURATION = (attack_phase_DURATION1*3) + attack_phase_DURATION2;
//                      // 
// E66C[atk lvl] = E66D-E674: 02030406090C1218
dl_ATTACK_DAMAGE = ds_list_create();
dl_ATTACK_DAMAGE[|$0] = $01; // If I ever use an attack level 0
dl_ATTACK_DAMAGE[|$1] = $02; // attack level 1
dl_ATTACK_DAMAGE[|$2] = $03; // attack level 2
dl_ATTACK_DAMAGE[|$3] = $04; // attack level 3
dl_ATTACK_DAMAGE[|$4] = $06; // attack level 4
dl_ATTACK_DAMAGE[|$5] = $09; // attack level 5
dl_ATTACK_DAMAGE[|$6] = $0C; // attack level 6
dl_ATTACK_DAMAGE[|$7] = $12; // attack level 7
dl_ATTACK_DAMAGE[|$8] = $18; // attack level 8
dl_ATTACK_DAMAGE[|$9] = $1C; // attack level 9








// ------------------------------------------------------
// ------------------------------------------------------
HSPD_MAX1       = $18;
HSPD_MAX1_DASH  = HSPD_MAX1 + $10;
HSPD_ENTRY      = $10; // When entering a room from side
HSPD_JUMP_HIGH  = min($13,HSPD_MAX1);
HSPD_FAIRY      = HSPD_MAX1;

Cucco_HSPD_MAX1 = HSPD_MAX1;
Cucco_HSPD_MAX1_DASH = Cucco_HSPD_MAX1 + floor(Cucco_HSPD_MAX1*(HSPD_MAX1/HSPD_MAX1_DASH));
Cucco_HSPD_MAX2 = $0C; // Crouching
Cucco_HSPD_MAX2_DASH = Cucco_HSPD_MAX2 + floor(Cucco_HSPD_MAX2*(HSPD_MAX1/HSPD_MAX1_DASH));

hspd_max        = HSPD_MAX1;
hspd_dir        = xScale; // 005F
hspd_dir_spawn  = hspd_dir;
x_change        = 0; // 0014
x_change_prev   = 0; // FOR DEBUG. previous frame x_change


Pushback_DURATION = $18; // amount g.control1_timer is set to for allowing hspd during attacking


WalkTo_active   = false;
WalkTo_x        = 0;
WalkTo_hspd_max = 0;





// BV: Base Velocity
VSPD_JUMP1   = $FC;      // Base Velocity REGular.               $9472, $9473 #$FC
VSPD_JUMP2   = $FB;      // Base Velocity High JumP.             $9470, $9471 #$FB
VSPD_DAMAGE  = $FE;
VSPD_DAMAGE2 = min(VSPD_DAMAGE+1, $FF);

VSPD_BOUNCE1 = $FE;      // #$FE - Bounce with down-thrust
VSPD_BOUNCE2 = $FD;      // For a higher down-thrust bounce
vspd_bounce  = VSPD_BOUNCE1;

VSPD_FAIRY   = HSPD_FAIRY;

TERMINAL_VELOCITY = 5;

LANDING_DURATION = 8;
landing_timer    = 0; // 0497

// BSG: Base Sudo Gravity
GRAVITY_JUMP1     = $F0;  // Base Gravity REGular.           $9476 #$F0
GRAVITY_JUMP1_RUN = $80;  // Base Gravity REGular RUNning.   $9477 #$80
GRAVITY_JUMP2     = $80;  // Base Gravity High JumP.         $9474 #$80
GRAVITY_JUMP2_RUN = 0;    // Base Gravity High JumP RUNning. $9475 #$00
GRAVITY1          = $30;
GRAVITY2          = $48;
vspd_grav         = GRAVITY2; // $03E6

vspd_prev      = vspd;
vspd_dir       = 1; // 
vspd_dir_spawn = vspd_dir;
y_change       = 0; // 
y_change_prev  = 0; // FOR DEBUG. previous frame vChange

// false: obj uses updateY2(). Only PC, ShadowBoss, Lowder, Megmat
// true:  obj uses updateY()
uses_vspd_sub = false;


jump_tokens = 1 + (f.items&ITM_FTHR!=0);


// ogr: Off Ground Reason
ogr = 0; // $0479. 0: NOT off ground, 1: reason other than jump, 2: jumped


// ------------------------------------------------------
// ------------------------------------------------------
DamageFlash_DURATION = $20; // 4 cycles of 4 colors, 2 frames each

//HoldItem_can_draw = false;
HoldItem_DURATION = $70;
HoldItem_timer    =   0; // 049C
HoldItem_inst     = noone; // 
HoldItem_object   =   0; // 049D
HoldItem_ver      =   0; // 
HoldItem_sprite   =   0;
HoldItem_palidx   = global.PI_MOB_ORG; // 5: MOB3 orange

// PC will always face right after holding an 
// item, regardless of PC's xScale on item pick up.
// This is to prevent that by using its own 
// value instead of changing PC.xScale.
HoldItem_X_SCALE = 1; // 1: Default. Although I don't think it'll need to vary at any point.
HoldItem_x_scale = HoldItem_X_SCALE;





// if pc is fairy in current frame
is_fairy = false;

// if pc is cucco in current frame
is_cucco = false;

in_restore_house = false; // 048D

colliding_elevator    = noone; // 0754
colliding_locked_door = $00;   // 05E7
//isFairy = false; // 0013. 0: NOT fairy, 8: fairy
//shieldActive = false; // 070F
//reflectActive = false; // 0710 = 1
//jumpActive = 0; // 00D0

//cucco_knockback_testing=0;
CUCCO_KNOCKBACK_REDUCTION = 1;
Stun_DURATION1  = $20; // 
Stun_DURATION2  = $1A; // For Cucco
stun_timer      = 0; // 050C
pipe_sink_timer = 0; // 070E
iframes_timer   = 0; // 0518. invulnerable. Decrements everytime 0500 reaches -1


DrownLiquid_y     = 0;
DrownLiquid_depth = 0;


// control is flags for various purposes
control_MOVE1  = $0001; // Slow walk speed in water 1
control_MOVE2  = $0002; // Slow walk speed in water 2
control_MOVE3  = $0004; // 
control_MOVE4  = $0008; // Walk on ice
control_DRAW1  = $0010; // Wave/Undulate drawYOff from walking in water
control_SOUND1 = $0100; // Sound for water walk
control        = 0;


// ------------------------------------------------------------
// ------------------------------------------------------------



                    _a=0;
      CS_OFF_IDX  = _a++;
Fairy_CS_OFF_IDX  = _a++;
Cucco_CS_OFF_IDX1 = _a++;
Cucco_CS_OFF_IDX2 = _a++;
      cs_off_idx  = CS_OFF_IDX;
//







// body hb
// ** Fairy has the same body hb as Lonk
                    _a=$1A;
      BodyHB_IDX1 = _a++; // HUMAN STAND
      BodyHB_IDX2 = _a++; // HUMAN CROUCH
Fairy_BodyHB_IDX1 = _a++;
Cucco_BodyHB_IDX1 = _a++;
Cucco_BodyHB_IDX2 = _a++;
      BodyHB_IDX  = BodyHB_IDX1;
      BodyHB_idx  = BodyHB_IDX;
//


// SHIELD HB --------------------------------------------------------------
                        _i=0; // 
      ShieldHB_IDX    = _i++; // 
Fairy_ShieldHB_IDX    = _i++; // 
Cucco_ShieldHB_IDX    = _i++; // 
//                              // 
                           _j=0; // 
ShieldHB_IDX_W1          = _j++; // 
ShieldHB_IDX_H1          = _j++; // 
ShieldHB_IDX_W2          = _j++; // 
ShieldHB_IDX_H2          = _j++; // 
ShieldHB_IDX_XOFF_RIGHT  = _j++; // 
ShieldHB_IDX_XOFF_LEFT   = _j++; // 
ShieldHB_IDX_YOFF_STAND  = _j++; // 
ShieldHB_IDX_YOFF_CROUCH = _j++; // 
//                              // 
//                              // 
// TODO: Finish PC hb balancing.. if needed.
// MOD. _adj1: Add some balance. In OG, shield hb facing right is 2 pixels further away from pc center than facing left.
// 2024/11/08. Not sure if I should keep this shield balancing or stay true to OG. Checked a bunch of projectile body hb and they're all centered/balanced
var _adj1 =  0; //  0: OG
    _adj1 = -1; // -1: mod
//                              // 
dg_ShieldHB = ds_grid_create(_i,_j);
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_W1]          =   5 + g.HB_ADJ_X;           // SHLD_W1
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_H1]          =  12 + g.HB_ADJ_X;           // SHLD_H1
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_W2]          = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_W1]; // SHLD_W2
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_H2]          = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_H1]; // SHLD_H2
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_XOFF_RIGHT]  =  14 + g.HB_ADJ_X + _adj1;   // SHLD_XOFF_RGT
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_XOFF_LEFT]   =  -1 + g.HB_ADJ_X + _adj1;   // SHLD_XOFF_LFT
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_YOFF_STAND]  =   2 + g.HB_ADJ_X;           // SHLD_YOFF_HGH
dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_YOFF_CROUCH] =  17 + g.HB_ADJ_X;           // SHLD_YOFF_LOW
//                                                                                                                      // 
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_W1]           = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_W1];         // SHLD_W1
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_H1]           = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_H1];         // SHLD_H1
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_W2]           = dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_W1];   // SHLD_W2
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_H2]           = dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_H1];   // SHLD_H2
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_XOFF_RIGHT]   = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_XOFF_RIGHT]; // SHLD_XOFF_RGT
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_XOFF_LEFT]    = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_XOFF_LEFT];  // SHLD_XOFF_LFT
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_YOFF_STAND]   = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_YOFF_STAND]; // SHLD_YOFF_HGH
dg_ShieldHB[#Fairy_ShieldHB_IDX,ShieldHB_IDX_YOFF_CROUCH]  = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_YOFF_CROUCH];// SHLD_YOFF_LOW
//                                                                                                                      // 
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_W1]           = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_W1];         // SHLD_W1. STANDING
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_H1]           = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_H1];         // SHLD_H1. STANDING
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_W2]           = dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_W1];   // SHLD_W2. CROUCHING
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_H2]           = dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_H1];                           // SHLD_H2. CROUCHING
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_H2]          +=(g.dg_BODY_HB[#Cucco_BodyHB_IDX2,$3] - g.dg_BODY_HB[#Cucco_BodyHB_IDX1,$3]); // SHLD_H2. CROUCHING
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_XOFF_RIGHT]   = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_XOFF_RIGHT]; // SHLD_XOFF_RGT
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_XOFF_LEFT]    = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_XOFF_LEFT];  // SHLD_XOFF_LFT
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_YOFF_STAND]   = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_YOFF_STAND]; // SHLD_YOFF_HGH
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_YOFF_CROUCH]  = dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_YOFF_STAND];                                             // SHLD_YOFF_LOW
dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_YOFF_CROUCH] +=(dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_H1] - dg_ShieldHB[#Cucco_ShieldHB_IDX,ShieldHB_IDX_H2]); // SHLD_YOFF_LOW
//                                                                                                                      // 
//                                                                                                                      // 
ShieldHB_can_draw = true;
ShieldHB_color    =  g.ShieldHB_COLOR; // c_yellow
ShieldHB_xoff     = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_XOFF_RIGHT]; // SHLD_XOFF_RGT
ShieldHB_yoff     = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_YOFF_STAND]; // SHLD_YOFF_HGH
ShieldHB_w        = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_W1]; // SHLD_W1
ShieldHB_h        = dg_ShieldHB[#ShieldHB_IDX,ShieldHB_IDX_H1]; // SHLD_H1
//                                                                                                                      // 
//                                                                                                                      // 




// sword hb
SwordHB_collidable = false;
SwordHB_can_draw   = SwordHB_collidable;
SwordHB_color      = c_lime; // debug

SwordHB_W       = 14 + g.HB_ADJ_W; // 14,15
SwordHB_H       =  3 + g.HB_ADJ_H; //  3, 4
Cucco_SwordHB_W =  7; // 6
Cucco_SwordHB_H =  4;
SwordHB_w       = SwordHB_W;
SwordHB_h       = SwordHB_H;
SwordHB_w_      =(SwordHB_w>>1);
SwordHB_h_      =(SwordHB_h>>1);
SwordHB_x_base  =  0; // 047E
SwordHB_y_base  =  0; // 0480
SwordHB_xoff    =  0;
SwordHB_yoff    =  0;
SwordHB_x       =  0;
SwordHB_y       =  0;

// SwordHB2 is for special circumstances.
// For example; If a magic jar was sitting 1 tile above foot of PC, 
// PC's sword hb would miss the jar's.
SwordHB2_can_draw   = false;
SwordHB2_colliding  = noone; // collided with instance
SwordHB2_collidable = false;
SwordHB2_W          = SwordHB_W;
SwordHB2_W_         = SwordHB2_W>>1;
SwordHB2_w          = SwordHB2_W;
SwordHB2_H          =  4;
SwordHB2_H_         = SwordHB2_H>>1;
SwordHB2_h          = SwordHB2_H;
SwordHB2_XOFF       = GraphicSwordPoint_DIST - SwordHB2_W_;
SwordHB2_YOFF       = -5; // 10 for HIGH, 20 for LOW
SwordHB2_xl         =  x + (SwordHB2_XOFF*xScale) - SwordHB2_W_;
SwordHB2_yt         =  y +  SwordHB2_YOFF + (10 * !stab_type); // stabType. 0: low, 1: high


// SCS: Sword Collide Solid Point
SCS_can_draw = false;
SCS_COLOR    = c_fuchsia;
SCS_XOFF     = 12;
SCS_YOFF     = 3;
SCS_x        = 0; // 005D
SCS_y        = 0; // 0039
SCS_draw_x   = 0;
SCS_draw_y   = 0;




