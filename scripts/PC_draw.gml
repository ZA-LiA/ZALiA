/// PC_draw()


if (can_draw_self)
{
    if (RescueFairy_sprite)
    {
        draw_sprite_(RescueFairy_sprite,0, RescueFairy_draw_x,RescueFairy_draw_y, PI_MOB_RED, 1);
    }
    
    
    
    if ((is_cucco && Cucco_sprite_body) 
    ||  (is_fairy && fairy_sprite) 
    || (!is_cucco && !is_fairy && sprite) )
    {
        //sprite_get_name(spritesheet_PC_Default01)
        var _x,_y, _x1,_y1, _val;
        var _surf = surface_create(Draw_surface_size,Draw_surface_size);
        surface_set_target(_surf);
        draw_clear_alpha(c_black,0);
        
        // _x1/_y1: surface's center point
        _x1 = Draw_surface_size>>1;
        _y1 = Draw_surface_size>>1;
        
        if (is_cucco)
        {
            if (use_disguise 
            ||  Draw_behavior==behavior_DAMAGE )
            {
                _x = _x1;
                _y = _y1;
                draw_sprite_(Cucco_sprite_body,0, _x,_y, Draw_palidx, Draw_xscale1,Draw_yscale1, c_white,1, Draw_rotation1);
            }
            else
            {
                _x = _x1;
                _y = _y1;
                pal_swap_set(p.palette_image, Draw_palidx);
                if (Cucco_sprite_body==Cucco_SPRITE_BODY4   // crouch
                ||  Cucco_sprite_body==Cucco_SPRITE_BODY5 ) // crouch (head fwrd)
                {   // draw legs behind body
                    draw_sprite_(Cucco_sprite_legs,0, _x,_y, -1, Draw_xscale1,Draw_yscale1, c_white,1, Draw_rotation1);
                    draw_sprite_(Cucco_sprite_body,0, _x,_y, -1, Draw_xscale1,Draw_yscale1, c_white,1, Draw_rotation1);
                }else
                {   // draw legs in front of body
                    draw_sprite_(Cucco_sprite_body,0, _x,_y, -1, Draw_xscale1,Draw_yscale1, c_white,1, Draw_rotation1);
                    draw_sprite_(Cucco_sprite_legs,0, _x,_y, -1, Draw_xscale1,Draw_yscale1, c_white,1, Draw_rotation1);
                }
                
                if (Cucco_eye_can_draw)
                {
                    _x = _x1 + Cucco_eye_xoff;
                    _y = _y1 + Cucco_eye_yoff;
                    draw_point_colour(_x,_y, Cucco_eye_color);
                }
                
                _x = _x1;
                _y = _y1 + Cucco_sprite_wing_yoff;
                draw_sprite_(Cucco_sprite_wing,0, _x,_y, -1, Draw_xscale1,Draw_yscale1, c_white,1, Draw_rotation1);
                pal_swap_reset();
            }
        }
        else if (is_fairy)
        {
            _x = _x1;
            _y = _y1;
            draw_sprite_(fairy_sprite,0, _x,_y, Draw_palidx, Draw_xscale1,Draw_yscale1, c_white,1, Draw_rotation1);
        }
        else
        {
            _x = _x1;
            _y = _y1;
            draw_pc_skin(_x,_y, Draw_xscale1,Draw_yscale1, Draw_behavior, use_disguise, -1,-1, Draw_palidx,-1, -1, Draw_rotation1);
        }
        
        
        surface_reset_target();
        
        
        
        
        
        
        _x1 = drawX - (Draw_surface_size>>1);
        _y1 = drawY - (Draw_surface_size>>1);
        _x  = _x1;
        _y  = _y1;
        
        _val = 0;
        
        if (Draw_can_rando1 
        ||  Draw_can_rando2 )
        {
            // Unfortunately, the origin point of a surface is its XL/YT and cannot be 
            // set to its center. This means flipping and rotating may require some adjustments.
            
            // Think of 4 squares the size of the surface, arranged together in a square. 
            // Square 0: bottom right: Where things need to end up.
            // Square 1:    top right
            // Square 2:    top  left
            // Square 3: bottom  left
            // -----------------
            // |       |       |
            // |   2   |   1   |
            // |       |       |
            // ------- + .......
            // |       :       :
            // |   3   :   0   :
            // |       :       :
            // --------.........
            
            // First, get a square num by applying the scaling.
            // Since the surface's origin point(the '+' in the diagram) is its XL/YT, 
            // -Draw_xscale2 would put you in one of the left 2 squares(2 or 3), and 
            // -Draw_yscale2 would put you in one of the  top 2 squares(1 or 2).
            _val = 0;
            if (Draw_can_rando1)
            {
                     if(!Draw_xscale2 && !Draw_yscale2) _val = 2;
                else if(!Draw_xscale2)                  _val = 3;
                else if(!Draw_yscale2)                  _val = 1;
            }
            
            // Next, add the number of 90deg rotations (1, 2, or 3) to 
            // that square num to get a new square num.
            // *** Rotation is counter-clockwise and the rotation axis is 
            // always the XL,YT of square 0 (the '+' in the diagram), 
            // regardless of what the scales are.
            if (Draw_can_rando2 
            &&  Draw_rotation2 )
            {
                _val += Draw_rotation2 div 90; // 1,2,3,4,5,6
                _val  = _val mod 4;  // 0,1,2,3
            }
            
            // Finally, add the offsets to get back to square 0:
            // *** Some scenarios with the combination of negative 
            // scales and rotations will end up at square 0 and 
            // therefor won't need to add any offsets.
            switch(_val){
            case 1:{                       _y+=Draw_surface_size; break;} // square 1
            case 2:{_x+=Draw_surface_size; _y+=Draw_surface_size; break;} // square 2
            case 3:{_x+=Draw_surface_size;                        break;} // square 3
            }//switch(_val)
        }
        
        
        
        
        
        
        if (Shadow_can_draw) // PC Shadow During Boss Explosion
        {
            Shadow_can_draw = false;
            
            var _depth_COPY = depth;
            depth = Shadow_DEPTH;
            
            //_val = 8;
            //with(Boss) _val *= facingDir;
            draw_surface_ext(_surf, _x+Shadow_xoff,_y, Draw_xscale2,Draw_yscale2, Draw_rotation2, c_black,1);
            
            depth = _depth_COPY;
        }
        
        
        draw_surface_ext(_surf, _x,_y, Draw_xscale2,Draw_yscale2, Draw_rotation2, c_white,1);
        surface_free(_surf);
        
        
        
        
        if (0){// debug -------------------
        _val=.5; // alpha
        draw_rect_(c_green,   _x1,                  _y1,                   Draw_surface_size,Draw_surface_size, _val, true); // square 0, bottom right
        draw_rect_(c_fuchsia, _x1,                  _y1-Draw_surface_size, Draw_surface_size,Draw_surface_size, _val, true); // square 1,    top right
        draw_rect_(c_green,   _x1-Draw_surface_size,_y1-Draw_surface_size, Draw_surface_size,Draw_surface_size, _val, true); // square 2,    top left
        draw_rect_(c_fuchsia, _x1-Draw_surface_size,_y1,                   Draw_surface_size,Draw_surface_size, _val, true); // square 3, bottom left
        }
    }
}




