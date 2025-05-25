/// get_fall_scene_type()


var                        _direction = 0;
     if (is_exiting_rm())  _direction = g.exit_leave.exit_type & g.FallScene_BITS;
else if (is_exiting_ow())  _direction = val(global.OVERWORLD.dm[?hex_str(global.OVERWORLD.exit_grid_xy)+STR_CutScene]);

if (is_string(_direction)) _direction = val(g.dm_cut_scene[?_direction+STR_ID]);

// Cannot have (both DOWN and UP) nor (both RIGHT and LEFT)
_direction = (_direction>>g.FallScene_BITS_SHIFT) &$FF;
return bit1st(_direction&($4|$8)) | bit1st(_direction&($1|$2));
//return bit1st(_direction&(g.FallScene_BIT_DOWN|g.FallScene_BIT_UP)) | bit1st(_direction&(g.FallScene_BIT_RIGHT|g.FallScene_BIT_LEFT));




