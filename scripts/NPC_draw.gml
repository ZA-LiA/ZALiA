/// NPC_draw()


NPC_draw_door();



// --------------------------------------------------------------------------------
if(!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


// Draw "?" over head of NPC that has an undescovered hint
if (1 
&&  has_rando_hint )
{
    var _NUM = val(f.dm_rando[?STR_Rando+STR_Hint+dialogue_datakey+STR_Hint+STR_Num]);
    if (_NUM 
    &&  is_undefined(g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_NUM)+STR_Dialogue]) )
    {
        draw_text_(x-4, yt-6, "?");
    }
}



if (sprite_datakey==STR_Zant)
{
    if (g.counter1&($1<<3) 
    ||  CastSpellSprite_timer )
    {    var _WING_SPR = spr_Wing_1b_1;  } // b: down
    else var _WING_SPR = spr_Wing_1a_1;    // a: up
    pal_swap_set(p.palette_image, palidx);
    draw_sprite_(_WING_SPR,0, drawX,drawY, -1,  1);
    draw_sprite_(_WING_SPR,0, drawX,drawY, -1, -1);
    GO_draw_sprite(sprite);
    pal_swap_reset();
}
else
{
    if (is_ver(id,NPC_0,2))
    {   // TOWN SIGN
        var _SPRITE = spr_Pole01Segment;
        var _H = sprite_get_height(_SPRITE);
        var _ROWS = max((hh>>3)-1, 1);
        var _Y1  = drawY+hh_;  // yb(ground)
            _Y1  = (_Y1>>3)<<3;// align w/ grid
            _Y1 -= (_ROWS<<3); // sign graphic yt
            _Y1 += _H>>1;      // sign board yc
        for(var _i=0; _i<_ROWS; _i++) draw_sprite_(_SPRITE,0, drawX,_Y1+(_H*_i), palidx);
        draw_sprite_(spr_SignBoard01,0, drawX,_Y1, palidx);
        //draw_sprite_(g.Sign_SPR1,0, drawX,(drawY>>3)<<3, palidx);
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    else if (is_ver(id,NPC_9,5))
    {
        Bot_draw();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    else
    {
        GameObject_draw_1a(sprite, palidx);
        
        if (is_ver(id,NPC_9,1)) // NPC_9,1: Bagu
        {   // Draw Riverman portrait
            var     _DEPTH = depth;
            depth =  DEPTH_BG5+1;
            draw_sprite_(spr_Riverman_portrait_1a_1,0, ((drawX>>3)<<3)+(6<<3), ((drawY>>3)<<3)-(3<<3)-4, PI_BGR_4);
            depth = _DEPTH;
        }
    }
}




