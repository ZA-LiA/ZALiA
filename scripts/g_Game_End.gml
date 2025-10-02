/// g_Game_End()


var _i;


/*
var _exists = false;

    _exists=variable_instance_exists(id,"dl_");
if (_exists) _exists = !is_undefined(    dl_);
if (_exists) _exists = ds_exists(        dl_,ds_type_list);
if (_exists)           ds_list_destroy(  dl_);
if (_exists)                             dl_=undefined;

    _exists=variable_instance_exists(id,"dm_");
if (_exists) _exists = !is_undefined(    dm_);
if (_exists) _exists = ds_exists(        dm_,ds_type_map);
if (_exists)           ds_map_destroy(   dm_);
if (_exists)                             dm_=undefined;

    _exists=variable_instance_exists(id,"dg_");
if (_exists) _exists = !is_undefined(    dg_);
if (_exists) _exists = ds_exists(        dg_,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_);
if (_exists)                             dg_=undefined;

    _exists=variable_instance_exists(id,"ds_");
if (_exists) _exists = !is_undefined(    ds_);
if (_exists) _exists = ds_exists(        ds_,ds_type_stack);
if (_exists)           ds_stack_destroy( ds_);
if (_exists)                             ds_=undefined;
*/



var _exists = false;




    _exists=variable_instance_exists(id,"StarSky_dl_surfaces");
if (_exists) _exists = !is_undefined(    StarSky_dl_surfaces);
if (_exists) _exists = ds_exists(        StarSky_dl_surfaces, ds_type_list);
if (_exists)
{
    for(_i=ds_list_size(StarSky_dl_surfaces)-1; _i>=0; _i--)
    {
        if (surface_exists(StarSky_dl_surfaces[|_i])) surface_free(StarSky_dl_surfaces[|_i]);
    }
    ds_list_destroy(StarSky_dl_surfaces); StarSky_dl_surfaces=undefined;
}



/*
if (              SignPole_SPR1 
&&  sprite_exists(SignPole_SPR1) )
{   sprite_delete(SignPole_SPR1);  }

if (              SignPole_SPR2 
&&  sprite_exists(SignPole_SPR2) )
{   sprite_delete(SignPole_SPR2);  }

if (              SignBoard_SPR1 
&&  sprite_exists(SignBoard_SPR1) )
{   sprite_delete(SignBoard_SPR1);  }

if (              Sign_SPR1 
&&  sprite_exists(Sign_SPR1) )
{   sprite_delete(Sign_SPR1);  }

if (              Leaf_SPR1 
&&  sprite_exists(Leaf_SPR1) )
{   sprite_delete(Leaf_SPR1);  }

if (              PlantPart1_SPR1 
&&  sprite_exists(PlantPart1_SPR1) )
{   sprite_delete(PlantPart1_SPR1);  }

if (              PlantPart2_SPR1 
&&  sprite_exists(PlantPart2_SPR1) )
{   sprite_delete(PlantPart2_SPR1);  }

if (              PlantPart2_SPR2 
&&  sprite_exists(PlantPart2_SPR2) )
{   sprite_delete(PlantPart2_SPR2);  }

if (              PlantPart3_SPR1 
&&  sprite_exists(PlantPart3_SPR1) )
{   sprite_delete(PlantPart3_SPR1);  }

if (              PlantPart4_SPR1 
&&  sprite_exists(PlantPart4_SPR1) )
{   sprite_delete(PlantPart4_SPR1);  }

    _exists=variable_instance_exists(id,"dl_PlantPart_SPR");
if (_exists) _exists = !is_undefined(    dl_PlantPart_SPR);
if (_exists) _exists = ds_exists(        dl_PlantPart_SPR, ds_type_list);
if (_exists)           ds_list_destroy(  dl_PlantPart_SPR);
if (_exists)                             dl_PlantPart_SPR=undefined;

if (              Block1_SPR1 
&&  sprite_exists(Block1_SPR1) )
{   sprite_delete(Block1_SPR1);  }

if (              Block2_SPR1 
&&  sprite_exists(Block2_SPR1) )
{   sprite_delete(Block2_SPR1);  }


if (              HeadMount1_SPR 
&&  sprite_exists(HeadMount1_SPR) )
{   sprite_delete(HeadMount1_SPR);  }

if (              HeadMount2_SPR 
&&  sprite_exists(HeadMount2_SPR) )
{   sprite_delete(HeadMount2_SPR);  }

if (              HeadMount3_SPR 
&&  sprite_exists(HeadMount3_SPR) )
{   sprite_delete(HeadMount3_SPR);  }

if (              HeadMount4_SPR 
&&  sprite_exists(HeadMount4_SPR) )
{   sprite_delete(HeadMount4_SPR);  }

if (              HeadMount5_SPR 
&&  sprite_exists(HeadMount5_SPR) )
{   sprite_delete(HeadMount5_SPR);  }
*/




