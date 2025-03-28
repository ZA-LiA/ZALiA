/// draw_sprite_part_(sprite, sub image, left, top, width, height, x, y, *pal index, *xscale, *yscale, *color, *alpha)
//                         0,         1,    2,   3,     4,      5, 6, 7,          8,       9,      10,     11,     12


if(!argument[0])      exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (argument_count<8) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _IS_PAL_SWAP = argument_count>8 && argument[8] && argument[8]<global.palette_image_W;
if (_IS_PAL_SWAP) pal_swap_set(p.palette_image, argument[8]); // Won't run if _palidx is out of range


switch(argument_count)
{
    // --------------------------------------------------------------
    case  8:{ //              sprite,  sub image,        left,        top,       width,     height,           x,          y
    draw_sprite_part(    argument[0],argument[1], argument[2],argument[3], argument[4],argument[5], argument[6],argument[7]);
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
    // --------------------------------------------------------------
    case  9:{ //              sprite,  sub image,        left,        top,       width,     height,           x,          y
    draw_sprite_part(    argument[0],argument[1], argument[2],argument[3], argument[4],argument[5], argument[6],argument[7]);
    break;}
    
    
    // --------------------------------------------------------------
    case 10:{ //              sprite,  sub image,        left,        top,       width,     height,           x,          y,      xscale,      yscale,        color,       alpha
    draw_sprite_part_ext(argument[0],argument[1], argument[2],argument[3], argument[4],argument[5], argument[6],argument[7], argument[9],           1,      c_white,           1);
    break;}
    // --------------------------------------------------------------
    case 11:{ //              sprite,  sub image,        left,        top,       width,     height,           x,          y,      xscale,      yscale,        color,       alpha
    draw_sprite_part_ext(argument[0],argument[1], argument[2],argument[3], argument[4],argument[5], argument[6],argument[7], argument[9],argument[10],      c_white,           1);
    break;}
    // --------------------------------------------------------------
    case 12:{ //              sprite,  sub image,        left,        top,       width,     height,           x,          y,      xscale,      yscale,        color,       alpha
    draw_sprite_part_ext(argument[0],argument[1], argument[2],argument[3], argument[4],argument[5], argument[6],argument[7], argument[9],argument[10], argument[11],           1);
    break;}
    // --------------------------------------------------------------
    case 13:{ //              sprite,  sub image,        left,        top,       width,     height,           x,          y,      xscale,      yscale,        color,       alpha
    draw_sprite_part_ext(argument[0],argument[1], argument[2],argument[3], argument[4],argument[5], argument[6],argument[7], argument[9],argument[10], argument[11],argument[12]);
    break;}
}


if (_IS_PAL_SWAP) pal_swap_reset();




