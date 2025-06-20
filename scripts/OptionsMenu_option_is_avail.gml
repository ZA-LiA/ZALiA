/// OptionsMenu_option_is_avail(menu, option index)


switch(argument0)
{
    // ============================================================
    case menu_state_MAIN:{
    switch(argument1)
    {
        default:                       {return false; break;}
        case MainOption_SND_VOL:       {return true; break;}
        case MainOption_MUS_VOL:       {return true; break;}
        case MainOption_MUSIC_SET:     {return true; break;}
        case MainOption_PC_SPRITES:    {return true; break;}
        case MainOption_INPUT_CONFIG:  {return true; break;}
        case MainOption_FULLSCREEN:    {return true; break;}
        case MainOption_APP_SCALE:     {return true; break;}
        case MainOption_DEV_TOOLS:     {return true; break;}
        case MainOption_OTHER:         {return true; break;}
        case MainOption_RANDO:         {return true; break;}
        //case MainOption_PAL_EDITOR:    {return true; break;}
        case MainOption_FORCE_GAMEOVER:{return true; break;}
        case MainOption_CLOSE:         {return true; break;}
    }//switch(argument1)
    break;}//case Menu_MAIN
    
    
    
    
    // ============================================================
    case menu_state_DEV_TOOLS:{
    switch(argument1)
    {
        default:                      {return false; break;}
        case DevTools.DEV_TOOLS_STATE:{return true; break;}
        case DevTools.SET_DEFAULT:    {return true; break;}
        case DevTools.APP_PERFORMANCE:{return true; break;}
        case DevTools.HITBOXES:       {return true; break;}
        case DevTools.SCP:            {return true; break;}
        case DevTools.XY:             {return true; break;}
        //case DevTools.OCS:            {return true; break;}
        case DevTools.OG_CAM:         {return true; break;}
        case DevTools.HP:             {return true; break;}
        case DevTools.SPRITE_OUTLINE: {return true; break;}
        case DevTools.FRAME_COUNT:    {return true; break;}
        case DevTools.EXITS:          {return DEV; break;}
        case DevTools.SOLID_TILES:    {return DEV; break;}
        case DevTools.UNIQUE_TILES:   {return DEV; break;}
        case DevTools.DUNGEON_MAP:    {return DEV; break;}
        case DevTools.ADD_ITEMS:      {return DEV; break;}
        //case DevTools.DOUBLE_JUMP:    {return f.items&ITM_FTHR; break;}
        //case DevTools.INVULNERABILITY:{return DEV; break;}
        case DevTools.PC_DASH:        {return true; break;}
        //case DevTools.PC_DASH:        {return DEV; break;}
        case DevTools.BGR_COLOR:      {return true; break;}
        case DevTools.ROOM_COLOR:     {return true; break;}
        case DevTools.BACK:           {return true; break;}
    }//switch(argument1)
    break;}//case Menu_DEV_TOOLS
    
    
    
    
    // ============================================================
    case menu_state_RANDO:{
    switch(argument1)
    {
        default:                    {return false; break;}
        case Rando_MARK_ACQUIRED:   {return val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) || val(f.dm_rando[?STR_Randomize+STR_PBAG+STR_Locations]) || val(f.dm_rando[?STR_Randomize+STR_Key +STR_Locations]); break;}
        case Rando_HINTS:           {return val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]); break;}
        case Rando_MAPS_SHOW_KEYS:  {return val(f.dm_rando[?STR_Randomize+STR_Key+STR_Locations]); break;}
        case Rando_ENEMY_RANDO:     {return val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Method]) || val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Spawner]) || val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_ENIGMA]); break;}
        //case Rando_RANDO_ENEMY:     {return val(f.dm_rando[?STR_Randomize+STR_Enemy+STR_Method]); break;}
        case Rando_DUNGEON_TILESETS:{return true; break;}
        case Rando_OW_BIOMES:       {return ds_map_size(global.OVERWORLD.dm_Rando_TSRC)>0; break;}
        case Rando_SCENES:          {return true; break;}
        case Rando_PALETTE:         {return true; break;}
        case Rando_BACK:            {return true; break;}
    }//switch(argument1)
    break;}//case Menu_RANDO_OPTIONS
    
    
    
    
    // ============================================================
    case menu_state_OTHER:{
    switch(argument1)
    {
        default:                       {return false; break;}
        case Other_FLASHING:           {return true;  break;}
        case Other_DIALOGUE_SPEED:     {return true;  break;}
        case Other_HIDDEN_OW_EXITS:    {return true;  break;}
        case Other_HUD:                {return true;  break;}
        case Other_TORCH_LIGHTING:     {return true;  break;}
        //case Other_RENDER_DELAY:       {return global.RenderFrameDelay_state!=-1; break;}
        case Other_BLACK_BGR:          {return true;  break;}
        case Other_SCREEN_SHAKE:       {return true;  break;}
        case Other_STAB_FRENZY:        {return true;  break;}
        case Other_ANARKHYA_OW:        {return true;  break;}
        case Other_HALLOWEEN1:         {return true;  break;}
        //case Other_SHOW_ACTIVE_SPELLS:{return false; break;}
        //case Other_SCENE_COLORS_EDITOR:{return true;  break;}
        //case Other_BGR_COLOR_EDITOR:   {return true;  break;}
        case Other_GEE:                {return true;  break;}
        case Other_BACK:               {return true;  break;}
    }//switch(argument1)
    break;}//case menu_state_OTHER
}//switch(argument0)



return false;




