/// obj_start_Step()


if (counter>=DURATION1)
{
    goto_title_rm();
}
else
{
    if (counter<3) g.surf.draw_clear_color = COLOR1; // p.C_GRY3. Grey 3. Mid grey. 3rd brightest grey. 2nd darkest grey.
    else           g.surf.draw_clear_color = p.C_BLK1;
}


//counter++;
counter += 1*global.delta_multiplier;
//show_debug_message("obj_start_Step(). "+"counter="+string_format(counter,4,8));
/*
if (g.counter1==7)
{
    goto_title_rm();
}
else
{
         if (g.counter0<3) g.surf.draw_clear_color = p.C_GRY3; // Grey 3. Mid grey. 3rd brightest grey. 2nd darkest grey.
    else if (g.counter0>8) g.surf.draw_clear_color = p.C_BLK1;
    else                   g.surf.draw_clear_color = background_colour;
}
*/




