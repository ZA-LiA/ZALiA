/// get_ground_y(x, y start, y search dir, *not found y, *solid bits)


var _i, _arg, _found;
var _ROWS = ds_grid_height(g.dg_RmTile_solid);

                                 _arg=0;
var _search_CLM = clamp(argument[_arg++]>>3, 0, max(0,ds_grid_width(g.dg_RmTile_solid)-1));
var _search_row = clamp(argument[_arg++]>>3, 0, max(0,_ROWS-1));
var _SEARCH_DIR = sign_(argument[_arg++]);

// _DEFAULT (Optional). Value to return if solid not found.
var                      _DEFAULT =              (viewYC()>>3)                   <<3;
if (argument_count>_arg) _DEFAULT = clamp(argument[_arg++]>>3, 0,max(0,_ROWS-1)) <<3;

if(!_ROWS) return _DEFAULT;

var                                          _SOLID_BITS =     TID_SOLID1;
if (argument_count>_arg && argument[_arg++]) _SOLID_BITS = max(TID_SOLID1,argument[_arg-1]);


var _is_in_solid = (g.dg_RmTile_solid[#_search_CLM,_search_row]&$FF) != 0;



// ------------------------------------------------------------------------
for(_i=0; _i<_ROWS; _i++)
{
        _search_row += _SEARCH_DIR; // += 1,-1. (increment OR decrement row)
    //
    if (_search_row <  0 
    ||  _search_row >= _ROWS )
    {   // New row(_search_row) is out of solid grid
        return _DEFAULT;
    }
    
    
         _val  = g.dg_RmTile_solid[#_search_CLM,_search_row]&$FF;
         _val &= _SOLID_BITS;
    //
    if ((_val && !_is_in_solid) 
    || (!_val &&  _is_in_solid) )
    {
        if ((_SEARCH_DIR && !_is_in_solid)    // dir_DWN &&  TID_SOLID1
        || (!_SEARCH_DIR &&  _is_in_solid) )  // dir_UP  && !TID_SOLID1
        {
            return (_search_row + !_SEARCH_DIR) <<3;
        }
        else
        {   // search for other type. this should only happen once.
            _is_in_solid = _val != 0;
            _i = 0;
            continue;//_i
        }
    }
}


return _DEFAULT;




