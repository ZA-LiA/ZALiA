/// WaterSparkle_refresh(pcrc)


ds_grid_clear(dg_WaterSparkle,-1);
WaterSparkle_timer = 0;

if!(f.items&ITM_BOOT) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _i, _owrc, _ow_clm,_ow_row, _tsrc;

var _PCRC = argument[0];


var _dl1=ds_list_create();
ds_list_copy(_dl1,dl_WaterSparkle_RC);

var _dl2=ds_list_create();
ds_list_add(_dl2,$00,$08,$80,$88);

for(_i=ds_grid_width(dg_WaterSparkle)-1; _i>=0; _i--)
{
    switch(_i){
    default:{_owrc=_PCRC;         break;} // pc's tile
    case  1:{_owrc=_PCRC+1;       break;} // east  of pc (right)
    case  2:{_owrc=_PCRC-1;       break;} // west  of pc (left)
    case  3:{_owrc=_PCRC+OW_CLMS; break;} // south of pc (down)
    case  4:{_owrc=_PCRC-OW_CLMS; break;} // north of pc (up)
    }
    
    if (_owrc>=0 
    &&  _owrc<OW_CLMS*OW_ROWS )
    {
        _ow_clm = (_owrc>>0)&$FF;
        _ow_row = (_owrc>>8)&$FF;
        
        _tsrc = dg_tsrc[#_ow_clm,_ow_row] &$FF;
        if (_tsrc==TSRC_WATER01 
        && !dg_solid[#_ow_clm,_ow_row] )
        {
            ds_list_shuffle(_dl1); // sparkle pixel rc w/in an 8x8 area
            ds_list_shuffle(_dl2); // offset to determine the sparkle pixel's overworld tile quadrant
            dg_WaterSparkle[#_i,0] = _owrc;
            
            // pixel rc w/in its overworld tile
            dg_WaterSparkle[#_i,1] = _dl1[|0]+_dl2[|0];
            dg_WaterSparkle[#_i,2] = _dl1[|1]+_dl2[|1];
            dg_WaterSparkle[#_i,3] = _dl1[|2]+_dl2[|2];
            dg_WaterSparkle[#_i,4] = _dl1[|3]+_dl2[|3];
            
            WaterSparkle_timer = WaterSparkle_DURATION0;
        }
    }
}

ds_list_destroy(_dl1); _dl1=undefined;
ds_list_destroy(_dl2); _dl2=undefined;




