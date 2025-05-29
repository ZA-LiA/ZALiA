/// PaletteEditor_initiate_bgr_edit_mode()


BgrColor_before_edit = global.BackgroundColor_scene;

var _IDX = ds_list_find_index(ColorGrid_dl_colors, BgrColor_before_edit);
if (_IDX!=-1)
{
    ColorGrid_Cursor_clm = _IDX mod ColorGrid_CLMS;
    ColorGrid_Cursor_row = _IDX div ColorGrid_CLMS;
}

gui_state_at_sess_start = g.gui_state;
g.gui_state = g.gui_state_EDIT_PAL;

timer = DELAY1_DUR; // Delay any input reaction in next state.
state = state_BGR_COLOR;




