/// PlatformA_init_2()


var _i;


//BODY_HB_IDX = -1;
BodyHB_idx = BodyHB_IDX;


dg_path[#0,1] = x;
dg_path[#0,2] = y;


var _path   = "00";
var _start  =  0;

if(!is_undefined(dk_spawn))
{
    path_dir = sign(val(g.dm_spawn[?dk_spawn+STR_Direction]));
    
    if(!is_undefined(   g.dm_spawn[?dk_spawn+STR_Path]))
    {           _path = g.dm_spawn[?dk_spawn+STR_Path];  }
    
    if(!is_undefined(   g.dm_spawn[?dk_spawn+STR_Start]))
    {      _start = val(g.dm_spawn[?dk_spawn+STR_Start]);  }
}



switch(ver)
{
    // -----------------------------------------------------------
    // -----------------------------------------------------------
    // -----------------------------------------------------------
    case 1:{ // ------------  PATH MOVEMENT ---------------------
    path_dir = sign_(path_dir);
    
    var _COUNT = string_length(_path)>>2;
    
    ds_grid_resize(dg_path, _COUNT, ds_grid_height(dg_path));
    ds_grid_clear( dg_path, 0);
    
    for(_i=_COUNT-1; _i>=0; _i--)
    {
        dg_path[#_i,1]  = str_hex(string_copy(_path,(_i<<2)+3,2)) <<3;
        dg_path[#_i,2]  = str_hex(string_copy(_path,(_i<<2)+1,2)) <<3;
        
        dg_path[#_i,1] += ww_;
        dg_path[#_i,2] += hh_;
    }
    
    
    // -1 means don't set location_a.
        _start = clamp(_start, -1, _COUNT-1);
    if (_start+1)
    {
        location_a = _start;
        location_b = location_a;
    }
    
    if (_COUNT-1) // if more than 1 location in the path.
    {
        if(!inRange(location_a+path_dir, 0,_COUNT-1))
        {
            path_dir = -path_dir;
        }
        
        location_b = location_a + path_dir;
    }
    
    set_xy(id, dg_path[#location_a,1], dg_path[#location_a,2]);
    
    timer = DELAY1_DUR;
    break;}//case 1:{
    
    
    
    
    
    
    
    
    // -----------------------------------------------------------
    // -----------------------------------------------------------
    // -----------------------------------------------------------
    case 2:{ // --------------  CIRCLE MOVEMENT  ----------------
    ds_grid_resize(dg_path, 2, ds_grid_height(dg_path));
    ds_grid_clear( dg_path, 0);
    location_a = 0;
    location_b = location_a + 1;
    
    
    spawn_xl = (spawn_xl <<3) - (ww>>1);
    spawn_yt = (spawn_yt <<3) - (hh>>1);
    set_xlyt(id, spawn_xl, spawn_yt);
    dg_path[# location_a, 1] = x;
    dg_path[# location_a, 2] = y;
    
    
    radius  = str_hex(_path)<<3;
    angle   = _start mod 360; // Start angle. mod 360 just in case
    
    set_xy_len_ang(id, dg_path[# location_a,1], dg_path[# location_a,2], radius, angle);
    dg_path[# location_b, 1] = x;
    dg_path[# location_b, 2] = y;
    
    
    REV_DUR = 3 * (radius >>5);
    rev_dur = REV_DUR;
    
    SPEED1 = (360 / rev_dur) / room_speed;
    speed1 = SPEED1;
    break;}//case 2:{
}//switch(ver)




