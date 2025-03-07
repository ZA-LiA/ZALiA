/// draw_pc_skin(x, y, xscale, yscale, *behavior, *use disguise, *shield level, *sword level, *palette idx, *sword palette idx, *color)


with(g.pc)
{
    var                     _arg = 0;
    var _X       = argument[_arg++]; // pc center x
    var _Y       = argument[_arg++]; // pc center y
    var _X_SCALE = argument[_arg++];
    var _Y_SCALE = argument[_arg++];
    
    var                                             _BEHAVIOR     = behavior;
    if (argument_count>_arg && argument[_arg++]>=0) _BEHAVIOR     = argument[_arg-1];
                                                    _BEHAVIOR     = val(dm_skins[?STR_Clm+hex_str(_BEHAVIOR)]);
    
    var                                             _USE_DISGUISE = use_disguise;
    if (argument_count>_arg && argument[_arg++]>=0) _USE_DISGUISE = argument[_arg-1];
    
    var                                             _SHIELD_LEVEL = 1 + sign(f.items&ITM_SHLD);
    if (argument_count>_arg && argument[_arg++])    _SHIELD_LEVEL = argument[_arg-1];
    
    var                                             _SWORD_LEVEL  = 1 + sign(f.items&ITM_SWRD);
    if (argument_count>_arg && argument[_arg++])    _SWORD_LEVEL  = argument[_arg-1];
    
    var                                             _PALIDX       = Draw_palidx;
    //var                                             _PALIDX       = get_pi(palidx, palidx_permut);
    if (argument_count>_arg && argument[_arg++]>=0) _PALIDX       = argument[_arg-1];
    
    var                                             _SWORD_PALIDX = sword_palidx;
    if (argument_count>_arg && argument[_arg++]>=0) _SWORD_PALIDX = argument[_arg-1];
    
    var                                             _COLOR        = c_white;
    if (argument_count>_arg && argument[_arg++]>=0) _COLOR        = argument[_arg-1];
    
    var                                             _ROTATION     = 0;
    if (argument_count>_arg && argument[_arg++]>=0) _ROTATION     = argument[_arg-1];
    
    
    
    
    if(!val(dm_skins[?hex_str(val(dm_skins[?STR_Current+STR_Idx]))+"_source_is_file"]))
    {
        switch(PCSkins_SYS_VER)
        {
            case 1:{
            var _val, _sub_image_index;
            
            pal_swap_set(p.palette_image, _PALIDX);
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
                _val = $5 + (disguise_idx*$5);
                _sub_image_index = (val(dm_skins[?STR_Row+STR_Body+"02"]) * $10) + _val + _BEHAVIOR;
                draw_sprite_(Skin_image,_sub_image_index, _X,_Y, -1, _X_SCALE,_Y_SCALE, _COLOR,1, _ROTATION);
            }
            
            // Sword
            _val = _SWORD_LEVEL;
            _sub_image_index = (val(dm_skins[?STR_Row+STR_Sword+hex_str(_val)]) * $10) + _BEHAVIOR;
            draw_sprite_(Skin_image,_sub_image_index, _X,_Y, -1, _X_SCALE,_Y_SCALE, _COLOR,1, _ROTATION);
            
            pal_swap_reset();
            break;}
            
            
            
            
            case 2:{ // Giant sprite off all pc skin sprites
            /*
            _dk1 = 'Link-Kazunobu Shimizu'; // ------------------------------------
            _skin_idx++;
            dm_skins[?hex_str(_skin_idx)+STR_Datakey] = _dk1;
            dm_skins[?hex_str(_skin_idx)+STR_Name]    = 'Link';
            dm_skins[?hex_str(_skin_idx)+STR_Creator] = 'Kazunobu Shimizu';
            dm_skins[?hex_str(_skin_idx)+STR_Palette] = '0D362A18'+'0D361618'+'0D36112D';
                      _dk2 = _dk1+'_Shield0100';
            dm_skins[?_dk2+STR_Placed+'_xl'] = $07E0;
            dm_skins[?_dk2+STR_Placed+'_yt'] = $0122;
            dm_skins[?_dk2+'_xoff']          = $25;
            dm_skins[?_dk2+'_yoff']          = $14;
            dm_skins[?_dk2+'_w']             = $03;
            dm_skins[?_dk2+'_h']             = $0E;
                      _dk2 = _dk1+'_Shield0101';
            dm_skins[?_dk2+STR_Placed+'_xl'] = $05BD;
            dm_skins[?_dk2+STR_Placed+'_yt'] = $0132;
            dm_skins[?_dk2+'_xoff']          = $25;
            dm_skins[?_dk2+'_yoff']          = $20;
            dm_skins[?_dk2+'_w']             = $03;
            dm_skins[?_dk2+'_h']             = $0D;
            */
            var _i, _xl1,_xl2, _yt1,_yt2, _xoff,_yoff, _count;
            var  _w,_h, _dist;
            var _dk1;
            var _dl1 = ds_list_create();
            
            _i   = val(dm_skins[?STR_Current+STR_Idx]);
            _dk1 = val(dm_skins[?hex_str(_i)+STR_Datakey]);
            
            // Shield
            if(!_USE_DISGUISE) ds_list_add(_dl1, _dk1+STR_Shield+hex_str(_SHIELD_LEVEL)+hex_str(_BEHAVIOR));
            
            // Body
            if (_USE_DISGUISE) ds_list_add(_dl1, _dk1+STR_Disguise+STR_Body+hex_str(_BEHAVIOR));
            else               ds_list_add(_dl1, _dk1+STR_Body+"01"+hex_str(_BEHAVIOR));
            
            // Head
            if (_USE_DISGUISE) ds_list_add(_dl1, _dk1+STR_Disguise+STR_Head+hex_str(1+(disguise_idx&$1))+hex_str(_BEHAVIOR mod 5));
            
            // Sword
            ds_list_add(_dl1, _dk1+STR_Sword+hex_str(_SWORD_LEVEL)+hex_str(_BEHAVIOR));
            
            
            
            pal_swap_set(p.palette_image, _PALIDX);
            _count = ds_list_size(_dl1);
            for(_i=0; _i<_count; _i++)
            {
                _dk1 = _dl1[|_i];
                _w = dm_skins[?_dk1+'_w'];
                if(!is_undefined(_w))
                {
                    _h    = val(dm_skins[?_dk1+'_h']);
                    _xl2  = val(dm_skins[?_dk1+STR_Placed+'_xl']); // relative to spr_PCSkins_Full01
                    _yt2  = val(dm_skins[?_dk1+STR_Placed+'_yt']); // relative to spr_PCSkins_Full01
                    
                    _xl1  = _X - (Spritesheet_W>>1);
                    _xoff = val(dm_skins[?_dk1+'_xoff']);
                    if(!_X_SCALE)
                    {
                        _dist  =(Spritesheet_W>>1) - _xoff;
                        _xoff  = Spritesheet_W>>1;
                        _xoff += _dist*(-_X_SCALE);
                    }
                    _xl1 += _xoff;
                    
                    _yt1  = _Y - (Spritesheet_H>>1);
                    _yoff = val(dm_skins[?_dk1+'_yoff']);
                    if(!_Y_SCALE)
                    {
                        _dist  =(Spritesheet_H>>1) - _yoff;
                        _yoff  = Spritesheet_H>>1;
                        _yoff += _dist*(-_Y_SCALE);
                    }
                    _yt1 += _yoff;
                    draw_sprite_part_(Skin_image,0, _xl2,_yt2, _w,_h, _xl1,_yt1, -1, _X_SCALE,_Y_SCALE, _COLOR);
                }
            }
            pal_swap_reset();
            
            ds_list_destroy(_dl1); _dl1=undefined;
            break;}
        }
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
        
        
        pal_swap_set(p.palette_image, _PALIDX);
        // Shield
        if(!_USE_DISGUISE)
        {
            _val = 0 + (_SHIELD_LEVEL>1);
            _Sheet_y = _val * Spritesheet_H;
            draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y,        -1, _X_SCALE,_Y_SCALE, _COLOR);
        }
        
        // Body
        _val = 2 + sign(_USE_DISGUISE);
        _Sheet_y = _val * Spritesheet_H;
        draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y,            -1, _X_SCALE,_Y_SCALE, _COLOR);
        
        // Head
        _val = 4;
        if (_USE_DISGUISE) _val = 5 + disguise_idx;
        _Sheet_y = _val * Spritesheet_H;
        draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y,            -1, _X_SCALE,_Y_SCALE, _COLOR);
        pal_swap_reset();
        
        // Sword
        _val = 8 + (_SWORD_LEVEL>1);
        _Sheet_y = _val * Spritesheet_H;
        draw_sprite_part_(Skin_image,0, _Sheet_X,_Sheet_y, Spritesheet_W,Spritesheet_H, _x,_y, _SWORD_PALIDX, _X_SCALE,_Y_SCALE, _COLOR);
    }
}




