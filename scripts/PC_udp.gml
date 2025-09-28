/// PC_udp()

// udp: Update Draw Properties


var _i, _idx, _val;
var _c1,_c2,_c3;
var _spr;
var _datakey;


can_draw_self = true;


Draw_can_rando1 = g._YwY_ || global.SloofLirpa_ENABLED;
Draw_can_rando2 = Draw_can_rando1; // random rotation, random behavior

if (Draw_can_rando2)
{
    Draw_behavior = dl_UwU_[|behavior];
}
else
{
    Draw_behavior = behavior;
    if (Disguise_enabled 
    &&  ds_list_find_index(Disguise_dl_behaviors,Draw_behavior)==-1 )
    {
        Draw_behavior = behavior_CROUCH;
    }
}


// EC0A
    draw_xoff =  0;
if (ogr 
&&  Draw_behavior==behavior_CROUCH )
{
    draw_yoff = -4;
}
else
{
    draw_yoff =  0;
}





// EC19 --------------------------------------------------------------
if (is_cucco)
{
    PC_udp_cucco();
    Cucco_sprite_is_whole = Disguise_enabled || Draw_behavior==behavior_DAMAGE;
    Cucco_legs_draw_first = Cucco_sprite_body==Cucco_SPRITE_BODY4 || Cucco_sprite_body==Cucco_SPRITE_BODY5; // crouch || crouch(head fwrd)
}
else if (is_fairy) // EBB8. Fairy PC ------------------------------------------------------
{   // EBD7
    fairy_sprite = g.dl_Fairy_SPRITES[|sign(g.counter1&$4)]; // spr_FairyA or spr_FairyB
}
else
{ // EC22, EC40 -------------------------------------------------------------------------
    GO_set_sprite(id,PC_PLACEMENT_SPR);
    
    palidx = palidx_def;
    
    if (Draw_behavior==behavior_HOLD_ITEM1 
    ||  Draw_behavior==behavior_HOLD_ITEM2 
    ||  Draw_behavior==behavior_HOLD_ITEM3 
    ||  Draw_behavior==behavior_HOLD_ITEM4 
    ||  Draw_behavior==behavior_HOLD_ITEM5 )
    {   // ED21, 9364
        //HoldItem_can_draw = true;
        HoldItem_x_scale = HoldItem_X_SCALE;
    }
}