if (              CloudLarge1_SPR1 
&&  sprite_exists(CloudLarge1_SPR1) )
{   sprite_delete(CloudLarge1_SPR1);  }




if (              TownDoor1_SPR 
&&  sprite_exists(TownDoor1_SPR) )
{   sprite_delete(TownDoor1_SPR);  }




if (surface_exists(global.Rain1_srf))
{   surface_free(  global.Rain1_srf);  }





















    _exists=variable_instance_exists(id,"dl_RandomOG");
if (_exists) _exists = !is_undefined(    dl_RandomOG);
if (_exists) _exists = ds_exists(        dl_RandomOG, ds_type_list);
if (_exists)           ds_list_destroy(  dl_RandomOG);
if (_exists)                             dl_RandomOG=undefined;

    _exists=variable_instance_exists(id,"dl_Fairy_SPRITES");
if (_exists) _exists = !is_undefined(    dl_Fairy_SPRITES);
if (_exists) _exists = ds_exists(        dl_Fairy_SPRITES, ds_type_list);
if (_exists)           ds_list_destroy(  dl_Fairy_SPRITES);
if (_exists)                             dl_Fairy_SPRITES=undefined;

    _exists=variable_instance_exists(id,"dl_HeartPiece_SPR");
if (_exists) _exists = !is_undefined(    dl_HeartPiece_SPR);
if (_exists) _exists = ds_exists(        dl_HeartPiece_SPR, ds_type_list);
if (_exists)           ds_list_destroy(  dl_HeartPiece_SPR);
if (_exists)                             dl_HeartPiece_SPR=undefined;

    _exists=variable_instance_exists(id,"dl_rising_xp_spr");
if (_exists) _exists = !is_undefined(    dl_rising_xp_spr);
if (_exists) _exists = ds_exists(        dl_rising_xp_spr, ds_type_list);
if (_exists)           ds_list_destroy(  dl_rising_xp_spr);
if (_exists)                             dl_rising_xp_spr=undefined;

    _exists=variable_instance_exists(id,"dl_AREA_NAME");
if (_exists) _exists = !is_undefined(    dl_AREA_NAME);
if (_exists) _exists = ds_exists(        dl_AREA_NAME, ds_type_list);
if (_exists)           ds_list_destroy(  dl_AREA_NAME);
if (_exists)                             dl_AREA_NAME=undefined;

    _exists=variable_instance_exists(id,"dl_exit_dirs");
if (_exists) _exists = !is_undefined(    dl_exit_dirs);
if (_exists) _exists = ds_exists(        dl_exit_dirs, ds_type_list);
if (_exists)           ds_list_destroy(  dl_exit_dirs);
if (_exists)                             dl_exit_dirs=undefined;

    _exists=variable_instance_exists(id,"dl_niao");
if (_exists) _exists = !is_undefined(    dl_niao);
if (_exists) _exists = ds_exists(        dl_niao, ds_type_list);
if (_exists)           ds_list_destroy(  dl_niao);
if (_exists)                             dl_niao=undefined;

    _exists=variable_instance_exists(id,"dl_cont_spr_hp");
if (_exists) _exists = !is_undefined(    dl_cont_spr_hp);
if (_exists) _exists = ds_exists(        dl_cont_spr_hp, ds_type_list);
if (_exists)           ds_list_destroy(  dl_cont_spr_hp);
if (_exists)                             dl_cont_spr_hp=undefined;

    _exists=variable_instance_exists(id,"dl_cont_spr_mp");
if (_exists) _exists = !is_undefined(    dl_cont_spr_mp);
if (_exists) _exists = ds_exists(        dl_cont_spr_mp, ds_type_list);
if (_exists)           ds_list_destroy(  dl_cont_spr_mp);
if (_exists)                             dl_cont_spr_mp=undefined;

    _exists=variable_instance_exists(id,"dl_HP");
