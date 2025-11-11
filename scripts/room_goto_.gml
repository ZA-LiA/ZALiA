/// room_goto_(room, *width, *height)


var                                  _view_w = g.VIEW_W;
if (argument_count>1 && argument[1]) _view_w = clamp(argument[1], 1<<8,4<<8);

var                                  _view_h = g.VIEW_H;
if (argument_count>2 && argument[2]) _view_h = clamp(argument[2], 1<<8,4<<8);

show_debug_message("room_goto_(). "+room_get_name(argument[0]));
room_set_view_(argument[0], _view_w,_view_h);
room_goto(     argument[0]);




