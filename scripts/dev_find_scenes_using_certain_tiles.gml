/// dev_find_scenes_using_certain_tiles()


var _i,_j,_k,_m, _idx, _count, _area, _scene_name;
var _str, _pos;
var _file, _file_name,_file_name1, _file_data;
var _layer_count, _layer_name, _layer, _dl_layer_data, _dm_layer_data;

var _dl_ts_data, _dm_ts_data, _dl_tile;
var _tile_count, _tile_data, _tsrc, _tsrc_found, _ts_idx, _ts_name;
//var _dm_ts_info = ds_map_create();
var _dl_tsrc  = ds_list_create();
var _dl_tsrc1 = ds_list_create();
var _dl_tiles1 = ds_list_create();
//var _dg_tiles1 = ds_grid_create(0,2);
var _dl_areas = ds_list_create();
ds_list_copy(_dl_areas,g.dl_AREA_NAME);
if (ds_list_find_index(_dl_areas,Area_Title)==-1) ds_list_insert(_dl_areas, 0, Area_Title);

// Special rule for this search. 0: Normal search
var _RULE = 0;


var _TS_NAME = "ts_Man_made_1a_WRB";
ds_list_add(_dl_tsrc,$98,$99,$9A,$9B,$9C,$9D,$9E,$A8,$A9);

/*
// Looking for anything using ts_Natural_2a_WRB
var _TS_NAME = "ts_Man_made_8a_HMS";
_i = $60;
repeat($AB-_i) ds_list_add(_dl_tsrc,_i++);
*/

/*
// Natural tiles in ts_ManMade05
var _TS_NAME = "ts_ManMade05";
ds_list_add(_dl_tsrc,$80,$81,$82,$83, $88,$89,$8A,$8B,$8C,$8D,$8E,$8F, $90,$91,$92,$93, $9C,$9D,$9E,$9F);
*/

/* // Outside town room connector tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_2a";
ds_list_add(_dl_tsrc,$60,$61,$62,$63,$64,$65,$69);
ds_list_add(_dl_tsrc,$70,$71,$72,$73);
*/

/* // 
var _TS_NAME = "ts_Natural_1a";
ds_list_add(_dl_tsrc,$5F);
*/

/* // Looking for usage of any tile from Natural_1a permutation tilesets
_RULE = 1; // Accept any ts_Natural_1a tileset except ts_Natural_1a_WRB
var _TS_NAME = "ts_Natural_1a";
ds_list_clear(_dl_tsrc); // means any tile from the tileset
//for(_i=$00; _i<$100; _i++) ds_list_add(_dl_tsrc,_i);
*/

/* // Looking for usage of any tile from the following tileset
var _TS_NAME = "ts_Man_made_1a_BRW";
ds_list_clear(_dl_tsrc); // means any tile from the tileset
*/

/* // Recheck the moved tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04,$05,$06,$07,$08,$09);
ds_list_add(_dl_tsrc,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F);
ds_list_add(_dl_tsrc,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F);
ds_list_add(_dl_tsrc,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F);
ds_list_add(_dl_tsrc,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F);
ds_list_add(_dl_tsrc,$60,$61,$62,$63,$64,$65,$66,$67,$68,$69);
ds_list_add(_dl_tsrc,$70,$71,$72,$73,$74,$75,$76,$77,$78,$79);
ds_list_add(_dl_tsrc,$80,$81,$82,$83,$84,$85,$86,$87);
*/

/* // Duplicate tiles in ts_Man_made_7a_WRB
var _TS_NAME = "ts_Man_made_7a_WRB";
ds_list_add(_dl_tsrc,$A0,$A1,$B0,$B1);
*/

/* // Torch top tile in ts_Man_made_1a_WRB
var _TS_NAME = "ts_Man_made_1a_WRB";
ds_list_add(_dl_tsrc,$05);
*/

/* // Specled FG wall tiles in ts_Man_made_4a
var _TS_NAME = "ts_Man_made_4a";
ds_list_add(_dl_tsrc,$D0,$D1,$D2,$D3,$D4,$D5);
*/

/* // Duplicate background wall tile in ts_Man_made_4a
var _TS_NAME = "ts_Man_made_4a";
ds_list_add(_dl_tsrc,$D9);
*/

/* // Duplicate basement background wall tile in ts_Man_made_4a
var _TS_NAME = "ts_Man_made_4a";
ds_list_add(_dl_tsrc,$E9);
*/

/* // Basement FG wall tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$70,$71,$72,$73,$74,$75);
*/

/* // Duplicate basement FG wall tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$80,$81,$82,$83,$84,$85,$86,$87);
*/

/* // Basement background wall tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$76,$77,$78,$79);
*/

/* // Break-Block tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$90,$91,$92,$93,$94,$95,$96,$97);
*/

/* // Block tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B);
*/

