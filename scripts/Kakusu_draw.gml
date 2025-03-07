/// Kakusu_draw()


if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(p.palette_image, palidx);

   draw_sprite_(smal_spr,0, drawX+smal_xoff, drawY+smal_yoff, -1, xScale,yScale);
GO_draw_sprite( body_spr);
   draw_sprite_(eyes_spr,0, drawX+eyes_xoff, drawY+eyes_yoff, -1, xScale,yScale);
//
pal_swap_reset();


switch(pupil_state){ // 0: no pupil, 1: 2x1, 2: 2x2
case 1:{draw_sprite_(spr_1x1_WHT,0, drawX+pupil_xoff, drawY+pupil_yoff, -1, 2,1, pupil_color); break;}
case 2:{draw_sprite_(spr_1x1_WHT,0, drawX+pupil_xoff, drawY+pupil_yoff, -1, 2,2, pupil_color); break;}
}

switch(mouth_state){ // 0: no mouth, 1: norm mouth, 2: open mouth
case 1:{draw_sprite_(spr_1x1_WHT,0, drawX+mouth_xoff, drawY+mouth_yoff, -1, 2,1, mouth_color); break;}
case 2:{draw_sprite_(spr_1x1_WHT,0, drawX+mouth_xoff, drawY+mouth_yoff, -1, 2,2, mouth_color); break;}
}