// -------------------------------------------------------------------------
/*
dg_PI_SEQ[#0,0] = PI_PC_1;
dg_PI_SEQ[#0,1] = PI_MOB1;
dg_PI_SEQ[#0,2] = PI_MOB2;
dg_PI_SEQ[#0,3] = PI_MOB3;
*/
     if (stun_timer) palidx = p.dg_PI_SEQ[#is_cucco, (stun_timer>>1)&$3]; // changes color every 2 frames
else if (is_cucco)   palidx = p.dg_PI_SEQ[#0,0];
else if (is_fairy)   palidx = p.dg_PI_SEQ[#0,1];
else                 palidx = p.dg_PI_SEQ[#0,0];


_c1 = stun_timer || p.SpellFlash_PC_timer;
_c2 = rm_pal_qual_lit();
_c3 = _c1 || _c2;


if(!_c3) palidx += p.PI_DRK1;

palidx_permut = 0;
Draw_palidx = palidx;




// -------------------------------------------------------------------------
// EC4F, EDF6
if (state==state_DROWN) // For drowning in water/lava
{
    depth = max(depth, DrownLiquid_depth+1);
}
else if (pipe_sink_timer) // Pipe sink
{
    depth = g.TILE_DEPTH_MAX_BACK+1;
}
else
{
    depth = depth_def;
}


// -------------------------------------------------------------------------
update_draw_xy();




if (state==state_RESCUE)
{
    RescueFairy_sprite = g.dl_Fairy_SPRITES[|sign(g.counter1&$4)];
}
else
{
    if(!(f.items&ITM_FRY1) 
    ||  (state==state_DROWN && !f.hp) 
    ||  (state!=state_DROWN && !iframes_timer) )
    {
        RescueFairy_sprite = 0;
    }
    else if (RescueFairy_sprite)
    {
        RescueFairy_sprite = g.dl_Fairy_SPRITES[|sign(g.counter1&$4)];
    }
}



    _c1 = !is_cucco && (is_fairy || (control&control_DRAW1 && hspd));
if (RescueFairy_sprite 
||  _c1 )
{
    var _YOFF = get_fairy_yoff(3 + !is_fairy);
    if (_c1) draw_yoff = _YOFF;
    
    if (RescueFairy_sprite)
    {
        RescueFairy_draw_x  = drawX;
        //RescueFairy_draw_yoff = _YOFF + y_change + draw_yoff;
        RescueFairy_draw_y  = drawY - hh_ - (sprite_get_height(RescueFairy_sprite)>>1);
        RescueFairy_draw_y += _YOFF + y_change + draw_yoff;
        //RescueFairy_draw_y += RescueFairy_draw_yoff;
        RescueFairy_draw_y += 8;
    }
}








// -------------------------  PC SHADOW DURING BOSS EXPLOSION  --------------------------
Shadow_can_draw = false;
Shadow_xoff = 8;
with(Boss)
{
    if (state==state_EXPLODE 
    &&  timer<g.BOSS_DEATH_FLASH_CUE )
    {
        facingDir = dir_to_pc_(id);
        
        // Blink the shadow to emulate the OG blinking 
        // effect the happens due to NES limitations.
        //other.Shadow_can_draw = rand()  &$3 != $3; // testing
        //other.Shadow_can_draw = g.timer0&$3 != $3; // testing
        other.Shadow_can_draw = other.can_draw_self && g.counter1&$1;
        other.Shadow_xoff *= facingDir;
        
        break;//with(Boss)
    }
}









if (is_fairy)
{
    Draw_surface_w = sprite_get_width( fairy_sprite);
    Draw_surface_h = sprite_get_height(fairy_sprite);
}
else if (is_cucco)
{
    Draw_surface_w = sprite_get_width( Cucco_sprite_body);
    Draw_surface_h = sprite_get_height(Cucco_sprite_body);
}
else
{
    Draw_surface_w = Spritesheet_W;
    Draw_surface_h = Spritesheet_H;
}

Draw_surface_size = max(Draw_surface_w,Draw_surface_h);




if (HoldItem_timer 
//if ((is_cucco && HoldItem_timer) 
||  Draw_behavior==behavior_HOLD_ITEM1 
||  Draw_behavior==behavior_HOLD_ITEM2 
||  Draw_behavior==behavior_HOLD_ITEM3 
||  Draw_behavior==behavior_HOLD_ITEM4 
||  Draw_behavior==behavior_HOLD_ITEM5 )
//if (HoldItem_can_draw)
{
    Draw_xscale1 = HoldItem_x_scale;
}
else
{
    Draw_xscale1 = xScale;
}
Draw_yscale1 = yScale;

if (Draw_can_rando1)
{
    Draw_xscale2 = dg_UwU_[#Draw_behavior,0];
    Draw_yscale2 = dg_UwU_[#Draw_behavior,1];
}
else
{
    Draw_xscale2 = 1;
    Draw_yscale2 = 1;
}




if (is_cucco)        Draw_rotation1 = PC_draw_get_cucco_rot(Draw_xscale1);
else                 Draw_rotation1 = 0;

if (Draw_can_rando2) Draw_rotation2 = dg_UwU_[#Draw_behavior,4];
else                 Draw_rotation2 = 0;




Draw_surface_xl = drawX - (Draw_surface_size>>1);
Draw_surface_yt = drawY - (Draw_surface_size>>1);

if (Draw_can_rando1 
||  Draw_can_rando2 )
{
    // Unfortunately, the origin point of a surface is its XL/YT and cannot be 
    // set to its center. This means flipping and rotating may require some adjustments.
    
    // Think of 4 squares the size of the surface, arranged together in a square. 
    // Square 0: bottom right: Where things need to end up.
    // Square 1:    top right
    // Square 2:    top  left
    // Square 3: bottom  left
    // -----------------
    // |       |       |
    // |   2   |   1   |
    // |       |       |
    // ------- + .......
    // |       :       :
    // |   3   :   0   :
    // |       :       :
    // --------.........
    
    // First, get a square num by applying the scaling.
    // Since the surface's origin point(the '+' in the diagram) is its XL/YT, 
    // -Draw_xscale2 would put you in one of the left 2 squares(2 or 3), and 
    // -Draw_yscale2 would put you in one of the  top 2 squares(1 or 2).
    _val = 0;
    if (Draw_can_rando1)
    {
             if(!Draw_xscale2 && !Draw_yscale2) _val = 2;
        else if(!Draw_xscale2)                  _val = 3;
        else if(!Draw_yscale2)                  _val = 1;
    }
    
    // Next, add the number of 90deg rotations (1, 2, or 3) to 
    // that square num to get a new square num.
    // *** Rotation is counter-clockwise and the rotation axis is 
    // always the XL,YT of square 0 (the '+' in the diagram), 
    // regardless of what the scales are.
    if (Draw_can_rando2 
    &&  Draw_rotation2 )
    {
        _val += Draw_rotation2 div 90; // 1,2,3,4,5,6
        _val  = _val mod 4;  // 0,1,2,3
    }
    
    // Finally, add the offsets to get back to square 0:
    // *** Some scenarios with the combination of negative 
    // scales and rotations will end up at square 0 and 
    // therefor won't need to add any offsets.
    switch(_val){
    case 1:{                                    Draw_surface_yt+=Draw_surface_size; break;} // square 1
    case 2:{Draw_surface_xl+=Draw_surface_size; Draw_surface_yt+=Draw_surface_size; break;} // square 2
    case 3:{Draw_surface_xl+=Draw_surface_size;                        break;} // square 3
    }//switch(_val)
}




_idx       = val(dm_skins[?STR_Current+STR_Idx]);
_datakey   = val(dm_skins[?hex_str(_idx)+STR_Datakey], STR_undefined);
Skin_image = val(dm_skins[?_datakey+STR_Sprite], PCSkin_DEFAULT_SPRITE);