/* // Square brick tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F);
ds_list_add(_dl_tsrc,$50,$51,$52,$53,$54,$55,$56,$57);
*/

/* // North Castle structure tiles in ts_Man_made_1a
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F);
*/

/* // Other pillar tiles in ts_Man_made_2a_WRB
var _TS_NAME = "ts_Man_made_2a_WRB";
ds_list_add(_dl_tsrc,$0A,$0B,$0C,$0D,$0E,$0F);
ds_list_add(_dl_tsrc,$1B);
ds_list_add(_dl_tsrc,$2A,$2B,$2C,$2D);
ds_list_add(_dl_tsrc,$4A,$4B,$4C,$4D,$4E,$4F);
*/
/* // Pillar tiles in ts_Man_made_2a_WRB
var _TS_NAME = "ts_Man_made_2a_WRB";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04,$05,$06,$07,$08,$09);
ds_list_add(_dl_tsrc,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19);
ds_list_add(_dl_tsrc,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29);
ds_list_add(_dl_tsrc,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49);
*/
/* // Pillar tiles in ts_Man_made_2a_WRB
var _TS_NAME = "ts_Man_made_2a_WRB";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F);
ds_list_add(_dl_tsrc,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1B);
ds_list_add(_dl_tsrc,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D);
ds_list_add(_dl_tsrc,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F);
*/

/* // Spike tiles in ts_Man_made_5a
var _TS_NAME = "ts_Man_made_5a";
ds_list_add(_dl_tsrc,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8);
ds_list_add(_dl_tsrc,$F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8);
*/

/* // Dungeon window tiles in ts_Man_made_5a
var _TS_NAME = "ts_Man_made_5a";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04,$05);
ds_list_add(_dl_tsrc,$10,$11,$12,$13,$14,$15);
ds_list_add(_dl_tsrc,$20,$21,$22,$23,$24,$25);
ds_list_add(_dl_tsrc,$30,$31,$32,$33,$34,$35);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45);
ds_list_add(_dl_tsrc,$50,$51,$52,$53,$54,$55);
*/

/* // Fountain statue tiles in ts_Man_made_3a
var _TS_NAME = "ts_Man_made_3a";
ds_list_add(_dl_tsrc,$D0,$D1,$E0,$E1,$F0,$F1);
*/

/* // Solid color tiles in ts_Man_made_1a_XXX
var _TS_NAME = "ts_Man_made_1a_BRW";
//var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04);
*/

/* // Lone stone texture using full green
var _TS_NAME = "ts_Man_made_6a";
ds_list_add(_dl_tsrc,$7E);
*/

/* // Stonehenge and Crystal Holder tiles in ts_Man_made_6a_WRB
var _TS_NAME = "ts_Man_made_1a";
ds_list_add(_dl_tsrc,$08,$09);
ds_list_add(_dl_tsrc,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F);
ds_list_add(_dl_tsrc,$3C,$3D,$3E,$3F);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F);
ds_list_add(_dl_tsrc,$AA,$AB,$AC,$AD);
*/

/* // Old dungeon tileset
var _TS_NAME = "ts_Man_made_4a";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04,$05,$06,$07,$08);
ds_list_add(_dl_tsrc,$20);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45);
ds_list_add(_dl_tsrc,$50,$51);
ds_list_add(_dl_tsrc,$60,$61,$62,$63,$64,$65);
ds_list_add(_dl_tsrc,$70,$71);
ds_list_add(_dl_tsrc,$80,$81,$82,$83,$84,$85);
ds_list_add(_dl_tsrc,$A0,$A1,$A2,$A3,$A4,$A5);
ds_list_add(_dl_tsrc,$B0,$B1);
ds_list_add(_dl_tsrc,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9);
ds_list_add(_dl_tsrc,$D6,$D7,$D8,$D9);
*/

repeat(2) sdm("");