if (_exists) _exists = !is_undefined(    dl_HP);
if (_exists) _exists = ds_exists(        dl_HP, ds_type_list);
if (_exists)           ds_list_destroy(  dl_HP);
if (_exists)                             dl_HP=undefined;

    _exists=variable_instance_exists(id,"dl_HP_DEFAULT");
if (_exists) _exists = !is_undefined(    dl_HP_DEFAULT);
if (_exists) _exists = ds_exists(        dl_HP_DEFAULT, ds_type_list);
if (_exists)           ds_list_destroy(  dl_HP_DEFAULT);
if (_exists)                             dl_HP_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dl_XP");
if (_exists) _exists = !is_undefined(    dl_XP);
if (_exists) _exists = ds_exists(        dl_XP, ds_type_list);
if (_exists)           ds_list_destroy(  dl_XP);
if (_exists)                             dl_XP=undefined;

    _exists=variable_instance_exists(id,"dl_XP_DEFAULT");
if (_exists) _exists = !is_undefined(    dl_XP_DEFAULT);
if (_exists) _exists = ds_exists(        dl_XP_DEFAULT, ds_type_list);
if (_exists)           ds_list_destroy(  dl_XP_DEFAULT);
if (_exists)                             dl_XP_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dl_XP_DRAIN");
if (_exists) _exists = !is_undefined(    dl_XP_DRAIN);
if (_exists) _exists = ds_exists(        dl_XP_DRAIN, ds_type_list);
if (_exists)           ds_list_destroy(  dl_XP_DRAIN);
if (_exists)                             dl_XP_DRAIN=undefined;

    _exists=variable_instance_exists(id,"dl_tileset");
if (_exists) _exists = !is_undefined(    dl_tileset);
if (_exists) _exists = ds_exists(        dl_tileset, ds_type_list);
if (_exists)           ds_list_destroy(  dl_tileset);
if (_exists)                             dl_tileset=undefined;

    _exists=variable_instance_exists(id,"dl_TILE_DEPTHS");
if (_exists) _exists = !is_undefined(    dl_TILE_DEPTHS);
if (_exists) _exists = ds_exists(        dl_TILE_DEPTHS, ds_type_list);
if (_exists)           ds_list_destroy(  dl_TILE_DEPTHS);
if (_exists)                             dl_TILE_DEPTHS=undefined;

    _exists=variable_instance_exists(id,"dl_TILE_DEPTH_NAMES");
if (_exists) _exists = !is_undefined(    dl_TILE_DEPTH_NAMES);
if (_exists) _exists = ds_exists(        dl_TILE_DEPTH_NAMES, ds_type_list);
if (_exists)           ds_list_destroy(  dl_TILE_DEPTH_NAMES);
if (_exists)                             dl_TILE_DEPTH_NAMES=undefined;

    _exists=variable_instance_exists(id,"dl_pal_swap_depths");
if (_exists) _exists = !is_undefined(    dl_pal_swap_depths);
if (_exists) _exists = ds_exists(        dl_pal_swap_depths, ds_type_list);
if (_exists)           ds_list_destroy(  dl_pal_swap_depths);
if (_exists)                             dl_pal_swap_depths=undefined;

    _exists=variable_instance_exists(id,"dl_hidden_tiles");
if (_exists) _exists = !is_undefined(    dl_hidden_tiles);
if (_exists) _exists = ds_exists(        dl_hidden_tiles, ds_type_list);
if (_exists)           ds_list_destroy(  dl_hidden_tiles);
if (_exists)                             dl_hidden_tiles=undefined;

    _exists=variable_instance_exists(id,"dl_spell_history");
if (_exists) _exists = !is_undefined(    dl_spell_history);
if (_exists) _exists = ds_exists(        dl_spell_history, ds_type_list);
if (_exists)           ds_list_destroy(  dl_spell_history);
if (_exists)                             dl_spell_history=undefined;

    _exists=variable_instance_exists(id,"dl_solid_inst");
if (_exists) _exists = !is_undefined(    dl_solid_inst);
if (_exists) _exists = ds_exists(        dl_solid_inst, ds_type_list);
if (_exists)           ds_list_destroy(  dl_solid_inst);
if (_exists)                             dl_solid_inst=undefined;


    _exists=variable_instance_exists(id,"dl_LOREM");
