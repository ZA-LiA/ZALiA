/// Spawner_Drop_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!


// ** 2022/10/15. This would block any bgr flashing so commenting it out
// Block any bgr wall graphics.
//draw_rect(p.dl_COLOR[|p.col_idx_bg], xl,yt,ww,hh);


pal_swap_set(p.palette_image, palidx);
for(var _i=0; _i<4; _i++) // draw an 8x8 graphic on each corner of a 16x16 area
{
    draw_background_part(TILESET, 
                         dg_XY_TS[#_i,0],             // ts x
                         dg_XY_TS[#_i,1],             // ts y
                         8,8, 
                         dg_XY_RM[#_i,0],             // rm x
                         dg_XY_RM[#_i,1]+draw_yoff ); // rm y
}
pal_swap_reset();