var          _COUNT1 = ds_list_size(_dl_areas);
for(_i=0; _i<_COUNT1; _i++) // Each area
{
    _area = _dl_areas[|_i];
    for(_j=0; _j<$100; _j++) // Each possible file of area
    {   // file name example:  "rm_tile_data/PalcA/PalcA_003.json"
        _file_has_ts = false;
        
        //_scene_name = _area+hex_str(_j);
        
        _file_name1  = string_lettersdigits(_area);
        _file_name1 += "_";
        _file_name1 += string_repeat("0",_j<100);
        _file_name1 += string_repeat("0",_j<10);
        _file_name1 += string(_j);
        
        _file_name  = "rm_tile_data";
        _file_name += "/";
        _file_name += string_lettersdigits(_area);
        _file_name += "/";
        _file_name += _file_name1;
        //_file_name += string_lettersdigits(_area);
        //_file_name += "_";
        //_file_name += string_repeat("0",_j<100);
        //_file_name += string_repeat("0",_j<10);
        //_file_name += string(_j);
        _file_name += ".json";
        if(!file_exists(_file_name)) continue;//_j. to next file
        
        _file_data = "";
        _file = file_text_open_read(_file_name);
        while(!file_text_eof(_file)) _file_data += file_text_readln(_file);
        file_text_close(_file);
        _file_data  = json_decode(_file_data);
        
        _ts_idx = -1;
        _ts_name = "";
        
        _dl_ts_data = _file_data[?"tilesets"];
        //ds_map_clear(_dm_ts_info);
                     _count = ds_list_size(_dl_ts_data);
        for(_k=0; _k<_count; _k++) // Each tileset
        {
            _dm_ts_data = _dl_ts_data[|_k];
            _str        = _dm_ts_data[?"source"];
            // _dm_ts_data[?"source"] Example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
                _pos = string_pos(_TS_NAME,_str);
            if (_pos)
            {
                if (_RULE==1 && string_pos("WRB",_str)) break;//_k
                _ts_idx = _k;
                _ts_name = string_copy(_str, _pos, string_pos(".tsx",_str)-_pos);
                break;//_k
            }
        }
        
        if (_ts_idx==-1) continue;//_j
        
        
        ds_list_clear(_dl_tsrc1);
        ds_list_clear(_dl_tiles1);
        _dl_layer_data = val(_file_data[?"layers"]);
        _layer_count = ds_list_size(_dl_layer_data);
        
        for(_k=0; _k<_layer_count; _k++) // Each layer
        {
            _tsrc_found = false;
            _dm_layer_data = _dl_layer_data[|_k];
            _layer_name    = _dm_layer_data[?"name"];
            _layer_name    = string(_layer_name);
            
            if (0)
            {   // List all dungeons rooms with liquid
                if(!string_pos("Palc",_area))
                {
                    _j = $100; // skip to next area
                    break;//_k
                }
                
                if(!string_pos("LIQUID_",_layer_name))
                {
                    continue;//_k
                }
                
                sdm(_file_name1);
                break;//_k
            }
            
            if (string_pos("BG",_layer_name) 
            ||  string_pos("FG",_layer_name) )
            {
                if (string_pos("BG",_layer_name))
                {    _layer = string_copy(_layer_name, string_pos("BG",_layer_name), 4);  }
                else _layer = string_copy(_layer_name, string_pos("FG",_layer_name), 4);
                
                _dl_tile = _dm_layer_data[?"data"];
                _tile_count = ds_list_size(_dl_tile);
                for(_m=0; _m<_tile_count; _m++)
                {
                    _tile_data = _dl_tile[|_m];
                    if (_tile_data==0) continue; // 0 means no tile
                    
                    _tile_data--; // Tiled app adds 1 so it can't be 0
                    _tile_data &= $3FFFFFFF; // truncate the scale xy data
                    _tile_data  = abs(_tile_data);
                    
                    _tsrc = _tile_data&$FF;
                    
                    if ((_tile_data>>8)&$FF==_ts_idx 
                    &&  ds_list_find_index(_dl_tsrc1,_tsrc)==-1 )
                    {
                        if(!ds_list_size(_dl_tsrc)  // any tile from the tileset
                        ||  ds_list_find_index(_dl_tsrc, _tsrc)!=-1 )
                        {
                            ds_list_add(_dl_tsrc1,_tsrc);
                            ds_list_add(_dl_tiles1,"$"+hex_str(_tsrc)+"-"+string_copy(_ts_name, string_length(_ts_name)-2, 3));
                            //_idx = ds_grid_width(_dg_tiles1);
                            //ds_grid_resize(_dg_tiles1, _idx+1,ds_grid_height(_dg_tiles1));
                        }
                    }
                }
            }
        }
        
            _count = ds_list_size(_dl_tsrc1);
        if (_count)
        {
            ds_list_sort(_dl_tsrc1,true);
            ds_list_sort(_dl_tiles1,true);
            
            _str = _file_name1+": ";
            for(_k=0; _k<_count; _k++) // Each found tsrc
            {
                if (_RULE==1) _str += _dl_tiles1[|_k]+", ";
                else          _str += "$"+hex_str(_dl_tsrc1[|_k])+", ";
            }
            sdm(_str);
        }
    }
}

repeat(2) sdm("");

ds_list_destroy(_dl_ts_data); _dl_ts_data=undefined;
ds_map_destroy(_dm_ts_data); _dm_ts_data=undefined;
//ds_map_destroy(_dm_ts_info); _dm_ts_info=undefined;
ds_list_destroy(_dl_tsrc); _dl_tsrc=undefined;
ds_list_destroy(_dl_tsrc1); _dl_tsrc1=undefined;
ds_list_destroy(_dl_tiles1); _dl_tiles1=undefined;
//ds_grid_destroy(_dg_tiles1); _dg_tiles1=undefined;
ds_list_destroy(_dl_areas); _dl_areas=undefined;




