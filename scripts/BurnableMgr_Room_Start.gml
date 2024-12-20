/// BurnableMgr_Room_Start()


if (!variable_instance_exists(self, "dg_Burnable")) exit;
ds_grid_resize(dg_Burnable,0,ds_grid_height(dg_Burnable));
ds_grid_clear (dg_Burnable,0);

can_draw = false;