if (_exists) _exists = !is_undefined(    dl_LOREM);
if (_exists) _exists = ds_exists(        dl_LOREM, ds_type_list);
if (_exists)           ds_list_destroy(  dl_LOREM);
if (_exists)                             dl_LOREM=undefined;

    _exists=variable_instance_exists(id,"dl_Spell_STR");
if (_exists) _exists = !is_undefined(    dl_Spell_STR);
if (_exists) _exists = ds_exists(        dl_Spell_STR, ds_type_list);
if (_exists)           ds_list_destroy(  dl_Spell_STR);
if (_exists)                             dl_Spell_STR=undefined;

    _exists=variable_instance_exists(id,"dl_Enemy_OBJVER");
if (_exists) _exists = !is_undefined(    dl_Enemy_OBJVER);
if (_exists) _exists = ds_exists(        dl_Enemy_OBJVER, ds_type_list);
if (_exists)           ds_list_destroy(  dl_Enemy_OBJVER);
if (_exists)                             dl_Enemy_OBJVER=undefined;

    _exists=variable_instance_exists(id,"dl_RandoEnemy_OBJVER_A1");
if (_exists) _exists = !is_undefined(    dl_RandoEnemy_OBJVER_A1);
if (_exists) _exists = ds_exists(        dl_RandoEnemy_OBJVER_A1, ds_type_list);
if (_exists)           ds_list_destroy(  dl_RandoEnemy_OBJVER_A1);
if (_exists)                             dl_RandoEnemy_OBJVER_A1=undefined;

    _exists=variable_instance_exists(id,"dl_RandoEnemy_OBJVER1");
if (_exists) _exists = !is_undefined(    dl_RandoEnemy_OBJVER1);
if (_exists) _exists = ds_exists(        dl_RandoEnemy_OBJVER1, ds_type_list);
if (_exists)           ds_list_destroy(  dl_RandoEnemy_OBJVER1);
if (_exists)                             dl_RandoEnemy_OBJVER1=undefined;

    _exists=variable_instance_exists(id,"dl_RandoEnemy_OBJVER2");
if (_exists) _exists = !is_undefined(    dl_RandoEnemy_OBJVER2);
if (_exists) _exists = ds_exists(        dl_RandoEnemy_OBJVER2, ds_type_list);
if (_exists)           ds_list_destroy(  dl_RandoEnemy_OBJVER2);
if (_exists)                             dl_RandoEnemy_OBJVER2=undefined;

    _exists=variable_instance_exists(id,"dl_RandoEnemy_OBJVER3");
if (_exists) _exists = !is_undefined(    dl_RandoEnemy_OBJVER3);
if (_exists) _exists = ds_exists(        dl_RandoEnemy_OBJVER3, ds_type_list);
if (_exists)           ds_list_destroy(  dl_RandoEnemy_OBJVER3);
if (_exists)                             dl_RandoEnemy_OBJVER3=undefined;

    _exists=variable_instance_exists(id,"dl_rando_seed_SPRITES");
if (_exists) _exists = !is_undefined(    dl_rando_seed_SPRITES);
if (_exists) _exists = ds_exists(        dl_rando_seed_SPRITES, ds_type_list);
if (_exists)           ds_list_destroy(  dl_rando_seed_SPRITES);
if (_exists)                             dl_rando_seed_SPRITES=undefined;

    _exists=variable_instance_exists(id,"dl_MapItem_ITEM_IDS");
if (_exists) _exists = !is_undefined(    dl_MapItem_ITEM_IDS);
if (_exists) _exists = ds_exists(        dl_MapItem_ITEM_IDS, ds_type_list);
if (_exists)           ds_list_destroy(  dl_MapItem_ITEM_IDS);
if (_exists)                             dl_MapItem_ITEM_IDS=undefined;

    _exists=variable_instance_exists(id,"dl_MenuFrame_TSRC");
if (_exists) _exists = !is_undefined(    dl_MenuFrame_TSRC);
if (_exists) _exists = ds_exists(        dl_MenuFrame_TSRC, ds_type_list);
if (_exists)           ds_list_destroy(  dl_MenuFrame_TSRC);
if (_exists)                             dl_MenuFrame_TSRC=undefined;

    _exists=variable_instance_exists(id,"dl_ceiling_bottom_rc");
