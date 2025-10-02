/// DungeonLayoutRando_testing()


if (keyboard_check_pressed(vk_f9)) global.DungeonLayoutRandoTesting_enabled = !global.DungeonLayoutRandoTesting_enabled;

if (global.DungeonLayoutRandoTesting_enabled)
{
    if (keyboard_check_pressed(vk_f10))
    {
        ds_map_clear(global.DungeonLayoutRandoTesting_dm);
        DungeonLayoutRando_testing_1();
    }
    
    
    var _XL0 = viewXC()-(global.DungeonLayoutRandoTesting_Background_W>>1);
    var _YT0 = viewYC()-(global.DungeonLayoutRandoTesting_Background_H>>1);
    draw_sprite_(spr_1x1_WHT,0, _XL0,_YT0, -1, global.DungeonLayoutRandoTesting_Background_W,global.DungeonLayoutRandoTesting_Background_H, c_black);
    
    
    if (ds_map_size(global.DungeonLayoutRandoTesting_dm))
    {
        var _SCENE_COUNT = val(global.DungeonLayoutRandoTesting_dm[?STR_Scene+STR_Count]);
        if (_SCENE_COUNT)
        {
            var _i, _xl,_yt;
            var _BGR_PAD_X = ($4<<3);
            var _BGR_PAD_Y = ($4<<3);
            var _XL1 = _XL0 + _BGR_PAD_X;
            var _YT1 = _YT0 + _BGR_PAD_Y;
            var _section_count_x,_section_count_y;
            var _map_clm0,_map_row0;
            for(_i=0; _i<_SCENE_COUNT; _i++)
            {
                _section_count_x = val(global.DungeonLayoutRandoTesting_dm[?STR_Scene+hex_str(_i)+STR_Section+STR_Count+"_X"]);
                _section_count_y = val(global.DungeonLayoutRandoTesting_dm[?STR_Scene+hex_str(_i)+STR_Section+STR_Count+"_Y"]);
                _map_clm0        = val(global.DungeonLayoutRandoTesting_dm[?STR_Scene+hex_str(_i)+STR_Section+"00"+"00"+STR_Map+STR_Clm]);
                _map_row0        = val(global.DungeonLayoutRandoTesting_dm[?STR_Scene+hex_str(_i)+STR_Section+"00"+"00"+STR_Map+STR_Row]);
                _xl = _XL1 + (_map_clm0<<3);
                _yt = _YT1 + (_map_row0<<3);
                draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _section_count_x<<3,_section_count_y<<3, c_red);
            }
        }
    }
}




