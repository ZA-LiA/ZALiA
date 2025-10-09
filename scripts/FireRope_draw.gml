/// FireRope_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i, _x,_y;

// units of 8
pal_swap_set(global.palette_image, palidx);
for(_i=fireball_count-1; _i>=0; _i--)
{
    _x = spawn_xl + round(lengthdir_x(_i<<3, angle));
    _y = spawn_yt + round(lengthdir_y(_i<<3, angle));
    draw_sprite_(SPR_A,0, _x,_y, -1, xScale,yScale, c_white,1, rotation);
}
pal_swap_reset();



// --------------------------------------------------------------------------------------
if(!g.DevTools_state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!g.can_draw_hb)  exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
if(!BodyHB_can_draw)  exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!
    BodyHB_can_draw = false;
// 
var _x,_y;
for(_i=fireball_count-1; _i>=0; _i--)
{
    _x = spawn_xl + round(lengthdir_x(_i<<3, angle));
    _y = spawn_yt + round(lengthdir_y(_i<<3, angle));
    drawPointCross(_x,_y);
}

//draw_line_colour(spawn_xl,spawn_yt, x,y, c_lime,c_lime);




