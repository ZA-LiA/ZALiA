/// Eyenocc_init2()


var _i,_j, _idx, _val,_val1, _count,_count1;
var _dk, _str, _len, _pos;

GO_init_palidx(global.PI_MOB_ORG);



/*
Y_DESPAWN = cam_yb_max()+($3<<3);


// ver 3 can move to diff rooms for puzzle reasons
if(!is_undefined(dk_spawn))
{
    _val = f.dm_quests[?dk_spawn+STR_Rm];
    if(!is_undefined(_val) 
    &&  g.rm_name != _val )
    {   // has moved to diff room
        instance_destroy();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}



if(!is_undefined(dk_spawn))
{   // Remember last xy
    var _X = f.dm_quests[?dk_spawn+STR_Position+"_x"];
    var _Y = f.dm_quests[?dk_spawn+STR_Position+"_y"];
    if(!is_undefined(_X) 
    && !is_undefined(_Y) )
    {
        set_xy(id,_X,_Y);
        
        if (ver==3 
        &&  yt>=Y_DESPAWN )
        {
            instance_destroy();
            exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
    }
}
*/



dm = ds_map_create();

if(!is_undefined(dk_spawn))
{
    //  _DATA example: "086B186B_1852_"
    // Each "_" is the end of a sequence num
    // Each 4 chars are a sub-sequence num of the 
    // sequence and are the destination row & clm.
    var _DATA = g.dm_spawn[?dk_spawn+STR_Sequence];
    if(!is_undefined(_DATA) 
    &&  is_string(   _DATA) )
    {
        _count = string_count("_",_DATA);
        dm[?STR_Sequence+STR_Count] = _count;
        for(_i=0; _i<_count; _i++)
        {
            _len = string_length( _DATA);
            _pos = string_pos("_",_DATA);
            _str = string_copy(   _DATA,1,_pos-1);
            if (_len>_pos) _DATA = string_copy(_DATA,_pos+1,_len-_pos);
            
            _count1 = string_length(_str)>>2;
            dm[?STR_Sequence+string(_i+1)+STR_Count] = _count1;
            for(_j=0; _j<_count1; _j++)
            {
                _val = string_copy(_str, (_j<<2)+1, 4);
                _val = str_hex(_val);
                dm[?STR_Sequence+string(_i+1)+string(_j+1)+"_X"] = ((_val>>0)&$FF) <<3;
                dm[?STR_Sequence+string(_i+1)+string(_j+1)+"_Y"] = ((_val>>8)&$FF) <<3;
            }
        }
    }
}



    sequence_num = $00;
if(!is_undefined(dk_spawn))
{
    sequence_num = val(f.dm_quests[?dk_spawn+STR_Sequence+STR_Num],sequence_num);
    if (sequence_num>>4>=val(dm[?STR_Sequence+STR_Count]))
    {
        sequence_num = (val(dm[?STR_Sequence+STR_Count])<<4) | max(sequence_num&$F, 1);
        sequence_num = (sequence_num&$F0) | val(dm[?STR_Sequence+string(sequence_num>>4)+STR_Count], sequence_num&$F);
    }
}




Source_xl = xl;
Source_yt = yt;
if (sequence_num)
{
    Source_xl = val(dm[?STR_Sequence+hex_str(sequence_num)+"_X"], Source_xl);
    Source_yt = val(dm[?STR_Sequence+hex_str(sequence_num)+"_Y"], Source_yt);
}
set_xlyt(id, Source_xl,Source_yt);

Destination_xl = xl;
Destination_yt = yt;

for(_i=(hh>>3)-1; _i>=0; _i--)
{
    for(_j=(ww>>3)-1; _j>=0; _j--)
    {
        tile_change_1a(0, xl+(_j<<3),yt+(_i<<3), -1,0, TID_SOLID1);
    }
}




                   _i=0;
sub_state_IDLE   = _i++;
sub_state_MOVING = _i++;
sub_state        = sub_state_IDLE;


                      _i=0;
Eye_state_OPEN_HALF = _i++;
Eye_state_OPEN_FULL = _i++;
Eye_state_CLOSED    = _i++;
Eye_state           = Eye_state_OPEN_HALF;
if (sequence_num>>4==val(dm[?STR_Sequence+STR_Count]))
{
    Eye_state = Eye_state_CLOSED;
}


sprite_OPEN_FULL = spr_Eyenocc01_1;
sprite_CLOSED    = spr_Eyenocc01_2;
sprite_OPEN_HALF = spr_Eyenocc01_3;
switch(Eye_state){
default:                   {GO_sprite_init(sprite_OPEN_FULL); break;}
case   Eye_state_OPEN_HALF:{GO_sprite_init(sprite_OPEN_HALF); break;}
case   Eye_state_CLOSED:   {GO_sprite_init(sprite_CLOSED);    break;}
}


Pupil_can_draw = false;
Pupil_xl = x-1;
Pupil_yt = y-0;
Pupil_h  = 1;




