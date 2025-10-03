/// PaletteEditor_initiate_pal_edit_mode()


gui_state_at_sess_start = g.gui_state;
g.gui_state = g.gui_state_EDIT_PAL;
pal_before_edit_sess = p.pal_rm_curr;
pal_during_edit = pal_before_edit_sess;

PalEdit_ViewColorInfo_enabled = false;

timer = DELAY1_DUR; // Delay any input reaction in next state.
state = state_EDIT1A;




