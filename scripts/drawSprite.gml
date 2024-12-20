/* // this has been replaced with draw_sprite_()
/// drawSprite(sprite, x, y, *pal index, *xscale, *yscale, *color, *alpha, *rotation)


if(!argument[0]) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



switch (argument_count)
{
    // --------------------------------------------------------------
    case 1: exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    case 2: exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    // --------------------------------------------------------------
    case 3: { // sprite, x, y
        draw_sprite(    argument[0],0, argument[1],argument[2]);
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;  }
    
    
    
    // --------------------------------------------------------------
    case 4: { // sprite, x, y, palidx
        pal_swap_set(p.palette_image, argument[3]); // Won't run if _palidx is out of range
        draw_sprite(    argument[0],0, argument[1],argument[2]);
    break;  }
    
    // --------------------------------------------------------------
    case 5: { // sprite, x, y, palidx, xscale
        pal_swap_set(p.palette_image, argument[3]); // Won't run if _palidx is out of range
        draw_sprite_ext(argument[0],0, argument[1],argument[2], argument[4],1, 0, c_white,1);
    break;  }
    
    // --------------------------------------------------------------
    case 6: { // sprite, x, y, palidx, xscale, yscale
        pal_swap_set(p.palette_image, argument[3]); // Won't run if _palidx is out of range
        draw_sprite_ext(argument[0],0, argument[1],argument[2], argument[4],argument[5], 0, c_white,1);
    break;  }
    
    // --------------------------------------------------------------
    case 7: { // sprite, x, y, palidx, xscale, yscale, color
        pal_swap_set(p.palette_image, argument[3]); // Won't run if _palidx is out of range
        draw_sprite_ext(argument[0],0, argument[1],argument[2], argument[4],argument[5], 0, argument[6],1);
    break;  }
    
    // --------------------------------------------------------------
    case 8: { // sprite, x, y, palidx, xscale, yscale, color, alpha
        pal_swap_set(p.palette_image, argument[3]); // Won't run if _palidx is out of range
        draw_sprite_ext(argument[0],0, argument[1],argument[2], argument[4],argument[5], 0, argument[6],argument[7]);
    break;  }
    
    // --------------------------------------------------------------
    case 9: { // sprite, x, y, palidx, xscale, yscale, color, alpha, rotation
        pal_swap_set(p.palette_image, argument[3]); // Won't run if _palidx is out of range
        draw_sprite_ext(argument[0],0, argument[1],argument[2], argument[4],argument[5], argument[8], argument[6],argument[7]);
    break;  }
}



if (argument[3]  // >= 1
&&  argument[3]<global.palette_image_W )
{
    pal_swap_reset();
}
*/




