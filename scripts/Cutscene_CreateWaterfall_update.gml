/// Cutscene_CreateWaterfall_update()


switch(sub_state)
{
    // ----------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHECK0:{
    if (timer) timer--;
    if (timer) break;
    
    // Make sure enemies have spawned
    var _spawned = false;
    with(Enemy)
    {
        if (state)
        {
            _spawned = true;
            break;
        }
    }
    
    if(!_spawned) break;
    
    
    
    
    with(TyellManager) ds_list_add(other.dl_Tyell_SPAWN_DK, dk_spawn);
    with(Tyell)        ds_list_add(other.dl_Tyell_SPAWN_DK, dk_spawn);
    
    
    timer     = 0;
    sub_state = SUB_STATE_CHECK1;
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_CHECK1:{
    if (timer) timer--;
    if (timer) break;
    
    // Check if all enemies are dead.
    var _complete=true;
    with(Enemy)
    {
        if (state)
        {   // Make sure it's a defeatable enemy just in 
            // case Rando puts an un-defeatable enemy here
            if (is_ancestor(object_index,Tyell))
            {
                _complete=false;
                break;//with(Enemy)
            }
            
            
            // GOB var 'react_sword': -------------------------
            //      Each byte is reaction type. 
            //      Each bit of a byte is sword atk type
            
            //      $01: stab high,      $02: stab low,      $04: thrust dw,     $08: thrust up, 
            //      $10: ,               $20: ,              $40: ,              $80: 
            
            //      $0000FF: take dmg, 
            //      $00FF00: body is like a shield/solid, 
            //      $FF0000: extra pushback/bounce
            // -----------------------------------------------
            
            
            /*
            //BIT_ATK1: stab stand
            //BIT_ATK2: stab crouch
            //BIT_ATK3: downthrust
            //BIT_ATK4: upthrust
            // ** OG data shows only Tektite & Zora have solid body ($00FF00)
            if ((_react_sword>>8)&_ATK_BITS)  // If body IS a solid to this type of sword strike
            {
                if (f.items&ITM_SWRD  // ITM_SWRD can pierce solid body
                && (!pc_is_cucco() || g.CuccoSpell2_Active) 
                && !is_ancestor(object_index,SpikeTrap) )
                {
                    _react_sword |= (_react_sword>>8)&_ATK_BITS;
                }
            }
            */
            if (react_sword)
            {
                var _vulnerability = (react_sword>>0)&$FF;
                var _SOLID         = (react_sword>>8)&$FF;
                var                     _ATK_BITS  = BIT_ATK1|BIT_ATK2;
                if (f.skills&SKILL_THD) _ATK_BITS |= BIT_ATK3;
                if (f.skills&SKILL_THU) _ATK_BITS |= BIT_ATK4;
                
                if (f.items&ITM_SWRD)
                {    _vulnerability |=  _SOLID;  }
                else _vulnerability &= ~_SOLID;
                
                     _vulnerability &= _ATK_BITS;
                //
                if ( _vulnerability)
                {
                    _complete=false;
                    break;//with(Enemy)
                }
            }
            
            
            
            
            /*
            // react_proj
            // PC projectile bits. 0: none, 1: Beam, 2: FIRE, 4: 
            // 0 means no reaction, projectile will just move right through.
            // body is vulnerable:      $0000FF
            // disintigrate on body:    $00FF00
            // ?                        $FF0000
            */
            if ( react_proj&$1                         // if pc proj BEAM can damage
            ||  (react_proj&$2 && f.spells&SPL_FIRE) ) // if pc proj FIRE can damage
            {
                _complete=false;
                break;//with(Enemy)
            }
            
            
            
            
            /*
            // Proj BodyHB to PC ShieldHB interaction.
            // $000000: none/passive. Unblockable
            //     $01: die/explode/disintegrate. 
            //     $02: Bounce off and fall.      
            //     $04: Reverse direction.        
            //     $08: Stick, Remove REFLECT, 
            //   $0100: REFLECT needed if $01 bit
            //   $0200: REFLECT needed if $02 bit
            //   $0400: REFLECT needed if $04 bit
            //   $0800: REFLECT needed if $08 bit
            // $010000: Sound 1
            PSa1 =     $01; // die/explode/disintegrate. 
            PSa2 = $010001; // die/explode/disintegrate.                 With Sound 1
            PSa3 =   $0101; // die/explode/disintegrate. REFLECT needed. 
            PSa4 = $010101; // die/explode/disintegrate. REFLECT needed. With Sound 1
            PSa5 = $020101; // die/explode/disintegrate. REFLECT needed. With Sound 2
            
            PSb1 =     $02; // Bounce off and fall.      
            PSb2 = $010002; // Bounce off and fall.                      With Sound 1
            PSb3 =   $0202; // Bounce off and fall.      REFLECT needed. 
            PSb4 = $010202; // Bounce off and fall.      REFLECT needed. With Sound 1
            
            PSc1 =     $04; // Reverse direction.        
            PSc2 = $010004; // Reverse direction.                        With Sound 1
            PSc3 =   $0404; // Reverse direction.        REFLECT needed. 
            PSc4 = $010404; // Reverse direction.        REFLECT needed. With Sound 1
            PSc5 = $010405; // Reverse dir or die.       REFLECT needed to reverse dir. With Sound 1
            */
            // Axe, Bullet1,Bullet2, Fireball1,Fireball2, Mace1,Mace2, Rock1,Rock2,Rock3, SoundWave
            if (f.spells&SPL_RFLC 
            &&  projectile )
            {
                var _PROJ_OBJVER = object_get_name(projectile)+hex_str(projectile_ver);
                if (val(g.dm_go_prop[?_PROJ_OBJVER+dk_ReactShield])&$4) // if projectile is REFLECT-able
                {
                    var _ENEMY_OBJVER = object_get_name(object_index)+hex_str(ver);
                    if (val(g.dm_go_prop[?_ENEMY_OBJVER+STR_REFLECT+STR_Vulnerable+_PROJ_OBJVER])) // if vulnerable to projectile
                    {
                        _complete=false;
                        break;//with(Enemy)
                    }
                }
            }
        }
    }
    
    
    
    if (_complete)
    {
        f.dm_quests[?STR_Nabooru+STR_Quest+STR_Complete] = true;
        
        
        // Set Tyell spawn permission so they can't spawn again.
        var _i, _spawn_dk;
        for(_i=ds_list_size(dl_Tyell_SPAWN_DK)-1; _i>=0; _i--)
        {
            _spawn_dk =     dl_Tyell_SPAWN_DK[|_i];
            // Commenting this out as temporary fix until a GO spawn_dk inclues save-file num and quest num.
            //g.dm_spawn[?_spawn_dk+STR_Spawn_Permission] = -1;
            
            // Setting it to 0 for now but changing areas will allow respawn.
            g.dm_spawn[?_spawn_dk+STR_Spawn_Permission] = 0;
            
            // TODO: GO spawn_dk need to include save-file num and quest num.
        }
        
        
        g.pc_lock = PC_LOCK_ALL;
        
        timer     = 0;
        sub_state = SUB_STATE_ACTV0;
    }
    
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV0:{
    if (timer) timer--;
    if (timer) break;
    
    // remove waterfall blocks
    Cutscene_CreateWaterfall_update_1a(Blocks1_CLM<<3,Blocks1_ROW<<3, Blocks1_CLMS*BlockTile_CLMS, Blocks1_TILE_COUNT);
    // remove exit blocks
    //Cutscene_CreateWaterfall_update_1a(Blocks2_CLM<<3,Blocks2_ROW<<3, Blocks2_CLMS*BlockTile_CLMS, Blocks2_TILE_COUNT);
    
    aud_play_combo1(3);
    
    with(LoDoA)
    {
        if(!counter) counter = -1; // -1: Tells LockedDoor to start opening process
    }
    
    
    timer     = DUR2; // Draw block crumble duration
    sub_state = SUB_STATE_ACTV1;
    
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV1:{
    if (timer) timer--;
    if (timer) break;
    
    // play quest completed sound
    if (g.counter1&$7 == $7)
    {
        aud_play_sound(get_audio_theme_track(dk_Fanfare), -1,false,-1, dk_Fanfare);
        //aud_play_sound(Audio.SND_SECRET_1A);
        timer     = 0;
        sub_state = SUB_STATE_ACTV2;
    }
    
    break;}
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV2:{
    if (timer) timer--;
    if (timer) break;
    
    // animate waterfall to destination
    if (rows_added >= $D 
    &&  AquiferWater_yoff < AquiferWater_yoff_MAX 
    && !(g.counter1 & AquiferWater_Rise_SPEED) )
    {
        AquiferWater_yoff++;
        tile_layer_shift(AquiferWater_DEPTH, 0,-1);
    }
    
    if(!(g.counter1&$7) 
    &&  rows_added < ROWS )
    {
        rows_added++;
    }
    
    
    if (rows_added >= ROWS)
    {
        tile_layer_show(Waterfall_DEPTH);
    }
    
    if (rows_added >= ROWS 
    &&  AquiferWater_yoff >= AquiferWater_yoff_MAX )
    {
        timer     = 0;
        sub_state = SUB_STATE_DONE;
    }
    
    break;}
    
    
    
    
    
    // ----------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_ACTV3:{ // Exit blocks crumble
    if (timer) timer--;
    if (timer) break;
    
    timer     = 0;
    sub_state = SUB_STATE_DONE;
    
    break;}
    
    
    
    
    
    
    // ----------------------------------------------------------------------
    // --------------------------------------------------------------
    case SUB_STATE_DONE:{
    if (timer) timer--;
    if (timer) break;
    
    g.pc_lock = 0;
    
    instance_destroy();
    
    break;}
}




