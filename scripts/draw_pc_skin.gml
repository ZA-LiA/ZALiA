/// draw_pc_skin(x, y, xscale, yscale, *behavior, *use disguise, *shield level, *sword level, *palette idx, *color, *rotation)


with(global.pc)
{
    var                     _arg = 0;
    var _X       = argument[_arg++]; // pc center x
    var _Y       = argument[_arg++]; // pc center y
    var _X_SCALE = argument[_arg++];
    var _Y_SCALE = argument[_arg++];
    
    var                                             _BEHAVIOR     = behavior;
    if (argument_count>_arg && argument[_arg++]>=0) _BEHAVIOR     = argument[_arg-1];
                                                    _BEHAVIOR     = val(dm_skins[?STR_Clm+hex_str(_BEHAVIOR)]);
    //
    var                                             _USE_DISGUISE = Disguise_enabled;
    if (argument_count>_arg && argument[_arg++]>=0) _USE_DISGUISE = argument[_arg-1];
    
    var                                             _SHIELD_LEVEL = 1 + sign(f.items&ITM_SHLD);
    if (argument_count>_arg && argument[_arg++])    _SHIELD_LEVEL = argument[_arg-1];
    
    var                                             _SWORD_LEVEL  = 1 + sign(f.items&ITM_SWRD);
    if (argument_count>_arg && argument[_arg++])    _SWORD_LEVEL  = argument[_arg-1];
    
    var                                             _PALIDX       = Draw_palidx;
    if (argument_count>_arg && argument[_arg++]>=0) _PALIDX       = argument[_arg-1];
    
    var                                             _COLOR        = c_white;
    if (argument_count>_arg && argument[_arg++]>=0) _COLOR        = argument[_arg-1];
    
    var                                             _ROTATION     = 0;
    if (argument_count>_arg && argument[_arg++]>=0) _ROTATION     = argument[_arg-1];
    
    
    
    
    if(!val(dm_skins[?hex_str(val(dm_skins[?STR_Current+STR_Idx]))+"_source_is_file"]))
    {
        var _val, _sub_image_index;
        
        pal_swap_set(global.palette_image, _PALIDX);
        // Shield
        if(!_USE_DISGUISE)
        {
            _val = _SHIELD_LEVEL;
            _sub_image_index = (val(dm_skins[?STR_Row+STR_Shield+hex_str(_val)]) * $10) + _BEHAVIOR;
            draw_sprite_(Skin_image,_sub_image_index, _X,_Y, -1, _X_SCALE,_Y_SCALE, _COLOR,1, _ROTATION);
        }
        
        // Body
        _val = 1 + sign(_USE_DISGUISE);
        _sub_image_index = (val(dm_skins[?STR_Row+STR_Body+hex_str(_val)]) * $10) + _BEHAVIOR;
        draw_sprite_(Skin_image,_sub_image_index, _X,_Y, -1, _X_SCALE,_Y_SCALE, _COLOR,1, _ROTATION);
        
        // Head
        if (_USE_DISGUISE)
        {
            _val = $5 + (Disguise_Head_idx*$5);
            _sub_image_index = (val(dm_skins[?STR_Row+STR_Body+"02"]) * $10) + _val + _BEHAVIOR;
            draw_sprite_(Skin_image,_sub_image_index, _X,_Y, -1, _X_SCALE,_Y_SCALE, _COLOR,1, _ROTATION);
        }
        
        // Sword
        _val = _SWORD_LEVEL;
        _sub_image_index = (val(dm_skins[?STR_Row+STR_Sword+hex_str(_val)]) * $10) + _BEHAVIOR;
        draw_sprite_(Skin_image,_sub_image_index, _X,_Y, -1, _X_SCALE,_Y_SCALE, _COLOR,1, _ROTATION);
        pal_swap_reset();
    }
    else
    {   // From 'custom_playercharacter_graphics' folder
        var _val, _x,_y;
        var _Sheet_X = _BEHAVIOR * Spritesheet_W;
        var _Sheet_y = 0;
        
        _x  = _X;
        _x -= Spritesheet_W>>1;
        _x += Spritesheet_W * sign(!_X_SCALE);
        
        _y  = _Y;
        _y -= Spritesheet_H>>1;
        _y += Spritesheet_H * sign(!_Y_SCALE);
        
        
        pal_swap_set(global.palette_image, _PALIDX);
        // Shield
        if(!_USE_DISGUISE)
        {
            _val = 0 + (_SHIELD_LEVEL>1);
            _Sheet_y = _val * Spritesheet_H;
            draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y, -1, _X_SCALE,_Y_SCALE, _COLOR);
        }
        
        // Body
        _val = 2 + sign(_USE_DISGUISE);
        _Sheet_y = _val * Spritesheet_H;
        draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y, -1, _X_SCALE,_Y_SCALE, _COLOR);
        
        // Head
        _val = 4;
        if (_USE_DISGUISE) _val = 5 + Disguise_Head_idx;
        _Sheet_y = _val * Spritesheet_H;
        draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y, -1, _X_SCALE,_Y_SCALE, _COLOR);
        pal_swap_reset();
        
        // Sword
        _val = 8 + (_SWORD_LEVEL>1);
        _Sheet_y = _val * Spritesheet_H;
        draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y, -1, _X_SCALE,_Y_SCALE, _COLOR);
        pal_swap_reset();
    }
}