if (_exists) _exists = !is_undefined(    dl_ceiling_bottom_rc);
if (_exists) _exists = ds_exists(        dl_ceiling_bottom_rc,ds_type_list);
if (_exists)           ds_list_destroy(  dl_ceiling_bottom_rc);
if (_exists)                             dl_ceiling_bottom_rc=undefined;

















    _exists=variable_instance_exists(id,"dm_rm");
if (_exists) _exists = !is_undefined(    dm_rm);
if (_exists) _exists = ds_exists(        dm_rm, ds_type_map);
if (_exists)           ds_map_destroy(   dm_rm);
if (_exists)                             dm_rm=undefined;

    _exists=variable_instance_exists(id,"dm_dungeon");
if (_exists) _exists = !is_undefined(    dm_dungeon);
if (_exists) _exists = ds_exists(        dm_dungeon, ds_type_map);
if (_exists)           ds_map_destroy(   dm_dungeon);
if (_exists)                             dm_dungeon=undefined;

    _exists=variable_instance_exists(id,"dm_spawn");
if (_exists) _exists = !is_undefined(    dm_spawn);
if (_exists) _exists = ds_exists(        dm_spawn, ds_type_map);
if (_exists)           ds_map_destroy(   dm_spawn);
if (_exists)                             dm_spawn=undefined;

    _exists=variable_instance_exists(id,"dm_spawn_DEFAULT");
if (_exists) _exists = !is_undefined(    dm_spawn_DEFAULT);
if (_exists) _exists = ds_exists(        dm_spawn_DEFAULT, ds_type_map);
if (_exists)           ds_map_destroy(   dm_spawn_DEFAULT);
if (_exists)                             dm_spawn_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dm_placement_spr");
if (_exists) _exists = !is_undefined(    dm_placement_spr);
if (_exists) _exists = ds_exists(        dm_placement_spr, ds_type_map);
if (_exists)           ds_map_destroy(   dm_placement_spr);
if (_exists)                             dm_placement_spr=undefined;

    _exists=variable_instance_exists(id,"dm_go_scr");
if (_exists) _exists = !is_undefined(    dm_go_scr);
if (_exists) _exists = ds_exists(        dm_go_scr, ds_type_map);
if (_exists)           ds_map_destroy(   dm_go_scr);
if (_exists)                             dm_go_scr=undefined;

    _exists=variable_instance_exists(id,"dm_go_prop");
if (_exists) _exists = !is_undefined(    dm_go_prop);
if (_exists) _exists = ds_exists(        dm_go_prop, ds_type_map);
if (_exists)           ds_map_destroy(   dm_go_prop);
if (_exists)                             dm_go_prop=undefined;

    _exists=variable_instance_exists(id,"dm_town");
if (_exists) _exists = !is_undefined(    dm_town);
if (_exists) _exists = ds_exists(        dm_town, ds_type_map);
if (_exists)           ds_map_destroy(   dm_town);
if (_exists)                             dm_town=undefined;

    _exists=variable_instance_exists(id,"dm_tile");
if (_exists) _exists = !is_undefined(    dm_tile);
if (_exists) _exists = ds_exists(        dm_tile, ds_type_map);
if (_exists)           ds_map_destroy(   dm_tile);
if (_exists)                             dm_tile=undefined;

    _exists=variable_instance_exists(id,"dm_TILE_DEPTH");
if (_exists) _exists = !is_undefined(    dm_TILE_DEPTH);
if (_exists) _exists = ds_exists(        dm_TILE_DEPTH, ds_type_map);
if (_exists)           ds_map_destroy(   dm_TILE_DEPTH);
if (_exists)                             dm_TILE_DEPTH=undefined;

    _exists=variable_instance_exists(id,"dm_tile_file");
if (_exists) _exists = !is_undefined(    dm_tile_file);
if (_exists) _exists = ds_exists(        dm_tile_file, ds_type_map);
if (_exists)           ds_map_destroy(   dm_tile_file);
if (_exists)                             dm_tile_file=undefined;

    _exists=variable_instance_exists(id,"dm_tileset");
