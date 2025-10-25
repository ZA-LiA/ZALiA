/// SmasherTrap01_init3(speed, x start_x, x start_y, x end_x, x end_y,  y start_x, y start_y, y end_x, y end_y)


var                              _i=0;
attack_speed          = argument[_i++];
attack_x_head_start_x = argument[_i++];
attack_x_head_start_y = argument[_i++];
attack_x_head_end_x   = argument[_i++];
attack_x_head_end_y   = argument[_i++];
attack_y_head_start_x = argument[_i++];
attack_y_head_start_y = argument[_i++];
attack_y_head_end_x   = argument[_i++];
attack_y_head_end_y   = argument[_i++];


if (attack_x_head_end_x!=attack_x_head_start_x)
{
    attack_x_head_x    = attack_x_head_start_x;
    attack_x_head_y    = attack_x_head_start_y;
    attack_x_direction = sign_(attack_x_head_end_x>attack_x_head_start_x);
    //attack_x_distance  = attack_x_head_end_x - attack_x_head_start_x;
    //attack_x_duration  = floor(abs(attack_x_distance)/attack_speed);
    
    //facing_dir = attack_x_direction;
}

if (attack_y_head_end_y!=attack_y_head_start_y)
{
    attack_y_head_x    = attack_y_head_start_x;
    attack_y_head_y    = attack_y_head_start_y;
    attack_y_direction = sign_(attack_y_head_end_y>attack_y_head_start_y);
    //attack_y_distance  = attack_y_head_end_y - attack_y_head_start_y;
    //attack_y_duration  = floor(abs(attack_y_distance)/attack_speed);
    
    //facing_dir = attack_y_direction;
}




