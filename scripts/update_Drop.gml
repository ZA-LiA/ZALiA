/// update_Drop()


var _i, _val;


// 98F8 & 98FB
if (collisionProjCS(0,0))
{
    if(!control 
    &&  available_update_idx_gob(MAX_GOB1)!=UIDX_NULL 
    &&  from_spawner_count()<6 )
    {
        var _obj = Bot_A;
        var _ver = 1;
        
        var _DATAKEY=STR_Randomize+STR_Enemy;
        var _IS_RANDO = val(global.dm_save_file_settings[?_DATAKEY+STR_Spawner]);
        if (_IS_RANDO)
        {
            var _DIFFICULTY = val(global.dm_save_file_settings[?_DATAKEY+STR_Difficulty],1);
            var _difficulty = 0;
            
            if(!_difficulty 
            &&  _DIFFICULTY>=4 
            && !irandom($7F) )
            {   _difficulty =4;  }
            
            if(!_difficulty 
            &&  _DIFFICULTY>=3 
            && !irandom($3F) )
            {   _difficulty =3;  }
            
            if(!_difficulty 
            &&  _DIFFICULTY>=2 
            && !irandom($7) )
            {   _difficulty =2;  }
            
            _difficulty = clamp(_difficulty, 1,g.RandoEnemy_difficulty_MAX);
            
            /* // keeping this as backup
            var _difficulty = 1;
            //var _difficulty = irandom(_DIFFICULTY-1) + 1;
                //_difficulty = choose(1,1,1,1,1, 2,2,2, 3,3);
            var _RAND = irandom(99);
            if (_DIFFICULTY>=2 
            &&  _RAND<35 )
            {   _difficulty =2;  }
            
            if (_DIFFICULTY>=3 
            &&  _RAND<15 )
            {   _difficulty =3;  }
            */
            
            /* // keeping this as backup
            var                             _dl_CHANCES=ds_list_create();
            if (_DIFFICULTY>=1) ds_list_add(_dl_CHANCES,1,1,1,1,1,1,1,1,1,1,1,1,1);
            if (_DIFFICULTY>=2) ds_list_add(_dl_CHANCES,2,2,2,2,2,2,2);
            if (_DIFFICULTY>=3) ds_list_add(_dl_CHANCES,3,3);
            ds_list_shuffle(_dl_CHANCES);
            _difficulty =   _dl_CHANCES[|0];
            ds_list_destroy(_dl_CHANCES); _dl_CHANCES=undefined;
            */
            
            var _datakey = STR_Dripper+STR_Difficulty+hex_str(_difficulty);
            var _COUNT = val(g.dm_RandoEnemy[?_datakey+STR_Count]);
            if (_COUNT>1)
            {
                _datakey += hex_str(irandom(_COUNT-1));
                _obj = val(g.dm_RandoEnemy[?_datakey+STR_Object], _obj);
                _ver = val(g.dm_RandoEnemy[?_datakey+STR_Version], 1);
            }
            
            /* // keeping this as backup
            var            _DIFFICULTY = val(f.dm_rando[?_DATAKEY+STR_Difficulty],1);
                           _DIFFICULTY = clamp(_DIFFICULTY,1,3);
                           //_DIFFICULTY = 3; // ** TESTING **
            switch(irandom(_DIFFICULTY-1)+1) // 1,2,3
            {
                case 1:{//----------------------------------------
                    switch(irandom($07)){
                    case $00:{_obj=Bot_A; _ver=1; break;}
                    case $01:{_obj=Bot_A; _ver=2; break;}
                    case $02:{_obj=LowdA; _ver=1; break;}
                    case $03:{_obj=MegmA; _ver=1; break;}
                    case $04:{_obj=Myu_A; _ver=1; break;}
                    case $05:{_obj=WosuA; _ver=1; break;}
                    case $06:{_obj=Moa_A; _ver=1; break;} // red Moa
                    case $07:{_obj=BubbA; _ver=1; break;}
                    }
                break;}
                
                case 2:{//----------------------------------------
                    switch(irandom($0C)){
                    case $00:{_obj=OctoA; _ver=2; break;} // walking Octorok
                    case $01:{_obj=AnerA; _ver=2; break;} // walking Aneru
                    case $02:{_obj=MoblA; _ver=1; break;}
                    case $03:{_obj=MoblA; _ver=2; break;}
                    case $04:{_obj=GoriA; _ver=1; break;}
                    case $05:{_obj=GoriA; _ver=2; break;}
                    case $06:{_obj=StalA; _ver=1; break;}
                    case $07:{_obj=Stallakk; _ver=1; break;}
                    case $08:{_obj=IrKnA; _ver=1; break;}
                    case $09:{_obj=IrKnA; _ver=2; break;}
                    case $0A:{_obj=BubbA; _ver=1; break;}
                    case $0B:{_obj=BubbA; _ver=2; break;} // fast Bubble
                    case $0C:{_obj=Moa_A; _ver=1; break;} // red Moa
                    }
                break;}
                
                case 3:{//----------------------------------------
                    switch(irandom($0F)){
                    case $00:{_obj=MoblA; _ver=3; break;}
                    case $01:{_obj=GoriA; _ver=3; break;}
                    case $02:{_obj=StalA; _ver=2; break;}
                    case $03:{_obj=GeruA; _ver=1; break;}
                    case $04:{_obj=GeruA; _ver=2; break;}
                    case $05:{_obj=GeruA; _ver=3; break;}
                    case $06:{_obj=DairA; _ver=1; break;}
                    case $07:{_obj=DairA; _ver=2; break;}
                    case $08:{_obj=DoomA; _ver=1; break;}
                    case $09:{_obj=IrKnA; _ver=3; break;}
                    case $0A:{_obj=FokkA; _ver=1; break;}
                    case $0B:{_obj=FokkA; _ver=2; break;}
                    case $0C:{_obj=FokuA; _ver=1; break;}
                    case $0D:{_obj=BoonA; _ver=1; break;}
                    case $0E:{_obj=BubbA; _ver=8; break;} // King Bubble
                    case $0F:{_obj=BlazA; _ver=2; break;} // hopping Blaze
                    //case $14:{_obj=AnerA; _ver=3; break;} // fire Aneru
                    }
                break;}
            }
            */
        }
        
        
        // B876 - spawn Bot
        var _xl,_yt;
        /*
        _xl  = xl;
        _yt  = get_ground_y(x,yb, -1, (yt>>3)<<3);
        //_yt  = get_ground_y(x,y, -1, (y>>3)<<3);
        _yt -= $10;
        
        //with(GameObject_create(_xl,_yt, _obj,_ver))
        */
        //with(GameObject_create(0,0, choose(LowdA,MegmA),1))
        with(GameObject_create(0,0, _obj,_ver))
        {
            var _OBJVER = object_get_name(object_index)+hex_str(ver);
            is_from_spawner = true;
            
            
            var       _dir  = Input.heldH;
            if(!_dir) _dir  = rand();
                      _dir &= $1;
            //
            if(!_dir) _dir  =  1;
            else      _dir  = -1;
            
            var _CARRY = (global.pc.yt&$FF) > 2;
            _xl = g.view_xl_og + ((8*_dir)&$FF) + _CARRY;
            _yt = global.pc.yt - 2;
            set_xlyt(id, _xl,_yt);
            
            facing_dir = dir_to_pc(id);
            
            
            // 9910
            _xl  =  other.xl;
            _yt  = (other.y>>3)<<3;
            _yt  = get_ground_y(other.x,other.y, -1, _yt);
            _yt -= hh;
            set_xlyt(id, _xl,_yt);
            if (_IS_RANDO) set_xy(id, other.x,y);
            if (_IS_RANDO) facing_dir = dir_to_pc_(id);
            
            
            
            if (is_ancestor(object_index,Ra__A))
            {
                var _Y1 = global.pc.yt+hh_; // where VSPD_MAX should occur
                _dir = sign_(y<_Y1);
                
                hspd = (HSPD*facing_dir) &$FF;
                vspd = 0;
                vspd_change = VSPD_CHANGE*_dir;
                
                    _val = abs(y-_Y1);
                if (_val < SPAWN_YOFF)
                {
                    _val = SPAWN_YOFF-_val; // dist to _Y1
                    _val = _val/SPAWN_YOFF; // dist to _Y1 percentage
                    vspd = round(VSPD_MAX*_val);
                    vspd = (vspd>>1)<<1; // keep it an even value
                    
                    vspd = (vspd*_dir) &$FF;
                    vspd_change = VSPD_CHANGE*_dir;
                }
            }
            else
            {
                if (ds_list_find_index(g.dl_RandoEnemy_OBJVER2,_OBJVER)==-1  // if NOT a flying enemy
                && !is_ancestor_(object_index,FokuA,WosuA) )
                {
                    hspd = ($08*facing_dir) &$FF;
                    vspd =  $E0;
                    if(!uses_vspd_sub)                    vspd = $FE; // Lowder, Megmat
                    if (is_ancestor_(object_index,MegmA)) vspd = $FB + (rand()&$1);
                    
                    if (_IS_RANDO) set_xy(id, x,y-1);
                }
                
                if (is_ancestor(object_index,Bot_A))
                {
                    HP_IDX  = $04; // g.dl_HP_DEFAULT[|$04] = $04
                    hp      = g.dl_HP[|HP_IDX];
                    counter = $FF;
                }
                else if (is_ancestor(object_index,StalA)) // Stalfos
                {
                    spawn_xl = xl;
                    spawn_yt = yt;
                    counter = 1; // has detached from chain
                }
            }
        }
        
        // 995A
        state = 0;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    }
    else
    {   // 993C
        state = state_EXPLODE;
        disintegrate_counter = $F2;
    }
}
else
{   // 9640, 9943
    vspd = (vspd+vspd_adj) &$FF;
    
    // DED4
    updateX();
    updateY();
    GO_update_cam_vars();
    
    
    if(!ocsH1(id)  // if NO width is w/in ocs area width
    ||  yt+8>cam_yb_max() )
    {
        state = 0;
        //if (g.mod_destroy_go_on_death && !state) GO_destroy_1a();
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    }
    
    
    Projectile_udd();
    Projectile_collision_1a();
    //Projectile_update_3a(true); // Projectile_update_1a(!isVal(pID, 6, 8));
}




