/// draw_background_part_ext_(palidx, bg, bg_x,bg_y, w,h, x,y, xscale,yscale)


pal_swap_set(p.palette_image,  argument0);

draw_background_part_ext(argument1,             // background
                         argument2, argument3,  // bg x, bg y
                         argument4, argument5,  // w, h
                         argument6, argument7,  // x, y
                         argument8, argument9,  // xscale, yscale
                         -1       , 1);         // color, alpha
pal_swap_reset();




