/// get_fall_scene_type()


var                       _direction = 0;
     if (is_exiting_rm()) _direction = g.exit_leave.exit_type & g.FallScene_BITS;
else if (is_exiting_ow()) _direction = val(global.OVERWORLD.dm[?hex_str(global.OVERWORLD.exit_grid_xy)+STR_CutScene]);

     if (is_string(_direction)) _direction = val(g.dm_cut_scene[?_direction+STR_ID]);
//

// Cannot have (both $8:UP and $4:DW) nor (both $1:RT and $2:LF)
return bit1st(_direction&($4|$8)) | bit1st(_direction&($1|$2));




