/// Bubble_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


var                     _ROT = 0;
if (ver & VER_BIT_CLNG) _ROT = rotation * 90;


pal_swap_set(p.palette_image, palidx);
if (ver & VER_BIT_GIAN) // GiantBubble
{
    // Left  half
    draw_sprite_(SPR_GIAN_A,0, drawX-8,drawY-8, -1,   1);
    draw_sprite_(SPR_GIAN_B,0, drawX-8,drawY+8, -1,   1);
    
    // Right half
    draw_sprite_(SPR_GIAN_A,0, drawX+8,drawY-8, -1,  -1);
    draw_sprite_(SPR_GIAN_B,0, drawX+8,drawY+8, -1,  -1);
}
else
{
    draw_sprite_(spr_aura,0, drawX,drawY, -1, xScale,yScale);
    draw_sprite_(spr_skul,0, drawX,drawY, -1, xScale,yScale, c_white,1, _ROT);
}
pal_swap_reset();


/*// DEBUG
if (ver & VER_BIT_CLNG)
{
    var _I2 = ds_grid_width(dg_cling)-4; // 4 center points
    var _I1 =                     _I2-4; // 4 corner points
    
    var _COLOR1 = c_lime;
    var _COLOR2 = c_purple;
    var _COLOR3 = c_orange;
    var _COLOR4 = c_white;
    var _col1;
    
    for (var i = 0; i < 4; i++)
    {
        // corner
        if (dg_cling[# _I1+i,0]) _col1 = _COLOR3;
        else                     _col1 = _COLOR4;
        drawPointCross(dg_cling[# _I1+i,1], dg_cling[# _I1+i,2], _col1, _COLOR2);
        
        // center
        if (dg_cling[# _I2+i,0]) _col1 = _COLOR1;
        else                     _col1 = _COLOR4;
        drawPointCross(dg_cling[# _I2+i,1], dg_cling[# _I2+i,2], _col1, _COLOR2);
    }
}
*/