if (_exists) _exists = !is_undefined(    dm_tileset);
if (_exists) _exists = ds_exists(        dm_tileset, ds_type_map);
if (_exists)           ds_map_destroy(   dm_tileset);
if (_exists)                             dm_tileset=undefined;

    _exists=variable_instance_exists(id,"dm_hidden_tiles");
if (_exists) _exists = !is_undefined(    dm_hidden_tiles);
if (_exists) _exists = ds_exists(        dm_hidden_tiles, ds_type_map);
if (_exists)           ds_map_destroy(   dm_hidden_tiles);
if (_exists)                             dm_hidden_tiles=undefined;

    _exists=variable_instance_exists(id,"dm_cut_scene");
if (_exists) _exists = !is_undefined(    dm_cut_scene);
if (_exists) _exists = ds_exists(        dm_cut_scene, ds_type_map);
if (_exists)           ds_map_destroy(   dm_cut_scene);
if (_exists)                             dm_cut_scene=undefined;

    _exists=variable_instance_exists(id,"dm_room_history");
if (_exists) _exists = !is_undefined(    dm_room_history);
if (_exists) _exists = ds_exists(        dm_room_history, ds_type_map);
if (_exists)           ds_map_destroy(   dm_room_history);
if (_exists)                             dm_room_history=undefined;

    _exists=variable_instance_exists(id,"dm_exit_leave_history");
if (_exists) _exists = !is_undefined(    dm_exit_leave_history);
if (_exists) _exists = ds_exists(        dm_exit_leave_history,ds_type_map);
if (_exists)           ds_map_destroy(   dm_exit_leave_history);
if (_exists)                             dm_exit_leave_history=undefined;

    _exists=variable_instance_exists(id,"dm_ITEM");
if (_exists) _exists = !is_undefined(    dm_ITEM);
if (_exists) _exists = ds_exists(        dm_ITEM, ds_type_map);
if (_exists)           ds_map_destroy(   dm_ITEM);
if (_exists)                             dm_ITEM=undefined;

    _exists=variable_instance_exists(id,"dm_Spell");
if (_exists) _exists = !is_undefined(    dm_Spell);
if (_exists) _exists = ds_exists(        dm_Spell, ds_type_map);
if (_exists)           ds_map_destroy(   dm_Spell);
if (_exists)                             dm_Spell=undefined;

    _exists=variable_instance_exists(id,"dm_RandoEnemy");
if (_exists) _exists = !is_undefined(    dm_RandoEnemy);
if (_exists) _exists = ds_exists(        dm_RandoEnemy, ds_type_map);
if (_exists)           ds_map_destroy(   dm_RandoEnemy);
if (_exists)                             dm_RandoEnemy=undefined;

    _exists=variable_instance_exists(id,"dm_RandoHints");
if (_exists) _exists = !is_undefined(    dm_RandoHints);
if (_exists) _exists = ds_exists(        dm_RandoHints,ds_type_map);
if (_exists)           ds_map_destroy(   dm_RandoHints);
if (_exists)                             dm_RandoHints=undefined;

    _exists=variable_instance_exists(id,"dm_RandoHintsRecorder");
if (_exists) _exists = !is_undefined(    dm_RandoHintsRecorder);
if (_exists) _exists = ds_exists(        dm_RandoHintsRecorder,ds_type_map);
if (_exists)           ds_map_destroy(   dm_RandoHintsRecorder);
if (_exists)                             dm_RandoHintsRecorder=undefined;

if (ds_exists(global.dm_randomized_tiles01,ds_type_map)){ds_map_destroy(global.dm_randomized_tiles01); global.dm_randomized_tiles01=undefined;}
if (ds_exists(global.WallStyle01_dm,ds_type_map)){ds_map_destroy(global.WallStyle01_dm); global.WallStyle01_dm=undefined;}
if (ds_exists(global.WallStyle02_dm,ds_type_map)){ds_map_destroy(global.WallStyle02_dm); global.WallStyle02_dm=undefined;}

if (ds_exists(global.dm_scene_rando,ds_type_map)){ds_map_destroy(global.dm_scene_rando); global.dm_scene_rando=undefined;}
if (ds_exists(global.dm_tile_layer_data,ds_type_map)){ds_map_destroy(global.dm_tile_layer_data); global.dm_tile_layer_data=undefined;}
if (ds_exists(global.dm_scene_wh,ds_type_map)){ds_map_destroy(global.dm_scene_wh); global.dm_scene_wh=undefined;}

