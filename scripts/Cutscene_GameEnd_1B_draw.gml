/// Cutscene_GameEnd_1B_draw()


var _i, _x,_y;


var _ADJ1 = (-($03<<3)) + $04;
if (triforce_can_draw)
{
    _x  = viewXC() - ($02<<3);
    var _Y  = GROUND_Y - ($0E<<3);
        _Y += _ADJ1;
    //
    for(_i=0; _i<3; _i++)
    {
                   _x +=  8;
        if (_i==1) _y  = _Y - $10;
        else       _y  = _Y;
        draw_sprite_(TRIFORCE_SPR,0, _x,_y, p.triforce_pi);
    }
}


if (THE_END_can_draw)
{
    //var _PAD = 4;
    var _DIST1 = $C;
    var _DIST2 = 4<<3;
    var _X1  = g.rm_w_ - _DIST2 - _DIST1;
    var _X2  = g.rm_w_ + _DIST2 - _DIST1;
        _X2 -= 2; // Micro adjustment
    var _Y   = GROUND_Y - ($02<<3);
        _Y  += 3;  // Micro adjustment
    draw_text_(_X1,_Y, "THE",0, THE_END_PI);
    draw_text_(_X2,_Y, "END",0, THE_END_PI);
}


if (dg_CREDITS[#0,0]) // credits idx
{
    var _text;
    var _LAST = dg_CREDITS[#0,0]==CREDITS_COUNT1-1;
    var _ADJ  = -(($04<<3)+$08);
    
    var _Y1 = GROUND_Y-($11<<3)-$02;
    var _Y2 = GROUND_Y-($10<<3)+_ADJ1;
    if (_LAST) _y = _Y2;
    else       _y = _Y1;
    //_y  = GROUND_Y-($10<<3);
    //if (_LAST) _y += _ADJ1; // "THANKS A MILLION" text
    
    if (dg_CREDITS[#0,3]&$1) // "STAFF" can draw
    {
        _text = dg_CREDITS[#dg_CREDITS[#0,0],5];
        //_x  = CREDITS_CLM1<<3;
        _x  = viewXC();
        _x -= (string_length(_text)<<3)>>1;
        //_x -= (dg_CREDITS[#0,3]!=1) <<2; // Micro adjustment
        //if (_LAST) _x += _ADJ;
        draw_text_(_x,_y, _text,0, CREDITS_STAF_PI);
    }
    
    if (dg_CREDITS[#0,4]  // 4: job title can draw
    &&  is_string(dg_CREDITS[#dg_CREDITS[#0,0],0]) )
    {
        _x    = CREDITS_CLM2<<3;
        //if (_LAST) _x += _ADJ;
        if (_LAST) _y += $04<<3;
        else       _y += $03<<3;
        //_y   += $04<<3;
        _text = dg_CREDITS[#dg_CREDITS[#0,0],0];
        draw_text_(_x,_y, _text,0, CREDITS_TITL_PI);
    }
    
    if (dg_CREDITS[#0,5]) // 5: name can draw
    {
        _x  = CREDITS_CLM1<<3;
        if (_LAST) _x += _ADJ;
        else       _x -= ($02<<3)+$04;
        var _X1=_x;
        
        for(_i=1; _i<CREDITS_COUNT2-2; _i++)
        {
                _text  = dg_CREDITS[#dg_CREDITS[#0,0],_i];
            if (_text == 0) break;
            
            _x=_X1;
            if (dg_CREDITS[#dg_CREDITS[#0,0],6]) // indicator to center text
            {
                _x  = viewXC() - ((string_length(_text)<<3)>>1);
            }
            //if (string_pos("CHIMING",_text)) _x -= $06<<3;
            
            _y += $02<<3;
            draw_text_(_x,_y, _text,0, CREDITS_NAME_PI);
        }
    }
}




if (triforce_can_draw)
{
    var _TEXT1 = "-CLEAR QUEST TIME-";
    _x  = viewXC();
    _x -= (sprite_get_width(global.dl_game_font[|global.game_font_idx]) * string_length(_TEXT1)) >>1;
    _y  = GROUND_Y - ($6<<3);
    draw_text_(_x,_y, _TEXT1);
    
    _x  = viewXC();
    _x -= (sprite_get_width( global.dl_game_font[|global.game_font_idx]) * string_length(global.QuestTimer_text)) >>1;
    _y +=  sprite_get_height(global.dl_game_font[|global.game_font_idx]);
    _y += $4;
    draw_text_(_x,_y, global.QuestTimer_text,0, CREDITS_STAF_PI);
}




