/// tile_change_1a(depth, x, y, tileset, tileset grid xy, *solid type, *unique type, *hidden type)

// changes 1 8x8 tile in the room


if (argument[1]>>3 <  0 
||  argument[1]>>3 >= g.rm_clms 
||  argument[2]>>3 <  0 
||  argument[2]>>3 >= g.rm_rows )
{
    return -1;
}


var                   _SOLID  = -1;
if (argument_count>5) _SOLID  = argument[5];

var                   _unique = -1;
if (argument_count>6) _unique = argument[6];

var                   _HIDDEN = -1;
if (argument_count>7) _HIDDEN = argument[7];



if (_SOLID!=-1) global.dg_solid[#argument[1]>>3,argument[2]>>3] = _SOLID;


if ( _unique 
&& !(_unique>>8) )
{
    var _IDX = ds_list_find_index(g.dl_TILE_DEPTHS, argument[0]);
    if (_IDX!=-1) _unique = (_IDX<<8) | (_unique&$FF);
}

if (_unique!=-1 
&&  _unique&$FF )
{
         if (isVal(_unique&$FF, TID_BREAK1,TID_BREAK2,TID_BREAK3,TID_BREAK4))
    {   g.dg_RmTile_Break[# argument[1]>>3, argument[2]>>3] = _unique;  }
    else if (isVal(_unique&$FF, TID_LQUID1,TID_LQUID2))
    {   g.dg_RmTile_Liquid[#argument[1]>>3, argument[2]>>3] = _unique;  }
}


dev_update_tile_marker_layer(argument[1],argument[2], _SOLID,_unique);






var _tile_id = -1;

if (argument[3]!=-1) // tileset: -1 means don't delete or add tile
{
    // ** NOTE **   
    // After some trial & error, tile_layer_find() seems to be a big 
    // contributor to the delay when entering a large rm.
    // TODO: Find more efficient method for adding tiles.
    
    _tile_id = tile_layer_find(argument[0], argument[1],argument[2]);
    tile_delete_(_tile_id);
    
    
    
    if (                     argument[3]   // tileset: 0 means no graphic
    &&  background_exists(   argument[3]))
    {
        _tile_id = tile_add_(argument[3],              // tileset
                           ((argument[4]>>0)&$F) <<3,  // ts x
                           ((argument[4]>>4)&$F) <<3,  // ts y
                             8,8,                      // tile w, tile h
                             argument[1],              // rm x
                             argument[2],              // rm y
                             argument[0] );            // depth
    }
}

if (_tile_id != -1 
&&  _HIDDEN  != -1 )
{
    tile_hidden_update_1a(_tile_id, _HIDDEN);
}


return _tile_id;




