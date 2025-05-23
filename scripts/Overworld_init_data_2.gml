/// Overworld_init_data_2()

show_debug_message("Overworld_init_data_2()");


var _i,_j, _idx, _val1,_val2, _count1,_count2;
var _clms,_rows;
var _owrc,_owrc_, _ow_clm,_ow_row, _ow_clm_,_ow_row_;
var _tsrc;
var _dk, _str1,_str2;
var _scene_id;
var _dl1 = ds_list_create();

var         _dl_AreaNames = ds_list_create();
ds_list_add(_dl_AreaNames,'NORTH CASTLE FIELD');
ds_list_add(_dl_AreaNames,'NORTH CASTLE WOODS'); // 18 character limit
ds_list_add(_dl_AreaNames,'NORTH CASTLE LAKE');
ds_list_add(_dl_AreaNames,'RAURU WOODS');
//                                                      //
ds_list_add(_dl_AreaNames,'TANTARI DESERT');
ds_list_add(_dl_AreaNames,'PARAPA DESERT');
ds_list_add(_dl_AreaNames,'RUTO MOUNTAINS');
ds_list_add(_dl_AreaNames,'SARIA FIELD');
//                                                      //
ds_list_add(_dl_AreaNames,'SARIA WOODS');
ds_list_add(_dl_AreaNames,'SARIA BAY');
ds_list_add(_dl_AreaNames,'SARIA CEMETERY');
ds_list_add(_dl_AreaNames,'MORUGE SWAMP');
//                                                      //
ds_list_add(_dl_AreaNames,'MIDORO FIELD');
ds_list_add(_dl_AreaNames,'MIDORO SWAMP');
ds_list_add(_dl_AreaNames,'ROYAL CEMETERY');
ds_list_add(_dl_AreaNames,'DEATH MOUNTAIN');
//                                                      //
//                                                      //
ds_list_add(_dl_AreaNames,'NABOORU FIELD');
ds_list_add(_dl_AreaNames,'NABOORU BAY');
ds_list_add(_dl_AreaNames,'DARUNIA FIELD');
ds_list_add(_dl_AreaNames,'DARUNIA FOREST');
//                                                      //
ds_list_add(_dl_AreaNames,'DARUNIA MOUNTAINS');
ds_list_add(_dl_AreaNames,'KASUTO CEMETERY');
ds_list_add(_dl_AreaNames,'KASUTO FOREST');
ds_list_add(_dl_AreaNames,'KASUTO SWAMP');
//                                                      //
ds_list_add(_dl_AreaNames,'SEASHORE');
ds_list_add(_dl_AreaNames,'VALLEY OF DEATH');
ds_list_add(_dl_AreaNames,'MAZE ISLAND');
ds_list_add(_dl_AreaNames,'WHALE ISLAND');
//                                                      //
ds_list_add(_dl_AreaNames,'SARIA RIVER');
ds_list_add(_dl_AreaNames,'NABOORU WOODS');
ds_list_add(_dl_AreaNames,'MAKARRHA');
ds_list_add(_dl_AreaNames,'DRAGMIRE'); // DRAGMIRE A
//                                                      //
ds_list_add(_dl_AreaNames,'DRAGMIRE'); // DRAGMIRE B (Island behind Dragmire)



OW_CLMS = $0100;
OW_ROWS = $0100;
OW_W = OW_CLMS<<SHIFT;
OW_H = OW_ROWS<<SHIFT;



ds_grid_resize(dg_tsrc_def, OW_CLMS, OW_ROWS);
ds_grid_clear( dg_tsrc_def, TSRC_WATER01);
ds_grid_copy(  dg_tsrc,dg_tsrc_def);

ds_grid_resize(dg_solid_def, OW_CLMS, OW_ROWS);
ds_grid_clear( dg_solid_def, 0);
ds_grid_copy(  dg_solid,dg_solid_def);

ds_grid_resize(dg_area, OW_CLMS, OW_ROWS);
ds_grid_clear( dg_area, -1);

ds_grid_resize(dg_AreaNames, OW_CLMS, OW_ROWS);
ds_grid_clear( dg_AreaNames, MapAreaName_DEF);

ds_grid_resize(HiddenExitIndicator_dg, 0,ds_grid_height(HiddenExitIndicator_dg));
ds_grid_clear (HiddenExitIndicator_dg, 0);


ds_grid_clear(dg_tsrc_def,$0580);








_ow_clm=$BE; _ow_row=$39;
_clms=$29; _rows=$3F;

    _dk = '_PATH_'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_MazIs_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0103); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$00; _ow_row=$92;
_clms=$49; _rows=$39;

    _dk = '_PATH_'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_DthMt_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0101); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$7D; _ow_row=$B6;
_clms=$83; _rows=$4A;

    _dk = '_PATH_'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'04'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0402); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$49; _ow_row=$B6;
_clms=$34; _rows=$4A;

    _dk = '_PATH_'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'03'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0302); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$00; _ow_row=$CB;
_clms=$49; _rows=$35;

    _dk = '_PATH_'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'03'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0302); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$76; _ow_row=$8C;
_clms=$8A; _rows=$2A;

    _dk = '_PATH_'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0202); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$76; _ow_row=$86;
_clms=$0F; _rows=$06;

    _dk = '_PATH_'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0202); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$76; _ow_row=$00;
_clms=$48; _rows=$86;

    _dk = '_PATH_'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0102); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$85; _ow_row=$86;
_clms=$39; _rows=$06;

    _dk = '_PATH_'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0102); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$BE; _ow_row=$00;
_clms=$42; _rows=$39;

    _dk = '_PATH_'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0102); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$BE; _ow_row=$78;
_clms=$42; _rows=$14;

    _dk = '_PATH_'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'01'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0102); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$E7; _ow_row=$39;
_clms=$19; _rows=$3F;

    _dk = '_PATH_'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_EastA_'+'01'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0102); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$00; _ow_row=$64;
_clms=$62; _rows=$2E;

    _dk = '_PATH_'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'02'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0200); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$4F; _ow_row=$61;
_clms=$13; _rows=$03;

    _dk = '_PATH_'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'02'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0200); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$62; _ow_row=$6B;
_clms=$06; _rows=$27;

    _dk = '_PATH_'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'02'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0200); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$68; _ow_row=$6F;
_clms=$0E; _rows=$23;

    _dk = '_PATH_'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'02'+'03';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0200); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$49; _ow_row=$92;
_clms=$2D; _rows=$24;

    _dk = '_PATH_'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'02'+'04';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0200); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$62; _ow_row=$61;
_clms=$14; _rows=$0A;

    _dk = '_PATH_'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'02'+'05';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0200); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$00; _ow_row=$61;
_clms=$4F; _rows=$03;

    _dk = '_PATH_'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'01'+'00';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0100); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$00; _ow_row=$00;
_clms=$76; _rows=$61;

    _dk = '_PATH_'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'01'+'01';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0100); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name




_ow_clm=$68; _ow_row=$6B;
_clms=$0E; _rows=$04;

    _dk = '_PATH_'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_VOLCA'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_CEMET'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_SWAMP'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FORES'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_BEACH'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_DESER'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

    _dk = '_FIELD'+'_WestA_'+'01'+'02';
dm[?_dk+STR_Clm]  = _ow_clm;
dm[?_dk+STR_Row]  = _ow_row;
dm[?_dk+STR_Clms] = _clms;
dm[?_dk+STR_Rows] = _rows;

ds_grid_set_region(dg_area, _ow_clm,_ow_row, (_ow_clm+_clms)-1,(_ow_row+_rows)-1, $0100); // value is 2 bytes. $(FF)FF: the sub area (Example: West 1: West-North, West 2: West-South). $FF(FF): the index of g.dl_area_name








// Raft data examples: '0101', '0102'
// Raft tiles are in pairs: (01)01 Set num, 01(01) Member num 1 or 2
// Member 1 is always N or W of member 2

_owrc=$7465; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0101;
dm[?STR_Raft+'0101'+STR_OWRC] = _owrc;

_owrc=$7481; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0102;
dm[?STR_Raft+'0102'+STR_OWRC] = _owrc;

_owrc=$2848; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0201;
dm[?STR_Raft+'0201'+STR_OWRC] = _owrc;

_owrc=$1248; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0202;
dm[?STR_Raft+'0202'+STR_OWRC] = _owrc;

_owrc=$0F4D; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0301;
dm[?STR_Raft+'0301'+STR_OWRC] = _owrc;

_owrc=$0F66; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0302;
dm[?STR_Raft+'0302'+STR_OWRC] = _owrc;

_owrc=$1272; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0401;
dm[?STR_Raft+'0401'+STR_OWRC] = _owrc;

_owrc=$2F72; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0402;
dm[?STR_Raft+'0402'+STR_OWRC] = _owrc;

_owrc=$3276; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0501;
dm[?STR_Raft+'0501'+STR_OWRC] = _owrc;

_owrc=$3287; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0502;
dm[?STR_Raft+'0502'+STR_OWRC] = _owrc;

_owrc=$3399; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0601;
dm[?STR_Raft+'0601'+STR_OWRC] = _owrc;

_owrc=$1899; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0602;
dm[?STR_Raft+'0602'+STR_OWRC] = _owrc;

_owrc=$14A0; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0701;
dm[?STR_Raft+'0701'+STR_OWRC] = _owrc;

_owrc=$14B8; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_Raft] = $0702;
dm[?STR_Raft+'0702'+STR_OWRC] = _owrc;



















