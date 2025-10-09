/// find_rc_solid(solid bits, clm start, row start, clm search dir, row search dir, *search limit, *none found rc $FFFF)

// return format: $FFFF.  row $(FF)00  |  clm $00(FF)
// rc: Row-Column of g.dg_rt_solid.
// argument[0](solid bits) can be 0 if searching for a non-solid clm/row


// -----------------------------------------------------------------------------------------
argument[0] &= $F;
argument[3]  = sign(argument[3]); // clm_dir
argument[4]  = sign(argument[4]); // row_dir


// _COUNT   (Optional). Number of tiles to check. Pass 0 for max limit.
                  var _COUNT   = $FF;
if (argument_count>5) _COUNT   = min(abs(argument[5]), _COUNT);
if(!_COUNT)           _COUNT   = $FF; // Pass 0 for max limit.

// _DEFAULT (Optional). Value to return if solid not found.
                  var _DEFAULT = -1; // -1 is returned if no value passed. This indicates no solid found.
if (argument_count>6) _DEFAULT = argument[6] & $FFFF;


// -----------------------------------------------------------------------------------------
var _MINX  = max(                0, cam_xl_min()>>3);
var _MINY  = max(                0, cam_yt_min()>>3);
var _GRIDW = min(global.dg_solid_w, cam_xr_max()>>3) - _MINX;
var _GRIDH = min(global.dg_solid_h, cam_yb_max()>>3) - _MINY;
//sdm("min_clm $"+hex_str(_MINX)+", max_clm $"+hex_str(_GRIDW-1)+", clm $"+hex_str(argument[1])+", min_row $"+hex_str(_MINY)+", max_row $"+hex_str(_GRIDH)+", row $"+hex_str(argument[2]));

for(var _i=0; _i<_COUNT; _i++)
{
    //                clm               row
    if(!is_in_grid(argument[1]-_MINX,argument[2]-_MINY, _GRIDW,_GRIDH))
    {
        break;//_i
    }
    
    
    if (global.dg_solid[#argument[1],argument[2]]    & argument[0])    // if SOLID or ONEWAY
    {                        return (argument[2]<<8) | argument[1];  } // return found solid row & clm
    //                                    row $FF00  |  clm $00FF
    if (argument[0]==0 
    && !global.dg_solid[#argument[1],argument[2]] )
    {                        return (argument[2]<<8) | argument[1];  } // return found non-solid row & clm
    
    
    // -----------------------------------------------------
    // If no dir was specified, putting this break here 
    // allows at least 1 check to be performed.
    if (argument[3]==0   // clm_dir
    &&  argument[4]==0 ) // row_dir
    {
        break;//_i
    }
    // -----------------------------------------------------
    
    
    argument[1] += argument[3]; // clm += clm_dir
    argument[2] += argument[4]; // row += row_dir
}


// -----------------------------------------------------------------------------------------
return _DEFAULT;
// -----------------------------------------------------------------------------------------




