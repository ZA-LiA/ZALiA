/// SpikeTrapA_init2()


var _i, _val, _len, _pos, _datakey;

DRAW_YOFF = 0;


switch(1) // testing different sprites
{
    case 1:{
    SPR_A = spr_Spike_ball_2a;
    SPR_B = SPR_A;
    SPR_C = SPR_A;
    break;}
    
    case 2:{
    SPR_A = spr_Spike_ball_3a;
    SPR_B = spr_Spike_ball_3b;
    SPR_C = spr_Spike_ball_3c;
    break;}
    
    case 3:{
    SPR_A = spr_Spike_ball_1a;
    SPR_B = spr_Spike_ball_1a;
    SPR_C = spr_Spike_ball_1b;
    break;}
    
    case 4:{
    SPR_A = spr_Spike_ball_2a;
    SPR_B = spr_Spike_ball_2a;
    SPR_C = spr_Spike_ball_2b;
    break;}
}


//Skull_SPRITE = 0;
if(!is_undefined(dk_spawn))
{
    var _DATAKEY = "_Skull";
    for(_i=1; _i<$10; _i++)
    {
        _val = g.dm_spawn[?dk_spawn+STR_Data+hex_str(_i)];
        if(!is_undefined(       _val) 
        &&  is_string(          _val) 
        &&  string_pos(_DATAKEY,_val) )
        {
            SPR_A = spr_SpikeBall09;
            //SPR_A = spr_SpikeBall08;
            SPR_B = SPR_A;
            SPR_C = SPR_A;
            //Skull_SPRITE = spr_Skull03;
            break;//_i
        }
    }
}

ds_list_add(dl_sprites,SPR_B);
ds_list_add(dl_sprites,SPR_C);




GO_init_palidx(global.PI_MOB_BLU);

facing_dir = 1;





switch(g.area_name){
case Area_PalcF:{ATTACK_LEVEL=$06; attack_level=ATTACK_LEVEL; break;}
case Area_PalcG:{ATTACK_LEVEL=$06; attack_level=ATTACK_LEVEL; break;}
}





//data_spawn(rm+STR_PRIO,SpTrA,$1,  x3,y5,  STR_Speed+_val1,  STR_Direction+_val2, STR_Duration+_val3, "_Skull"); // SpikeTrapA $1


// Change Direction Delay (after hitting solid)
Idle_DURATION1 = $40;
if(!is_undefined(dk_spawn)) Idle_DURATION1 = val(g.dm_spawn[?dk_spawn+STR_Duration],Idle_DURATION1);
Idle_DURATION1 = max(Idle_DURATION1,1);
Idle_timer     = Idle_DURATION1;




// Starting Direction
// Horizontal: $1-RIGHT, $2-LEFT, $3-First towards pc
// Vertical:   $4-DOWN,  $8-UP,   $C-First towards pc
var _DIRECTION = $4;
if(!is_undefined(dk_spawn)) _DIRECTION = val(g.dm_spawn[?dk_spawn+STR_Direction],_DIRECTION);
_DIRECTION = clamp(_DIRECTION,$1,$C);
if (_DIRECTION&$3==$3 
||  _DIRECTION&$C==$C )
{
    if (_DIRECTION&$3) _DIRECTION = $1<<(x>global.pc.x);
    else               _DIRECTION = $4<<(y>global.pc.y);
}




// Movement Speed
SPEED1 = $20;
if(!is_undefined(dk_spawn)) SPEED1 = val(g.dm_spawn[?dk_spawn+STR_Speed],SPEED1);
SPEED1 = clamp(SPEED1,$01,$7F);
speed1 = (SPEED1*sign_(_DIRECTION&$5)) &$FF;






hspd = 0;
vspd = 0;
if (_DIRECTION&$3) hspd=speed1;
else               vspd=speed1;