/*
        else
        {   // Human form; Shield, Body, Sword
            if (Draw_can_rando2) _rot = dg_UwU_[#Draw_behavior,4];
            else                 _rot = 0;
            
            draw_spritesheet_pc(drawX,drawY, _x_scale,yScale, Draw_behavior, use_disguise, -1,-1, Draw_palidx,-1, -1, _rot);
            
            if (0)
            {
                _idx         = val(dm_skins[?STR_Current+STR_Idx]);
                _val         = val(dm_skins[?hex_str(_idx)+STR_Datakey]);
                var _W       = val(dm_skins[?STR_Frame+STR_Width]);
                var _H       = val(dm_skins[?STR_Frame+STR_Height]);
                var _Sheet_X = val(dm_skins[?STR_Clm+hex_str(Draw_behavior)]) * _W;
                var _Sheet_y = 0;
                var _X = drawX - (_W>>1) + (sign(!_x_scale)*_W);
                var _Y = drawY - (_H>>1) + (sign(!yScale)  *_H);
                
                if (val(dm_skins[?hex_str(_idx)+"_is_from_file"]))
                {
                    // For the 'Braffolk Custom Sprite Framework'
                    _sprite  = image_group_find_image(SPRITESHEETS_GROUP_NAME,_val);
                    
                    if(!use_disguise)
                    {
                        _val = 1 + sign(f.items&ITM_SHLD);
                        _Sheet_y = val(dm_skins[?STR_Row+STR_Shield+hex_str(_val)]) * _H;
                        draw_image_part_ext_(Draw_palidx, _sprite,0, _Sheet_X,_Sheet_y, _W,_H, _X,_Y, _x_scale,yScale);
                    }
                    
                    _val = 1 + sign(use_disguise);
                    _Sheet_y = val(dm_skins[?STR_Row+STR_Body+hex_str(_val)]) * _H;
                    draw_image_part_ext_(Draw_palidx, _sprite,0, _Sheet_X,_Sheet_y, _W,_H, _X,_Y, _x_scale,yScale);
                    
                    _val = 1 + (sign(use_disguise)*(disguise_idx+1));
                    _Sheet_y = val(dm_skins[?STR_Row+STR_Head+hex_str(_val)]) * _H;
                    draw_image_part_ext_(Draw_palidx, _sprite,0, _Sheet_X,_Sheet_y, _W,_H, _X,_Y, _x_scale,yScale);
                    
                    _val = 1 + sign(f.items&ITM_SWRD);
                    _Sheet_y = val(dm_skins[?STR_Row+STR_Sword+hex_str(_val)]) * _H;
                    draw_image_part_ext_(Draw_palidx, _sprite,0, _Sheet_X,_Sheet_y, _W,_H, _X,_Y, _x_scale,yScale);
                }
            }
        }
*/








//dev_create_pc_skin_sprite();









if(!g.DevTools_state) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



// Body. Toggle with 'N'
GO_draw_body_hb();

// Sword. Toggle with 'N'
GO_draw_sword_hb();

// Shield. Toggle with 'N'
GO_draw_shield_hb();

// draw ocs lines. Toggle with 'C'
GO_draw_ocs();

// CS: Collide Solid points. Toggle with 'H'
GO_draw_cs_points();

// SCS: Sword Collide Solid. Toggle with 'N'
PC_draw_scs();

// Draw PC hp. Toggle with 'V'
PC_draw_hp();

// Toggle with 'L'. Outline representing the og camera
draw_view_og_outline();




