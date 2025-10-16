/// Boss_init_2()


var _i, _val;

    arena_x  =  g.rm_w_;
if(!is_undefined(dk_spawn))
{   arena_x  =  val(g.dm_spawn[?dk_spawn+STR_Arena+"_x"], arena_x);  }


switch(object_index)
{   // ---------------------------------------------------------
    default:{
    var            _default = g.rm_rows-$02;
    var _row =      find_row_solid(TID_SOLID1, arena_x>>3,viewYC()>>3, -1, 0, _default) + 1; // search for ceiling
    if (_row>=     _default) // if didnt find ceiling
    {   _row = max(0, viewYT()>>3);  }
    
                   _default = (viewXR()>>3)-$02;
         arena_xl = find_clm_solid(TID_SOLID1, arena_x>>3,_row, -1,0, _default);
    if ( arena_xl>=_default) // if didn't find left wall
    {    arena_xl = arena_x-viewW_();  }
    else arena_xl =(arena_xl+$01)<<3;
    
    arena_xl = clamp(arena_xl, arena_x-viewW_(), arena_x-8);
    arena_w  = min((arena_x-arena_xl)<<1, viewW());
    
    arena_xl = arena_x - (arena_w>>1);
    arena_xr = arena_xl + arena_w;
    break;}
    
    // ---------------------------------------------------------
    case Ganon2:{
    arena_xl = find_clm_solid(0, $00,g.rm_row0+$08, 1,0, $05);
    arena_xl = arena_xl<<3;
    
    arena_xr = g.rm_w;
    
    arena_w  = arena_xr-arena_xl;
    break;}
    /*
    // ---------------------------------------------------------
    case Ganon3:{
    arena_xr = find_clm_solid(TID_SOLID1, arena_x>>3,g.rm_row0+$08, 1,0, g.rm_clms-$06);
    arena_xr = arena_xr<<3;
    
    arena_w  = max(0, arena_xr-arena_x);
    arena_w  = arena_w<<1;
    
    arena_xl = arena_x-(arena_w>>1);
    sdm("arena_xl $"+hex_str(arena_xl));
    break;}
    */
}




Boss_init_2a(); // set GROUND_Y
//sdm("GROUND_Y $"+hex_str(GROUND_Y)+", arena_x $"+hex_str(arena_x)+", arena_xx $"+hex_str(arena_xx)+", arena_w $"+hex_str(arena_w));



// HPBar_XOFF: x offset from viewXL()
HPBar_XOFF  = max(0, (viewW()-arena_w)>>1);
HPBar_XOFF += HPBar_XPAD;
HPBar_XOFF  = clamp(HPBar_XOFF, HPBar_XPAD,viewW_()-4);


if(!is_ancestor_(object_index,Thunderbird01,ShadowLonk01,Ganon))
{
    with(GameObject_create(arena_xl-8,y, ArenaGateA,1)) boss=other;
    with(GameObject_create(arena_xr,  y, ArenaGateA,1)) boss=other;
}




