/// update_Pallete_1a()


var _idx, _num, _count, _dk;
var _color, _pi;


// 8E23: JSR 9235.  Update Link's palette
// 0: Green, 1: Red(SHIELD active || have RING), 2: Blue(SHIELD active && have RING)
_pi = global.PI_PC1;

if (g.game_end_state)
{
    if (pc_is_cucco()) _pi = global.PI_CUCCO1; // Switch to traditional green tunic for end game.
    else               _pi = global.PI_PC1;    // Switch to traditional green tunic for end game.
}
else if (g.FallScene_timer)
{
    if (pc_is_cucco()) _pi = global.PI_CUCCO1;
    else               _pi = global.PI_PC1;
    _pi += sign(f.items&ITM_RING) + sign(g.spells_active&SPL_PRTC);
    if!(g.FallScene_timer&$7)sdm("update_Pallete_1a(). g.FallScene_timer=$"+hex_str(g.FallScene_timer)+", _pi==global.PI_PC1 = "+string(_pi==global.PI_PC1));
}
else if (SpellFlash_PC_timer)
{
    _idx = (SpellFlash_PC_timer-1)&$3;
    if (pc_is_cucco()) _pi = dg_PI_SEQ[#$5,_idx];
    else               _pi = dg_PI_SEQ[#$4,_idx];
}
else if (g.pc.Disguise_enabled)
{
    if (pc_is_cucco()) _pi = global.PI_DISGUISE_CUCCO;
    else               _pi = global.PI_DISGUISE_PC;
}
else
{
    if (pc_is_cucco()) _pi = global.PI_CUCCO1;
    else               _pi = global.PI_PC1;
    _pi += sign(f.items&ITM_RING) + sign(g.spells_active&SPL_PRTC);
}

dg_PI_SEQ[#$0,$0] = _pi;




// Update background color
_color = global.BackgroundColor_scene;

if (g.all_bg_black_only)
{
    _color = p.C_BLK1; // For patreon user Guardian's bg color issue
}
else
{
    if (Flash_Bgr_timer 
    ||  Flash_Bgr_timer2 ) // for Ganon3 spell and boss explosion
    {
             if (Flash_Bgr_timer2)           _color = C_RED3; // Ganon3_ProjRain_update() updates the bgr color
        else if (BackgroundFlash_setting==1) _color = dg_color_seq[#0,(Flash_Bgr_timer-1)&$3]; // Spell flash
        else if (BackgroundFlash_setting)    _color = dl_BackgroundFlash_COLORS[|BackgroundFlash_setting];
    }
}

set_background_color(_color);




// Update spell flash timer 074B.  9245
if (Flash_Pal_timer)        Flash_Pal_timer--;
if (Flash_Bgr_timer)        Flash_Bgr_timer--;
if (Flash_Bgr_timer2)       Flash_Bgr_timer2--;
if (SpellFlash_PC_timer)    SpellFlash_PC_timer--;
if (SpellFlash_GOB_timer)   SpellFlash_GOB_timer--;
if (SpellReady_flash_timer) SpellReady_flash_timer--;




update_rm_brightness();




/*
if (g.FallScene_timer)
{
    if(!val(global.FallScene_dm[?STR_Counter]))
    {
        var _TYPE_ = val(global.FallScene_dm[?STR_Current+STR_Type], "1"); // "1": vertical fall, "2": horizontal fall
        var _FALL_DIRECTION = val(global.FallScene_dm[?STR_Current+STR_Fall+STR_Direction], $1<<(2*(_TYPE_=="1")));
        var _DIR = sign_(_FALL_DIRECTION&$5); // $5: RIGHT | DOWN
        
        _count = val(global.FallScene_dm[?_TYPE_+dk_PI+STR_Count], 3);
        _idx  =  val(global.FallScene_dm[?dk_PI+STR_Sequence+STR_Index]);
        _idx += _count;
        _idx += _DIR;
        _idx  = _idx mod _count;
        global.FallScene_dm[?dk_PI+STR_Sequence+STR_Index] = _idx;
        
        global.FallScene_dm[?STR_Current+dk_PI] = val(global.FallScene_dm[?_TYPE_+dk_PI+string(_idx+1)], global.PI_GUI2);
    }
    
    //fs_pal_state += g.tmr_change_room&$1; // OG
    // OG is every 2 frames but that looks too fast in ZALiA. Every 4 frames looks too slow, but 3 looks fine.
    global.FallScene_dm[?STR_Counter] = (val(global.FallScene_dm[?STR_Counter])+1) mod 3;
}
*/




/*
//  Lava glow
var _TIME = g.counter0&$FF;
if!(_TIME&$1F)
{
    if(!_TIME 
    ||  _TIME&$80 )
    {
        if (rm_pal_qual_lit() 
        &&  ds_grid_width(g.dg_t_anim_liquid) )
        {
            var _depth = g.dg_t_anim_liquid[#0,0];
            var _idx   = ds_list_find_index(g.dl_t_depth,_depth);
            var _pi    = dg_depth_pi[#_idx,1];
            
            // if lava colors
            if (isVal(get_pal_color(_pi,2), C_RED3,C_RED4,C_PNK3,C_PNK4,C_ORG3,C_ORG4))
            {
                var _COLOR_IDX = CI_WHT0_;
                if (g.counter0&$100)
                {
                    if(!_TIME)
                    {
                        _COLOR_IDX = CI_ORG4_;
                    }
                    else if!(_TIME&$3F)
                    {
                    
                    }
                }
                else
                {
                    if(!_TIME)
                    {
                    
                    }
                    else
                    {
                    
                    }
                }
                //change_pal(strReplaceAt(p.pal_rm_new, midtone_PALDATA_POS, 2, midtone_colorID_cur));
            }
        }
    }
}
*/