_owrc=$5D56; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_01';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5D56; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Rauru02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$5D56; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_02';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5D56; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Rauru01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$4B2A; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_04';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $4B2A; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Ruto02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$4B2A; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_05';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $4B2A; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Ruto01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$8230; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_06';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8230; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Saria02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$8030; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8030; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Saria01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7264; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_09';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7264; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Mido02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7264; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7264; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Mido01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7C91; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7C91; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Nabooru02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7C91; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7C91; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Nabooru01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$617D; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_0F';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $617D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Darunia02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$617D; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_11';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $617D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Darunia01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$95B8; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_12';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $95B8; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_New_Kasuto01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$A39C; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_15';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A39C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Old_Kasuto02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$A39C; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_17';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A39C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Old_Kasuto01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7C91; _owrc_=hex_str(_owrc);
_scene_id = '_TownA_19';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7B93; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Nabooru03'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$D5C1; _owrc_=hex_str(_owrc);
_scene_id = '_TownB_02';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D5C1; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Bulblin02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$D5C1; _owrc_=hex_str(_owrc);
_scene_id = '_TownB_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D5C1; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Bulblin01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$3C64; _owrc_=hex_str(_owrc);
_scene_id = '_PalcA_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3C64; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Parapa_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$3C64; _owrc_=hex_str(_owrc);
_scene_id = '_PalcA_0D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $3C64; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Parapa_Palace02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$6734; _owrc_=hex_str(_owrc);
_scene_id = '_PalcB_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6734; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Midoro_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$6734; _owrc_=hex_str(_owrc);
_scene_id = '_PalcB_14';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6734; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Midoro_Palace02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7CB8; _owrc_=hex_str(_owrc);
_scene_id = '_PalcE_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7CB8; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7CB8; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Palace_On_The_Sea01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7CB8; _owrc_=hex_str(_owrc);
_scene_id = '_PalcE_06';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7CB8; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Palace_On_The_Sea02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$8961; _owrc_=hex_str(_owrc);
_scene_id = '_PalcC_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8961; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Island_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$8961; _owrc_=hex_str(_owrc);
_scene_id = '_PalcC_0E';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8961; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Island_Palace02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$5FD6; _owrc_=hex_str(_owrc);
_scene_id = '_PalcD_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5FD6; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Maze_Island_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$5FD6; _owrc_=hex_str(_owrc);
_scene_id = '_PalcD_0D';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5FD6; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Maze_Island_Palace02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$ABAC; _owrc_=hex_str(_owrc);
_scene_id = '_PalcF_00';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $ABAC; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Three_Eye_Rock_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$ABAC; _owrc_=hex_str(_owrc);
_scene_id = '_PalcF_16';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $ABAC; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Three_Eye_Rock_Palace02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$897E; _owrc_=hex_str(_owrc);
_scene_id = '_PalcG_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $897E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Great_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$897E; _owrc_=hex_str(_owrc);
_scene_id = '_PalcG_36';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $897E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Great_Palace02'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$EAD6; _owrc_=hex_str(_owrc);
_scene_id = '_PalcH_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $EAD6; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Dragmire_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$897E; _owrc_=hex_str(_owrc);
_scene_id = '_PalcG_3C';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $897E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_Great_Palace03'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$63C7; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_01';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $63C6; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $63C8; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$69CA; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_02';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $69C9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $69CB; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5FC3; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_03';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '_Fall_04';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '80808080';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $5FC3; // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5FC3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$61D3; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_04';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '_Fall_04';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '80808080';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $61D3; // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $61D3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5FCA; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_05';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5FC9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5FCB; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$56CD; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_09';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $55CD; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $57CD; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$57C8; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_07';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $57C7; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $57C9; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$53CA; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $53C9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $53CB; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4FCC; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_06';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $4FCB; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $4FCD; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5AD9; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_0A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5AD9; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5AD9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$68B1; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $68B0; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$68BF; _owrc_=hex_str(_owrc);
_scene_id = '_MazIs_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $68C0; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$982A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_01';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $982A; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$952D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_01';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $952D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9632; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_02';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9632; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9835; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_02';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9835; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9A3C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_03';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9A3C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$963C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_03';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $963C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B2D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_04';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9B2D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B31; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_04';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9B31; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E2D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_05';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9E2D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D2F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_05';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9D2F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D38; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_06';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9D38; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E3A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_06';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E3A; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A12E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_07';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A12E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A42F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_07';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A42F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E3E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9E3E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A03F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A03F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A53E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_09';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A53E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A33F; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_09';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A33F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A92D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A92D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A731; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A731; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A839; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A839; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A73C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A73C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AA37; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AA37; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AA3D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $AA3D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AF3A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AF3A; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AD3C; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $AD3C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AD40; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AD40; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AA42; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $AA42; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AE34; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_0F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AE34; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9939; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_16';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9939; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9538; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_16';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9538; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D33; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_17';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9D33; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E35; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_17';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E35; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A232; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_18';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A232; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A134; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_18';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A134; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A435; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_19';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A435; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A438; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_19';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A438; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$AE32; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '_Fall_04';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '80808080';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $AE32; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9341; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9341; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$893D; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $893D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A828; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A828; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A81E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_1F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A81E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A81B; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_21';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '_Fall_04';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '80808080';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $A81B; // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$BA2E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $BA2E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$B448; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_24';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $B448; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $B448; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A53A; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A53A; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8C31; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8B31; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D33; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D34; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C13E; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_31';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '_Fall_04';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '80808080';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $C13E; // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8E31; _owrc_=hex_str(_owrc);
_scene_id = '_DthMt_2C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8F31; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9D9D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9D9C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9D9E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A49F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_01';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A49E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A4A0; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8C8F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_02';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8B8F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D8F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$918B; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_03';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $908B; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $928B; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$948D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_04';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $948C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $948E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A092; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_05';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9F92; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A192; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6483; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_06';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6383; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6583; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$78B9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_07';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $78B9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $78B9; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7492; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7492; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7095; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7095; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8793; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_09';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8793; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8E99; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8E99; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8EAB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8EAB; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8EB3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8EB3; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8B7C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_10';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8B7C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8B7E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_10';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8B7E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D80; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_13';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8D80; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D84; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_14';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D84; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6684; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_17';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6584; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6784; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9682; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_18';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9582; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9782; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$937D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_19';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $927D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $947D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A382; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A381; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A383; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$81AF; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_21';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $81AF; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $81AF; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $81AF; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7A84; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_26';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7A84; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7A84; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7A84; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9BB0; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9BB0; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9BB0; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9BB0; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8487; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8487; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8487; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $8487; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A7AA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A7AA; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A7AA; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9194; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_33';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9194; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9194; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9194; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6CAA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6CAA; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6CAA; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6CAA; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$789C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $789C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $789C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $789C; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A395; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A395; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A395; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $A395; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B7E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_3F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9B7E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9B7E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9B7E; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5E82; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_11';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5E82; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$729F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_12';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $729F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$94A9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_15';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $94A9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $94A9; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8996; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_16';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8996; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$46A3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_6A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $46A3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $46A3; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$698D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $698D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E7C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E7C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$1F68; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_20';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $1F68; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $1F68; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$63A3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_23';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+STR_Special+STR_Encounter] = _scene_id;
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $63A3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $63A3; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$87B2; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_68';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $86B2; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$37A5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_29';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $38A5; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$36A5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2A';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $38A5; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3AA4; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_52';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3AA4; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$839C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_24';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $839C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $839C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$0F6C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_2B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $0F6C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$0F72; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_41';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $0F72; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$1598; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_31';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $1598; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $1598; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$98BB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_69';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $97BB; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9B8F; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_36';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9B8F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9B8F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9B8F; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$288E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_37';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $288E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $288E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$88B2; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_68';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $89B2; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$99BB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_69';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9ABB; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D548; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_48';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+dk_NO_ENCOUNTER] = 1; // dk_NO_ENCOUNTER:  Can't use encounter skip exploit for this exit
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D547; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$DA4E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_49';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $DA4E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D84C; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_49';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D84C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D559; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D559; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E446; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $E346; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E545; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E645; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E750; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E750; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $E750; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $E750; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7795; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_5B';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7795; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7795; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$788D; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_62';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $788D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $788D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8587; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_70';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8587; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8587; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_Forest_Hammer'+_owrc_] = '_Forest_Hammer_0101'; // info example: '_Forest_Hammer_0101'
dm[?'_OWRC_Forest_Hammer_0101'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$BFC9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_77';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $BFC9; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$BF94; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_78';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+dk_NO_ENCOUNTER] = 1; // dk_NO_ENCOUNTER:  Can't use encounter skip exploit for this exit
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $BF93; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D0C3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D0C3; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBC4; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CBC4; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$BFD0; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_80';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $BFD0; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C1D3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_81';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C1D3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C0DA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_84';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C0DA; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C7D7; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_87';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C7D7; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CCCA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CCCA; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C4DC; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_85';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C4DC; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C8DC; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_86';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C8DC; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBD1; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_88';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CBD1; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CACB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '21212121';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'21'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'21'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'21'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'21'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'21'+STR_OWRC]      = $CACB; // goto owrc
g.dm_rm[?_scene_id+'21'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'21'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D0D3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D0D3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CDD9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_8D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CDD9; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$DEB3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_64';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $DEB3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D6D3; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_90';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D6D3; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D6D3; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E0BD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_A0';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E0BD; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C9C1; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_91';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C9C1; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C9C1; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$C8BD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_92';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $C8BD; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $C8BD; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CDB6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_93';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CDB6; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CDB6; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D3B5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_94';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D3B5; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D3B5; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBBE; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_95';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CBBE; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CBBE; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CCBC; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_96';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CCBC; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CCBC; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CABB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_97';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CABB; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CABB; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CCBA; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_98';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CCBA; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CCBA; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CBB9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_99';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CBB9; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CBB9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CDB8; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CDB8; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CDB8; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CEB7; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CEB7; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CEB7; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D1B6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D1B6; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D1B6; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D0B7; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D0B7; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D0B7; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D3B6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D3B6; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D3B6; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$CABD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_9F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $CABD; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $CABD; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$EBB7; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_A1';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '_Fall_04';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '80808080';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'


_owrc=$D9C6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B2';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D9C6; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A08A; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_C6';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A08A; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$DCC8; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B3';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20101020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $DCC7; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $DBC8; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E0CB; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B4';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20101020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E1CB; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $DFCB; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D7C6; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B5';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D7C7; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E4CD; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B6';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $E4CE; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E4CC; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D7C5; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_B5';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $D7C4; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$10B9; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_0F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $10B9; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$D64B; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_4F';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $D64B; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$E261; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_42';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $E261; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$867E; _owrc_=hex_str(_owrc);
_scene_id = '_EastA_1B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $867E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5B3F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_00';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $5B3F; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
dm[?'_OWRC_North_Palace01'] = _owrc; // datakey example: '_OWRC_Parapa_Palace01'


_owrc=$7938; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_01';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7838; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7A38; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7E42; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_02';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7E41; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7E43; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8842; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_04';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8841; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8849; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_05';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $884A; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6266; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_06';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6166; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6366; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$555F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_07';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $555F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4D56; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_07';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $4D56; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5B44; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_03';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+dk_NO_ENCOUNTER] = 1; // dk_NO_ENCOUNTER:  Can't use encounter skip exploit for this exit
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5B45; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6129; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_09';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6129; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$652B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_0B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $652B; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$654E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_0C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $654E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6C31; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_0E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6C31; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$655E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_10';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $655E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$875A; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_12';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '_Fall_04';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '80808080';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'80'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'80'+STR_OWRC]      = $875A; // goto owrc
g.dm_rm[?_scene_id+'80'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'80'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $875A; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D64; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D64; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$672F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_14';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $672F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $672F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $672F; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$733C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_15';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $733C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $733C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $733C; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7439; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_16';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7439; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7439; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7439; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$743D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_17';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $743D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $743D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $743D; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5B38; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5B37; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$743F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $743F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $743F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $743F; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$753B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $753B; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $753B; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $753B; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8D4E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_1F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8D4E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8D4E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $8D4E; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7F47; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_20';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7F47; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7F47; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7F47; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$4745; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_21';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $4745; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6766; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_26';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6766; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6766; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6766; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$514D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $514D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $514D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $514D; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6338; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2D';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6338; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7D3C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2E';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7D3C; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7D3C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $7D3C; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6E30; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_33';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6E30; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6E30; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6E30; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6D4F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_34';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6D4F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6D4F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$825E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_38';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $825E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $825E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $825E; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6B4D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_3A';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6B4D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6B4D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $6B4D; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$563F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_29';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $563F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $563F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7F5A; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_24';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7F5A; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7F5A; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$733D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_25';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $733D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $733D; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5B3F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_00';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'


_owrc=$6F38; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6F38; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6B37; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_08';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6B37; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$8535; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_37';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $8535; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $8535; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3A5E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_3F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3A5E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $3A5E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5D33; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_3E';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $5D33; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7F57; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_60';
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7F57; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$0F47; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $0F47; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $0F47; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $0F47; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$3D5F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_43';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20101020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $3E5F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $3C5F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$493C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_2C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $493C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$2F31; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_44';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $2F31; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7919; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_4D';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7919; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$751F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_4F';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $741F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7428; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_4F';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $7428; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$751C; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_52';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $741C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$681D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_55';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $681D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$9E4F; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_45';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '00000000';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'00'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $9E4F; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $9E4F; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'00'+STR_OWRC]      = $9E4F; // goto owrc
g.dm_rm[?_scene_id+'00'+STR_ow_dir]    = $0F; // goto ow facing dir
g.dm_rm[?_scene_id+'00'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6A3E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_47';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6A3E; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6A3E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$405E; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_58';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $405E; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$415D; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_58';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $415D; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$432A; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_FF';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $432A; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$402B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_F8';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $402B; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6E64; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_40';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6E64; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6155; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_5B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '10101010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $6155; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $04; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$5F53; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_5B';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $5F53; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$6965; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_5C';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $6965; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $08; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$A44B; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_59';
dm[?_owrc_+STR_Open]             = $01;
dm[?_owrc_+STR_Open+STR_Default] = $01;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20102010';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'10'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $A44A; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit
g.dm_rm[?_scene_id+'10'+STR_OWRC]      = $A44C; // goto owrc
g.dm_rm[?_scene_id+'10'+STR_ow_dir]    = $01; // goto ow facing dir
g.dm_rm[?_scene_id+'10'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit


_owrc=$7416; _owrc_=hex_str(_owrc);
_scene_id = '_WestA_53';
dm[?_owrc_+STR_Open]             = $00;
dm[?_owrc_+STR_Open+STR_Default] = $00;
dm[?_owrc_+STR_CutScene] = '0';
dm[?_owrc_+STR_RmName]   = _scene_id;
dm[?_owrc_+STR_AccessRm] = '20202020';
dm[?_owrc_+'08'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'04'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'02'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
dm[?_owrc_+'01'+STR_Exit] = _scene_id+'20'; // goto rm exit.  datakey example: owrc + ow move_dir  + '_Exit'
g.dm_rm[?_scene_id+STR_OWRC]           = _owrc; // scene owrc
g.dm_rm[?_scene_id+'20'+STR_OWRC]      = $7315; // goto owrc
g.dm_rm[?_scene_id+'20'+STR_ow_dir]    = $02; // goto ow facing dir
g.dm_rm[?_scene_id+'20'+STR_goto_reen] = Area_OvrwA+_owrc_; // goto ow exit








// STR_Scene+STR_OWRC
// This is an exit obj that's soley here to 
// indicate the owrc of a scene so pause menu 
// map will acurately show the ow position of PC.
// _data Example: '_WestA_FF'
// _data Example: '_WestA_FA,_WestA_F4,_WestA_F3'  (all share same owrc)

_owrc = $452A;
g.dm_rm[?'_WestA_FF'+STR_OWRC] = _owrc;

_owrc = $BFA4;
g.dm_rm[?'_EastA_75'+STR_OWRC] = _owrc;

_owrc = $BFBA;
g.dm_rm[?'_EastA_76'+STR_OWRC] = _owrc;

_owrc = $3E2B;
g.dm_rm[?'_WestA_F7'+STR_OWRC] = _owrc;

_owrc = $3B2B;
g.dm_rm[?'_WestA_FE'+STR_OWRC] = _owrc;

_owrc = $5B3E;
g.dm_rm[?'_WestA_18'+STR_OWRC] = _owrc;

_owrc = $5B3B;
g.dm_rm[?'_WestA_19'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_48'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_49'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_3D'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_3E'+STR_OWRC] = _owrc;

_owrc = $5B42;
g.dm_rm[?'_WestA_03'+STR_OWRC] = _owrc;

_owrc = $5B40;
g.dm_rm[?'_WestA_31'+STR_OWRC] = _owrc;

_owrc = $5B3F;
g.dm_rm[?'_WestA_00'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_32'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_3C'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_42'+STR_OWRC] = _owrc;

_owrc = $6C31;
g.dm_rm[?'_WestA_0F'+STR_OWRC] = _owrc;

_owrc = $632A;
g.dm_rm[?'_WestA_0A'+STR_OWRC] = _owrc;

_owrc = $492A;
g.dm_rm[?'_TownA_03'+STR_OWRC] = _owrc;

_owrc = $655E;
g.dm_rm[?'_WestA_11'+STR_OWRC] = _owrc;

_owrc = $8B5D;
g.dm_rm[?'_WestA_13'+STR_OWRC] = _owrc;

_owrc = $4745;
g.dm_rm[?'_WestA_36'+STR_OWRC] = _owrc;

_owrc = $733D;
g.dm_rm[?'_TownA_5F'+STR_OWRC] = _owrc;

_owrc = $8D31;
g.dm_rm[?'_DthMt_2C'+STR_OWRC] = _owrc;

_owrc = $812F;
g.dm_rm[?'_WestA_4A'+STR_OWRC] = _owrc;

_owrc = $7E22;
g.dm_rm[?'_WestA_4C'+STR_OWRC] = _owrc;

_owrc = $7C20;
g.dm_rm[?'_WestA_4D'+STR_OWRC] = _owrc;

_owrc = $7523;
g.dm_rm[?'_WestA_4F'+STR_OWRC] = _owrc;

_owrc = $AE34;
g.dm_rm[?'_DthMt_0F'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_10'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_11'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_12'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_13'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_14'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_15'+STR_OWRC] = _owrc;

_owrc = $BA2E;
g.dm_rm[?'_DthMt_23'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_22'+STR_OWRC] = _owrc;

_owrc = $A81B;
g.dm_rm[?'_DthMt_21'+STR_OWRC] = _owrc;

_owrc = $C13E;
g.dm_rm[?'_DthMt_31'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_30'+STR_OWRC] = _owrc;

_owrc = $8848;
g.dm_rm[?'_WestA_05'+STR_OWRC] = _owrc;

_owrc = $8843;
g.dm_rm[?'_WestA_04'+STR_OWRC] = _owrc;

_owrc = $BF95;
g.dm_rm[?'_EastA_74'+STR_OWRC] = _owrc;

_owrc = $68B8;
g.dm_rm[?'_MazIs_00'+STR_OWRC] = _owrc;

_owrc = $7C91;
g.dm_rm[?'_TownA_78'+STR_OWRC] = _owrc;

_owrc = $654E;
g.dm_rm[?'_WestA_0D'+STR_OWRC] = _owrc;

_owrc = $3A2B;
g.dm_rm[?'_WestA_FA'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_F6'+STR_OWRC] = _owrc;

_owrc = $3C2B;
g.dm_rm[?'_WestA_F4'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_F5'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_F3'+STR_OWRC] = _owrc;
g.dm_rm[?'_WestA_FC'+STR_OWRC] = _owrc;

_owrc = $6E64;
g.dm_rm[?'_WestA_41'+STR_OWRC] = _owrc;

_owrc = $8E99;
g.dm_rm[?'_EastA_0C'+STR_OWRC] = _owrc;

_owrc = $8793;
g.dm_rm[?'_EastA_0A'+STR_OWRC] = _owrc;

_owrc = $A7AA;
g.dm_rm[?'_EastA_34'+STR_OWRC] = _owrc;

_owrc = $36A5;
g.dm_rm[?'_EastA_50'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_51'+STR_OWRC] = _owrc;

_owrc = $7C91;
g.dm_rm[?'_EastA_53'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_54'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_56'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_57'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_58'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_59'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5A'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5C'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5D'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5E'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_5F'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_61'+STR_OWRC] = _owrc;

_owrc = $1598;
g.dm_rm[?'_EastA_63'+STR_OWRC] = _owrc;

_owrc = $C0D5;
g.dm_rm[?'_EastA_82'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_83'+STR_OWRC] = _owrc;

_owrc = $CCCF;
g.dm_rm[?'_EastA_89'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_8A'+STR_OWRC] = _owrc;

_owrc = $E8B9;
g.dm_rm[?'_EastA_A2'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A3'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A4'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A5'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A6'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A7'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_A8'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_AA'+STR_OWRC] = _owrc;

_owrc = $D6C2;
g.dm_rm[?'_EastA_B0'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_B1'+STR_OWRC] = _owrc;

_owrc = $897E;
g.dm_rm[?'_EastA_C0'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_C1'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_C2'+STR_OWRC] = _owrc;
g.dm_rm[?'_EastA_C3'+STR_OWRC] = _owrc;

_owrc = $AE34;
g.dm_rm[?'_DthMt_10'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_11'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_12'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_13'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_14'+STR_OWRC] = _owrc;
g.dm_rm[?'_DthMt_15'+STR_OWRC] = _owrc;

_owrc = $D54A;
g.dm_rm[?'_EastA_4F'+STR_OWRC] = _owrc;

_owrc = $839C;
g.dm_rm[?'_TownA_74'+STR_OWRC] = _owrc;

_owrc = $DEB3;
g.dm_rm[?'_EastA_65'+STR_OWRC] = _owrc;

_owrc = $46A3;
g.dm_rm[?'_EastA_6B'+STR_OWRC] = _owrc;

_owrc = $8587;
g.dm_rm[?'_EastA_71'+STR_OWRC] = _owrc;

_owrc = $EBB7;
g.dm_rm[?'_EastA_A1'+STR_OWRC] = _owrc;

_owrc = $6B32;
g.dm_rm[?'_WestA_5A'+STR_OWRC] = _owrc;

_owrc = $7F5A;
g.dm_rm[?'_WestA_60'+STR_OWRC] = _owrc;

_owrc = $6733;
g.dm_rm[?'_PalcB_16'+STR_OWRC] = _owrc;

_owrc = $7518;
g.dm_rm[?'_WestA_54'+STR_OWRC] = _owrc;












_count1 = $0100;
_count2 = $0100;
ds_grid_resize(dg_tsrc_def, _count1,_count2);
ds_grid_clear( dg_tsrc_def, TSRC_WATER01);
ds_grid_copy(  dg_tsrc,dg_tsrc_def);

ds_list_clear(_dl1);
// ROWS $00-$0F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041004100410' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800580058004D404100410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800580058004D404100410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800584'+'05840584058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800580058004D404D40410'+'04100410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058405840584'+'05840584058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004D40410'+'04100410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800584058405840440'+'04400440044104400584058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04240424048104100410041004100410' + '04100410041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004F004D4'+'04100410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800584058404410430'+'0440044104400440044004AE05800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004B00424'+'042404240481042404D5041004100410' + '0410041004D504240410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058005800580058005800580058004F0'+'04D40410041004100410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $10-$1F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800584058404400440'+'04410440044104400440058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800424'+'04240424042404810410041004100410' + '04100424042404240580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04F004D5041004100410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058405840584'+'04400440044105840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800584'+'04240424042404100410041004100410' + '04240424042405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004400580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04F004F0041004100410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04AF0580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05840584042404100410041004100410' + '0580058004AF05800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580044004410580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04D404F0041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800584058404240410041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800440' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058004F0041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058405840410041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04410440044104400580058004410440' + '04AE0580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04B004F004D404100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058405840410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800441'+'04780440044004400441044004400440' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058004D404F004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058404100410041005800410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004400440'+'04400440044104400440044104400580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'0580058004D405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058404100410058005800410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04410440044004400441058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058404100410058004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058004AF058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800584044004100580058004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800584058405800580041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05840584044005800580041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05840441044005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05840440058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05840584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04400580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $20-$2F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800440058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004400441058005800580'+'05800580058004410580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004400440044005800580'+'05800580058004400440058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580044004410430043005800580'+'05800580044004300441044005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580044004300430043004300580'+'04B10580043004300430044005840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004300580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100580058005800580' + '05800584043004300430043004300430'+'04200430043004300430044005840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410043004300430058405840584' + '05840584058404300430043004410440'+'04400440043004300441058405840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004300580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100430'+'04300430043005840584058405840584' + '05840584058405840441044004400440'+'04400441044004400584058405840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580043004300580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004100410043004300430'+'05840584058405840584058005800580' + '05800580058405840584058404400441'+'04410440058405840584058405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580043004300580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004300430043004300584'+'05840584058405800580058005800580' + '05800580058005840584058405840584'+'05840584058405840584058405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580043004200580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004300430043005840584'+'05840580058005800580058005800580' + '05800580058005800580058405840584'+'05840584058405840584058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800430043004300420' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '041004C0041004100430058405840584'+'05800580058005800580058005800580' + '05800580058005800580058005800584'+'05840584058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058004B105800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580042004200430043004300440' + '04410580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $30-$3F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410058405840580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800441044004400580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800441044104200430043004200441' + '04400580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041004100410' + '04100580058004100584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04400420042004400441058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04410441042004200430043004200440' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410058005840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04200430043004200441044004AE0580'+'05800580058005800580058005800580' + '058005800580058005800580058004B0'+'04410441042004300430042004200441' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041005840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04200430043004300420044105800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800441042004300430042004410440' + '05840580058005800580058005800580'+'058004B1058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800420042004200580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580042004300430042004400584' + '05840584058005800580058005800580'+'05800440043005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100410058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800430058405840584' + '05840584058005800580058005800580'+'04410430043004200580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100584058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005840584' + '05840584058405800580058005800580'+'04400430042004400580058005800580' + '05800580058005800580040805800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100410041004100410' + '04100584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800584058405840584058005800584'+'04410420042004410580058005800580' + '05800580058005800580040805800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410041004100410041004100410' + '04100584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005840584058405840584'+'05840440044005840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410041004100410041004100410' + '04100584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058405840584' + '04080580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05840584058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800584042404250410' + '04100410058405840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800580040A040A05800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004D50410041004100410' + '04100584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800424042404100410' + '04240424042404240424058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '040A05840584058405840584040A0580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004D50410041004100410' + '04100410058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004240424041004100424' + '04240424041004240491042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '058405840584040A0584058405840584'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '04100410058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580042404240410041004100425' + '04100410041004100424042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058405840584' + '05840584058405840584058405840584'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '04100410041005840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800424042404100410041004100424' + '04240424041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800584058405840584' + '05840584058405840584058405840584'+'05840580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '04100410041005840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800424041004100410041004240424' + '04100424042404100410041004240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800584058405840584' + '05840584058405840584058405840584'+'05840584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $40-$4F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004100410041004100410'+'04100410041004D50410041004100410' + '04100410041005840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04240424041004100410041004250410' + '04100410042404240424041004240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058005800580040A0584058405840584' + '05840584044104400440044004400584'+'05840584058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'0410041004D404D40410041004100410' + '04100410041004100584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580040805800580' + '05800580058005800580058005800424'+'04240424041004100424042504100410' + '04100410041004240424042404240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058005800580040A0584058405840584' + '04400440044104400440044104400441'+'04400584058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'0410041004D404100410041004100410' + '04100410041004100584040805800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800584041005840584' + '05840580058005800580058004240424'+'04240410041004240424042404240424' + '04100410041004100424042404100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'0580058005800584040A058405840440' + '04400441044004400430043004300440'+'04400441058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'0410041004D404100410041004100410' + '04100410041004100410058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800584'+'05840584058405840584041004100424' + '04240584058405840424042404240410'+'04100410041004240424042404240424' + '04240410041004240424041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005840584058404400441' + '04400440043004300430043004300430'+'04300430044005840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410058005800410041004100410' + '04100410041004100410058405840580'+'05800580058005800580058005800580' + '04240424042404240424042404240424'+'04240424058405840410041004100410' + '04240424042404240424041004100410'+'04100410042404240424042404240424' + '04100410041004240424041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058005800580040A0584058404400440' + '04300430043004300430043004300430'+'04300430043004400584058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100580058005800410041004100410' + '04100410041004100410041005840584'+'05800580058005800580058004240424' + '04240424042404240424042404240424'+'04240424042404240410041004100410' + '04240424042404100410041004100424'+'04240424042404240424042404240410' + '04100410042404240410041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800584058404410430' + '04300430043004300430043004300430'+'04300430043004300440058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410058004100410041004100410' + '04100410041004100410041004100584'+'04080580058005800424042404240424' + '04240424042404240410041004100424'+'04240424042404240410041004100410' + '04100424042404240424042404240424'+'04240424041004100424042404240424' + '04240410042404100410041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800584058404400430' + '04300430043004300430043004300430'+'04300430043004300441058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'05840408040804240424042404240424' + '0424042404240424041004C004100424'+'04240424042404240410041004100410' + '04100410041004240424042404240424'+'04240410041004240424042404240410' + '04100424042404240424041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800584058404400440' + '04300430043004300430043004300430'+'04300430043004300430058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004240424042404240424' + '04240424042404240424042404240424'+'04240424042404240424041004100410' + '04100410041004100424042404240424'+'04100410041004240424041004100410' + '04100410042404240424042404240410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058405840441' + '04300430043004300430043004300430'+'04300430043004300430058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100425042404240424' + '04240424042404240424042404240424'+'04240424042404240424041004100410' + '04100410041004100410042404240410'+'04100410041004240424042404100410' + '04100410041004240410042404240410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058405840440' + '04410430043004300430043004300430'+'04300430043004300430058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410058004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'041004F004D404F004F004F004100410' + '04100410041004100410041004100410'+'04100410041004100410041004240424' + '04240424042404240424042404240424'+'04240424042404240424042404100410' + '04100410041004100410042404100410'+'04100410041004100424042404240410' + '04100410041004100410041004240424'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005840584' + '04400430043004300430043004300430'+'04300430043004300580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004100410041004100410'+'04100410041004100410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04F004F004E804F004F004F004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100424' + '04240424042404240424042404240424'+'04240424042404240424042404100410' + '04100410041004100410042404240410'+'04100410041004100410042404240424' + '04100410041004100410042404240424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '04400430043004300430043004300430'+'04300430043005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04F004F004F004F004F004F004F004F0' + '04D40410041004100410041004100410'+'04100410041004100410041004100410' + '04240424042404240424042404240424'+'04240424042404240424042404240410' + '04100410041004100410041004240424'+'04240424041004100410042404240424' + '04100410041004100424042404240424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05840440044104300430043004300430'+'04400580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04F004F004F004F004F004F004F004F0' + '04F004D4041004100410041004100410'+'04100410041004100410041004100410' + '04100424042404240424042404240424'+'04240424042404240424042404240410' + '04100410041004100410041004C00410'+'04100424042404100410042404240424' + '04240410041004100410041004240424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800584044004300430043004300441'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004F004F004F004F004F0'+'04F004F004F004F004D404D404F004D4' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04F004F004F004F004F0041004100410' + '04F004F004F004F004F004F004F004F0'+'04F004F004F004D404F004F004100410' + '04100410041004240424042404240424'+'04240424042404240420042004200420' + '04100410041004100410041004100410'+'04100410042404240410042404240424' + '04240424042404100410041004240424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058404410430043004400580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004F00410041004100410'+'0410041004100410041004F004100410' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04F00410041004100410041004100410' + '04100430043004300430043004300430'+'0430043004300430043004F004F004F0' + '04F004F004D404240424042404240424'+'04240420042004200420042004200420' + '04100410041004100410041004100410'+'04100410041004240424042404240424' + '04240424042404240424041004100424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800440044005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004D404F004F004F004F0'+'04F004F004F004F004F004F004F004D4' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $50-$5F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04F00410041004100410041004100410' + '04100430043004300430043004300430'+'04300430043004300430043004300430' + '0430043004F004D40424042404240420'+'04200420042004200420042004200420' + '04200410041004100410041004100410'+'04100410041004100410041004240424' + '04240424042404240424042404100424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004F00410041004100410'+'04100410041004F004100410041004F0' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04D40410041004100410041004100410' + '04100430043004300430043004300430'+'04300430043004300430043004300430' + '04300430043004F004D4042404200420'+'04200420042004200420043004200420' + '04200410041004100410041004100410'+'04100410041004100410041004100410' + '04100410042404240424042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004F0041004F004D404F0'+'04F004F0041004F004F004F0041004F0' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04F00410041004100410041004100410' + '04100430043004300430043004300430'+'04300430043004300430043004300430' + '043004300430043004F004D404F004F0'+'04F004F004F004F004F004F004F00420' + '04200410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100424042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004F0041004F004100410'+'041004F0041004F0041004F0041004F0' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04D50410041004100410041004100410' + '04100410043004300430043004300430'+'04300430043004300430043004300430' + '04300430043004300420042004200420'+'04200420042004200420042004F004F0' + '04F004F0041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580044005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004F0041004D404F004F0'+'041004F004F004F0041004F0041004F0' + '04100410041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04D40410041004100410041004100410' + '04100410041004300430043004300430'+'04300430043004300430043004300430' + '04300430042004200420042004200420'+'04200420042004200420042004200420' + '042004F004F004D404F004F004300430'+'04300430041004100410041004100410' + '04100410041004100410041004100424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580044005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004F004100410041004F0'+'041004F004100410041004F0041004F0' + '04100410041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04D50410041004100410041004100410' + '04100410041004100430043004300430'+'04300430043004300430043004300430' + '04300420042004200420042004200420'+'04200420042004200420042004200420' + '042004F004300430043004F004F004F0'+'043004300430043004100410041004C0' + '04100410041004100410041004100410'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004F004F004F004F004F0'+'041004D404F004F0041004D4041004F0' + '04100410041004100410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04D50410041004100410041004100410' + '04100410041004100420042004200420'+'04300430043004300430043004300423' + '04200420042004200420042004200420'+'04200420042004200420042004200420' + '042004F00430043004300430043004D4'+'04F00430043004300430043004300430' + '04100410041004100410041004100410'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004F0041004D4041004F0' + '04100410041004100410041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04D40410041004100410041004100410' + '04100410041004200420042004200420'+'04200420043004300430058005800580' + '05800420042004200420042004200420'+'04200420042004200420042004200420' + '04F004D4043004300430043004300430'+'04D40430043004300430043004300410' + '04100410041004100410041004100410'+'04250410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004D404F004F004F004F0'+'04F004F004F004F0041004F0041004F0' + '04100410041004100410041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04F00410041004100410041004100410' + '04100410042004200420042004200420'+'04200420058005800580058005800580' + '05800580058004200420042004200420'+'042004200420042004200420042004F0' + '04F00430043004300430043004300430'+'04D40430043004300430043004300410' + '04100410041004100410041004100424'+'04D50410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800424042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004F00410041004100410'+'04100410041004F0041004F0041004F0' + '04100410041004100410041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04D504D4041004100410041004100410' + '04100420042004200420042004200420'+'04200580058005800580058005800580' + '05800580058005800420042004200420'+'04200420042004200420042004F004F0' + '04300430043004300430043004300430'+'04F00430043004300430043004100410' + '04100410041004100410042504D504D5'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800424043004240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004F004F004F004F004D4'+'04F004D4041004F0041004F004F004F0' + '04F004F004F004F00410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'041004D404D504100410041004100410' + '04100420042004200420042004200420'+'05800580058005800580058004D404F0' + '04D40580058005800580042004200420'+'0420042004200420042004F004F00430' + '043004300430043004300430043004F0'+'04D40430043004300430041004100410' + '04100410041004100410042404100410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004240430043004300424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058004100410041004100410041004D4'+'04100410041004F00410041004100410' + '04100410041004F00410058005800580'+'05800408058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041005800580' + '04100410041004100410041004100410'+'041004D404F004D40410041004100410' + '04100410042004200420042004200420'+'05800580058004080580058004F004E1' + '04F004B204F004F004F004F004F004F0'+'04D404F004F004F004F004F004300430' + '043004300430043004300430043004D4'+'04300430043004300410041004100410' + '0410041004100410042504D504100410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004240430043004300424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004F004F004D4041004F0'+'041004F004F004F004F004F0041004D4' + '04D404F0041004F00410058004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041005800580' + '04100410041004100410041004100410'+'04D404D404D404D50410041004100410' + '04100410041004200420042004200420'+'05800580058005800580058004D404F0' + '04F00580058005800580042004200420'+'04200420042004300430043004300430' + '043004300430043004300430043004F0'+'04300430043004100410041004100410' + '041004100410041004D4041004100410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005840410' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580042404300430043004300424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004F0041004D4041004F0'+'0410041004100410041004F004100410' + '041004D4041004F00580058004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100580' + '04100410041004100410041004100410'+'04D404F004D404D40410041004100410' + '04100410041004200420042004200420'+'04200580058005800580058005800580' + '05800580058005800580042004200420'+'04200420043004300430043004300430' + '04300430043004300430043004E904F0'+'04300430041004100410041004100410' + '0410041004100410042404D505800580'+'05800410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058404100410' + '04100410058005800584042504240424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800424043004300430043004300424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004D4041004F0041004F0'+'04F004F004F004F0041004F004F004F0' + '04F004F0041004F00580041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100580' + '04100410041004100410041004100410'+'04D404D404D404D40410041004100410' + '04100410041004100420042004200420'+'04200420058005800580058005800580' + '05800580058005800420042004200420'+'04200420043004300430043004300430' + '043004300430043004300430043004D4'+'04100410041004100410041004100410' + '0410041004100410042404F005800580'+'05800580041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058404100410' + '0410041004C004100410041004240424'+'04240424058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800424043004300430043004300424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004F0041004F004100410'+'041004F0041004100410041004100410' + '041004F0041004F0058004D404F004D4'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041005800580' + '04100410041004100410041004100410'+'04D504D404D404D40410041004100410' + '04100410041004100410041004200420'+'04200420042005800580058005800580' + '04200420042004200420042004200420'+'04200430043004300430043004300430' + '04100410041004C004100410043004F0'+'04100410041004100410041004100410' + '041004100410041004F004D405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800424042404250410' + '04100410041004100410041004100424'+'04240424042404240580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04240424043004300430043004300424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004D4041004F004F004F0'+'04F004F004F004F004F004D404F004F0' + '041004F0041004F004B204F004E004D4'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $60-$6F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041005800410' + '04100410041004100410041004100410'+'041004F004D404D40410041004100410' + '04100410041004100410041004100420'+'04200420042004200420042004200420' + '04200410041004100410042004200420'+'04300430043004300430041004100410' + '04100410041004100410041004100480'+'04100410041004100410041004100410' + '0410041004100410041004D405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004240424042404240410' + '04100410041004100410041004100424'+'04240424043004300430058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800424' + '04240430043004300430043004300430'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004F00410041004100410'+'0410041004100410041004F0058004B3' + '0580058005800580058004F004D404D4'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'041004C0041004100410041004100410' + '04100410041004100410041004100420'+'04200420042004200420042004100410' + '04100410041004100410041004100430'+'04300430041004100410041004100410' + '0410041004100410041004C0041004D4'+'04200420041004100410041004100410' + '0410041004100410041004F004F00580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580042404250424047304240425' + '04100410041004100410041004250424'+'04300430043004300430043004300580' + '05800580058005800580058005800580'+'05800580058005800580042404240424' + '04300430043004300430043004300430'+'04240424058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004F004F004F004F004F0'+'04F004F004F004F004F004F0058004F0' + '041004F004F004D40410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041005800580'+'05800580041004100580041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04200420042004200410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '041004100410041004100420042004F0'+'04200420042004200420041004100410' + '04100410041004100410041004D50580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580042404240424042404240424' + '04240424042404100410041004240424'+'04300430043004300430043004300430' + '04300430058005800580058005800580'+'05800580058004300430043004300430' + '04300430043004300430043004300430'+'04300424042405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'041004100410041005800580058004F0' + '041004F0041004100410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800410' + '05800580041004100410041004100580'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04C00410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '041004100410042004200420042004D4'+'04200420042004200420042004100410' + '04100410041004100410041004F004D4'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410042504240424042504240410' + '04100410044204250410041004100424'+'04240430043004300430043004300430' + '04300430043005800580058005800580'+'05800430043004300430043004300430' + '04300430043004330430043004300430'+'04300424042404240580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580041004100410041004F004F004F0'+'04F004F004F004F0058004F004F004F0' + '041004D404F004F00410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058004100580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '041004200420042004200420042004F0'+'04200420042004200420042004100410' + '041004100410041004100410041004F0'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004250424042404100410' + '04100410041004D50410041004100424'+'04240430043004300430043004300430' + '04300430043004300430043004300430'+'04300430043004300430043004300430' + '04300430043004300430043004300430'+'04300424042404240424058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580041004100410041004F004100410'+'04100410041004F0058004F004100410' + '04100410041004F00410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800410041005800580' + '04100410041005800580058005800410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004C00410041004100410' + '04100410041004100410041004100410'+'04100438043804380410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004C00410' + '041004200420042004200420042004F0'+'04200420042004200420048204C00410' + '041004100410041004100410041004D4'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100410041004D504D5041004100424'+'04240410043004300430043004300430' + '04300430043004300430043004300430'+'04300430043004300430043004300430' + '04300430043004300430043004300430'+'04300424042404240424042405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058004100410041004F004F004F0'+'04F004F0041004F004B204F0041004F0' + '04F004D4041004F00410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058004100410041004100580' + '05800580058005800580058004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410042004200420042004100410' + '04100410041004380438043804380438'+'04380438043804380438043804100410' + '04100410041004100410041004100410'+'04100410041004100410041004200420' + '042004200420042004200420042004F0'+'04200420042004200420042004100410' + '04100410041004100410043004300430'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '041004100410041004D5041004240425'+'04240410043004300430043004300430' + '04300430043004200420042004200430'+'04300430043004300430043004300430' + '04300430043004300430043004300430'+'04240424042404240424042405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058004B305800580058004F0041004F0' + '041004F0041004F00410041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100410041005800580' + '05800580058004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100420042004200420042004200430' + '04100410041004380490043804380438'+'04380438043804D404D4043804380410' + '04100410041004100410041004100410'+'04100410041004100420042004200420' + '042004200420042004200420042004F0'+'04200420042004200420042004100410' + '04100410041004100410043004230430'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '041004100410041004D5042404240424'+'04240410041004300430043004300420' + '04200420042004200420042004200420'+'04300430043004300430043004300430' + '04300430043004300430043004300430'+'04300430042404240424042405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800410041004F0041004F0'+'04F004F0041004F004F004F0041004F0' + '041004F0041004F00410041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100410058005800410' + '04100410041004100410041004100410'+'04100410041004100410043404100410' + '04100410041004100410041004100410'+'04100420042004200438043804380438' + '041004100410041004380438043804D4'+'04380438043804380438043804380438' + '04380438041004100410041004100410'+'04100410042004200420042004200420' + '04200420042004200420042004F004F0'+'04200420042004200420041004100410' + '04100410041004100410043004300430'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410042504240424'+'04240410041004300430043004200420' + '04200420042004200420042004200420'+'04200420042004200430043004300430' + '04300430043004300430043004300430'+'04300430043004300424042404B204B2' + '04B204B204B204B20580058005800580'+'0580058005800580058004B204B204B2' + '04B204B204B204F004F004F0041004F0'+'04100410041004F0041004F0041004D4' + '041004F0041004F00410041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100580058004100410' + '04100410041004100410041004100410'+'04100430043004100410043004100410' + '04100410041004100410041004100410'+'04200420043804380438043804380410' + '04100410041004100410041004380438'+'04380438043804380438043804380438' + '04380438043804D404D404D404380438'+'04380438043804380438043804380438' + '04380438043804380420042004F00420'+'04200420042004200420041004100410' + '0410041004100410041004C004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410041004240424'+'04100410041004100410042304200420' + '04200420042004200420042004200420'+'04200420042004200420042004300430' + '04300430043004300430043004300430'+'04300430043004300424042405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800410041004F0041004F0'+'04F004F004F004F0041004F004F004D4' + '041004F0041004F00410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041005800580041004100410' + '04100410041004100410041004100410'+'04300430041004100410043004100410' + '04100410041004100410041004100410'+'04200420043804380438043804380410' + '04100410041004100410041004100438'+'04380438043804380438043804390438' + '04100410041004100410041004380438'+'04380438043804380438043804380438' + '04380438043804380438043804F00420'+'04200420042004200410041004100410' + '04100410041004100410041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100420' + '04200420042004200420042004200420'+'04200420043004300430043004300430' + '04300430043004300430043004300430'+'04300430043004300424042405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800410041004F004100410'+'041004F0041004100410041004100410' + '041004F0041004F00410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04300430041004300430043004100410' + '04100410041004100410041004100410'+'04200438043804380438043804380410' + '041004100410041004100410041004C0'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'043804380438043804D404D404380438' + '04380438043804380438043804D40420'+'04200420042004100410041004100410' + '04100410041004100410041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100420042004200420042004100410'+'04100430043004300430043004300430' + '04300430043004300430043004300430'+'04300430043004240424044105800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800410041004F004F004F0'+'04F004F004F004F004F004F004F004F0' + '04F004F004F004D40410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800410058005800580041004100410' + '04100410041004100410041004100410'+'04100410041004300430041004100410' + '04300410041004100410041004100410'+'04200438043804380438043804380438' + '041004C0041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100438043804380438043804380438' + '04380438043804380438043804F00420'+'04200410041004100410041004100410' + '04100410041004100410041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410042004200420041004100410'+'04100410041004100410041004300430' + '04300430043004300410041004100410'+'04100410044004410441058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'04100410058005800410041004100410' + '04100410041004100410041004100410'+'04100410041004300410041004100430' + '04300430041004100410041004100410'+'04200438043804380438043804380438' + '04380483043804100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04380438043804380438043804380439' + '04380438043804380438043804F00410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '041004100410041004D4041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100584058405840584058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'04100410058005800410041004100410' + '04100410041004100430043004100410'+'04300430043004300410041004300430' + '04300430041004100410041004100410'+'04200438043804380438043804380438' + '04390438043804380438041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100438'+'04380438043804380438043804380438' + '04380410041004100410041004D40410'+'04100410041004100410041004100410' + '04100410041004100425041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410042004200410041004100410'+'04100410041004100410041004100410' + '041004100410041004F004D404100410'+'04100410041004100410041004100410' + '04100410041004100410041004100584'+'05840584058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'04100580058005800410041004100410' + '04100410041004300430041004100410'+'04300410041004100410041004100430' + '04300430043004100410041004100410'+'04200420043804380438043804380438' + '04380438043804380438043804380410'+'04C00410041004100410041004100410' + '04100410041004100410043804380438'+'04380438043804380438043804380410' + '04100410041004100410041004F00410'+'04100410041004100410041004100410' + '04100410042404240424042404100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800420042004200420042004100410'+'04100410041004100410041004100410' + '0410041004100410041004F004100410'+'04100410041004100410041004100410' + '04100410041004100410041005840584'+'05840580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100580041004100410041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $70-$7F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058004100410041004100410' + '04300410041004100410041004100410'+'04300430041004100410041004100410' + '04100430043004100410041004100410'+'04100420042004380438043804380438' + '04380438043804380438043804380420'+'04200410041004100410041004100410' + '04100410041004100438043804380438'+'04380438043804380438043804100410' + '04100410041004100410041004D40410'+'04100410041004100410041004100410' + '04240424042404240424042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800420042004200420042004200420'+'04100410041004100410041004100410' + '0410041004100410041004C004100410'+'04100410041004100410041004100410' + '04100410041004100584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058004100410041004100430' + '04300430041004100410041004100430'+'04200420043004300410041004100410' + '04100410041004100410041004100410'+'04100420042004200438043804380438' + '04380438043804380438043804380420'+'04200420042004200410041004100410' + '04100410041004300430043804380438'+'04380438043804380438043804100410' + '0410041004100410041004F004D40410'+'04100410041004100410041004240424' + '0424042404240424042404D405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580042004200420042004200420'+'04200420042004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100410041004100430' + '04300410041004100430043004200420'+'04200420042004200420041004100410' + '04100410041004100410041004100410'+'04100420042004380438043804380438' + '04380438043804380438043804200420'+'04200420043004300430043004300430' + '04300430043004300430042004200438'+'04380438043804380438043804100410' + '0410041004100410041004D404100410'+'04100410041004240424042404240424' + '042404240424042404EA058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580042004200420042004200420'+'04200420042004200420041004100410' + '04100410041004100410041004100410'+'041004100410041004100410041004C0' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004300430042005800580'+'05800580043004300420042004100410' + '04100410041004100410041004100410'+'04100420043804380438043804380438' + '04380438042004200420042004200420'+'04300430043004300430043004300430' + '04300430043004300420042004200420'+'04380438043804380438043804100410' + '041004100410041004F004F004100410'+'04100424042404240424042404240424' + '042404240424042404D4058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580042004200420042004200420'+'04200420042004200420042004100410' + '04100410041004100410041004200420'+'04200410041004100410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800410'+'05800580058004100410041004100410' + '04100410043004300420058004080580'+'05800580058005800430042004200420' + '04100410041004100410041004100410'+'04200420043804380438043804200420' + '04200420042004200420042004200430'+'04300430043004300430043004300430' + '04300430043004200420042004200420'+'04200438043804380438043804100410' + '041004D404D404F004F004F0048004D4'+'04F004D404F004F004F004F004F004F0' + '04F004F004F004F004F004AE05800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058004B004D404200420042004200420'+'04200420042004200420042004100410' + '0410041004C004100410042004200420'+'04200410041004100410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058004100410'+'05800580058004100410041004100410' + '04100430043004300420058005800580'+'04350580058005800408058005800408' + '04080580058004080580058005800408'+'05800580058004380438042004200420' + '04200420042004200420042004200430'+'04300430043004300430043004300430' + '04F004F004F004F004D404F004F004F0'+'04F004F004F004F004D404F004D404D4' + '04D404F0041004100410041004100410'+'04240424042404D40424042404240424' + '042404240424042404D4058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580042004200420042004200420'+'04200420042004200420042004200420' + '0410041004F004200420042004200420'+'04200420041004100410041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058004100410'+'05800580058004100410041004100410' + '04100430043004300420042005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04100410058005800420042004200420' + '04200420042004200420042004200420'+'0430043004F004F004F004F004F004F0' + '04F00430043004300420042004200420'+'04200420042004200420042004200410' + '04100410041004100410041004100410'+'04240424042404240424042404240424' + '0424042404240424042404D405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800420042004200420042004200420'+'04D40420042004200420042004200420' + '042004D404F004200420042004200420'+'04200424042404250410041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058004100580'+'05800580058005800410041004100410' + '04100410043004300430042004200580'+'05800580058004300430041004100410' + '04100410041004100410041004100410'+'04100410041005800580042004200420' + '04200420042004200420042004200420'+'042004F004F004300430043004300430' + '04300430043004300430043004300430'+'04300430042004200420042004200410' + '04100410041004100410041004100424'+'04240424042404240424042404240424' + '04240424042404240424042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04200420042004200420042004200420'+'04200420042004200420042004200420' + '042004F0042004200420042004200420'+'04240424042404240424042404400584' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100430043004200420'+'04080420043004300410041004100430' + '04300430041004100410041004100410'+'04100410041004100580058005800420' + '04200420042004200420042004200420'+'04F004F0042004200420042004200420' + '04300430043004300430043004300430'+'04300430043004300430043004100410' + '04100410041004100410041004240424'+'04240424042404240424042404240424' + '04240424042404240424042404240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004200420' + '04200420042004200420042004200420'+'04200420042004200420042004200420' + '042004F0042004200420042004200420'+'04240424042404240425042404400441' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800408058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410041004100420'+'05800420041004100410043004300430' + '04300410041004100410041004100410'+'04100410041004100410041005800580' + '05800580058005800580058005800580'+'04B30580042004200420042004200420' + '04200430043004300430043004300430'+'04300430043004300430043004100410' + '04100410041004100410041004240424'+'0424042404D504D40424042404240424' + '04240424042404240424042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041004100420' + '04200420042004200420042004200420'+'0420042004F004D40420042004200420' + '042004F0042004200420042004200424'+'04240424042404240424042404400440' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100430043004100410041004100410'+'05800410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004200420' + '04200420042004200420042004200420'+'04F00580058005800580042004200420' + '04200420043004300430043004300430'+'04300430043004300430041004100410' + '0410041004100410041004D404D4042C'+'042C042C042C042C042C042C042C042E' + '042C042C042404240424042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04200420042004200430042004200420'+'04200420042004200420042004200420' + '042004F0042004200420042004240424'+'04240424042404240424042404400584' + '05840584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005840584'+'05840584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100410043004100410041004100410'+'04080580041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100420' + '04200420042004F004F004F004F004F0'+'04F00420042004200580058005800580' + '04200420043004300430043004300430'+'04300430043004300430041004100410' + '041004100410041004D404D4042C042C'+'042C042C042C042C042C042C042C042C' + '042C042C042404240424042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100420042004200420042004200420'+'042004200420042004200420042004F0' + '04F004F004F004F00420042004240424'+'04240424042404240424044104400584' + '05840584058405800580058005800580'+'05800580058005800580058005800580' + '0580058005800580058005840584040A'+'0584040A058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004300430041004100410'+'04100580058005800580058005800580' + '04080410041004100410041004100410'+'04100410041004100410041004100410' + '0420042004F004F00420042004200420'+'04200420042004200420042004200580' + '05800580043004300580058005800580'+'05800580043004300410041004100410' + '04100410041004D404F0042C042C042E'+'042C042C042C042C042C042C042C042C' + '042C042C042404240424042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410042004200420042004200420'+'042004200420042004200420042004F0' + '04F004E804F004F004F004F004F004F0'+'04F004D404F004F004F004D405840584' + '05840584058405840584058005800580'+'05800580058005800580058005800580' + '05800580058005800584058405840584'+'04940584040A05800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '05800580058004100410041004100410'+'04100410041004100410041004100410' + '041004F004F004200420042004200420'+'04200420042004200430042004200420' + '04200580058005800580044004400441'+'04400580058004300410041004100410' + '041004D404D404F0042C042C042C042C'+'042C042C042C042C042C042E042C042C' + '042C042C042404240424042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004200420042004200420'+'042004200420042004200420042004F0' + '04F004F004F004F00420042004240424'+'04240424042404240440044005840584' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580040A0584040A'+'0584040A058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410040804100410041004100410'+'04100410041004100410041004100410' + '04D404F0042004200420042004200420'+'04200420042004200420042004200420' + '0420042004B204410440044004410441'+'04400440058004100410041004100410' + '04D404F0042C042C042C042C042C042C'+'042C04D404D404D4042C042C042C042C' + '042C042C042404240424042404240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004200420043004300430'+'04300420042004200420042004200420' + '04200420042004200420042004240424'+'04240424042404240440058405840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800584'+'040A0584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410058005800580041004100410'+'04100410041004100410041004100410' + '04F00420042004200420042004200420'+'04200420042004200420042004200420' + '04200420058004400441044004400430'+'04400441058004100410041004100424' + '04D4042C042C042C042C042C042C042C'+'042C04D4042D04D4042C042C042C042C' + '042C042C042404240424058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100430043004300430'+'04300430042004200420042004200420' + '04200420042004200420042004240424'+'04240424042404400441058405800580' + '05800580058005800580058005800580'+'05800580058005800580042404240424' + '04240424042405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $80-$8F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100580058005800580'+'05800580058004100410041004100410' + '04E80420042004200420042004200420'+'04200420042004200420042004200420' + '05800580058005800440044004400440'+'04400580058004100410041004240424' + '04F0042C042E042C042C042C042C042C'+'042C04D404D404D4042C042C042C042C' + '042C042C042404240580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100430043004300430'+'04300430043004200420042004200420' + '04200420042004200420042004240424'+'04240424044004410580058005800580' + '05800580058005800580058005800580'+'05800580058004240424042404240424' + '04240424042404240440058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410058005800408058005800580' + '05800580058005800580058004200420'+'04200420042004200420058005800580' + '05800580058005800580058005800580'+'05800580058005800410042404240424' + '04F0042C042C042C042C042C042C042C'+'042C042C042C042C042C042C042C042C' + '042C042C042405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100410041004100410043004300430'+'04300430043004300430042004200420' + '04200420042004200420042004240424'+'04240441058005800580058005800580' + '05800580058005800580058005800580'+'05800424042404240410041004100425' + '04240424042404240424044105800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04E804F004D404D404D4058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800424042404240424' + '04F0042C042C042C042C042C042C042C'+'042C042C042C042C042C042C042D042C' + '042C042C058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100410041004100410043004300580'+'05800430043004300430043004200420' + '04D40420042004200420042404240424'+'04240580058005800580058005800580' + '05800580058005800580058005800580'+'04240424042404100410041004100410' + '04100424042404240424044005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04F004F004F004D4042C042C042C042C'+'04100410041004100410042504240424' + '05800580058005800580058005800580'+'05800580058005800424042404240424' + '04F0042C042C042C042C042C042C042C'+'042E042C042C042C042C042C042C042C' + '042C0580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100410041004100410043004300580'+'05800580058004300430043004200420' + '04200420042004200420042404240424'+'05800580058005800478058005800580' + '05800580058005800580058005800424'+'04250410041004100410041004100410' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04D504F004F004F0042C042C042C042C'+'04100410041004100410041004240424' + '04240580058005800580058005800580'+'05800580058005800424042404240424' + '04D4042C042C042C042C042C042C042C'+'042C042C042C042C042E042C042C042C' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100410041004100410041004300430'+'058005800580043004300430042004D4' + '04200420042004200420042404240424'+'05800580058005800580058005800580' + '05800580058005800580058004240424'+'04100410041004100410041004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04F004F004F004D5042C042D042C0410'+'04100410041004100410041004240425' + '04240580058005800580058005800580'+'05800580058005800424042404240424' + '04F0042C042C042C042E042C042C042C'+'042C042C042C042C042C042C042C0580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100410041004100410041004300430'+'04300580043004300430042004200420' + '04200420042004200420042404240481'+'04240580058005800580058005800580' + '05800580058005800580042504240410'+'04100410041004100410041004100410' + '04100410041005840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '041004F004F004F0042C042C042C0410'+'04100410041004100410041004240424' + '04240424058005800580058005800580'+'058005800580042404240424042404F0' + '04F0042C042C042C042C042C042C042C'+'042C042C042C042C042C042C042C0580' + '05800580042404240424058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004C00410' + '04100410041004100410041004100410'+'04300580043004300420042004200420' + '04200420042004200420041004100410'+'04250424058005800580058005800580' + '05800580058005800580042404100410'+'04100410041004100410041004100410' + '04100410058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '0410041004F004F0042C042C04100410'+'04100410041004100410042504240424' + '04240424058005800580058005800580'+'05800580042404240424042404F004D4' + '0424042C042C042C042C042C042C042C'+'042C042C042C042C042C042C05800580' + '05800424042404240424042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100410041004D40410' + '04100410041004100410041004100410'+'04100580042004200420042004200420' + '04100410041004C00410041004100410'+'04100424042405800580058005800580' + '05800580058005800424042404100410'+'04100410041004100410041004100410' + '04100584040A05800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '0410041004F004D40410041004100410'+'04100410041004100410042404240424' + '0424042404B204B204B204B204B204B2'+'04B204B204F004F004F004F004D40424' + '0424042C042C042C042E042C042C042C'+'042C042C042C042C042F058005800580' + '04240424041004100410042404240580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100410041004D40410' + '04100410041004100410041004100410'+'04100580042004200420042004100410' + '04100410041004100410041004100410'+'04100410042404240580058005800580' + '05800580058004240424041004100410'+'04100410041004100410041004100410' + '04100584040A05800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '0410041004D404100410041004100410'+'0410041004100410041004C004100410' + '04250424058005800410058005800580'+'05800580042404240424042404240424' + '0424042C042C042C042C042C042C042C'+'05840584042C042C0580058005800580' + '04240491041004100410042404240424'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'0410041004100410041004D504A004D5' + '04100410041004100410041004100410'+'0410058005800420042004D404100410' + '04100410041004100580058004080410'+'04100410041004240424058005800580' + '05800580042404240410041004100410'+'04100410041004100410041004100410' + '04100410058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '041004F004D404100410041004100410'+'04100410041004100410041004100410' + '04100424058005800410041005800580'+'05800580058004240424042404240424' + '0424042C042C042C042C042C042C0584'+'042F042C058405800580058005800580' + '04240410041004100410041004240424'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100410041004D40410' + '04100410041004100410041004100410'+'0410041005800580058004D905800580' + '05800580058005800580058005800410'+'04100410041004100425042404240580' + '05800424042404100410041004100410'+'04100410041004100410041004100410' + '04100410058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100580058004100410041004100410' + '04100410041005800580058005800580'+'05800580041004100410041004100410' + '041004D4041004100410041004100410'+'04100410041004100410041004100410' + '04100584058005800410041005800580'+'05800580058005800424042404240424' + '0424042C042C042C042C042C042C042C'+'042C0584058005800580058005800580' + '04240410041004100410041004240424'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'041004100410041004C0041004C00410' + '04100410041004100410041004100410'+'0410041004100410041004F004D404F0' + '04100410041005800580058004100410'+'04100410041004100410041004240424' + '04250424041004100410041004100410'+'04100410041004100410041004100410' + '04100410041005840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100580058004100410041004100410' + '04100410041004100410041004100580'+'05800580058005800580058005800580' + '058004B3041004100410041004100410'+'04100410041004100410041004100584' + '05840584058004100410041004100580'+'05800580058005800440042404240424' + '0424042C042C042C042C042C0584042C'+'0584042F058005800580058005800580' + '04100410041004100410041004240424'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100428041004100410' + '04100410041004100410041004100410'+'041004100410041004100410041004D5' + '04100410041004100580041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041005840584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410058004100410041004100410' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '058004B30408040A0584058405840410'+'04100410041004100410058405840584' + '05840410041004100410041005800580'+'05800580058005800584044004240424' + '0424042E042C0584042C042C05840584'+'05840580058005800580058005800580' + '058004100410041004C0042404240580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100428042804100410' + '04C004100410041004C0041004100410'+'04100410041004100410041004F004D4' + '04100410041004100580041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100584058405840584'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410058005800580' + '05800580058005800580058004100410'+'04100410041004100410041004100580' + '040804B3041004100410041005840584'+'05840584058405840584058405840410' + '04100410041004100410041005800580'+'05800580058005800580058404410424' + '042405840584042C042F05840584042F'+'05800580058005800580058005800580' + '05800580041004100410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410042804100410' + '04280410041004100428041004100410'+'041004100410041004F004D504D50410' + '04100410041004100580058004100410'+'041004C0041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004C00410041004100410' + '04100410041004C00441044004400584'+'05840584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '041004D4041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100580'+'05800580058005800580058005840440' + '0440042F058405840584058405840580'+'05800580058005800580058005800580' + '05800580058004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410042804100410' + '04280410041004100428041004100410'+'04100410041004D404D5041004100410' + '04100410041004100410058004380438'+'04380438043804380410041004100410' + '04100410041004100410041004100410'+'04100410043004300430043004100410' + '04100410041004100410042404240441'+'04400584058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $90-$9F
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '041004D4041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100580'+'05800580058005800580058005840584' + '058405840584042F0584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410042804100410' + '04280410041004100428042804100410'+'04100410041004D40410041004100410' + '04100410041004100410041004380438'+'04380438043804380438043804100410' + '04100410041004100430043004300410'+'04100430043004300430043004300410' + '04100410041004100410042504240430'+'04300440058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04D404F0041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041005800580'+'05800580058005800580058005800584' + '05840584058405840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410042804100428' + '04280410041004280428041004100410'+'04100410041004D50410041004100410' + '04100410041004100439043804380438'+'04380438043804380438043804380410' + '04100430043004300430043004300430'+'04300430043004300430043004300430' + '04100410041004100425042404300430'+'04300430058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04F00410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05840584058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410042804100428' + '04100410041004280410041004100410'+'04100410041004D50410041004100410' + '04100410041004100438043804380438'+'04380438043804380438043804380430' + '04300430043004300430043004300430'+'04300580058005800430043004300430' + '04100410041004100424043004300430'+'04300430058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004F004D4' + '04F00410041004100410041004100410'+'04100410041004100410041004100410' + '041004C0041004100580058005800580'+'05800580058005800580058005800580' + '05840584058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410042804100428' + '04100410041004280410041004100410'+'04100410041004D404D5041004100410' + '04100410041004380438043804380438'+'04380438043804380438043804300430' + '04300430043004300430043004300430'+'05800580058005800580043004300430' + '04300410041004100410043004300430'+'04300430058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004F004F0' + '04F00410041004100410041004100410'+'041004F004F004F004100410041004F0' + '04F004F0041004100580058005800580'+'05800580058005800580058005800580' + '05800584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410042804280428' + '04100410042804280410041004100410'+'041004100410041004D404D504D50410' + '04100410041004380438043804380438'+'04380438043804380438043804300430' + '04300430043004300430043004300580'+'05800408058005800580058004300430' + '04300410041004100410043004300430'+'04300430058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410041004100410'+'0410041004100410041004C004F004F0' + '04F004F0041004100410041004100410'+'04C004F004F004F00410041004F004F0' + '04F004F004D405800580058005800580'+'05800580058005800580058005800580' + '05800584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004280428' + '04100410042804100410041004100410'+'04100410041004100410041004D50410' + '04100410041004380438043804380438'+'04380438043804380438043804300430' + '04300430043004300430043004300580'+'05800580058005800580058005800430' + '04300430041004100410041004300430'+'04300430058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100410041004100410041004100410'+'041004100410041004100410041004D4' + '04F004F004C004100410041004100410'+'0410041004F004F004C0041004F004F0' + '041004F004F005800580058005800580'+'05800580058005800580058005800580' + '05800584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100428' + '04100410042804100410041004100410'+'04100410041004100410041004D504F0' + '04100410041004100438043804380438'+'04380438043804380430043004300430' + '04300430043005800580058005800580'+'05800580058005800580058005800430' + '04300430041004100410041004100430'+'04300430058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100580' + '05800580041004100410041004100410'+'04100410041004100410041004F004F0' + '04F004F004F005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100410042804100410041004100410'+'041004100410041004100410041004D4' + '04F004F0041004100438043804380438'+'04380438043004300430043004300430' + '04300430058005800430043004300580'+'05800580058005800580058005800430' + '04300430041004100410041004100410'+'04100410058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410041004100410'+'0410041004C004100410041004100410' + '0410041004100410041004C004F004F0'+'041004100410041004100410041004F0' + '04F004F004F005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100410042804100410041004100410'+'0410041004100410041004100410042C' + '042C04D404F004380438043804380438'+'04380430043004300430043004300430' + '04300580058004300430043004300430'+'04300430058005800580058004300430' + '04300430041004100410041004100410'+'041004100410040A0584058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041004100410' + '04100410041004100410041004100410'+'0410041004F004F00410041004100410' + '04100410041004100410041004F004F0'+'04F004C0041004100410041004100410' + '0410041004F005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100410042804280410041004100410'+'041004100410041004100410042C042C' + '042C042C04F004F004F0043804380438'+'04300430043004300430043005800580' + '05800580043004300430043004300430'+'04300430043005800580043004300430' + '04300430043004100410041004100410'+'041004100410040A0584058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'0410041004F004F004F0041004100410' + '04100410041004100410041004F004F0'+'04F004100410041004C0041004100410' + '0410041004F005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100428' + '04100410042804280428041004100410'+'04100410041004100410042E042C042C' + '042C042C042C042C04D404F004300430'+'04300430043004300430043005800430' + '04300430043004300430043004300430'+'04300430043004300430043004300430' + '04300430043004300410041004100410'+'04100410058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'0410041004D404F004F004C004100410' + '041004C0041004100410041004100410'+'04100410041004100430043004100410' + '041004F004F005800580058005800580'+'05800580058005800580058005800580' + '05800584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004280428' + '04280410041004280428041004100410'+'04100410041004100410042C042C042E' + '042E042C042C042C042C04D404D40430'+'04300430043004300430058005800430' + '04300430043004300430043004240424'+'04240424043004300430043004300430' + '04300430043004300430041004100410'+'04100441058405840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04F004F0041004100410041004100410'+'04100410041004100430043004100410' + '04F004F0058005800580058005800580'+'05800580058005800580058005800584' + '05840584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04280428042804280428041004100410'+'041004100410041004100410042C042C' + '042C042C042C042C042C042C04D404D4'+'04D40430043004300430058004300430' + '04300430043004300424042404240424'+'04240424042404300430043004300430' + '04300430043004300430042404240424'+'04240440058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041004100410' + '04100410041004100410041004100410'+'041004100410041004100410041004C0' + '04F004F004F004C00410041004100410'+'04C00410041004D404D404F004100410' + '04F00580058005800580058005800580'+'05800580058005800580058005840440' + '04410440058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100410' + '04100428042804280410041004100410'+'04100410041004100410041004100410' + '042E042C042C042C042C042C042C042C'+'04D404D404F004D404D404B204300430' + '04300430043004240424042404240424'+'04240424043004300430043004300430' + '04300430043004240424042404240424'+'04240440058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'0410041004100410041004C004100410' + '04F004F004F00410041004C004F004F0'+'04F0041004C004D404F004F004C00410' + '04D404F0058005800580058005800580'+'05800580058005800580058404400443' + '04400440058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058004100410041004C0041004100410' + '04100410042804280410041004100410'+'04100410041004100410041004100410' + '0410042C042C042C042C042E042C042C'+'04100410041004100410058005800430' + '04300430043004240424042404240424'+'04240424042404240424042404300430' + '04300430042404240424042404240424'+'04410584058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'041004100410041004F004F004100410' + '04100410041004100410041004F004F0'+'04F00410041004F004F0041004100410' + '041004F004F005800580058005800580'+'05800580058005800580058404410440' + '04410584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100428041004100410' + '04100428042804100410041004100410'+'04100410041004100410041004100410' + '04100410042C04100410041004100410'+'04100410041004100410041005800430' + '04300430042404240424042404240424'+'04240424042404240424042404240430' + '04300424042404240424042404240424'+'04400584058405800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $A0-$AF
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'04100410041004F004F004F004100410' + '0410041004100410041004F004F004F0'+'041004100410041004100410041004C0' + '0410041004D404F00580058005800580'+'05800580058005800580058405840441' + '04400584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004280428041004100410' + '04280428041004100410041004100410'+'04100410042804100410041004100410' + '0410041004D504100410041004100410'+'04100410041004100410041005800580' + '04240424042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240424042404240424'+'04410584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004100410'+'0410041004F004F004F004F004C00410' + '041004100410041004C004F004F004F0'+'04100410041004100410041004F004F0' + '04100410041004D40584058005800580'+'05800580058005800580058005840584' + '05840584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580042804280410041004100428' + '04280410041004100410041004100410'+'04100410042804280428042804100410' + '04100410042804100410041004100410'+'04100410041004100410041004100580' + '04240424042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240424042404240424'+'04410584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'0410041004F004F004F0041004100410' + '0410041004C004100410041004100410'+'04100410041004100410041004F004F0' + '04100410041004D404F0044005840580'+'05800580058005800580058004400584' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580042804280410041004280428' + '04280410041004280428042804280428'+'04280428042804280428042804280428' + '04280428042804280428041004100410'+'041004D504F004F004D504F004F00580' + '04240424042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240424042404240424'+'04400580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100410041004100410'+'0410041004D404F004F0041004100410' + '04F004F004F004F00410041004100410'+'0410041004F004F004100410041004C0' + '041004100410041004D404D405840584'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004280428041004100410' + '04280428042804280428042804280428'+'04280428042804280428042804280428' + '04280428042804280428042804100410'+'041004F004D504D404EA04D404F00580' + '04240424042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240424042404240440'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041005800580' + '04100410041004100410041004100410'+'04100410041004D404F00410041004C0' + '04F004F0041004F004F004C004100410'+'04C004D404F004F00410041004100410' + '0410041004100410041004F004400584'+'05840580058004400580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100428041004100410' + '04100410041004100410041004280428'+'04280428042804280428042805800580' + '05800580042804280428041004100410'+'04F004F004F004D504D404F004D404B2' + '04240424042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240424042404240440'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004100580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04F004F004F004F004F0041004100410'+'04100410043004100410041004C00410' + '0410041004100410041004F004410584'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100428042804100410' + '04100410041004100410041004100428'+'04280428042804280580058005800580' + '05800580058005800428041004100410'+'04F004D504F004F004F004F004F00580' + '04240424042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240424042404240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004D404D4041004100410' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '041004F004F004F00410041004100410'+'0410041004100410041004F004F00410' + '04100410041004F004F004F004410584'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100428042804100410' + '04100410041004100410041004100410'+'04280428042805800580058005800580' + '05800580058005800580058004100410'+'04D504F004F004F004F004D405800580' + '05800424042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240424042404240580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'0410041004D404F004F004D404100410' + '04100580058005800410041004100410'+'04100410041004100410041004100410' + '041004C0041004100410041004F004F0'+'041004100410041004C004F004F004D4' + '0410041004D504F004F0044004400584'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410042804280410' + '04100410041004100410041004100410'+'04100428058005800580058005800580' + '05800580058005800580058005800580'+'04D404D404F004F004F0058005800580' + '05800580042404240424042404240424'+'04240424042404240410042404240424' + '04240424042404240424042405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'041004D404F004C804F004F004C00410' + '04100580058005800580041004100410'+'04C004D504D504D40410041004100410' + '04100410041004100410041004F004F0'+'04F004C0041004100410041004100410' + '0410041004F004F004F0044005840580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410041004100410041004280428' + '04280410041004100410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'0580058004D404D40580058005800580' + '05800580042404240424042404240424'+'04240424042404240424042404240424' + '04240424042404240580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'041004D404F004F004F004D404100410' + '04100580058004100410041004100410'+'0410041004D504F004D504C004100410' + '0410041004100410041004D404F004F0'+'04F00410041004100410041004100410' + '0410041004F004F00441058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04280428042805800580058005800580'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004240424042404240424'+'04240424041004240424042404100424' + '04240424042405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'0410041004D404D404D4041004100410' + '05800580041004100410041004100410'+'04100410041004D404F0041004100410' + '041004100410041004100410041004C0'+'0410041004100410041004C004100410' + '0410041004C004100584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100410041004100410' + '04280428041004100410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800424042404240424'+'04240424042404240424042404240424' + '04240424042405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410041004100410041004100580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'04100410041004F004F004F004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100410041004100410041004100410' + '05840428041004100410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004240424'+'04240424042404240424042404240424' + '04240424058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100410'+'0410041004D404F004F0041004100410' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410041004100410041004100410' + '04100584058405840584041004100410'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800424'+'04240424042404240424042404240424' + '04240580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04D404F004F004F004F004F004100410'+'041004100410041004C0041004100410' + '04C00410041005840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '05840584058405840584058404280428'+'04100410041005840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800424042404240424042404240424' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04F004F0048004D404C004F004F004F0'+'04100410041004100410041004100424' + '04240424058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100584' + '05840410041004280580058005840584'+'05840428042804400584058405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '041004D404F004F004F004F0041004D4'+'0410041004C004100410041004240424' + '04240584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100584' + '04100410058005800580058005800580'+'05800584042804100410044005840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $B0-$BF
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041004100424'+'04240424042404240424042404240424' + '04240584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041005840584' + '04100410058005800580058005800580'+'05800580058004100410041005840584' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410042C042C042C042E042C0410' + '04100410041004100410041004100424'+'04240424042404240424042404240424' + '04240424058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800410041004410428' + '04100580058005800580058005800580'+'05800580058005800410041004400584' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410042E042C042C042C042C04D4' + '04D404D4041004100410042404240424'+'04240424042404240424042404240424' + '04240424042405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580041005840428' + '04100580058005800580058005800410'+'04100580058005800580058004100440' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'041004100410042E042C042C042C0410' + '04100430043004300424042404240424'+'04240424042405800580058004240424' + '04240424042404240584058005800408'+'04080580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005840428' + '05800580058005800580058004100410'+'04100410058005800580058005800440' + '05840584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004100410' + '04300430043004300424042404240424'+'04240580058005800580058004240430' + '04300430042404240584058405800580'+'04080408058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005840584' + '04280410058005800580058004100410'+'04100410041005800580058005800580' + '05840584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04300430043004300430043004240424'+'04240580058005800424042404240580' + '05800430042404240584058005800408'+'04080580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800440' + '05840410041004100580058005800410'+'04100410058005800580058005800580' + '05840584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04300430043004300430043004240424'+'04240424042405800424042404240424' + '04240424042404240580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '05840428041004100580058005800580'+'05800580058005800580058005800580' + '05800584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004300430' + '04300430043004300430043004300424'+'04240424042405800424042404240424' + '04240424042404240580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05840440042804100410058005800580'+'05800580058005800580058005800580' + '04100584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004300430' + '04300430043004300430043004300430'+'04240424042405800424042404240424' + '04240424058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800441044004280428041004100580'+'05800580058005800580058004100410' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410043004300430' + '04300410041004100410041004300430'+'04300430043005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058405840428044104400428'+'05800580041004100410041004100410' + '04100410041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004100410041004C00410' + '04100410041004100410043004300430'+'04300430058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005840584044004400428'+'04280440044004100410041004100428' + '04280428042804100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058405840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410043004300430'+'05840584058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058405840584'+'05840441044004410428042804280428' + '04280428042804280410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '05800410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041005840584'+'05840580058005800580058405840584' + '05840584058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800584'+'05840584044004400428042804280428' + '04280424042504100410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058004100410041004100410' + '04100410041004100410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041005840584'+'05800580058005800584058405800580' + '05800584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058405840584042804280428' + '04240424042404100410041004100580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410041005840580'+'05800580058005840584058404840584' + '05840580058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058404280428' + '04240424042504240410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004100410' + '04100410041004100410041004100410'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410058405840580'+'05800580058405840484058405840584' + '04840580058005840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100428' + '0425042404240424042504B005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058004B2044104400440044004100410' + '04C00410041004100410058004100410'+'04100410041005840580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $C0-$CF
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410058004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410058405840580'+'05800580058405840584058404D40584' + '05840584058005840584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100424042404100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800441044004400441' + '04410410041004100410041004100410'+'0410041004C005840584058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041005800410041004100410'+'04100410041004100410041004100410' + '04100410041004100430058405840580'+'0580058005840484058404D4041004D4' + '05840484058005800584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580044004410440' + '04400410041004C00410041004100410'+'04100410041004100584058405800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041005800580041004100410'+'04100410041004100410041004100410' + '04100410041004100430058405840584'+'05800580058005840584058404D40584' + '05840584058005800584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004400440' + '04400441041004330410041004100410'+'04100410041004100584058405840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410058004100410'+'04100410041004100410041004100410' + '04100410041004100430058405840584'+'05800580058005840484058405840584' + '04840580058005800584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800440' + '04410440044004330433041004100410'+'04100410041004100410044005840580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041005800410'+'04100410041004100410041004100410' + '04100410041004100430043005840584'+'05840580058005800584058404840584' + '05840580058005800584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800441' + '04400440044004330433041004100410'+'041004100410041004C0044104400580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100580'+'04100410041004100410041004100410' + '04100410041004100430043005840584'+'05840580058005800580058005800580' + '05800580058005840584058405800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800441' + '04400441044105800580058005800580'+'05800580058005800580058005800441' + '04400441043304330433043304100410'+'04100410041004100410041004400440' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'05800410041004100410041004100410' + '04100410041004100410043004300584'+'05840584058405800580058005800580' + '05800584058405840584058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580044004410440044004400440' + '04400440044004400424041004100580'+'05800580058005800580058005800440' + '04400433043304330433041004100410'+'04100410041004100410041004100410' + '04410580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100580058005800410041004100410' + '04100410041004100410043004300430'+'05840584058405840580058005800584' + '05840584058405840580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800441'+'04410440044004400440044104100410' + '04100410042404240425042404100410'+'04100580058005800580044004400440' + '044004330433043304330410041004C0'+'04100410041004100410041004100410' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410058005800580058004100410' + '04100410041004100410041004300430'+'04300584058405840584058405840584' + '05840584058405800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004410440'+'04400410041004100410043304330410' + '04100410041004240424042404250410'+'04100410044104400440044104400433' + '04330433043304330410041004100438'+'041004100410041004C0041004100410' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410058005800410058005800580' + '05800410041004100410041004100410'+'04100430058405840584058405840584' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800441044004400440'+'04100410041004330433043304330433' + '04330433043304240424042404100410'+'04100410041004410440044004330433' + '04330433041004100410041004100438'+'04100410041004100424042504240441' + '04100410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041005800580058005800580' + '05800580058005800580041004100410'+'04100410041005840584058005800584' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800440044004100410'+'04330433043304330433043304330433' + '04330433041004100424042504100410'+'04100410041004C00410043304330410' + '04100410041004100410041004100438'+'04100410041004100424042404240440' + '04410410058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410058004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004410440041004100410'+'04330433043304330433043304330433' + '041004100410041004C0041004100410'+'04100410041004100410041004100410' + '041004C0043804100410043804380438'+'04100410041004250424042404240440' + '04400580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041005800580' + '04100410041004100410041004100410'+'04100580058004100410058005800580' + '05800580058005800410041004100410'+'04100410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004400440041004100433'+'04330433043304330433043304100410' + '04100410041004100410041004100410'+'0410041004C004100410041004100410' + '04100410043804380438043804100410'+'04100410041004240424042404400441' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100580' + '05800410041004100410041004100410'+'04100580058004100410041005800580' + '05800580058004100410041004100410'+'04100410041004100410041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580044004400440044104330433'+'04330433043304100410041004100410' + '04100410041004100410041004100410'+'04100410043304330433041004100410' + '04100410041004100410041004100410'+'041004C0042404240424042404400440' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04100580058004100410041004100410'+'04100410058005800410058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580044004400440041004330433'+'0433043304D504100410041004100410' + '04100410041004100410043304330433'+'04100410041004330433043304100410' + '04100410041004100410041004100410'+'04100410042504240424044004410580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100410041004100410041004100410' + '04100410058005800580041004100410'+'04100410041005800580058004100410' + '04100410041004100410043004300430'+'04300430043004100410041004100410' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800441044004400410041004330433'+'0433041004D504D504D5041004100410' + '04100410041004100433043304100433'+'04330410041004330433043304100410' + '04100410041004100410041004100410'+'04100410041004400441044005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $D0-$DF
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580041004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100580058004100410'+'04100580058005800410041004100410' + '04100410041004100430043004300430'+'04300430043004300410041004100410' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05840441044004410410041004330433'+'043304100410041004D5041004100410' + '04100410041004C00433043304100410'+'04330433041004100433043304330410' + '04100410041004C00410041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410058005800580'+'05800580058004100410041004100410' + '04100410043004300430043004300430'+'04300430043004300430041004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05840440044004240410043304330433'+'043304100410041004D504D504D50410' + '04100410041004100410043304100410'+'04330433043304330433043304330433' + '04100410041005840410041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004100410041004100410'+'04100410041004100410041004100410' + '04100410041004100410058005800580'+'05800580041004100410041004100410' + '04100430043004300430043005800580'+'05800430043004300430043004100410' + '04100580058004100430043005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05840410044104240410043304330433'+'04330410041004100410041004D50410' + '04100410041004100410041004100580'+'05800580058005800580043304330433' + '04100410041005840410041004100410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '04100410041004100580058005800410'+'05800580041004100410041004100410' + '04300430043004300430058005800580'+'05800580058004300430043004300410' + '05800580058004300430043004300410'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '05840410042404240424043304330433'+'04100410041004100410041004D504D5' + '04240425042404100410058005800580'+'05800580058005800580058005800410' + '04100410058405840584041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100410041004100410' + '04100410041005800580058004100410'+'05800580058004100410041004100410' + '04300430043004300580058005800580'+'05800580058005800430043004300410' + '04100580041004300430043004300410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '05840410041004240424041004330433'+'04100410041004100410041004100425' + '04240425058005800580058005800580'+'05800580058005800580058005800580' + '05800584058405840584058405800410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100410041005800580041004100410'+'04100580058004100410041004100410' + '04300430043004300430043004300420'+'04230580058005800430043004300410' + '04100410041004100430043004380438'+'041004C0041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '05840410041004250424041004330433'+'04100410041004100410041004100425' + '04250471058005800580058005800580'+'05800580058005800580058005800580' + '05800580058405840584058005800580'+'05800410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100410041005800580058004100410'+'04100580058005800410041004100410' + '04300430043004300430058005800580'+'05800580058004300430043004100410' + '04100410041004100430043804380438'+'04380438041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '05840410041004100424042504100433'+'04100410041004100410041004100425' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058005800580040A0580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100410041005800580058004100410'+'04100580058005800410041004100410' + '04100430043004300430043005800580'+'05800580041004300430041004100410' + '04100410041004100410043804380438'+'04380438043804380438058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '05840410041004100424042404240433'+'04100410041004100410041004100580' + '05800580058005800441058405840441'+'04400410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100410041005800580058004100410'+'05800580058005800410041004100410' + '04100410043004300410041004300580'+'058004300410041004C0041004100410' + '04100410041004100410041004380438'+'04380438043804380438043805800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '058404100410041004D5042404D504D5'+'04100410041004100410041005800580' + '05800580058004400440041004100440'+'04100410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100410058005800580058004100410'+'05800580058005800410041004100410' + '04100410041004100410041004300430'+'04300410041004100410041004100410' + '04100410041004100410041004100410'+'04380438043804380438043805800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800584' + '0584041004100410041004D504D504D5'+'04100410041004100410041005800580' + '05800580058004400410041004C00441'+'04100433043804380438041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041004100410' + '04100580058005800580058005800410'+'05800580058005800580041004100410' + '04100410041004100410043004300430'+'04100410041004100410041004C00410' + '04100410041004100410041004100438'+'04380438043804380438043805800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0584041004100410041004D5042404D5'+'04100410041004100410041004100580' + '05800580058004410410041004100410'+'04100433041004100438041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410041004100410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04100410041004100410041004300410'+'04100410041004100410043004300410' + '04100410041004100410043804380438'+'04380438043804380438058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05840584041004100410042404D504D5'+'04100410041004100410041004100580' + '05800580058004400433041004100410'+'04330433041004380438041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '04100410041004100410041004100410'+'04100410041004300430043004100410' + '04100410041004300430043004100410'+'04100438043804380410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0584058404100410041004D504D504D5'+'04D50410041004100410041004100580' + '05800580058004410433043304100433'+'04330410043304330410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800410041004100410041004100410'+'04100430043004300410041004100410' + '04100410043004200420041004100410'+'04100410043804300410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058005840410041004100410042404D5'+'04D50410041004100410041004100580' + '05800580058004100410043804100433'+'04100410043304100433043804380410' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800584044004100410'+'04200420042004300430041004100410' + '04200420042004200410041004100430'+'04300430043004100410041004100410' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800584058404C004100410041004D5'+'04D504D5041004100410041004100580' + '05800580058004100438043804100433'+'04100433043304100433041004380410' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800584044104400420'+'04200420042004200420042004200420' + '04200420042004100410041004300430'+'04100410041004100410041004100410' + '04100580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058404100410041004100425'+'04D504D5041004100410041004100410' + '05800580058005800410043804380433'+'04100433041004330433041004330410' + '04080580058004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $E0-$EF
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058404410441'+'04200420042004200420042004200420' + '04200420041004100410043004300410'+'04100410041004100410041004100410' + '04100410041005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005840410041004100410'+'041004D504D504D5041004C004100410' + '05800580058005800410041004100410'+'04330433041004330410043304330410' + '04100408040804100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058404400440'+'04200420042004200420042004200420' + '04200410041004100410043004100410'+'04100410041004100410041004100410' + '04100410041004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004100410'+'04100410042404D504D504D504100410' + '05800580058005800580058004100410'+'04380410043304330410043304100410' + '04100410058005800410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058404410440'+'04400420042004200420042004200420' + '04100410041004100410043004300410'+'04100410041004100410041004100410' + '041004C0041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'0410041004100410042504D504D50410' + '05800580058005800580058005800410'+'043804380438041004330433041004D5' + '04100410040805800410041005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005840440'+'04400440044004400410041004100410' + '04100410041004100410041004300430'+'04100410041004100410043004300430' + '04300420041004100410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580041004100410041004D504D5' + '05800580058005800580058005800580'+'04100410041004100433041004250425' + '04250410040805800410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058005800580058005800580040A0584'+'04410441044004400440044104100410' + '04100410041004100410041004100430'+'04300430043004300430043004300430' + '04200420042004100580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'058005800580058004100410041004D5' + '04D50580058005800580058005800410'+'058004080410041004D5043304250410' + '04D50410058005800580040804080580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580040A05800580'+'05840584058404410440044004400584' + '05840410041004100410041004100410'+'04100410043004300430043004200420' + '04200420058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058004100410' + '04D504D5058005800580058005800580'+'04100410058004100410041004100410' + '04B70580058004080410058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800584044105800580'+'05800580058005800580058005800580' + '05800580058004300430041004100410'+'04100410041004300430042004200420' + '04200580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004080408'+'04080408058005800580058005800580' + '04D504D5058005800580058005800580'+'05800580058004080580041004100410' + '04A904B204A805800410058004100580'+'04080580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058404400441'+'05800580058005800580044004410440' + '04200440043004300430043004100410'+'04100410041004100430042004200420' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800408040805840584'+'05840584040805800580058005800580' + '04D50584058005800580058005800580'+'05800410041004100408058004080408' + '0580041004B304100580041004080580'+'05800408040805800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058404400440'+'04400440044004400441044004400440' + '04400440044104200420043004300410'+'04100410041004100410042004200420' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800408058405840584'+'05840584058404080580058005800580' + '05840584058005800580058005800580'+'05800580041004100410058005800580' + '0408058004A904B204A8041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005840441'+'04400441044104410440044004400440' + '04410440042004200420042004200410'+'04100410041004100410042004200580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058005800580040805840584040A040A'+'040A0584058404080580058005800408' + '05840584058005800580058005800580'+'05800580058005800410058004080410' + '041005800580041004B704D404100410'+'04100408058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800584'+'05840440044104400440044004410440' + '04400584058404200420042004100410'+'04100410041004100420042004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004080584040A04410440'+'0441040A058405840408040804080584' + '05840580058005800580058005800580'+'05800580058005800580058005800410' + '0410058004100410041004D404A004D4'+'04100580058004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800584058405840584058405840584' + '05840584058404100410041004100410'+'04100410041005840584041004100580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580040804080584040A04400481'+'04400440040A05840584058405840584' + '05840580058005800580058005800580'+'05800580058005800580058005800580' + '04100410040805800410041004D40410'+'04100408058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005840584' + '05840584041004100410041004100410'+'04100584058405840410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '058005800408040805840584040A0441'+'0440040A058405840584058405840584' + '04080580058005800580058005800580'+'05800580058005800580058005800580' + '04080580058005800580041004100410'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800584058404100410041005840584'+'05840584041004100410041005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '0580058005800408040805840584040A'+'040A0584058405840584058404080580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058004080410040805800408'+'05800410058004080580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058405840584058405840584'+'04100410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580040805840584'+'05840584058405840408040805800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800408058004080580'+'04100410041005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800584058404100410'+'04100410041004100410058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058004080408'+'04080408040804080408058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
// ROWS $F0-$FF
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800410041004100410'+'04100410041004100580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580041004100410'+'04100410058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800410'+'04100580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');
ds_list_add(_dl1,'05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580' + '05800580058005800580058005800580'+'05800580058005800580058005800580');


for(_j=0; _j<_count2; _j++) // Each row of tiles
{
    _str1 = _dl1[|_j];
    for(_i=0; _i<_count1; _i++) // Each clm of tiles
    {
        _str2 = string_copy(_str1,(_i<<2)+1,4);
        dg_tsrc_def[#_i,_j] = str_hex(_str2);
    }
}












_count1 = $0100;
_count2 = $0100;
ds_grid_resize(dg_solid_def, _count1,_count2);
ds_grid_clear( dg_solid_def,0);
ds_grid_copy(  dg_solid,dg_solid_def);

ds_list_clear(_dl1);
// ROWS $00-$0F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000010000010101' + '0101000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $10-$1F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000101010101' + '0100000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000101010101' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000101010101' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000001010000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $20-$2F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000010101'+'0101010001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000101'+'0101010000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000101'+'0101000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000001'+'0001000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0000000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0000000000000000'+'0000000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0000000000000000'+'0000000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000010101' + '0101000000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000101010101' + '0101010000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0001010101010101' + '0101010101000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010100000000'+'0101010101010101' + '0101010101010100'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $30-$3F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000001010101'+'0101010101010101' + '0101010101010101'+'0100000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000001'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0100000000000000' + '0001010101010101'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000001010101'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0000010101010101'+'0100000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000010101010101'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000101010101'+'0000000001010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000010100'+'0000000001010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000001' + '0101000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010001010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000101' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010001010101' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000010100' + '0000010000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010100' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000101010100' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100010101010000' + '0100000101010001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $40-$4F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010001010101' + '0101010000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010001' + '0101000000010001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010101' + '0101010100010101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0101010101010100'+'0000010100000101' + '0101010000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010100010000' + '0001010101010000'+'0001010000000000' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000000' + '0000000000000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000101010101' + '0101010101000101'+'0101010101010101' + '0101010101010100'+'0000000000010100' + '0000000000000001'+'0101010000000000' + '0001010000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000000' + '0000000000000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000001'+'0101010101010101' + '0000000000000000'+'0000000001010101' + '0000000000010101'+'0101000000000000' + '0101010000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000000' + '0000000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0101010101010000' + '0000000000000000'+'0000000001010101' + '0000000101010100'+'0000000000000001' + '0101000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0001010100000000' + '0000000001010100'+'0000000001010101' + '0100000000000000'+'0000010100000000' + '0001000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000000000000' + '0000000001000100'+'0000000001010101' + '0101010000000000'+'0001010000000001' + '0100000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000000' + '0000000000000000'+'0000000000010101' + '0101010100000000'+'0101010000010101' + '0101000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0000000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000010101' + '0101010101000001'+'0101010000000101' + '0101010001000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0000000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000101' + '0101010101010101'+'0101010101010000' + '0000000000000000'+'0000000000000101' + '0101010101000101'+'0101010100000001' + '0101010101010000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000000000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000000000101' + '0101010101010101'+'0101010101010100' + '0000000000000000'+'0000000000000101' + '0101010101000001'+'0101010101000000' + '0101010101000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0000000000000000'+'0000000000000001' + '0101010101010000'+'0000010101000000' + '0101010100000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000000000000' + '0000010101010101'+'0101010101010101' + '0100000000000000'+'0000000000000001' + '0101010101010001'+'0100000101000000' + '0001010101010000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000000010101' + '0000000000000000'+'0000000000000101' + '0101010000000000'+'0000000000000000' + '0101010101010101'+'0101000001000000' + '0000000101010000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0101010101000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0101010101010101'+'0101010000000000' + '0000000000010100'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $50-$5F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010000' + '0000000000000100'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0101010001010100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001000000'+'0000010000000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010100000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001000101'+'0100010001000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000010101010101'+'0101010101010101' + '0101010101010000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001000000'+'0100000001000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101010000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000010101010101' + '0101010101010100'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010100'+'0100010101000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000001010100' + '0101010101010101'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0100000001000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0101010101010101'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010001000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101010000000000'+'0000000000010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000001' + '0101010101010101'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000001000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101000000000000'+'0000010101010101' + '0101010000000000'+'0000000000000000' + '0000000000000000'+'0000000000000001' + '0101010101010100'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0101010001000100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101010101' + '0100000000000000'+'0001010101010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000010001000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000101010101' + '0100000000000000'+'0101010101010000' + '0001010101000000'+'0000000000000000' + '0000000000000000'+'0000000000010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0101010001010101' + '0101010001010101'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000001010101' + '0101000000000000'+'0101010001010000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000001010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000100'+'0100000000000100' + '0000010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000001010101' + '0101010000000000'+'0101010101010000' + '0001010101000000'+'0000000000000000' + '0000000000000000'+'0000000101010101' + '0101010100010101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001000100'+'0101010101000101' + '0100010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000001010101' + '0101010000000000'+'0001010101010101' + '0101010101000000'+'0000000000000000' + '0000000000000000'+'0000010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0101010100000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001000100'+'0000000001000000' + '0000010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000001010101' + '0101010100000000'+'0000010101010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0101000101010000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001000101'+'0100010101010101' + '0100010001000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000001010101' + '0101010101010000'+'0000000101010101' + '0000000000000000'+'0000000000000000' + '0101010001010000'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010100000001' + '0101010101010100'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010001000000'+'0000000000000000' + '0100010000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $60-$6F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000001010101' + '0101010101010100'+'0000000000000000' + '0001010101000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010000000001' + '0101010101010100'+'0000000000010101' + '0101010101010101'+'0101010101010100' + '0000000000000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0101010101000100' + '0101010101000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100010101010101' + '0101010101010100'+'0000000000000101' + '0101010101010100'+'0000010101010101' + '0101010101000100'+'0000010101010101' + '0101010101000001'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0101010101010000'+'0000000000000001' + '0101010101010101'+'0101010101000000' + '0000000000000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000100' + '0100000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000010101' + '0101010101010001'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0000000101010000'+'0000000000000000' + '0000010101010101'+'0101010000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000101' + '0101010101010000'+'0101010101010101' + '0101010101010101'+'0101000000000001' + '0101000001010100'+'0000000000000000' + '0000000101010101'+'0100000000000000' + '0000000000000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000001000000' + '0100000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0000000000000101' + '0101010101010100'+'0101010101010101' + '0101010101010101'+'0101010000000101' + '0101010001010100'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0101010001000101' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010001010101' + '0101010101010101'+'0100000001010101' + '0101010101010101'+'0101010101010001' + '0100000000000000'+'0000000000010001' + '0101010101010100'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000010100'+'0001000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000010000000100' + '0000010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000101' + '0101010000000000'+'0000000000000101' + '0101010101010101'+'0101010101010000' + '0000000000000000'+'0000000000000101' + '0101010101000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100010000'+'0001000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100010101000100' + '0100010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000000' + '0101010000000000'+'0000000000000001' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000000101' + '0101010101000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0001010000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101000100'+'0000010000000100' + '0100010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0101010101010101'+'0100000000000000' + '0101010100000000'+'0000000000000000' + '0000010101010101'+'0101000000000000' + '0000000000000000'+'0000000000010101' + '0101010101000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0001010000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000001010101'+'0101010101000000' + '0000000000000100'+'0101010001000100' + '0100010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000101000101' + '0101010101010101'+'0000000000000001' + '0101010101010000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000010101' + '0101010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0101010101000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101000100'+'0000000001000000' + '0100010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010101000101' + '0101010101010101'+'0000000000000001' + '0101010101010100'+'0000000000000000' + '0101010101010000'+'0000000000000000' + '0000000000000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0100010101010101' + '0100010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0000010000000101' + '0101010101010101'+'0000000000000001' + '0101010101010100'+'0101010101010101' + '0101010101010101'+'0000000000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000101'+'0100000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000010101' + '0001010101010101'+'0000000000000000' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000000' + '0000000000000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000010101'+'0101010101010000' + '0000000001010101'+'0101000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010001010100' + '0000010101010101'+'0000000000000000' + '0001000101010101'+'0101010101010101' + '0101010101010101'+'0000000000000000' + '0000000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100010101'+'0101010101010101' + '0101010101010101'+'0100000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010100000101'+'0000000001010000' + '0000010101010101'+'0000000000000000' + '0000000000010101'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0001010101010001'+'0101010101010101' + '0101010100010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000001010101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010100'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010000010101'+'0001010101010100' + '0000000101010101'+'0000000000000000' + '0000000000000001'+'0001010101010101' + '0101010101000000'+'0000000000000001' + '0101010101010001'+'0101010101010101' + '0101000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000101'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010101010000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $70-$7F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0001010101010101'+'0000010101010101' + '0100000101010101'+'0100000000000000' + '0000000000000000'+'0001010101010101' + '0101010100000000'+'0000000000000101' + '0101010101010001'+'0101010101010101' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0101010101010101' + '0101010101000101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010100' + '0000010101010100'+'0000000001010101' + '0101010101010101'+'0100000000000000' + '0000000000000000'+'0000000001010101' + '0101010000000000'+'0000000000000101' + '0101010101000001'+'0101010101010000' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010100' + '0001010100000000'+'0000000000010101' + '0101010101010101'+'0100000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101000101'+'0101010000000000' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010000000101'+'0101000000000101' + '0101010101010101'+'0100000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010100000101'+'0100000000000000' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000000000101' + '0101010101010000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101000000010001'+'0101010100000000' + '0101010101010101'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0100000000000100'+'0000000000000000' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0000000000000101' + '0101000101000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0100000000010101'+'0001010100010100' + '0001010001010100'+'0101010000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000010101010101'+'0000000000000000' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000000000000' + '0101000000000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0100000000000101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000001' + '0101010101010101'+'0000000000000000' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101000000000001'+'0101010000010101' + '0101010101010101'+'0101010101000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000001' + '0101010101010100'+'0000000000000000' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000001010100' + '0000010101010101'+'0101010101010100' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010000'+'0000000000000000' + '0000000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010100'+'0100010101000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0001000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000000000000'+'0001010101000000' + '0000000000000000'+'0000000000010101' + '0101010101000000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000010101010101'+'0101010101010101' + '0101010101010000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101000101010101'+'0001010101010101' + '0101010101010101'+'0101010101010100' + '0000000000000000'+'0000000001010101' + '0000000000000000'+'0000000000010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000101010101'+'0101010101010101' + '0101010101000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010000010101'+'0101010101010101' + '0001010101010101'+'0101010101010101' + '0000000000000000'+'0000000000000001' + '0101000001010101'+'0101000001010101' + '0101010000000000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000010101'+'0101010101010101' + '0101010100000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000000'+'0000000000000000' + '0001010101000000'+'0001010001010101' + '0100000000000000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000101010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000010101010101' + '0000000000000000'+'0000000000000000' + '0000000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000000' + '0000000000000000'+'0000000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000010000000000'+'0000010101010100' + '0000000000000000'+'0000000000000000' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0000000000000101' + '0101010101010101'+'0101010101000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $80-$8F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0101010100000000'+'0001010101010000' + '0000000000000000'+'0000000000000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0000000001010101' + '0101010101010101'+'0101010000000000' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100010101' + '0101010101010000'+'0000000000010101' + '0101010101010101'+'0101010101000000' + '0000000000000000'+'0000000000000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000000' + '0000000000000000'+'0000010101010101' + '0101010101010101'+'0100000001010100' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000001'+'0100000000000000' + '0000000000000000'+'0001010101010101' + '0101010101010101'+'0000000101010101' + '0100000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0101010101000000' + '0101010101010101'+'0101010100000000' + '0000000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000001'+'0101010000000000' + '0000000000000000'+'0101010100010101' + '0101010101010100'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0101010101010000' + '0001010101010101'+'0101010100000000' + '0000000000000000'+'0000000000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0101010000000000' + '0000000000000000'+'0101010101010101' + '0101010101010000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000001'+'0101010101010000' + '0001010101010101'+'0101010100000000' + '0000000000000000'+'0000000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0001000000000000' + '0000000000000001'+'0001010101010101' + '0101010101000001'+'0101010101010101' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000001'+'0101010101010000' + '0000010101010101'+'0101010000000000' + '0000000000000000'+'0000000000000001' + '0101000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0001000000000000' + '0000000000010101'+'0000010101010101' + '0101010101000101'+'0101010101010101' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000101'+'0101010101000000' + '0000010101010101'+'0101000000000000' + '0000000000000000'+'0000000000000101' + '0100000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101000000000000' + '0101010001010101'+'0100000101010101' + '0101010100000101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000001010101'+'0101010101000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000010101' + '0000010101000001'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101000000000101' + '0101010101010101'+'0101000001010101' + '0101010000010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000101010101'+'0101010101000101' + '0000010101010101'+'0101000000000000' + '0000000000000000'+'0000000001010101' + '0000010101000000'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0101010101010101'+'0101010000000101' + '0101010101010001'+'0101010000010101' + '0101000001010101'+'0101010101010101' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0100010101010101'+'0101010000000000' + '0000000000000000'+'0000000101010101' + '0001010101010000'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000001' + '0100000101010101'+'0101010101010101' + '0101000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0100010101010101'+'0101010100000000' + '0000000000000000'+'0000010101010101' + '0001010101010000'+'0101010101010101' + '0101010101010101'+'0101010100010001' + '0101010101010101'+'0101010101000000' + '0101010101010101'+'0101010101010000' + '0000010101010101'+'0101010101010101' + '0101010000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010101010101'+'0101010101010100' + '0000010101010101'+'0101010100000000' + '0000000000000000'+'0000010101010101' + '0101010101010000'+'0101010101010101' + '0101010101010101'+'0101010100010101' + '0101010101010101'+'0101010101010100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010000000001'+'0101010101000000' + '0001010101010101'+'0101010100000000' + '0000000000000000'+'0001010101010101' + '0101010100000001'+'0101010101010101' + '0101010101010101'+'0101010100000101' + '0001010100010101'+'0101010101010000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010101010000'+'0000000000000001' + '0101010101010101'+'0101010101000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0001010100010101'+'0101010100000001' + '0101010101010101'+'0100010101010101' + '0101010101010101'+'0101010001010101' + '0101010000000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0001010100010101'+'0101010000010101' + '0101010101010000'+'0000000001010101' + '0101010101010101'+'0101000000000101' + '0101010101000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $90-$9F
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0001010100000101'+'0101010001010101' + '0101010101010000'+'0000000000000101' + '0101010100000001'+'0100000000000001' + '0101010101000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000100' + '0001010000010101'+'0101010001010101' + '0101010100000000'+'0000000000000001' + '0100000000000000'+'0000000000000000' + '0101010100000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000100' + '0101010001010101'+'0101010001010101' + '0101010100000000'+'0000000000000000' + '0000000000000000'+'0001010100000000' + '0101010100000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0001010101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000100' + '0101010001010101'+'0101010000010101' + '0101010000000000'+'0000000000000000' + '0000000000000000'+'0101010101000000' + '0001010101000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0001010101010101'+'0100000001010100' + '0000010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0101000001010101'+'0101010100000001' + '0101010000000000'+'0000000000000000' + '0000000000000001'+'0100010101010000' + '0001010101000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0000010101010101'+'0000000001010000' + '0000000101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0101000101010101'+'0101010101010001' + '0101010000000000'+'0000000000000000' + '0000000000000001'+'0101010101010100' + '0000010101010000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000101010101'+'0101000000010000' + '0100000101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0101000101010101'+'0101010101010000' + '0101010100000000'+'0000000000000000' + '0000000101010101'+'0101010101010100' + '0000010101010100'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000101010101'+'0101010101010100' + '0000010100000000'+'0000000000000000' + '0000010100000001'+'0101010101010100' + '0000010101010101'+'0101000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000101010101' + '0101010101000000'+'0101010101010100' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000101010101'+'0101010101010100' + '0000000000000000'+'0000000000000000' + '0001010000000000'+'0000010101010000' + '0000010101010101'+'0101010000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010101' + '0101010101010000'+'0000010101010101' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000001010101'+'0101010101010000' + '0000000000000000'+'0000000000000101' + '0101000000000000'+'0000000101000000' + '0000000101010101'+'0101010000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000010101' + '0101010101010000'+'0001010100010101' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0101000000010101'+'0101010101000000' + '0000000000000000'+'0000000000000100' + '0000000000000000'+'0000000000000000' + '0000000001010101'+'0101000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000101' + '0100010101010101'+'0101010100000101' + '0100000101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0001010000010101'+'0101010101000000' + '0000000000000000'+'0000000000010100' + '0000000000000000'+'0000000000000000' + '0000000000010101'+'0100000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010101010101'+'0101010100000101' + '0000010101010101'+'0101010101010100' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000010101'+'0101010101010000' + '0000000000000000'+'0000000000010000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000001010101'+'0001010000000101' + '0001010101010101'+'0101010101010000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000001010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0000000101000000'+'0001000000000001' + '0000010101010101'+'0101010101000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100010101' + '0101000001010101'+'0101010101010101' + '0100000000000000'+'0101010101010100' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000101' + '0101010101010000'+'0001010000010101' + '0100000101010101'+'0101010101000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100010101' + '0100000101010101'+'0101010101010101' + '0101000101010101'+'0101010101010100' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $A0-$AF
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000101' + '0101010101000000'+'0101010101010100' + '0101000001010101'+'0101010101000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000010101' + '0000010101010101'+'0101000101010101' + '0101000101010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000001' + '0101010100000000'+'0101010101010000' + '0101010000010101'+'0101010101010000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010100' + '0001010101010101'+'0101000000000101' + '0101000101010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000010101' + '0101000101010101'+'0101010101010000' + '0101010000000001'+'0101010101010000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010000' + '0001010000000000'+'0000000000000000' + '0000000000010101'+'0100000000000001' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000010101' + '0000000001010101'+'0101000001010100' + '0101010100000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000010101' + '0000000000000000'+'0000000000000000' + '0000000000000101'+'0100000000000001' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000010100' + '0000010000000101'+'0000000001010101' + '0101010101000000'+'0001010001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100010101' + '0101010101010000'+'0000000000000101' + '0101000000010101'+'0000000000000000' + '0000000000000000'+'0000000000000000' + '0000000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000010101'+'0101000101010001' + '0101010101000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000101' + '0101010101010100'+'0000000001010101' + '0101010100010101'+'0000000000000001' + '0000000000000000'+'0000000000000000' + '0000000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000010101' + '0101010101010101'+'0101010101010101' + '0100000001010101'+'0101010101000001' + '0101010000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000101' + '0101010101010101'+'0000000101010101' + '0101010101010101'+'0000000000000101' + '0100000000000000'+'0000000000000000' + '0000000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000101' + '0101010101010101'+'0101010101010101' + '0100010101010000'+'0101010100000000' + '0101000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000001' + '0101010101010101'+'0100010101010101' + '0101010101010101'+'0000000000010101' + '0101000000000000'+'0000000001000000' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000001' + '0101010101010101'+'0000000001010101' + '0101010101010000'+'0000010101010101' + '0101000000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101000001010101' + '0101000000000000'+'0000000000000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000101' + '0101010101010101'+'0101000000000101' + '0101010101000000'+'0001010101010101' + '0101000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000010000000100' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000010101' + '0101010101010101'+'0101010000010101' + '0101010101010100'+'0101010101000101' + '0101000100010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000000000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000000000000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000101'+'0101010100010101' + '0001010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0101010001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010000000000'+'0101010101010100' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010001010000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000100'+'0101000101010000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0101010101010101'+'0100000101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $B0-$BF
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0101010101010101'+'0101010101010000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000001' + '0101010101010100'+'0000000000000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0101010101010101'+'0101010101010000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0000010101000000'+'0000000000000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0101010101010101'+'0101010101010100' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000001' + '0100000000000000'+'0000000101010000' + '0000000000010100'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0101010101010101'+'0101010101010100' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0001010101010000' + '0000000000000101'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0001010101010101'+'0101010101010101' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0001010100000001' + '0100000000010100'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010101010101'+'0101010101010101' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0000000100000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000010101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000000000000'+'0000000100000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000101010101'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000000000000000'+'0000000100000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0001010101010000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010001' + '0101010101000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000101010100' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0001010101000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0101010100000101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010001'+'0101010000000100' + '0001000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000001'+'0101000001000000' + '0101010000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000101' + '0001010101010101'+'0101010001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $C0-$CF
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000001'+'0101000000000000' + '0000010000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000000' + '0001010101010101'+'0101000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000001'+'0101000100000100' + '0001010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101000000' + '0001010001010101'+'0101010100000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0101010000000000' + '0000010100010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000010001010101'+'0101010100000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0101010001000000' + '0101010100010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000010101'+'0101010101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0001010100000100' + '0001010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000000010101'+'0101010100000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0001010101010101' + '0101010000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0000000101010101'+'0101010101010100' + '0000000000000101'+'0101010101010000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000101010101' + '0100000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000000' + '0000000000010101'+'0101010101010100' + '0000000000010101'+'0101010101010101' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000001010100' + '0000000001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000000000101' + '0101000000000101'+'0101010101000000' + '0000000000010100'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000000000000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0001010101000001' + '0101010000000001'+'0101000000000000' + '0000000001010100'+'0101010100010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0101010000000000' + '0000000000000101'+'0101010000000000' + '0000010101010100'+'0101010100000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000010100' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0000000000000000' + '0000010100000101'+'0101010001000001' + '0101010101010100'+'0101010100000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000010101'+'0000000000000000' + '0101010100010101'+'0101010101010101' + '0100000101000000'+'0101010000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000010100'+'0000000000000101' + '0101010101010101'+'0101000101010101' + '0101000000000101'+'0101010000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000101010101' + '0101010101010101'+'0101000000010101' + '0101010101010101'+'0100000000000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000010000'+'0000000101010101' + '0101010101000000'+'0101010000000101' + '0101010101010101'+'0101000000000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000001010000'+'0001000000010101' + '0101010100000100'+'0001010000000101' + '0101010101010101'+'0101010000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $D0-$DF
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000001010000'+'0001010100010101' + '0101010000000101'+'0000010100000001' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000001000000'+'0001010100000001' + '0101010101000101'+'0000000000000000' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000101'+'0100000000000101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0001000001000000'+'0001010101010001' + '0101010101010101'+'0101010101000000' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000010101'+'0101010000000001' + '0101010000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001000000000000'+'0101010101010000' + '0000000101010101'+'0101010101010101' + '0101000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000001010101'+'0101010100000001' + '0101010000000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010000010000'+'0101010101010100' + '0000010101010101'+'0101010101010101' + '0100000000000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000000000'+'0001010100000001' + '0101010100000000'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010000010000'+'0101010101010100' + '0000010101010101'+'0101010101010101' + '0101000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000000000010101'+'0101010000000101' + '0101010100000000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010100000100'+'0101010101010100' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000000000101'+'0101010000010101' + '0101010101000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010100000000'+'0101010101010101' + '0101010100000000'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000001010001'+'0100010100010101' + '0101010101010000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010100000000'+'0101010101010101' + '0101010000010100'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0001010101010101' + '0101010101010101'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010101000000'+'0101010101010101' + '0101010001010000'+'0100000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0101010101010001' + '0101010101010100'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0001010101000000'+'0101010101010101' + '0101010001010101'+'0100010100010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010001'+'0101010101000001' + '0101010101000000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010101000000'+'0101010101010101' + '0101010000010101'+'0000010000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010000000101' + '0101010000000101'+'0100000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010101000000'+'0001010101010101' + '0101010000000100'+'0001000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000001010101' + '0101000000010101'+'0101000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100010101010000'+'0001010101010101' + '0101010101000100'+'0101000100000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0000000000010101' + '0000000001010100'+'0000000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000001010100'+'0000010101010101' + '0101010100000100'+'0100000100010001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000000000000' + '0000000101010000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000101010100'+'0000010101010101' + '0101010101000000'+'0100010000010001' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $E0-$EF
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000000' + '0000010101000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010001010101'+'0100000001000101' + '0101010101010101'+'0000010001000001' + '0100000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000000' + '0001010101000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101000000000101' + '0101010101010101'+'0001000001000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000000' + '0101010101000001'+'0101010101010101' + '0100010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010100000001' + '0101010101010101'+'0000000100000100' + '0101000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000000001010101' + '0101010101010000'+'0101010101000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0101010101010101'+'0101010100010000' + '0001000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000000000000101' + '0101010101010100'+'0000000000000000' + '0000000101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010100' + '0001010101010101'+'0100010100000001' + '0001010101000001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000101'+'0000000000000000' + '0001010101010101'+'0101000000000000' + '0000010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0000010101010101'+'0101010101010101' + '0001010001010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010000010101'+'0101010000000000' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000010101010101' + '0000010101010101'+'0101010001010101' + '0000000101010101'+'0001010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0101010101000000' + '0000000000000101'+'0101010100000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000101010101' + '0000010101010101'+'0101010100010000' + '0101000101010001'+'0100000101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000000' + '0000000000000001'+'0101010101000000' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000000'+'0000000001010101' + '0000010101010101'+'0101010101010101' + '0001000000010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000000000000000' + '0000000000000001'+'0101010101000001' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000001010100' + '0000010101010101'+'0101010101010001' + '0101010100000101'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010100'+'0000000000000000' + '0000000000000101'+'0101010100000101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101010101000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0100000000000000' + '0000000101010101'+'0101010000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000001'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0101000101010001'+'0100010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010000' + '0000010101010101'+'0100000001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0000000000000000' + '0001010101010101'+'0101010101010101' + '0001010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0100000101010000'+'0000010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010000000000'+'0000000000000001' + '0101010101010101'+'0101010101010101' + '0101010001000100'+'0101010001010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101000000000000'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101000000'+'0000000000000101' + '0101010101010101'+'0101010101010101' + '0101010100010001'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010100000101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010000'+'0000000000010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
// ROWS $F0-$FF
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');
ds_list_add(_dl1,'0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101' + '0101010101010101'+'0101010101010101');


for(_j=0; _j<_count2; _j++) // Each row of tiles
{
    _str1 = _dl1[|_j];
    for(_i=0; _i<_count1; _i++) // Each clm of tiles
    {
        _str2 = string_copy(_str1,(_i<<1)+1,2);
        dg_solid_def[#_i,_j] = str_hex(_str2);
    }
}












_count1 = $0100;
_count2 = $0100;
ds_grid_resize(dg_AreaNames, _count1,_count2);
ds_grid_clear( dg_AreaNames,MapAreaName_DEF);

ds_list_clear(_dl1);
// ROWS $00-$0F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $10-$1F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1B1B1B1B'+'1B1B1B1B1B1B1B1B' + '1B1BFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $20-$2F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $30-$3F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF06060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '060606FFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF05050505' + '050505FFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF0505050505' + '050505050505FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF050505050505' + '05050505050505FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF05050505050505' + '05050505050505FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'0505050505050505' + '05050505050505FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF05'+'0505050505050505' + '0505050505050505'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF05'+'0505050505050505' + '0505050505050505'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $40-$4F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0505'+'0505050505050505' + '0505050505050505'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF050505'+'0505050505050505' + '0505050505050505'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFF0505' + '0505050505050505'+'0505050505050505' + '0505050505050505'+'05FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFF0505' + '0505050505050505'+'0505050505050505' + '0505050505050505'+'05FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '0404040404040404'+'0404FFFFFFFF0505' + '0505050505050505'+'0505050505050505' + '0505050505050505'+'05FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFF0404' + '0404040404040404'+'04040404FFFF0505' + '0505050505050505'+'0505050505050505' + '0505050505050505'+'05FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFF04040404' + '04040404FFFFFF04'+'04040404FFFFFF05' + '0505050505050505'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFF0404040404' + '04040404FFFFFF04'+'04040404FFFFFFFF' + '0505050505050505'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFF0404040404' + '0404040404040404'+'0404040404FFFFFF' + 'FFFF050505050505'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFF04040404' + '0404040404040404'+'0404040404FFFFFF' + 'FFFFFF0505050505'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFF0404' + '0404040404040404'+'040404040404FFFF' + 'FFFFFF050505FF05'+'0505050505050505' + '05FF050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFF04' + '0404040404040404'+'040404040404FFFF' + 'FFFFFFFF05050505'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '0404040404040404'+'04040404040404FF' + 'FFFFFFFF05050505'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF04040404040404'+'04040404040404FF' + 'FFFFFFFFFF050505'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFF0404040404'+'0404040400000000' + 'FFFFFFFFFFFFFFFF'+'0505050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0601010101010101'+'0101010101FFFFFF' + 'FFFFFF0404040404'+'0400000000000000' + 'FFFFFFFFFFFFFFFF'+'FF05050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $50-$5F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0601010101010101'+'0101010101010101' + '0101FFFF04040400'+'0000000000000000' + '00FFFFFFFFFFFFFF'+'FFFF050505050505' + '0505050505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0601010101010101'+'0101010101010101' + '010101FFFF040000'+'0000000000000000' + '00FFFFFFFFFFFFFF'+'FFFFFFFFFF050505' + '0505050505050505'+'05FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0601010101010101'+'0101010101010101' + '0101010100000000'+'0000000000000000' + '00FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF05050505050505'+'05FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606010101010101'+'0101010101010101' + '0101010100000000'+'0000000000000000' + '0000FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFF0505050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606060101010101'+'0101010101010101' + '0101000000000000'+'0000000000000000' + '0000030303030303'+'0303FFFFFFFFFFFF' + 'FFFFFFFFFF050505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606060601010101'+'0101010101010101' + '0000000000000000'+'0000000000000000' + '0000030303030303'+'03030303FFFFFFFF' + 'FFFFFFFFFFFF0505'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606060600000000'+'0101010101010100' + '0000000000000000'+'0000000000000000' + '0000030303030303'+'0303030303030303' + 'FFFFFFFFFFFFFF05'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606060000000000'+'0000010101020202' + '0200000000000000'+'0000000000000000' + '0000030303030303'+'03030303030303FF' + 'FFFFFFFFFFFFFF05'+'0505FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0606000000000000'+'0000020202020202' + '0202020000000000'+'0000000000000000' + '0003030303030303'+'03030303030303FF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF141414' + '1414FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0600000000000000'+'0002020202020202' + '0202020200000000'+'0000000000000000' + '0303030303030303'+'030303030303FFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF14141414' + '141414FFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF13FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '0600000000000000'+'020202020202FFFF' + 'FF02020202000000'+'0000000000000003' + '0303030303030303'+'0303030303FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF1414141414' + '14141414FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF131313FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FF000000000000'+'020202020202FFFF' + 'FFFFFFFFFF000000'+'0000000000000303' + '0303030303030303'+'03030303FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF1414141414' + '1414141414FFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF131313FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFF0000000000'+'020202020202FFFF' + 'FF02020202000000'+'0000000303030303' + '0303030303030303'+'030303FFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF1414141414' + '141414141414FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFF13131313FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFF0000000000'+'0002020202020202' + '0202020202000000'+'0000030303030303' + '030303030303FF03'+'0303FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF1414141414' + '14FF141414141414'+'14FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF1313131313FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFF00000000'+'0000020202020202' + '0202020200000000'+'0000030303030303' + '0303030303030303'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF1414141414' + '1414141414141414'+'1414FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF1313131313FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFF0000'+'0000000202020202' + '0000000000000000'+'0003030303030303' + 'FFFFFFFFFFFF0303'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF141414141414' + '1414141414141414'+'14141414FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF1313131313FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $60-$6F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFF00'+'0000000000000000' + '00FFFFFFFF000000'+'0303030303FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF14141414141414' + '1414141414141414'+'1414131313FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF13131313131313'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFF00'+'000000000000FFFF' + 'FFFFFFFFFFFFFF03'+'0303FFFFFFFFFFFF' + 'FFFFFFFFFFFFFF0C'+'0C0CFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF14141414141414' + '1414141414141414'+'13131313131313FF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '1313131313131313'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'00000000FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF0C0C0C'+'0C0C0C0C0CFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF14141414141414' + '1414141414FF1414'+'1313131313131313' + '1313FFFFFFFFFFFF'+'FFFFFF1313131313' + '1313131313131313'+'13FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF060606' + '0606060606060606'+'0606060606060606' + '06FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFF0C0C0C0C0C'+'0C0C0C0C0C0CFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF14141414141414' + '1414141414141414'+'1413131313131313' + '131313FFFFFFFFFF'+'FF13131313131313' + '1313131313131313'+'13FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF0C0C0C0C0C0C0C'+'0C0C0C0C0C0CFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'1414141414141414' + '1414141414141414'+'1413131313131313' + '1313131313131313'+'1313131313131313' + '1313131313131313'+'13FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF0D0D0DFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF0C0C0C0C0C0C0C'+'0C0C0C0C0C0CFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'1414141414141414' + '1414141414141414'+'1414131313131313' + '1313131313131313'+'1313131313131313' + '1313131313131313'+'13FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF07070707FFFF' + 'FFFF0D0D0D0D0D0D'+'0D0D0D0D0D0DFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFF0C0C' + '0C0C0C0C0C0C0C0C'+'0C0C0C0C0C0CFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'1414141414141414' + '1414141414141414'+'1414131313131313' + '1313131212121213'+'1313131313131313' + '1313131313131313'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF070707070707FF' + 'FFFF0D0D0D0D0D0D'+'0D0D0D0D0D0D0DFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF0C0C0C0C' + '0C0C0C0C0C0C0C0C'+'0C0C0C0C0C0CFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF14141414141414' + '1414141414141414'+'1414141313131312' + '1212121212121212'+'1313131313131313' + '1313131313131313'+'1313FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'070707070B0B0B0B' + '0BFFFF0D0D0D0D0D'+'0D0D0D0D0D0D0D0D' + '0D0DFFFFFFFFFFFF'+'FFFF0C0C0C0C0C0C' + '0C0C0C0C0C0C0C0C'+'0C0C0C0C0CFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF141414141414' + '1414141414141414'+'1414141313131212' + '1212121212121212'+'1212121213131313' + '1313131313131313'+'13131313FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'07070B0B0B0B0B0B' + '0BFFFFFFFFFF0D0D'+'0D0D0D0D0D0D0D0D' + '0D0D0D0D0D0D0D0D'+'0D0D0D0D0D0D0D0D' + '0D0D0D0D0C0C0C0C'+'0C0C0C0C0CFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF141414141414' + '1414141414141414'+'141414FFFF121212' + '1212121212121212'+'1212121212121313' + '1313131313131313'+'13131313FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'07070B0B0B0B0B0B' + '0BFFFFFFFFFFFF0D'+'0D0D0D0D0D0D0D0D' + 'FFFFFFFFFFFF0D0D'+'0D0D0D0D0D0D0D0D' + '0D0D0D0D0D0D0C0C'+'0C0C0C0CFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF14141414' + '1414141414141414'+'141414FFFFFFFF12' + '1212121212121212'+'1212131313131313' + '1313131313131313'+'13131313FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'070B0B0B0B0B0B0B' + '0BFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'0D0D0D0D0D0D0D0D' + '0D0D0D0D0D0D0D0C'+'0C0C0CFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF141414' + '1414141414141414'+'141414FFFFFFFFFF' + 'FF1212121212FFFF'+'FF13131313131313' + '1313131313131313'+'131313FFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'070B0B0B0B0B0B0B' + '0BFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF0D0D0D0D0D0D0D' + '0D0D0D0D0D0D0D0C'+'0CFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF121212FFFFFF'+'FFFFFFFFFFFF1313' + '13131313FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'070B0B0B0B0B0B0B' + '0B0B0B0B0BFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'0D0D0D0D0D0D0D0D' + '0D0D0D0D0D0D0DFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF12FFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF11111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'070B0B0B0B0B0B0B' + '0B0B0B0B0B0B0BFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF0D'+'0D0D0D0D0D0D0D0D' + '0DFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF1010FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1212FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF11'+'1111111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'07070B0B0B0B0B0B' + '0B0B0B0B0B0B0BFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF0D0D0D'+'0D0D0D0D0D0D0DFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF1010101010FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF12FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1111'+'1111111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $70-$7F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'0707070B0B0B0B0B' + '0B0B0B0B0B0B0B07'+'07FFFFFFFFFFFFFF' + 'FFFFFFFF0D0D0D0D'+'0D0D0D0D0D0D0DFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF10101010101010'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF12FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF11111111'+'1111111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'070707070B0B0B0B' + '0B0B0B0B0B0B0B07'+'07070707FFFFFFFF' + 'FFFFFF08080D0D0D'+'0D0D0D0D0D0DFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF101010101010'+'101010FFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF111111111111'+'1111111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'0707070B0B0B0B0B' + '0B0B0B0B0B0B0707'+'0707080808080808' + '080808080807070D'+'0D0D0D0D0D0DFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF101010101010'+'1010101010FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '1111111111111111'+'1111111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'07070B0B0B0B0B0B' + '0B0B070707070707'+'0808080808080808' + '0808080807070707'+'0D0D0D0D0D0DFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF101010101010'+'101010101010FFFF' + 'FFFFFFFFFFFF1010'+'10FFFFFFFFFFFFFF' + '1111111111111111'+'1111111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1A1A1A1A' + '1A1A1A1A1A1A1A1A'+'1A1A1A1A1AFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'07070B0B0B0B0707' + '0707070707070708'+'0808080808080808' + '0808080707070707'+'070D0D0D0D0DFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF101010101010'+'101010101010FFFF' + 'FFFFFFFFFF101010'+'10FFFFFFFFFFFFFF' + '1111111111111111'+'1111111111FFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1C1C1C' + '1C1C1C1C1C1C1C1C'+'1C1C1C0B0B070707' + '0707070707070708'+'0808080808080808' + '0808080807070707'+'07070D0D0D0DFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF101010101010'+'1010101010101010' + 'FFFF101010101010'+'1010FFFFFFFFFF11' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1C1C07070707' + '0707070707070707'+'0808080808080808' + '0808080807070707'+'07070707070707FF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF10101010101010'+'1010101010101010' + '1010101010101010'+'10111111FFFFFF11' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF1C1C070707' + '0707070707070707'+'0707070808080808' + '0808080808080808'+'08080707070707FF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '1010101010101010'+'1010101010101010' + '1010101010101010'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF1C1C1C07' + '0707070707070707'+'0707070707070707' + '0808080808080808'+'080808080808FFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFF1010' + '1010101010101010'+'1010101010101010' + '1010101010101010'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'1CFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFF1C1C' + '1C1C1C1C1C1C1C1C'+'1C1C070707070707' + '0708080808080808'+'080808080808FFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF0E0EFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFF10' + '1010101010101010'+'1010101010101010' + '1010101010101011'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'1CFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFF0707' + '0707070707070707'+'071C1C1C1C070707' + '0707080808080808'+'0808080808FFFFFF' + 'FFFFFFFFFF0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '1010101010101010'+'1010101010101010' + '1010101010101111'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'1C1CFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFF07' + '0707070707070707'+'070707071C1C1C1C' + '0707080808080808'+'0808080808FFFFFF' + 'FFFFFFFF0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF10101010101010'+'1010101010101010' + '1010101010101111'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF1C1C1C1C1C1C1C' + '1CFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '0707070707070707'+'070707070707071C' + '1C1C08081C1C1C1C'+'1C1C0808FFFFFFFF' + 'FFFFFF0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF101010101010'+'1010101010101010' + '10FF101010101111'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '1C1C1CFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FF07070707070707'+'07070707FF070707' + '071C1C1C1C080809'+'091C1C08FFFFFFFF' + 'FF0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFF1010101010'+'1010101010101010' + '1010101010101111'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF1CFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '0707070707070707'+'0707070707070707' + '07071C0909090909'+'09091CFFFFFFFFFF' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFF10101D1D1D'+'1D10101010101010' + '1010101010101111'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF1C1C1CFFFFFF'+'FFFFFFFFFFFFFFFF' + '0707070707070707'+'0707070707070707' + '0707090909090909'+'09091C0909090909' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1D1D1D1D'+'1D1D101010101010' + '1010101010101111'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $80-$8F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1C1C1C1C'+'1C1C1CFFFFFFFFFF' + 'FF07070707070707'+'0707070707070707' + '0909090909090909'+'0909090909090909' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1D1D1D1D'+'1D1D1D1010101010' + '1010101010101111'+'1111111111111111' + '1111111111111111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1C1C1C1C1C1C' + '1C1C1C1C1C1C0707'+'0707070707090909' + '0909090909090909'+'0909090909090909' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF1D1D1D1D'+'1D1D1D1D1D101010' + '1010101010101111'+'1111111111111111' + '1111111111111111'+'11111111FFFFFFFF' + '1111111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF1C1C1C'+'1C1C1C1C1C090909' + '0909090909090909'+'0909090909090909' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0E0EFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF1D1DFF'+'FF1D1D1D1D1D1010' + '1010101010111111'+'1111111111111111' + '1111111111111111'+'111111FFFFFFFFFF' + 'FF11111111111111'+'11111111FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF0A0A0A0A'+'FFFFFF0909090909' + '0909090909090909'+'0909090909090909' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + '0EFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFF1D1DFF'+'FFFFFF1D1D1D1010' + '1010101010111111'+'11111111FF111111' + '1111111111111111'+'11FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF0A0A0A0A'+'FFFFFF0909090909' + '0909090909090909'+'0909090909090909' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '191919FFFF1D1D1D'+'FFFFFF1D1D1D1010' + '1010101010111111'+'1111111111111111' + '1111111111111111'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF0A0A0AFF'+'FFFFFF0909090909' + '0909090909090909'+'0909090909090909' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0E0E' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '19191919FFFF1D1D'+'1DFF1D1D1D101010' + '1010101010111111'+'1111111111111111' + '11111111111111FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF0A0A0AFF'+'FFFFFF0909090909' + '0909090909090909'+'090909090909090E' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0E0EFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919FF1D1D'+'1DFF1D1D10101010' + '1010101010FFFFFF'+'1111111111111111' + '111111111111FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF0A0AFFFF'+'FFFFFF0909090909' + '0909090909090909'+'0909090909090E0E' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0EFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919FFFFFF'+'FFFF101010101010' + 'FFFFFFFFFFFFFFFF'+'FF11111111111111' + '111111111111FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF0909090909' + '0909090909090909'+'09090E0E0E0E0E0E' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0E0EFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919FFFFFF'+'FFFF10101010FFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF111111111111' + '1111111111FFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF0909090909' + '090909FFFFFFFFFF'+'FFFF0E0E0E0E0E0E' + '0E0E0E0E0E0E0E0E'+'0E0E0E0E0EFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'FFFFFF101010FFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFF1111111111' + '11111111FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF09090909' + '090909FFFFFFFFFF'+'FFFFFF0E0E0E0E0E' + '0E0E0E0E0E0E0E0E'+'0E0E0EFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF11111111' + '111111FFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF0E0E0E0E' + '0E0E0E0E0E0E0E0E'+'0E0EFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFF1111' + '1111FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF0E0E0E0E' + '0E0E0E0E0E0E0E0E'+'0E0EFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFF0E0E0E0E' + '0E0E0E0E0E0E0E0E'+'0EFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF0E0E0E' + '0E0E0E0E0E0E0E0E'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFF0E0E' + '0E0E0E0E0E0E0EFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFFFFFFFF1717'+'17171717FFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF16161616FFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $90-$9F
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFF0E0E' + '0E0E0E0E0E0EFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFFFFFFFF1717'+'171717171717FFFF' + 'FFFFFFFF161616FF'+'FF161616161616FF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFF0E' + '0E0E0E0E0E0EFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFFFF17171717'+'17171717171717FF' + 'FF16161616161616'+'1616161616161616' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + '0E0E0E0E0EFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFFFF17171717'+'1717171717171716' + '1616161616161616'+'16FFFFFF16161616' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFF1717171717'+'1717171717171616' + '1616161616161616'+'FFFFFFFFFF161616' + '16FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFF1717171717'+'1717171717171616' + '16161616161616FF'+'FFFFFFFFFFFF1616' + '16FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919FFFFFFFFFFFF' + 'FFFFFF1717171717'+'1717171717171616' + '16161616161616FF'+'FFFFFFFFFFFFFF16' + '1616FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919FFFFFFFFFF' + 'FFFFFFFF17171717'+'1717171716161616' + '161616FFFFFFFFFF'+'FFFFFFFFFFFFFF16' + '1616FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919FFFFFFFFFF' + 'FFFFFFFF17171717'+'1717161616161616' + '1616FFFF161616FF'+'FFFFFFFFFFFFFF16' + '1616FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919FFFFFFFF15' + '15FFFF1717171717'+'1716161616161616' + '16FFFF1616161616'+'1616FFFFFFFF1616' + '1616FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919FFFFFF1515' + '1515FFFFFF171717'+'161616161616FFFF' + 'FFFF161616161616'+'161616FFFF161616' + '161616FFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919FFFF151515' + '15151515FFFF1616'+'161616161616FF16' + '1616161616161616'+'1616161616161616' + '16161616FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919FFFF151515' + '1515151515FFFF16'+'1616161616FFFF16' + '1616161616161818'+'1818161616161616' + '1616161616FFFFFF'+'FF18FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919FFFFFF1515' + '151515151515FFFF'+'FF16161616FF1616' + '1616161618181818'+'1818181616161616' + '1616161616181818'+'1818FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919FFFFFF' + '1515151515151515'+'FFFFFFFFFFFF1616' + '1616161818181818'+'1818161616161616' + '1616161818181818'+'1818FFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919FFFFFF' + 'FF15151515151515'+'FFFFFFFFFFFFFF16' + '1616161818181818'+'1818181818181616' + '1616181818181818'+'18FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'191919191919FFFF' + 'FFFF15FFFFFFFFFF'+'FFFFFFFFFFFFFF16' + '1616181818181818'+'1818181818181816' + '1618181818181818'+'18FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $A0-$AF
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + '1818181818181818'+'1818181818181818' + '1818181818181818'+'18FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + '1818181818181818'+'1818181818181818' + '1818181818181818'+'18FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + '1818181818181818'+'1818181818181818' + '1818181818181818'+'18FFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + '1818181818181818'+'1818181818181818' + '1818181818181818'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + '1818181818181818'+'1818181818181818' + '1818181818181818'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + '1818181818181818'+'1818181818181818' + '18181818181818FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FF18181818181818'+'1818181818181818' + '18181818181818FF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF181818181818'+'1818181818181818' + '181818181818FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFF181818181818'+'1818181818181818' + '18181818FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFF1818181818'+'1818181818181818' + '181818FFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFF18181818'+'1818181818181818' + '181818FFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1818'+'1818181818181818' + '1818FFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF18'+'1818181818181818' + '18FFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FF18181818181818' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $B0-$BF
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1919'+'1919191919191919' + '1919191919191919'+'1919191919191919' + '191919191919FFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $C0-$CF
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF191919' + '1919191919191919'+'1919191919191919' + '19191919FFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0FFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0FFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0FFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0FFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0FFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0FFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $D0-$DF
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFF0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F0F0F0F0F0F0F' + '0F0F0F0F0F0F0F0F'+'0F0F1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $E0-$EF
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
// ROWS $F0-$FF
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFF1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFF1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1E1E1E1E1E'+'1E1E1E1E1E1E1E1E' + '1E1E1E1EFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFF1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1F1F1F1F'+'1F1F1F1F1F1F1F1F' + '1F1F1F1F1FFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');
ds_list_add(_dl1,'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF' + 'FFFFFFFFFFFFFFFF'+'FFFFFFFFFFFFFFFF');


for(_j=0; _j<_count2; _j++) // Each row of tiles
{
    _str1 = _dl1[|_j];
    for(_i=0; _i<_count1; _i++) // Each clm of tiles
    {
        _str2 = string_copy(_str1,(_i<<1)+1,2);
        _idx = str_hex(_str2);
        if (_idx==$FF) continue;//_i. $FF represents MapAreaName_DEF
        dg_AreaNames[#_i,_j] = _dl_AreaNames[|_idx];
    }
}












ds_grid_resize(HiddenExitIndicator_dg, $21,$05);
ds_grid_clear (HiddenExitIndicator_dg, 0);

HiddenExitIndicator_dg[#$00,$00] = $B9;
HiddenExitIndicator_dg[#$00,$01] = $10;

HiddenExitIndicator_dg[#$01,$00] = $68;
HiddenExitIndicator_dg[#$01,$01] = $1F;

HiddenExitIndicator_dg[#$02,$00] = $5E;
HiddenExitIndicator_dg[#$02,$01] = $3A;

HiddenExitIndicator_dg[#$03,$00] = $5E;
HiddenExitIndicator_dg[#$03,$01] = $40;

HiddenExitIndicator_dg[#$04,$00] = $5D;
HiddenExitIndicator_dg[#$04,$01] = $41;

HiddenExitIndicator_dg[#$05,$00] = $A3;
HiddenExitIndicator_dg[#$05,$01] = $46;

HiddenExitIndicator_dg[#$06,$00] = $3C;
HiddenExitIndicator_dg[#$06,$01] = $49;

HiddenExitIndicator_dg[#$07,$00] = $3F;
HiddenExitIndicator_dg[#$07,$01] = $56;

HiddenExitIndicator_dg[#$08,$00] = $C3;
HiddenExitIndicator_dg[#$08,$01] = $5F;

HiddenExitIndicator_dg[#$09,$00] = $D3;
HiddenExitIndicator_dg[#$09,$01] = $61;

HiddenExitIndicator_dg[#$0A,$00] = $8D;
HiddenExitIndicator_dg[#$0A,$01] = $69;

HiddenExitIndicator_dg[#$0B,$00] = $3E;
HiddenExitIndicator_dg[#$0B,$01] = $6A;

HiddenExitIndicator_dg[#$0C,$00] = $4D;
HiddenExitIndicator_dg[#$0C,$01] = $6B;

HiddenExitIndicator_dg[#$0D,$00] = $AA;
HiddenExitIndicator_dg[#$0D,$01] = $6C;

HiddenExitIndicator_dg[#$0E,$00] = $4F;
HiddenExitIndicator_dg[#$0E,$01] = $6D;

HiddenExitIndicator_dg[#$0F,$00] = $30;
HiddenExitIndicator_dg[#$0F,$01] = $6E;




HiddenExitIndicator_dg[#$10,$00] = $3D;
HiddenExitIndicator_dg[#$10,$01] = $73;

HiddenExitIndicator_dg[#$11,$00] = $9C;
HiddenExitIndicator_dg[#$11,$01] = $78;

HiddenExitIndicator_dg[#$12,$00] = $AF;
HiddenExitIndicator_dg[#$12,$01] = $81;

HiddenExitIndicator_dg[#$13,$00] = $5E;
HiddenExitIndicator_dg[#$13,$01] = $82;

HiddenExitIndicator_dg[#$14,$00] = $87;
HiddenExitIndicator_dg[#$14,$01] = $84;

HiddenExitIndicator_dg[#$15,$00] = $35;
HiddenExitIndicator_dg[#$15,$01] = $85;

HiddenExitIndicator_dg[#$16,$00] = $96;
HiddenExitIndicator_dg[#$16,$01] = $89;

HiddenExitIndicator_dg[#$17,$00] = $4E;
HiddenExitIndicator_dg[#$17,$01] = $8D;

HiddenExitIndicator_dg[#$18,$00] = $94;
HiddenExitIndicator_dg[#$18,$01] = $91;

HiddenExitIndicator_dg[#$19,$00] = $B8;
HiddenExitIndicator_dg[#$19,$01] = $95;

HiddenExitIndicator_dg[#$1A,$00] = $7E;
HiddenExitIndicator_dg[#$1A,$01] = $9B;

HiddenExitIndicator_dg[#$1B,$00] = $8F;
HiddenExitIndicator_dg[#$1B,$01] = $9B;

HiddenExitIndicator_dg[#$1C,$00] = $B0;
HiddenExitIndicator_dg[#$1C,$01] = $9B;

HiddenExitIndicator_dg[#$1D,$00] = $4F;
HiddenExitIndicator_dg[#$1D,$01] = $9E;

HiddenExitIndicator_dg[#$1E,$00] = $95;
HiddenExitIndicator_dg[#$1E,$01] = $A3;

HiddenExitIndicator_dg[#$1F,$00] = $AA;
HiddenExitIndicator_dg[#$1F,$01] = $A7;




HiddenExitIndicator_dg[#$20,$00] = $48;
HiddenExitIndicator_dg[#$20,$01] = $B4;









ds_grid_resize(dg_boulders, $12,$04);

dg_boulders[#$00,$00] = $6057;
dg_boulders[#$00,$01] = $01;
dg_boulders[#$00,$02] = $04D5;

dg_boulders[#$01,$00] = $655D;
dg_boulders[#$01,$01] = $01;
dg_boulders[#$01,$02] = $0420;

dg_boulders[#$02,$00] = $6D31;
dg_boulders[#$02,$01] = $01;
dg_boulders[#$02,$02] = $0438;

dg_boulders[#$03,$00] = $7456;
dg_boulders[#$03,$01] = $01;
dg_boulders[#$03,$02] = $04D5;

dg_boulders[#$04,$00] = $8597;
dg_boulders[#$04,$01] = $01;
dg_boulders[#$04,$02] = $0424;

dg_boulders[#$05,$00] = $AE32;
dg_boulders[#$05,$01] = $01;
dg_boulders[#$05,$02] = $04C8;

dg_boulders[#$06,$00] = $BE3E;
dg_boulders[#$06,$01] = $01;
dg_boulders[#$06,$02] = $0584;

dg_boulders[#$07,$00] = $BF40;
dg_boulders[#$07,$01] = $01;
dg_boulders[#$07,$02] = $0584;

dg_boulders[#$08,$00] = $C141;
dg_boulders[#$08,$01] = $01;
dg_boulders[#$08,$02] = $0584;

dg_boulders[#$09,$00] = $C340;
dg_boulders[#$09,$01] = $01;
dg_boulders[#$09,$02] = $0584;

dg_boulders[#$0A,$00] = $C43E;
dg_boulders[#$0A,$01] = $01;
dg_boulders[#$0A,$02] = $0584;

dg_boulders[#$0B,$00] = $C33C;
dg_boulders[#$0B,$01] = $01;
dg_boulders[#$0B,$02] = $0584;

dg_boulders[#$0C,$00] = $C13B;
dg_boulders[#$0C,$01] = $01;
dg_boulders[#$0C,$02] = $0584;

dg_boulders[#$0D,$00] = $BF3C;
dg_boulders[#$0D,$01] = $01;
dg_boulders[#$0D,$02] = $0584;

dg_boulders[#$0E,$00] = $EBB7;
dg_boulders[#$0E,$01] = $01;
dg_boulders[#$0E,$02] = $04C8;

dg_boulders[#$0F,$00] = $0F6A;
dg_boulders[#$0F,$01] = $01;
dg_boulders[#$0F,$02] = $0424;




dg_boulders[#$10,$00] = $106B;
dg_boulders[#$10,$01] = $01;
dg_boulders[#$10,$02] = $0424;

dg_boulders[#$11,$00] = $0E6A;
dg_boulders[#$11,$01] = $01;
dg_boulders[#$11,$02] = $0424;









BoulderCircle_center_OWRC = $C13E;

dl_BoulderCircle_OWRC[|$00]    = $BE3E;
dm[?'_OWRC_Boulder_Circle_01'] = $BE3E; // datakey example: _OWRC_Boulder_Circle_03

dl_BoulderCircle_OWRC[|$01]         = $BF40;
dm[?'_OWRC_Boulder_Circle_02'] = $BF40; // datakey example: _OWRC_Boulder_Circle_03

dl_BoulderCircle_OWRC[|$02]         = $C141;
dm[?'_OWRC_Boulder_Circle_03'] = $C141; // datakey example: _OWRC_Boulder_Circle_03

dl_BoulderCircle_OWRC[|$03]         = $C340;
dm[?'_OWRC_Boulder_Circle_04'] = $C340; // datakey example: _OWRC_Boulder_Circle_03

dl_BoulderCircle_OWRC[|$04]         = $C43E;
dm[?'_OWRC_Boulder_Circle_05'] = $C43E; // datakey example: _OWRC_Boulder_Circle_03

dl_BoulderCircle_OWRC[|$05]         = $C33C;
dm[?'_OWRC_Boulder_Circle_06'] = $C33C; // datakey example: _OWRC_Boulder_Circle_03

dl_BoulderCircle_OWRC[|$06]         = $C13B;
dm[?'_OWRC_Boulder_Circle_07'] = $C13B; // datakey example: _OWRC_Boulder_Circle_03

dl_BoulderCircle_OWRC[|$07]         = $BF3C;
dm[?'_OWRC_Boulder_Circle_08'] = $BF3C; // datakey example: _OWRC_Boulder_Circle_03









dm[?'6057'+STR_TSRC+STR_Under+STR_Boulder] = $04D5;
dm[?'655D'+STR_TSRC+STR_Under+STR_Boulder] = $0420;
dm[?'6D31'+STR_TSRC+STR_Under+STR_Boulder] = $0438;
dm[?'7456'+STR_TSRC+STR_Under+STR_Boulder] = $04D5;
dm[?'8597'+STR_TSRC+STR_Under+STR_Boulder] = $0424;
dm[?'AE32'+STR_TSRC+STR_Under+STR_Boulder] = $04C8;
dm[?'BE3E'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'BF40'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'C141'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'C340'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'C43E'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'C33C'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'C13B'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'BF3C'+STR_TSRC+STR_Under+STR_Boulder] = $0584;
dm[?'EBB7'+STR_TSRC+STR_Under+STR_Boulder] = $04C8;
dm[?'0F6A'+STR_TSRC+STR_Under+STR_Boulder] = $0424;

dm[?'106B'+STR_TSRC+STR_Under+STR_Boulder] = $0424;
dm[?'0E6A'+STR_TSRC+STR_Under+STR_Boulder] = $0424;












_count1 = $019B;
_count2 = $08;
ds_grid_resize(dg_ChangeTiles_Boots, _count1,_count2);

for(_i=0; _i<_count1; _i++)
{
    dg_ChangeTiles_Boots[#_i,1] = $00;
    dg_ChangeTiles_Boots[#_i,2] = TSRC_WATER01;
    dg_ChangeTiles_Boots[#_i,3] = $26;
}

dg_ChangeTiles_Boots[#$0000,$00] = $3030;
dg_ChangeTiles_Boots[#$0000,$03] = $21;
dg_ChangeTiles_Boots[#$0001,$00] = $3031;
dg_ChangeTiles_Boots[#$0001,$03] = $21;
dg_ChangeTiles_Boots[#$0002,$00] = $3131;
dg_ChangeTiles_Boots[#$0002,$03] = $21;
dg_ChangeTiles_Boots[#$0003,$00] = $3132;
dg_ChangeTiles_Boots[#$0003,$03] = $21;
dg_ChangeTiles_Boots[#$0004,$00] = $3232;
dg_ChangeTiles_Boots[#$0004,$03] = $21;
dg_ChangeTiles_Boots[#$0005,$00] = $385F;
dg_ChangeTiles_Boots[#$0005,$03] = $21;
dg_ChangeTiles_Boots[#$0006,$00] = $3860;
dg_ChangeTiles_Boots[#$0006,$03] = $21;
dg_ChangeTiles_Boots[#$0007,$00] = $3861;
dg_ChangeTiles_Boots[#$0007,$03] = $21;
dg_ChangeTiles_Boots[#$0008,$00] = $38A5;
dg_ChangeTiles_Boots[#$0008,$03] = $21;
dg_ChangeTiles_Boots[#$0009,$00] = $3961;
dg_ChangeTiles_Boots[#$0009,$03] = $21;
dg_ChangeTiles_Boots[#$000A,$00] = $3962;
dg_ChangeTiles_Boots[#$000A,$03] = $21;
dg_ChangeTiles_Boots[#$000B,$00] = $3963;
dg_ChangeTiles_Boots[#$000B,$03] = $21;
dg_ChangeTiles_Boots[#$000C,$00] = $39A5;
dg_ChangeTiles_Boots[#$000C,$03] = $21;
dg_ChangeTiles_Boots[#$000D,$00] = $3F58;
dg_ChangeTiles_Boots[#$000D,$03] = $21;
dg_ChangeTiles_Boots[#$000E,$00] = $404C;
dg_ChangeTiles_Boots[#$000E,$03] = $21;
dg_ChangeTiles_Boots[#$000F,$00] = $404D;
dg_ChangeTiles_Boots[#$000F,$03] = $21;

dg_ChangeTiles_Boots[#$0010,$00] = $404E;
dg_ChangeTiles_Boots[#$0010,$03] = $21;
dg_ChangeTiles_Boots[#$0011,$00] = $4056;
dg_ChangeTiles_Boots[#$0011,$03] = $21;
dg_ChangeTiles_Boots[#$0012,$00] = $4057;
dg_ChangeTiles_Boots[#$0012,$03] = $21;
dg_ChangeTiles_Boots[#$0013,$00] = $414B;
dg_ChangeTiles_Boots[#$0013,$03] = $21;
dg_ChangeTiles_Boots[#$0014,$00] = $414C;
dg_ChangeTiles_Boots[#$0014,$03] = $21;
dg_ChangeTiles_Boots[#$0015,$00] = $414E;
dg_ChangeTiles_Boots[#$0015,$03] = $21;
dg_ChangeTiles_Boots[#$0016,$00] = $414F;
dg_ChangeTiles_Boots[#$0016,$03] = $21;
dg_ChangeTiles_Boots[#$0017,$00] = $4150;
dg_ChangeTiles_Boots[#$0017,$03] = $21;
dg_ChangeTiles_Boots[#$0018,$00] = $4154;
dg_ChangeTiles_Boots[#$0018,$03] = $21;
dg_ChangeTiles_Boots[#$0019,$00] = $4155;
dg_ChangeTiles_Boots[#$0019,$03] = $21;
dg_ChangeTiles_Boots[#$001A,$00] = $4156;
dg_ChangeTiles_Boots[#$001A,$03] = $21;
dg_ChangeTiles_Boots[#$001B,$00] = $4249;
dg_ChangeTiles_Boots[#$001B,$03] = $21;
dg_ChangeTiles_Boots[#$001C,$00] = $424A;
dg_ChangeTiles_Boots[#$001C,$03] = $21;
dg_ChangeTiles_Boots[#$001D,$00] = $424B;
dg_ChangeTiles_Boots[#$001D,$03] = $21;
dg_ChangeTiles_Boots[#$001E,$00] = $4251;
dg_ChangeTiles_Boots[#$001E,$03] = $21;
dg_ChangeTiles_Boots[#$001F,$00] = $4252;
dg_ChangeTiles_Boots[#$001F,$03] = $21;

dg_ChangeTiles_Boots[#$0020,$00] = $4253;
dg_ChangeTiles_Boots[#$0020,$03] = $21;
dg_ChangeTiles_Boots[#$0021,$00] = $4254;
dg_ChangeTiles_Boots[#$0021,$03] = $21;
dg_ChangeTiles_Boots[#$0022,$00] = $4255;
dg_ChangeTiles_Boots[#$0022,$03] = $21;
dg_ChangeTiles_Boots[#$0023,$00] = $4FA3;
dg_ChangeTiles_Boots[#$0023,$03] = $21;
dg_ChangeTiles_Boots[#$0024,$00] = $50A4;
dg_ChangeTiles_Boots[#$0024,$03] = $21;
dg_ChangeTiles_Boots[#$0025,$00] = $50A5;
dg_ChangeTiles_Boots[#$0025,$03] = $21;
dg_ChangeTiles_Boots[#$0026,$00] = $51A5;
dg_ChangeTiles_Boots[#$0026,$03] = $21;
dg_ChangeTiles_Boots[#$0027,$00] = $52A5;
dg_ChangeTiles_Boots[#$0027,$03] = $21;
dg_ChangeTiles_Boots[#$0028,$00] = $55A5;
dg_ChangeTiles_Boots[#$0028,$03] = $21;
dg_ChangeTiles_Boots[#$0029,$00] = $56A5;
dg_ChangeTiles_Boots[#$0029,$03] = $21;
dg_ChangeTiles_Boots[#$002A,$00] = $5A7E;
dg_ChangeTiles_Boots[#$002A,$03] = $21;
dg_ChangeTiles_Boots[#$002B,$00] = $5A7F;
dg_ChangeTiles_Boots[#$002B,$03] = $21;
dg_ChangeTiles_Boots[#$002C,$00] = $5A80;
dg_ChangeTiles_Boots[#$002C,$03] = $21;
dg_ChangeTiles_Boots[#$002D,$00] = $5A81;
dg_ChangeTiles_Boots[#$002D,$03] = $21;
dg_ChangeTiles_Boots[#$002E,$00] = $5AD5;
dg_ChangeTiles_Boots[#$002E,$03] = $21;
dg_ChangeTiles_Boots[#$002F,$00] = $5AD6;
dg_ChangeTiles_Boots[#$002F,$03] = $21;

dg_ChangeTiles_Boots[#$0030,$00] = $5AD7;
dg_ChangeTiles_Boots[#$0030,$03] = $21;
dg_ChangeTiles_Boots[#$0031,$00] = $5AD8;
dg_ChangeTiles_Boots[#$0031,$03] = $21;
dg_ChangeTiles_Boots[#$0032,$00] = $5B7D;
dg_ChangeTiles_Boots[#$0032,$03] = $21;
dg_ChangeTiles_Boots[#$0033,$00] = $5B7E;
dg_ChangeTiles_Boots[#$0033,$03] = $21;
dg_ChangeTiles_Boots[#$0034,$00] = $5B7F;
dg_ChangeTiles_Boots[#$0034,$03] = $21;
dg_ChangeTiles_Boots[#$0035,$00] = $5B81;
dg_ChangeTiles_Boots[#$0035,$03] = $21;
dg_ChangeTiles_Boots[#$0036,$00] = $5B82;
dg_ChangeTiles_Boots[#$0036,$03] = $21;
dg_ChangeTiles_Boots[#$0037,$00] = $5BD5;
dg_ChangeTiles_Boots[#$0037,$03] = $21;
dg_ChangeTiles_Boots[#$0038,$00] = $5C7D;
dg_ChangeTiles_Boots[#$0038,$03] = $21;
dg_ChangeTiles_Boots[#$0039,$00] = $5C82;
dg_ChangeTiles_Boots[#$0039,$03] = $21;
dg_ChangeTiles_Boots[#$003A,$00] = $5C83;
dg_ChangeTiles_Boots[#$003A,$03] = $21;
dg_ChangeTiles_Boots[#$003B,$00] = $5CD4;
dg_ChangeTiles_Boots[#$003B,$03] = $21;
dg_ChangeTiles_Boots[#$003C,$00] = $5CD5;
dg_ChangeTiles_Boots[#$003C,$03] = $21;
dg_ChangeTiles_Boots[#$003D,$00] = $5D82;
dg_ChangeTiles_Boots[#$003D,$03] = $21;
dg_ChangeTiles_Boots[#$003E,$00] = $5D83;
dg_ChangeTiles_Boots[#$003E,$03] = $21;
dg_ChangeTiles_Boots[#$003F,$00] = $5DD4;
dg_ChangeTiles_Boots[#$003F,$03] = $21;

dg_ChangeTiles_Boots[#$0040,$00] = $5ED4;
dg_ChangeTiles_Boots[#$0040,$03] = $21;
dg_ChangeTiles_Boots[#$0041,$00] = $60CE;
dg_ChangeTiles_Boots[#$0041,$03] = $21;
dg_ChangeTiles_Boots[#$0042,$00] = $60D0;
dg_ChangeTiles_Boots[#$0042,$03] = $21;
dg_ChangeTiles_Boots[#$0043,$00] = $60D1;
dg_ChangeTiles_Boots[#$0043,$03] = $21;
dg_ChangeTiles_Boots[#$0044,$00] = $60D2;
dg_ChangeTiles_Boots[#$0044,$03] = $21;
dg_ChangeTiles_Boots[#$0045,$00] = $60D3;
dg_ChangeTiles_Boots[#$0045,$03] = $21;
dg_ChangeTiles_Boots[#$0046,$00] = $60D4;
dg_ChangeTiles_Boots[#$0046,$03] = $21;
dg_ChangeTiles_Boots[#$0047,$00] = $61CE;
dg_ChangeTiles_Boots[#$0047,$03] = $21;
dg_ChangeTiles_Boots[#$0048,$00] = $62CC;
dg_ChangeTiles_Boots[#$0048,$03] = $21;
dg_ChangeTiles_Boots[#$0049,$00] = $62CD;
dg_ChangeTiles_Boots[#$0049,$03] = $21;
dg_ChangeTiles_Boots[#$004A,$00] = $62CE;
dg_ChangeTiles_Boots[#$004A,$03] = $21;
dg_ChangeTiles_Boots[#$004B,$00] = $63CC;
dg_ChangeTiles_Boots[#$004B,$03] = $21;
dg_ChangeTiles_Boots[#$004C,$00] = $64CC;
dg_ChangeTiles_Boots[#$004C,$03] = $21;
dg_ChangeTiles_Boots[#$004D,$00] = $66C4;
dg_ChangeTiles_Boots[#$004D,$03] = $21;
dg_ChangeTiles_Boots[#$004E,$00] = $66C5;
dg_ChangeTiles_Boots[#$004E,$03] = $21;
dg_ChangeTiles_Boots[#$004F,$00] = $66C6;
dg_ChangeTiles_Boots[#$004F,$03] = $21;

dg_ChangeTiles_Boots[#$0050,$00] = $66C7;
dg_ChangeTiles_Boots[#$0050,$03] = $21;
dg_ChangeTiles_Boots[#$0051,$00] = $66C8;
dg_ChangeTiles_Boots[#$0051,$03] = $21;
dg_ChangeTiles_Boots[#$0052,$00] = $66CA;
dg_ChangeTiles_Boots[#$0052,$03] = $21;
dg_ChangeTiles_Boots[#$0053,$00] = $66CB;
dg_ChangeTiles_Boots[#$0053,$03] = $21;
dg_ChangeTiles_Boots[#$0054,$00] = $66CC;
dg_ChangeTiles_Boots[#$0054,$03] = $21;
dg_ChangeTiles_Boots[#$0055,$00] = $70A6;
dg_ChangeTiles_Boots[#$0055,$03] = $21;
dg_ChangeTiles_Boots[#$0056,$00] = $71A2;
dg_ChangeTiles_Boots[#$0056,$03] = $21;
dg_ChangeTiles_Boots[#$0057,$00] = $71A3;
dg_ChangeTiles_Boots[#$0057,$03] = $21;
dg_ChangeTiles_Boots[#$0058,$00] = $71A4;
dg_ChangeTiles_Boots[#$0058,$03] = $21;
dg_ChangeTiles_Boots[#$0059,$00] = $72A0;
dg_ChangeTiles_Boots[#$0059,$03] = $21;
dg_ChangeTiles_Boots[#$005A,$00] = $72A1;
dg_ChangeTiles_Boots[#$005A,$03] = $21;
dg_ChangeTiles_Boots[#$005B,$00] = $72A2;
dg_ChangeTiles_Boots[#$005B,$03] = $21;
dg_ChangeTiles_Boots[#$005C,$00] = $73A0;
dg_ChangeTiles_Boots[#$005C,$03] = $21;
dg_ChangeTiles_Boots[#$005D,$00] = $73A1;
dg_ChangeTiles_Boots[#$005D,$03] = $21;
dg_ChangeTiles_Boots[#$005E,$00] = $74A0;
dg_ChangeTiles_Boots[#$005E,$03] = $21;
dg_ChangeTiles_Boots[#$005F,$00] = $74BA;
dg_ChangeTiles_Boots[#$005F,$03] = $21;

dg_ChangeTiles_Boots[#$0060,$00] = $74BB;
dg_ChangeTiles_Boots[#$0060,$03] = $21;
dg_ChangeTiles_Boots[#$0061,$00] = $759F;
dg_ChangeTiles_Boots[#$0061,$03] = $21;
dg_ChangeTiles_Boots[#$0062,$00] = $75A0;
dg_ChangeTiles_Boots[#$0062,$03] = $21;
dg_ChangeTiles_Boots[#$0063,$00] = $75B4;
dg_ChangeTiles_Boots[#$0063,$03] = $21;
dg_ChangeTiles_Boots[#$0064,$00] = $75B5;
dg_ChangeTiles_Boots[#$0064,$03] = $21;
dg_ChangeTiles_Boots[#$0065,$00] = $75B6;
dg_ChangeTiles_Boots[#$0065,$03] = $21;
dg_ChangeTiles_Boots[#$0066,$00] = $75B7;
dg_ChangeTiles_Boots[#$0066,$03] = $21;
dg_ChangeTiles_Boots[#$0067,$00] = $75B8;
dg_ChangeTiles_Boots[#$0067,$03] = $21;
dg_ChangeTiles_Boots[#$0068,$00] = $75B9;
dg_ChangeTiles_Boots[#$0068,$03] = $21;
dg_ChangeTiles_Boots[#$0069,$00] = $75BA;
dg_ChangeTiles_Boots[#$0069,$03] = $21;
dg_ChangeTiles_Boots[#$006A,$00] = $75BB;
dg_ChangeTiles_Boots[#$006A,$03] = $21;
dg_ChangeTiles_Boots[#$006B,$00] = $769F;
dg_ChangeTiles_Boots[#$006B,$03] = $21;
dg_ChangeTiles_Boots[#$006C,$00] = $76A0;
dg_ChangeTiles_Boots[#$006C,$03] = $21;
dg_ChangeTiles_Boots[#$006D,$00] = $76B0;
dg_ChangeTiles_Boots[#$006D,$03] = $21;
dg_ChangeTiles_Boots[#$006E,$00] = $76B1;
dg_ChangeTiles_Boots[#$006E,$03] = $21;
dg_ChangeTiles_Boots[#$006F,$00] = $76B2;
dg_ChangeTiles_Boots[#$006F,$03] = $21;

dg_ChangeTiles_Boots[#$0070,$00] = $76B4;
dg_ChangeTiles_Boots[#$0070,$03] = $21;
dg_ChangeTiles_Boots[#$0071,$00] = $76B7;
dg_ChangeTiles_Boots[#$0071,$03] = $21;
dg_ChangeTiles_Boots[#$0072,$00] = $76B9;
dg_ChangeTiles_Boots[#$0072,$03] = $21;
dg_ChangeTiles_Boots[#$0073,$00] = $76BB;
dg_ChangeTiles_Boots[#$0073,$03] = $21;
dg_ChangeTiles_Boots[#$0074,$00] = $77A0;
dg_ChangeTiles_Boots[#$0074,$03] = $21;
dg_ChangeTiles_Boots[#$0075,$00] = $77A1;
dg_ChangeTiles_Boots[#$0075,$03] = $21;
dg_ChangeTiles_Boots[#$0076,$00] = $77AD;
dg_ChangeTiles_Boots[#$0076,$03] = $21;
dg_ChangeTiles_Boots[#$0077,$00] = $77AF;
dg_ChangeTiles_Boots[#$0077,$03] = $21;
dg_ChangeTiles_Boots[#$0078,$00] = $77B0;
dg_ChangeTiles_Boots[#$0078,$03] = $21;
dg_ChangeTiles_Boots[#$0079,$00] = $77B4;
dg_ChangeTiles_Boots[#$0079,$03] = $21;
dg_ChangeTiles_Boots[#$007A,$00] = $77B6;
dg_ChangeTiles_Boots[#$007A,$03] = $21;
dg_ChangeTiles_Boots[#$007B,$00] = $77B9;
dg_ChangeTiles_Boots[#$007B,$03] = $21;
dg_ChangeTiles_Boots[#$007C,$00] = $77BB;
dg_ChangeTiles_Boots[#$007C,$03] = $21;
dg_ChangeTiles_Boots[#$007D,$00] = $78A1;
dg_ChangeTiles_Boots[#$007D,$03] = $21;
dg_ChangeTiles_Boots[#$007E,$00] = $78A2;
dg_ChangeTiles_Boots[#$007E,$03] = $21;
dg_ChangeTiles_Boots[#$007F,$00] = $78AC;
dg_ChangeTiles_Boots[#$007F,$03] = $21;

dg_ChangeTiles_Boots[#$0080,$00] = $78AD;
dg_ChangeTiles_Boots[#$0080,$03] = $21;
dg_ChangeTiles_Boots[#$0081,$00] = $78AE;
dg_ChangeTiles_Boots[#$0081,$03] = $21;
dg_ChangeTiles_Boots[#$0082,$00] = $78AF;
dg_ChangeTiles_Boots[#$0082,$03] = $21;
dg_ChangeTiles_Boots[#$0083,$00] = $78B0;
dg_ChangeTiles_Boots[#$0083,$03] = $21;
dg_ChangeTiles_Boots[#$0084,$00] = $78B1;
dg_ChangeTiles_Boots[#$0084,$03] = $21;
dg_ChangeTiles_Boots[#$0085,$00] = $78B2;
dg_ChangeTiles_Boots[#$0085,$03] = $21;
dg_ChangeTiles_Boots[#$0086,$00] = $78B3;
dg_ChangeTiles_Boots[#$0086,$03] = $21;
dg_ChangeTiles_Boots[#$0087,$00] = $78B4;
dg_ChangeTiles_Boots[#$0087,$03] = $21;
dg_ChangeTiles_Boots[#$0088,$00] = $78B5;
dg_ChangeTiles_Boots[#$0088,$03] = $21;
dg_ChangeTiles_Boots[#$0089,$00] = $78B6;
dg_ChangeTiles_Boots[#$0089,$03] = $21;
dg_ChangeTiles_Boots[#$008A,$00] = $78B7;
dg_ChangeTiles_Boots[#$008A,$03] = $21;
dg_ChangeTiles_Boots[#$008B,$00] = $78BB;
dg_ChangeTiles_Boots[#$008B,$03] = $21;
dg_ChangeTiles_Boots[#$008C,$00] = $79A1;
dg_ChangeTiles_Boots[#$008C,$03] = $21;
dg_ChangeTiles_Boots[#$008D,$00] = $79A2;
dg_ChangeTiles_Boots[#$008D,$03] = $21;
dg_ChangeTiles_Boots[#$008E,$00] = $79A3;
dg_ChangeTiles_Boots[#$008E,$03] = $21;
dg_ChangeTiles_Boots[#$008F,$00] = $79AD;
dg_ChangeTiles_Boots[#$008F,$03] = $21;

dg_ChangeTiles_Boots[#$0090,$00] = $7AA2;
dg_ChangeTiles_Boots[#$0090,$03] = $21;
dg_ChangeTiles_Boots[#$0091,$00] = $7AA3;
dg_ChangeTiles_Boots[#$0091,$03] = $21;
dg_ChangeTiles_Boots[#$0092,$00] = $7AA4;
dg_ChangeTiles_Boots[#$0092,$03] = $21;
dg_ChangeTiles_Boots[#$0093,$00] = $7AA5;
dg_ChangeTiles_Boots[#$0093,$03] = $21;
dg_ChangeTiles_Boots[#$0094,$00] = $7AAD;
dg_ChangeTiles_Boots[#$0094,$03] = $21;
dg_ChangeTiles_Boots[#$0095,$00] = $7BA3;
dg_ChangeTiles_Boots[#$0095,$03] = $21;
dg_ChangeTiles_Boots[#$0096,$00] = $7BA4;
dg_ChangeTiles_Boots[#$0096,$03] = $21;
dg_ChangeTiles_Boots[#$0097,$00] = $7BA5;
dg_ChangeTiles_Boots[#$0097,$03] = $21;
dg_ChangeTiles_Boots[#$0098,$00] = $7BA6;
dg_ChangeTiles_Boots[#$0098,$03] = $21;
dg_ChangeTiles_Boots[#$0099,$00] = $7BA7;
dg_ChangeTiles_Boots[#$0099,$03] = $21;
dg_ChangeTiles_Boots[#$009A,$00] = $7BA8;
dg_ChangeTiles_Boots[#$009A,$03] = $21;
dg_ChangeTiles_Boots[#$009B,$00] = $7BAD;
dg_ChangeTiles_Boots[#$009B,$03] = $21;
dg_ChangeTiles_Boots[#$009C,$00] = $7CA5;
dg_ChangeTiles_Boots[#$009C,$03] = $21;
dg_ChangeTiles_Boots[#$009D,$00] = $7CA6;
dg_ChangeTiles_Boots[#$009D,$03] = $21;
dg_ChangeTiles_Boots[#$009E,$00] = $7CA7;
dg_ChangeTiles_Boots[#$009E,$03] = $21;
dg_ChangeTiles_Boots[#$009F,$00] = $7CA8;
dg_ChangeTiles_Boots[#$009F,$03] = $21;

dg_ChangeTiles_Boots[#$00A0,$00] = $7CA9;
dg_ChangeTiles_Boots[#$00A0,$03] = $21;
dg_ChangeTiles_Boots[#$00A1,$00] = $7CAA;
dg_ChangeTiles_Boots[#$00A1,$03] = $21;
dg_ChangeTiles_Boots[#$00A2,$00] = $7CAB;
dg_ChangeTiles_Boots[#$00A2,$03] = $21;
dg_ChangeTiles_Boots[#$00A3,$00] = $7CAC;
dg_ChangeTiles_Boots[#$00A3,$03] = $21;
dg_ChangeTiles_Boots[#$00A4,$00] = $7CAD;
dg_ChangeTiles_Boots[#$00A4,$03] = $21;
dg_ChangeTiles_Boots[#$00A5,$00] = $7CAE;
dg_ChangeTiles_Boots[#$00A5,$03] = $21;
dg_ChangeTiles_Boots[#$00A6,$00] = $7CAF;
dg_ChangeTiles_Boots[#$00A6,$03] = $21;
dg_ChangeTiles_Boots[#$00A7,$00] = $7CB0;
dg_ChangeTiles_Boots[#$00A7,$03] = $21;
dg_ChangeTiles_Boots[#$00A8,$00] = $7CB1;
dg_ChangeTiles_Boots[#$00A8,$03] = $21;
dg_ChangeTiles_Boots[#$00A9,$00] = $7CB2;
dg_ChangeTiles_Boots[#$00A9,$03] = $21;
dg_ChangeTiles_Boots[#$00AA,$00] = $7CB3;
dg_ChangeTiles_Boots[#$00AA,$03] = $21;
dg_ChangeTiles_Boots[#$00AB,$00] = $7DA1;
dg_ChangeTiles_Boots[#$00AB,$03] = $21;
dg_ChangeTiles_Boots[#$00AC,$00] = $7DA2;
dg_ChangeTiles_Boots[#$00AC,$03] = $21;
dg_ChangeTiles_Boots[#$00AD,$00] = $7DA3;
dg_ChangeTiles_Boots[#$00AD,$03] = $21;
dg_ChangeTiles_Boots[#$00AE,$00] = $7DA4;
dg_ChangeTiles_Boots[#$00AE,$03] = $21;
dg_ChangeTiles_Boots[#$00AF,$00] = $7DA5;
dg_ChangeTiles_Boots[#$00AF,$03] = $21;

dg_ChangeTiles_Boots[#$00B0,$00] = $7DA6;
dg_ChangeTiles_Boots[#$00B0,$03] = $21;
dg_ChangeTiles_Boots[#$00B1,$00] = $7DA7;
dg_ChangeTiles_Boots[#$00B1,$03] = $21;
dg_ChangeTiles_Boots[#$00B2,$00] = $7DA8;
dg_ChangeTiles_Boots[#$00B2,$03] = $21;
dg_ChangeTiles_Boots[#$00B3,$00] = $7DA9;
dg_ChangeTiles_Boots[#$00B3,$03] = $21;
dg_ChangeTiles_Boots[#$00B4,$00] = $7DAA;
dg_ChangeTiles_Boots[#$00B4,$03] = $21;
dg_ChangeTiles_Boots[#$00B5,$00] = $7DAB;
dg_ChangeTiles_Boots[#$00B5,$03] = $21;
dg_ChangeTiles_Boots[#$00B6,$00] = $7DAC;
dg_ChangeTiles_Boots[#$00B6,$03] = $21;
dg_ChangeTiles_Boots[#$00B7,$00] = $7DAD;
dg_ChangeTiles_Boots[#$00B7,$03] = $21;
dg_ChangeTiles_Boots[#$00B8,$00] = $7DAE;
dg_ChangeTiles_Boots[#$00B8,$03] = $21;
dg_ChangeTiles_Boots[#$00B9,$00] = $7E9F;
dg_ChangeTiles_Boots[#$00B9,$03] = $21;
dg_ChangeTiles_Boots[#$00BA,$00] = $7EA0;
dg_ChangeTiles_Boots[#$00BA,$03] = $21;
dg_ChangeTiles_Boots[#$00BB,$00] = $7EA1;
dg_ChangeTiles_Boots[#$00BB,$03] = $21;
dg_ChangeTiles_Boots[#$00BC,$00] = $7EA2;
dg_ChangeTiles_Boots[#$00BC,$03] = $21;
dg_ChangeTiles_Boots[#$00BD,$00] = $7EA3;
dg_ChangeTiles_Boots[#$00BD,$03] = $21;
dg_ChangeTiles_Boots[#$00BE,$00] = $7EA4;
dg_ChangeTiles_Boots[#$00BE,$03] = $21;
dg_ChangeTiles_Boots[#$00BF,$00] = $7EA5;
dg_ChangeTiles_Boots[#$00BF,$03] = $21;

dg_ChangeTiles_Boots[#$00C0,$00] = $7EA6;
dg_ChangeTiles_Boots[#$00C0,$03] = $21;
dg_ChangeTiles_Boots[#$00C1,$00] = $7EA7;
dg_ChangeTiles_Boots[#$00C1,$03] = $21;
dg_ChangeTiles_Boots[#$00C2,$00] = $7EA8;
dg_ChangeTiles_Boots[#$00C2,$03] = $21;
dg_ChangeTiles_Boots[#$00C3,$00] = $7EA9;
dg_ChangeTiles_Boots[#$00C3,$03] = $21;
dg_ChangeTiles_Boots[#$00C4,$00] = $7EAA;
dg_ChangeTiles_Boots[#$00C4,$03] = $21;
dg_ChangeTiles_Boots[#$00C5,$00] = $7EAB;
dg_ChangeTiles_Boots[#$00C5,$03] = $21;
dg_ChangeTiles_Boots[#$00C6,$00] = $7F9E;
dg_ChangeTiles_Boots[#$00C6,$03] = $21;
dg_ChangeTiles_Boots[#$00C7,$00] = $7F9F;
dg_ChangeTiles_Boots[#$00C7,$03] = $21;
dg_ChangeTiles_Boots[#$00C8,$00] = $7FA0;
dg_ChangeTiles_Boots[#$00C8,$03] = $21;
dg_ChangeTiles_Boots[#$00C9,$00] = $7FA1;
dg_ChangeTiles_Boots[#$00C9,$03] = $21;
dg_ChangeTiles_Boots[#$00CA,$00] = $7FA2;
dg_ChangeTiles_Boots[#$00CA,$03] = $21;
dg_ChangeTiles_Boots[#$00CB,$00] = $7FA3;
dg_ChangeTiles_Boots[#$00CB,$03] = $21;
dg_ChangeTiles_Boots[#$00CC,$00] = $7FA4;
dg_ChangeTiles_Boots[#$00CC,$03] = $21;
dg_ChangeTiles_Boots[#$00CD,$00] = $7FA5;
dg_ChangeTiles_Boots[#$00CD,$03] = $21;
dg_ChangeTiles_Boots[#$00CE,$00] = $7FA6;
dg_ChangeTiles_Boots[#$00CE,$03] = $21;
dg_ChangeTiles_Boots[#$00CF,$00] = $7FA7;
dg_ChangeTiles_Boots[#$00CF,$03] = $21;

dg_ChangeTiles_Boots[#$00D0,$00] = $7FA8;
dg_ChangeTiles_Boots[#$00D0,$03] = $21;
dg_ChangeTiles_Boots[#$00D1,$00] = $7FA9;
dg_ChangeTiles_Boots[#$00D1,$03] = $21;
dg_ChangeTiles_Boots[#$00D2,$00] = $809C;
dg_ChangeTiles_Boots[#$00D2,$03] = $21;
dg_ChangeTiles_Boots[#$00D3,$00] = $809D;
dg_ChangeTiles_Boots[#$00D3,$03] = $21;
dg_ChangeTiles_Boots[#$00D4,$00] = $809E;
dg_ChangeTiles_Boots[#$00D4,$03] = $21;
dg_ChangeTiles_Boots[#$00D5,$00] = $809F;
dg_ChangeTiles_Boots[#$00D5,$03] = $21;
dg_ChangeTiles_Boots[#$00D6,$00] = $80A0;
dg_ChangeTiles_Boots[#$00D6,$03] = $21;
dg_ChangeTiles_Boots[#$00D7,$00] = $80A1;
dg_ChangeTiles_Boots[#$00D7,$03] = $21;
dg_ChangeTiles_Boots[#$00D8,$00] = $80A2;
dg_ChangeTiles_Boots[#$00D8,$03] = $21;
dg_ChangeTiles_Boots[#$00D9,$00] = $80A3;
dg_ChangeTiles_Boots[#$00D9,$03] = $21;
dg_ChangeTiles_Boots[#$00DA,$00] = $80A4;
dg_ChangeTiles_Boots[#$00DA,$03] = $21;
dg_ChangeTiles_Boots[#$00DB,$00] = $80A5;
dg_ChangeTiles_Boots[#$00DB,$03] = $21;
dg_ChangeTiles_Boots[#$00DC,$00] = $80A6;
dg_ChangeTiles_Boots[#$00DC,$03] = $21;
dg_ChangeTiles_Boots[#$00DD,$00] = $80A7;
dg_ChangeTiles_Boots[#$00DD,$03] = $21;
dg_ChangeTiles_Boots[#$00DE,$00] = $80A8;
dg_ChangeTiles_Boots[#$00DE,$03] = $21;
dg_ChangeTiles_Boots[#$00DF,$00] = $80B5;
dg_ChangeTiles_Boots[#$00DF,$03] = $21;

dg_ChangeTiles_Boots[#$00E0,$00] = $819A;
dg_ChangeTiles_Boots[#$00E0,$03] = $21;
dg_ChangeTiles_Boots[#$00E1,$00] = $819B;
dg_ChangeTiles_Boots[#$00E1,$03] = $21;
dg_ChangeTiles_Boots[#$00E2,$00] = $819C;
dg_ChangeTiles_Boots[#$00E2,$03] = $21;
dg_ChangeTiles_Boots[#$00E3,$00] = $819D;
dg_ChangeTiles_Boots[#$00E3,$03] = $21;
dg_ChangeTiles_Boots[#$00E4,$00] = $819E;
dg_ChangeTiles_Boots[#$00E4,$03] = $21;
dg_ChangeTiles_Boots[#$00E5,$00] = $819F;
dg_ChangeTiles_Boots[#$00E5,$03] = $21;
dg_ChangeTiles_Boots[#$00E6,$00] = $81A0;
dg_ChangeTiles_Boots[#$00E6,$03] = $21;
dg_ChangeTiles_Boots[#$00E7,$00] = $81A1;
dg_ChangeTiles_Boots[#$00E7,$03] = $21;
dg_ChangeTiles_Boots[#$00E8,$00] = $81A2;
dg_ChangeTiles_Boots[#$00E8,$03] = $21;
dg_ChangeTiles_Boots[#$00E9,$00] = $81A3;
dg_ChangeTiles_Boots[#$00E9,$03] = $21;
dg_ChangeTiles_Boots[#$00EA,$00] = $81A4;
dg_ChangeTiles_Boots[#$00EA,$03] = $21;
dg_ChangeTiles_Boots[#$00EB,$00] = $81A5;
dg_ChangeTiles_Boots[#$00EB,$03] = $21;
dg_ChangeTiles_Boots[#$00EC,$00] = $81A6;
dg_ChangeTiles_Boots[#$00EC,$03] = $21;
dg_ChangeTiles_Boots[#$00ED,$00] = $81A7;
dg_ChangeTiles_Boots[#$00ED,$03] = $21;
dg_ChangeTiles_Boots[#$00EE,$00] = $81A8;
dg_ChangeTiles_Boots[#$00EE,$03] = $21;
dg_ChangeTiles_Boots[#$00EF,$00] = $81B6;
dg_ChangeTiles_Boots[#$00EF,$03] = $21;

dg_ChangeTiles_Boots[#$00F0,$00] = $8299;
dg_ChangeTiles_Boots[#$00F0,$03] = $21;
dg_ChangeTiles_Boots[#$00F1,$00] = $829A;
dg_ChangeTiles_Boots[#$00F1,$03] = $21;
dg_ChangeTiles_Boots[#$00F2,$00] = $829B;
dg_ChangeTiles_Boots[#$00F2,$03] = $21;
dg_ChangeTiles_Boots[#$00F3,$00] = $829C;
dg_ChangeTiles_Boots[#$00F3,$03] = $21;
dg_ChangeTiles_Boots[#$00F4,$00] = $829D;
dg_ChangeTiles_Boots[#$00F4,$03] = $21;
dg_ChangeTiles_Boots[#$00F5,$00] = $829E;
dg_ChangeTiles_Boots[#$00F5,$03] = $21;
dg_ChangeTiles_Boots[#$00F6,$00] = $829F;
dg_ChangeTiles_Boots[#$00F6,$03] = $21;
dg_ChangeTiles_Boots[#$00F7,$00] = $82A0;
dg_ChangeTiles_Boots[#$00F7,$03] = $21;
dg_ChangeTiles_Boots[#$00F8,$00] = $82A1;
dg_ChangeTiles_Boots[#$00F8,$03] = $21;
dg_ChangeTiles_Boots[#$00F9,$00] = $82A2;
dg_ChangeTiles_Boots[#$00F9,$03] = $21;
dg_ChangeTiles_Boots[#$00FA,$00] = $82A3;
dg_ChangeTiles_Boots[#$00FA,$03] = $21;
dg_ChangeTiles_Boots[#$00FB,$00] = $82A4;
dg_ChangeTiles_Boots[#$00FB,$03] = $21;
dg_ChangeTiles_Boots[#$00FC,$00] = $82A5;
dg_ChangeTiles_Boots[#$00FC,$03] = $21;
dg_ChangeTiles_Boots[#$00FD,$00] = $82A6;
dg_ChangeTiles_Boots[#$00FD,$03] = $21;
dg_ChangeTiles_Boots[#$00FE,$00] = $82A7;
dg_ChangeTiles_Boots[#$00FE,$03] = $21;
dg_ChangeTiles_Boots[#$00FF,$00] = $82B6;
dg_ChangeTiles_Boots[#$00FF,$03] = $21;

dg_ChangeTiles_Boots[#$0100,$00] = $8398;
dg_ChangeTiles_Boots[#$0100,$03] = $21;
dg_ChangeTiles_Boots[#$0101,$00] = $8399;
dg_ChangeTiles_Boots[#$0101,$03] = $21;
dg_ChangeTiles_Boots[#$0102,$00] = $839A;
dg_ChangeTiles_Boots[#$0102,$03] = $21;
dg_ChangeTiles_Boots[#$0103,$00] = $839B;
dg_ChangeTiles_Boots[#$0103,$03] = $21;
dg_ChangeTiles_Boots[#$0104,$00] = $839D;
dg_ChangeTiles_Boots[#$0104,$03] = $21;
dg_ChangeTiles_Boots[#$0105,$00] = $839E;
dg_ChangeTiles_Boots[#$0105,$03] = $21;
dg_ChangeTiles_Boots[#$0106,$00] = $839F;
dg_ChangeTiles_Boots[#$0106,$03] = $21;
dg_ChangeTiles_Boots[#$0107,$00] = $83A0;
dg_ChangeTiles_Boots[#$0107,$03] = $21;
dg_ChangeTiles_Boots[#$0108,$00] = $83A1;
dg_ChangeTiles_Boots[#$0108,$03] = $21;
dg_ChangeTiles_Boots[#$0109,$00] = $83A2;
dg_ChangeTiles_Boots[#$0109,$03] = $21;
dg_ChangeTiles_Boots[#$010A,$00] = $83A3;
dg_ChangeTiles_Boots[#$010A,$03] = $21;
dg_ChangeTiles_Boots[#$010B,$00] = $83A4;
dg_ChangeTiles_Boots[#$010B,$03] = $21;
dg_ChangeTiles_Boots[#$010C,$00] = $83A5;
dg_ChangeTiles_Boots[#$010C,$03] = $21;
dg_ChangeTiles_Boots[#$010D,$00] = $83A6;
dg_ChangeTiles_Boots[#$010D,$03] = $21;
dg_ChangeTiles_Boots[#$010E,$00] = $83B5;
dg_ChangeTiles_Boots[#$010E,$03] = $21;
dg_ChangeTiles_Boots[#$010F,$00] = $83B6;
dg_ChangeTiles_Boots[#$010F,$03] = $21;

dg_ChangeTiles_Boots[#$0110,$00] = $8498;
dg_ChangeTiles_Boots[#$0110,$03] = $21;
dg_ChangeTiles_Boots[#$0111,$00] = $8499;
dg_ChangeTiles_Boots[#$0111,$03] = $21;
dg_ChangeTiles_Boots[#$0112,$00] = $849A;
dg_ChangeTiles_Boots[#$0112,$03] = $21;
dg_ChangeTiles_Boots[#$0113,$00] = $849B;
dg_ChangeTiles_Boots[#$0113,$03] = $21;
dg_ChangeTiles_Boots[#$0114,$00] = $849C;
dg_ChangeTiles_Boots[#$0114,$03] = $21;
dg_ChangeTiles_Boots[#$0115,$00] = $849D;
dg_ChangeTiles_Boots[#$0115,$03] = $21;
dg_ChangeTiles_Boots[#$0116,$00] = $849E;
dg_ChangeTiles_Boots[#$0116,$03] = $21;
dg_ChangeTiles_Boots[#$0117,$00] = $849F;
dg_ChangeTiles_Boots[#$0117,$03] = $21;
dg_ChangeTiles_Boots[#$0118,$00] = $84A0;
dg_ChangeTiles_Boots[#$0118,$03] = $21;
dg_ChangeTiles_Boots[#$0119,$00] = $84A1;
dg_ChangeTiles_Boots[#$0119,$03] = $21;
dg_ChangeTiles_Boots[#$011A,$00] = $84A2;
dg_ChangeTiles_Boots[#$011A,$03] = $21;
dg_ChangeTiles_Boots[#$011B,$00] = $84A3;
dg_ChangeTiles_Boots[#$011B,$03] = $21;
dg_ChangeTiles_Boots[#$011C,$00] = $84A4;
dg_ChangeTiles_Boots[#$011C,$03] = $21;
dg_ChangeTiles_Boots[#$011D,$00] = $84A5;
dg_ChangeTiles_Boots[#$011D,$03] = $21;
dg_ChangeTiles_Boots[#$011E,$00] = $84B4;
dg_ChangeTiles_Boots[#$011E,$03] = $21;
dg_ChangeTiles_Boots[#$011F,$00] = $84B5;
dg_ChangeTiles_Boots[#$011F,$03] = $21;

dg_ChangeTiles_Boots[#$0120,$00] = $84B6;
dg_ChangeTiles_Boots[#$0120,$03] = $21;
dg_ChangeTiles_Boots[#$0121,$00] = $8599;
dg_ChangeTiles_Boots[#$0121,$03] = $21;
dg_ChangeTiles_Boots[#$0122,$00] = $859A;
dg_ChangeTiles_Boots[#$0122,$03] = $21;
dg_ChangeTiles_Boots[#$0123,$00] = $859B;
dg_ChangeTiles_Boots[#$0123,$03] = $21;
dg_ChangeTiles_Boots[#$0124,$00] = $859C;
dg_ChangeTiles_Boots[#$0124,$03] = $21;
dg_ChangeTiles_Boots[#$0125,$00] = $859D;
dg_ChangeTiles_Boots[#$0125,$03] = $21;
dg_ChangeTiles_Boots[#$0126,$00] = $859E;
dg_ChangeTiles_Boots[#$0126,$03] = $21;
dg_ChangeTiles_Boots[#$0127,$00] = $859F;
dg_ChangeTiles_Boots[#$0127,$03] = $21;
dg_ChangeTiles_Boots[#$0128,$00] = $85A0;
dg_ChangeTiles_Boots[#$0128,$03] = $21;
dg_ChangeTiles_Boots[#$0129,$00] = $85A1;
dg_ChangeTiles_Boots[#$0129,$03] = $21;
dg_ChangeTiles_Boots[#$012A,$00] = $85A2;
dg_ChangeTiles_Boots[#$012A,$03] = $21;
dg_ChangeTiles_Boots[#$012B,$00] = $85A3;
dg_ChangeTiles_Boots[#$012B,$03] = $21;
dg_ChangeTiles_Boots[#$012C,$00] = $85A4;
dg_ChangeTiles_Boots[#$012C,$03] = $21;
dg_ChangeTiles_Boots[#$012D,$00] = $85B4;
dg_ChangeTiles_Boots[#$012D,$03] = $21;
dg_ChangeTiles_Boots[#$012E,$00] = $869A;
dg_ChangeTiles_Boots[#$012E,$03] = $21;
dg_ChangeTiles_Boots[#$012F,$00] = $869B;
dg_ChangeTiles_Boots[#$012F,$03] = $21;

dg_ChangeTiles_Boots[#$0130,$00] = $869C;
dg_ChangeTiles_Boots[#$0130,$03] = $21;
dg_ChangeTiles_Boots[#$0131,$00] = $869D;
dg_ChangeTiles_Boots[#$0131,$03] = $21;
dg_ChangeTiles_Boots[#$0132,$00] = $869E;
dg_ChangeTiles_Boots[#$0132,$03] = $21;
dg_ChangeTiles_Boots[#$0133,$00] = $869F;
dg_ChangeTiles_Boots[#$0133,$03] = $21;
dg_ChangeTiles_Boots[#$0134,$00] = $86A0;
dg_ChangeTiles_Boots[#$0134,$03] = $21;
dg_ChangeTiles_Boots[#$0135,$00] = $86A1;
dg_ChangeTiles_Boots[#$0135,$03] = $21;
dg_ChangeTiles_Boots[#$0136,$00] = $86A2;
dg_ChangeTiles_Boots[#$0136,$03] = $21;
dg_ChangeTiles_Boots[#$0137,$00] = $86A3;
dg_ChangeTiles_Boots[#$0137,$03] = $21;
dg_ChangeTiles_Boots[#$0138,$00] = $86A4;
dg_ChangeTiles_Boots[#$0138,$03] = $21;
dg_ChangeTiles_Boots[#$0139,$00] = $86B3;
dg_ChangeTiles_Boots[#$0139,$03] = $21;
dg_ChangeTiles_Boots[#$013A,$00] = $879B;
dg_ChangeTiles_Boots[#$013A,$03] = $21;
dg_ChangeTiles_Boots[#$013B,$00] = $879C;
dg_ChangeTiles_Boots[#$013B,$03] = $21;
dg_ChangeTiles_Boots[#$013C,$00] = $879D;
dg_ChangeTiles_Boots[#$013C,$03] = $21;
dg_ChangeTiles_Boots[#$013D,$00] = $879E;
dg_ChangeTiles_Boots[#$013D,$03] = $21;
dg_ChangeTiles_Boots[#$013E,$00] = $879F;
dg_ChangeTiles_Boots[#$013E,$03] = $21;
dg_ChangeTiles_Boots[#$013F,$00] = $87A0;
dg_ChangeTiles_Boots[#$013F,$03] = $21;

dg_ChangeTiles_Boots[#$0140,$00] = $87A1;
dg_ChangeTiles_Boots[#$0140,$03] = $21;
dg_ChangeTiles_Boots[#$0141,$00] = $87A2;
dg_ChangeTiles_Boots[#$0141,$03] = $21;
dg_ChangeTiles_Boots[#$0142,$00] = $87A3;
dg_ChangeTiles_Boots[#$0142,$03] = $21;
dg_ChangeTiles_Boots[#$0143,$00] = $889C;
dg_ChangeTiles_Boots[#$0143,$03] = $21;
dg_ChangeTiles_Boots[#$0144,$00] = $889D;
dg_ChangeTiles_Boots[#$0144,$03] = $21;
dg_ChangeTiles_Boots[#$0145,$00] = $889E;
dg_ChangeTiles_Boots[#$0145,$03] = $21;
dg_ChangeTiles_Boots[#$0146,$00] = $889F;
dg_ChangeTiles_Boots[#$0146,$03] = $21;
dg_ChangeTiles_Boots[#$0147,$00] = $88A0;
dg_ChangeTiles_Boots[#$0147,$03] = $21;
dg_ChangeTiles_Boots[#$0148,$00] = $88A1;
dg_ChangeTiles_Boots[#$0148,$03] = $21;
dg_ChangeTiles_Boots[#$0149,$00] = $88A2;
dg_ChangeTiles_Boots[#$0149,$03] = $21;
dg_ChangeTiles_Boots[#$014A,$00] = $8994;
dg_ChangeTiles_Boots[#$014A,$03] = $21;
dg_ChangeTiles_Boots[#$014B,$00] = $8995;
dg_ChangeTiles_Boots[#$014B,$03] = $21;
dg_ChangeTiles_Boots[#$014C,$00] = $8996;
dg_ChangeTiles_Boots[#$014C,$03] = $21;
dg_ChangeTiles_Boots[#$014D,$00] = $899D;
dg_ChangeTiles_Boots[#$014D,$03] = $21;
dg_ChangeTiles_Boots[#$014E,$00] = $899E;
dg_ChangeTiles_Boots[#$014E,$03] = $21;
dg_ChangeTiles_Boots[#$014F,$00] = $899F;
dg_ChangeTiles_Boots[#$014F,$03] = $21;

dg_ChangeTiles_Boots[#$0150,$00] = $89A0;
dg_ChangeTiles_Boots[#$0150,$03] = $21;
dg_ChangeTiles_Boots[#$0151,$00] = $89A1;
dg_ChangeTiles_Boots[#$0151,$03] = $21;
dg_ChangeTiles_Boots[#$0152,$00] = $8A92;
dg_ChangeTiles_Boots[#$0152,$03] = $21;
dg_ChangeTiles_Boots[#$0153,$00] = $8A93;
dg_ChangeTiles_Boots[#$0153,$03] = $21;
dg_ChangeTiles_Boots[#$0154,$00] = $8A94;
dg_ChangeTiles_Boots[#$0154,$03] = $21;
dg_ChangeTiles_Boots[#$0155,$00] = $8A9F;
dg_ChangeTiles_Boots[#$0155,$03] = $21;
dg_ChangeTiles_Boots[#$0156,$00] = $8AA0;
dg_ChangeTiles_Boots[#$0156,$03] = $21;
dg_ChangeTiles_Boots[#$0157,$00] = $8B93;
dg_ChangeTiles_Boots[#$0157,$03] = $21;
dg_ChangeTiles_Boots[#$0158,$00] = $8B94;
dg_ChangeTiles_Boots[#$0158,$03] = $21;
dg_ChangeTiles_Boots[#$0159,$00] = $8B95;
dg_ChangeTiles_Boots[#$0159,$03] = $21;
dg_ChangeTiles_Boots[#$015A,$00] = $8C94;
dg_ChangeTiles_Boots[#$015A,$03] = $21;
dg_ChangeTiles_Boots[#$015B,$00] = $8D94;
dg_ChangeTiles_Boots[#$015B,$03] = $21;
dg_ChangeTiles_Boots[#$015C,$00] = $8E94;
dg_ChangeTiles_Boots[#$015C,$03] = $21;
dg_ChangeTiles_Boots[#$015D,$00] = $8E95;
dg_ChangeTiles_Boots[#$015D,$03] = $21;
dg_ChangeTiles_Boots[#$015E,$00] = $8F95;
dg_ChangeTiles_Boots[#$015E,$03] = $21;
dg_ChangeTiles_Boots[#$015F,$00] = $93A9;
dg_ChangeTiles_Boots[#$015F,$03] = $21;

dg_ChangeTiles_Boots[#$0160,$00] = $93AA;
dg_ChangeTiles_Boots[#$0160,$03] = $21;
dg_ChangeTiles_Boots[#$0161,$00] = $93AB;
dg_ChangeTiles_Boots[#$0161,$03] = $21;
dg_ChangeTiles_Boots[#$0162,$00] = $94AB;
dg_ChangeTiles_Boots[#$0162,$03] = $21;
dg_ChangeTiles_Boots[#$0163,$00] = $95A8;
dg_ChangeTiles_Boots[#$0163,$03] = $21;
dg_ChangeTiles_Boots[#$0164,$00] = $95AB;
dg_ChangeTiles_Boots[#$0164,$03] = $21;
dg_ChangeTiles_Boots[#$0165,$00] = $95AC;
dg_ChangeTiles_Boots[#$0165,$03] = $21;
dg_ChangeTiles_Boots[#$0166,$00] = $95AD;
dg_ChangeTiles_Boots[#$0166,$03] = $21;
dg_ChangeTiles_Boots[#$0167,$00] = $9652;
dg_ChangeTiles_Boots[#$0167,$03] = $21;
dg_ChangeTiles_Boots[#$0168,$00] = $96A7;
dg_ChangeTiles_Boots[#$0168,$03] = $21;
dg_ChangeTiles_Boots[#$0169,$00] = $96A8;
dg_ChangeTiles_Boots[#$0169,$03] = $21;
dg_ChangeTiles_Boots[#$016A,$00] = $96A9;
dg_ChangeTiles_Boots[#$016A,$03] = $21;
dg_ChangeTiles_Boots[#$016B,$00] = $96AA;
dg_ChangeTiles_Boots[#$016B,$03] = $21;
dg_ChangeTiles_Boots[#$016C,$00] = $96AC;
dg_ChangeTiles_Boots[#$016C,$03] = $21;
dg_ChangeTiles_Boots[#$016D,$00] = $9751;
dg_ChangeTiles_Boots[#$016D,$03] = $21;
dg_ChangeTiles_Boots[#$016E,$00] = $97A8;
dg_ChangeTiles_Boots[#$016E,$03] = $21;
dg_ChangeTiles_Boots[#$016F,$00] = $97AA;
dg_ChangeTiles_Boots[#$016F,$03] = $21;

dg_ChangeTiles_Boots[#$0170,$00] = $97AB;
dg_ChangeTiles_Boots[#$0170,$03] = $21;
dg_ChangeTiles_Boots[#$0171,$00] = $97AC;
dg_ChangeTiles_Boots[#$0171,$03] = $21;
dg_ChangeTiles_Boots[#$0172,$00] = $97AD;
dg_ChangeTiles_Boots[#$0172,$03] = $21;
dg_ChangeTiles_Boots[#$0173,$00] = $9851;
dg_ChangeTiles_Boots[#$0173,$03] = $21;
dg_ChangeTiles_Boots[#$0174,$00] = $98AB;
dg_ChangeTiles_Boots[#$0174,$03] = $21;
dg_ChangeTiles_Boots[#$0175,$00] = $9951;
dg_ChangeTiles_Boots[#$0175,$03] = $21;
dg_ChangeTiles_Boots[#$0176,$00] = $9A50;
dg_ChangeTiles_Boots[#$0176,$03] = $21;
dg_ChangeTiles_Boots[#$0177,$00] = $9A51;
dg_ChangeTiles_Boots[#$0177,$03] = $21;
dg_ChangeTiles_Boots[#$0178,$00] = $9B50;
dg_ChangeTiles_Boots[#$0178,$03] = $21;
dg_ChangeTiles_Boots[#$0179,$00] = $A34D;
dg_ChangeTiles_Boots[#$0179,$03] = $21;
dg_ChangeTiles_Boots[#$017A,$00] = $A34E;
dg_ChangeTiles_Boots[#$017A,$03] = $21;
dg_ChangeTiles_Boots[#$017B,$00] = $A34F;
dg_ChangeTiles_Boots[#$017B,$03] = $21;
dg_ChangeTiles_Boots[#$017C,$00] = $A449;
dg_ChangeTiles_Boots[#$017C,$03] = $21;
dg_ChangeTiles_Boots[#$017D,$00] = $A44A;
dg_ChangeTiles_Boots[#$017D,$03] = $21;
dg_ChangeTiles_Boots[#$017E,$00] = $A44C;
dg_ChangeTiles_Boots[#$017E,$03] = $21;
dg_ChangeTiles_Boots[#$017F,$00] = $A44D;
dg_ChangeTiles_Boots[#$017F,$03] = $21;

dg_ChangeTiles_Boots[#$0180,$00] = $A44E;
dg_ChangeTiles_Boots[#$0180,$03] = $21;
dg_ChangeTiles_Boots[#$0181,$00] = $A548;
dg_ChangeTiles_Boots[#$0181,$03] = $21;
dg_ChangeTiles_Boots[#$0182,$00] = $A549;
dg_ChangeTiles_Boots[#$0182,$03] = $21;
dg_ChangeTiles_Boots[#$0183,$00] = $A648;
dg_ChangeTiles_Boots[#$0183,$03] = $21;
dg_ChangeTiles_Boots[#$0184,$00] = $A748;
dg_ChangeTiles_Boots[#$0184,$03] = $21;
dg_ChangeTiles_Boots[#$0185,$00] = $A847;
dg_ChangeTiles_Boots[#$0185,$03] = $21;
dg_ChangeTiles_Boots[#$0186,$00] = $A887;
dg_ChangeTiles_Boots[#$0186,$03] = $21;
dg_ChangeTiles_Boots[#$0187,$00] = $A888;
dg_ChangeTiles_Boots[#$0187,$03] = $21;
dg_ChangeTiles_Boots[#$0188,$00] = $A889;
dg_ChangeTiles_Boots[#$0188,$03] = $21;
dg_ChangeTiles_Boots[#$0189,$00] = $A946;
dg_ChangeTiles_Boots[#$0189,$03] = $21;
dg_ChangeTiles_Boots[#$018A,$00] = $A983;
dg_ChangeTiles_Boots[#$018A,$03] = $21;
dg_ChangeTiles_Boots[#$018B,$00] = $A984;
dg_ChangeTiles_Boots[#$018B,$03] = $21;
dg_ChangeTiles_Boots[#$018C,$00] = $A985;
dg_ChangeTiles_Boots[#$018C,$03] = $21;
dg_ChangeTiles_Boots[#$018D,$00] = $A986;
dg_ChangeTiles_Boots[#$018D,$03] = $21;
dg_ChangeTiles_Boots[#$018E,$00] = $A987;
dg_ChangeTiles_Boots[#$018E,$03] = $21;
dg_ChangeTiles_Boots[#$018F,$00] = $AA45;
dg_ChangeTiles_Boots[#$018F,$03] = $21;

dg_ChangeTiles_Boots[#$0190,$00] = $AB44;
dg_ChangeTiles_Boots[#$0190,$03] = $21;
dg_ChangeTiles_Boots[#$0191,$00] = $AC43;
dg_ChangeTiles_Boots[#$0191,$03] = $21;
dg_ChangeTiles_Boots[#$0192,$00] = $AC44;
dg_ChangeTiles_Boots[#$0192,$03] = $21;
dg_ChangeTiles_Boots[#$0193,$00] = $AF43;
dg_ChangeTiles_Boots[#$0193,$03] = $21;
dg_ChangeTiles_Boots[#$0194,$00] = $B042;
dg_ChangeTiles_Boots[#$0194,$03] = $21;
dg_ChangeTiles_Boots[#$0195,$00] = $B043;
dg_ChangeTiles_Boots[#$0195,$03] = $21;
dg_ChangeTiles_Boots[#$0196,$00] = $B143;
dg_ChangeTiles_Boots[#$0196,$03] = $21;
dg_ChangeTiles_Boots[#$0197,$00] = $B244;
dg_ChangeTiles_Boots[#$0197,$03] = $21;
dg_ChangeTiles_Boots[#$0198,$00] = $B345;
dg_ChangeTiles_Boots[#$0198,$03] = $21;
dg_ChangeTiles_Boots[#$0199,$00] = $B446;
dg_ChangeTiles_Boots[#$0199,$03] = $21;
dg_ChangeTiles_Boots[#$019A,$00] = $B447;
dg_ChangeTiles_Boots[#$019A,$03] = $21;








_owrc=$8A8D; _owrc_=hex_str(_owrc);
dm[?_owrc_+STR_River_Devil+STR_State] = 1;
dm[?STR_OWRC+STR_River_Devil+'01'] = _owrc;
dm[?_owrc_+STR_River_Devil] = $01;
dm[?_owrc_+STR_TSRC+STR_Under+STR_River_Devil] = $04B3;

_owrc=$6057; _owrc_=hex_str(_owrc);
dm[?STR_Rando+STR_River_Devil+STR_OWRC] = _owrc;
dm[?STR_Rando+STR_River_Devil+STR_TSRC] = $05F8;
dm[?_owrc_+STR_TSRC+STR_Under+STR_River_Devil] = (TILESET1_TS_IDX<<8) | TSRC_PATH02;








dm[?STR_Rando+STR_Exit+STR_Count] = $03;

_owrc=$6155; _owrc_=hex_str(_owrc);
dm[?STR_Rando+STR_Exit+'01'+STR_OWRC] = _owrc;
dm[?_owrc_+STR_Rando+STR_Exit+STR_Num] = $01;

_owrc=$5F53; _owrc_=hex_str(_owrc);
dm[?STR_Rando+STR_Exit+'02'+STR_OWRC] = _owrc;
dm[?_owrc_+STR_Rando+STR_Exit+STR_Num] = $02;

_owrc=$6965; _owrc_=hex_str(_owrc);
dm[?STR_Rando+STR_Exit+'03'+STR_OWRC] = _owrc;
dm[?_owrc_+STR_Rando+STR_Exit+STR_Num] = $03;








ds_grid_copy(dg_solid,dg_solid_def);
ds_grid_copy(dg_tsrc,dg_tsrc_def);
ds_list_destroy(_dl1); _dl1=undefined;
ds_list_destroy(_dl_AreaNames); _dl_AreaNames=undefined;




