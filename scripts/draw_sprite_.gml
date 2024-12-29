/// draw_sprite_(sprite, sub image, x, y, *pal index, *xscale, *yscale, *color, *alpha, *rotation)


if(!argument[0]) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



if (argument_count>4 
&&  argument[4]  // if pal index >= .5
&&  argument[4]<global.palette_image_W )
{
    pal_swap_set(p.palette_image, argument[4]); // Won't run if pal index is out of range
}


switch(argument_count)
{
    // --------------------------------------------------------------
    case  1: exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    case  2: exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    case  3: exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    // --------------------------------------------------------------
    case  4:{ //         sprite,  sub image,           x,          y
    draw_sprite(    argument[0],argument[1], argument[2],argument[3]);
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
    
    
    
    // --------------------------------------------------------------
    case  5:{ //         sprite,  sub image,           x,          y
    draw_sprite(    argument[0],argument[1], argument[2],argument[3]);
    break;}
    
    // --------------------------------------------------------------
    case  6:{ //         sprite,  sub image,           x,          y,      xscale,     yscale,    rotation,       color,      alpha
    draw_sprite_ext(argument[0],argument[1], argument[2],argument[3], argument[5],          1,           0,     c_white,          1);
    break;}
    
    // --------------------------------------------------------------
    case  7:{ //         sprite,  sub image,           x,          y,      xscale,     yscale,    rotation,       color,      alpha
    draw_sprite_ext(argument[0],argument[1], argument[2],argument[3], argument[5],argument[6],           0,     c_white,          1);
    break;}
    
    // --------------------------------------------------------------
    case  8:{ //         sprite,  sub image,           x,          y,      xscale,     yscale,    rotation,       color,      alpha
    draw_sprite_ext(argument[0],argument[1], argument[2],argument[3], argument[5],argument[6],           0, argument[7],          1);
    break;}
    
    // --------------------------------------------------------------
    case  9:{ //         sprite,  sub image,           x,          y,      xscale,     yscale,    rotation,       color,      alpha
    draw_sprite_ext(argument[0],argument[1], argument[2],argument[3], argument[5],argument[6],           0, argument[7],argument[8]);
    break;}
    
    // --------------------------------------------------------------
    case 10:{ //         sprite,  sub image,           x,          y,      xscale,     yscale,    rotation,       color,      alpha
    draw_sprite_ext(argument[0],argument[1], argument[2],argument[3], argument[5],argument[6], argument[9], argument[7],argument[8]);
    break;}
}



if (argument[4] 
&&  argument[4]<global.palette_image_W )
{
    pal_swap_reset();
}




