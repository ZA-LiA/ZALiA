///pal_swap_index_palette(palette sprite index)
//indexs a palette enabling pal_swap_get_pal_color().
//
//This is only used if you enabled palette indexing in your pal_swap_init_system() call.
//Allows you to use pal_swap_get_color() on any palette that has been indexed. This is slow, and
//should only be called once per palette right after the system is indexed.
//Again, this is not really recommended, but here's the functionality if you need it.

if(!ds_map_exists(Pal_Map,argument[0]))
{
    var _spr = argument[0];
    var _colors = sprite_get_height(_spr);
    var _palettes = ds_list_create();
    ds_map_add(Pal_Map,_spr,_palettes);
    
    //Draw the palette to a surface for reading.
    if(sprite_get_width(_spr)>1)
    {
        var _num = sprite_get_width(_spr);
        var _surface = surface_create(_num,_colors);
        surface_set_target(_surface);
        draw_clear_alpha(c_black,0);
        draw_sprite(_spr,0,0,0);
    }
    
    //Get the Palettes
    for(var i=0; i<_num;i++)
    {
        var _pal = ds_list_create();
        for(var ii=0; ii<_colors;ii++)
        {
            ds_list_add(_pal,surface_getpixel(_surface,i,ii));
        }
        ds_list_add(_palettes,_pal);
    }    
    
    show_debug_message(string(_num)+" palettes indexed for sprite: "+sprite_get_name(_spr));
    surface_reset_target();
    surface_free(_surface);
}
else
{
    show_debug_message("That palette has already been indexed.");
}