if (ds_exists(global.DropSpawner_dm,ds_type_map)){ds_map_destroy(global.DropSpawner_dm); global.DropSpawner_dm=undefined;}
if (ds_exists(global.DungeonLayoutRandoTesting_dm,ds_type_map)){ds_map_destroy(global.DungeonLayoutRandoTesting_dm); global.DungeonLayoutRandoTesting_dm=undefined;}

if (FileCleaning01_STATE)
{
        _exists=variable_instance_exists(id,"FileCleaning01_dm");
    if (_exists) _exists = !is_undefined(    FileCleaning01_dm);
    if (_exists) _exists = ds_exists(        FileCleaning01_dm,ds_type_map);
    if (_exists)           ds_map_destroy(   FileCleaning01_dm);
    if (_exists)                             FileCleaning01_dm=undefined;
}



















    _exists=variable_instance_exists(id,"dg_spell_cost");
if (_exists) _exists = !is_undefined(    dg_spell_cost);
if (_exists) _exists = ds_exists(        dg_spell_cost, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_spell_cost);
if (_exists)                             dg_spell_cost=undefined;

    _exists=variable_instance_exists(id,"dg_spell_cost_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_spell_cost_DEFAULT);
if (_exists) _exists = ds_exists(        dg_spell_cost_DEFAULT, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_spell_cost_DEFAULT);
if (_exists)                             dg_spell_cost_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_solid");
if (_exists) _exists = !is_undefined(    dg_RmTile_solid);
if (_exists) _exists = ds_exists(        dg_RmTile_solid, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_solid);
if (_exists)                             dg_RmTile_solid=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_solid_def");
if (_exists) _exists = !is_undefined(    dg_RmTile_solid_def);
if (_exists) _exists = ds_exists(        dg_RmTile_solid_def, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_solid_def);
if (_exists)                             dg_RmTile_solid_def=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Break");
if (_exists) _exists = !is_undefined(    dg_RmTile_Break);
if (_exists) _exists = ds_exists(        dg_RmTile_Break, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Break);
if (_exists)                             dg_RmTile_Break=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Break_def");
if (_exists) _exists = !is_undefined(    dg_RmTile_Break_def);
if (_exists) _exists = ds_exists(        dg_RmTile_Break_def, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Break_def);
if (_exists)                             dg_RmTile_Break_def=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Liquid");
if (_exists) _exists = !is_undefined(    dg_RmTile_Liquid);
if (_exists) _exists = ds_exists(        dg_RmTile_Liquid, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Liquid);
if (_exists)                             dg_RmTile_Liquid=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Liquid_def");
if (_exists) _exists = !is_undefined(    dg_RmTile_Liquid_def);
if (_exists) _exists = ds_exists(        dg_RmTile_Liquid_def, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Liquid_def);
if (_exists)                             dg_RmTile_Liquid_def=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Current");
if (_exists) _exists = !is_undefined(    dg_RmTile_Current);
if (_exists) _exists = ds_exists(        dg_RmTile_Current, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Current);
if (_exists)                             dg_RmTile_Current=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Current_def");
if (_exists) _exists = !is_undefined(    dg_RmTile_Current_def);
if (_exists) _exists = ds_exists(        dg_RmTile_Current_def, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Current_def);
if (_exists)                             dg_RmTile_Current_def=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_TempSolid");
if (_exists) _exists = !is_undefined(    dg_RmTile_TempSolid);
if (_exists) _exists = ds_exists(        dg_RmTile_TempSolid, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_TempSolid);
if (_exists)                             dg_RmTile_TempSolid=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Spike");
if (_exists) _exists = !is_undefined(    dg_RmTile_Spike);
if (_exists) _exists = ds_exists(        dg_RmTile_Spike, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Spike);
if (_exists)                             dg_RmTile_Spike=undefined;

    _exists=variable_instance_exists(id,"dg_RmTile_Spike_def");
if (_exists) _exists = !is_undefined(    dg_RmTile_Spike_def);
if (_exists) _exists = ds_exists(        dg_RmTile_Spike_def, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_RmTile_Spike_def);
if (_exists)                             dg_RmTile_Spike_def=undefined;

    _exists=variable_instance_exists(id,"dg_tile_anim");
if (_exists) _exists = !is_undefined(    dg_tile_anim);
if (_exists) _exists = ds_exists(        dg_tile_anim, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_tile_anim);
if (_exists)                             dg_tile_anim=undefined;

    _exists=variable_instance_exists(id,"dg_anim_liquid");
if (_exists) _exists = !is_undefined(    dg_anim_liquid);
if (_exists) _exists = ds_exists(        dg_anim_liquid, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_anim_liquid);
if (_exists)                             dg_anim_liquid=undefined;

    _exists=variable_instance_exists(id,"dg_anim_clouds");
if (_exists) _exists = !is_undefined(    dg_anim_clouds);
if (_exists) _exists = ds_exists(        dg_anim_clouds, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_anim_clouds);
if (_exists)                             dg_anim_clouds=undefined;

    _exists=variable_instance_exists(id,"dg_enemy_damage");
if (_exists) _exists = !is_undefined(    dg_enemy_damage);
if (_exists) _exists = ds_exists(        dg_enemy_damage, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_enemy_damage);
if (_exists)                             dg_enemy_damage=undefined;

    _exists=variable_instance_exists(id,"dg_enemy_damage_DEFAULT");
if (_exists) _exists = !is_undefined(    dg_enemy_damage_DEFAULT);
if (_exists) _exists = ds_exists(        dg_enemy_damage_DEFAULT, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_enemy_damage_DEFAULT);
if (_exists)                             dg_enemy_damage_DEFAULT=undefined;

    _exists=variable_instance_exists(id,"dg_BODY_HB");
if (_exists) _exists = !is_undefined(    dg_BODY_HB);
if (_exists) _exists = ds_exists(        dg_BODY_HB, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_BODY_HB);
if (_exists)                             dg_BODY_HB=undefined;

    _exists=variable_instance_exists(id,"dg_CS_OFF");
if (_exists) _exists = !is_undefined(    dg_CS_OFF);
if (_exists) _exists = ds_exists(        dg_CS_OFF, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_CS_OFF);
if (_exists)                             dg_CS_OFF=undefined;

    _exists=variable_instance_exists(id,"dg_ShieldHB");
if (_exists) _exists = !is_undefined(    dg_ShieldHB);
if (_exists) _exists = ds_exists(        dg_ShieldHB, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_ShieldHB);
if (_exists)                             dg_ShieldHB=undefined;

    _exists=variable_instance_exists(id,"dg_spawn_prxm");
if (_exists) _exists = !is_undefined(    dg_spawn_prxm);
if (_exists) _exists = ds_exists(        dg_spawn_prxm, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_spawn_prxm);
if (_exists)                             dg_spawn_prxm=undefined;

    _exists=variable_instance_exists(id,"dg_spawn_prio");
if (_exists) _exists = !is_undefined(    dg_spawn_prio);
if (_exists) _exists = ds_exists(        dg_spawn_prio, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_spawn_prio);
if (_exists)                             dg_spawn_prio=undefined;

    _exists=variable_instance_exists(id,"dg_NPC_SPR");
if (_exists) _exists = !is_undefined(    dg_NPC_SPR);
if (_exists) _exists = ds_exists(        dg_NPC_SPR, ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_NPC_SPR);
if (_exists)                             dg_NPC_SPR=undefined;

    _exists=variable_instance_exists(id,"dg_YxY_");
if (_exists) _exists = !is_undefined(    dg_YxY_);
if (_exists) _exists = ds_exists(        dg_YxY_,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_YxY_);
if (_exists)                             dg_YxY_=undefined;










if (BackgroundTileAnimations_VER)
{
        _exists=variable_instance_exists(id,"dl_scene_anims");
    if (_exists) _exists = !is_undefined(    dl_scene_anims);
    if (_exists) _exists = ds_exists(        dl_scene_anims,ds_type_list);
    if (_exists)           ds_list_destroy(  dl_scene_anims);
    if (_exists)                             dl_scene_anims=undefined;
    
        _exists=variable_instance_exists(id,"dm_TILE_ANIM");
    if (_exists) _exists = !is_undefined(    dm_TILE_ANIM);
    if (_exists) _exists = ds_exists(        dm_TILE_ANIM,ds_type_map);
    if (_exists)           ds_map_destroy(   dm_TILE_ANIM);
    if (_exists)                             dm_TILE_ANIM=undefined;
}




