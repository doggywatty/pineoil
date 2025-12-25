if (sprite_index == spr_pizzaportalend && !obj_fade.fade)
{
	image_speed = 0
	image_index = image_number - 1
	do_fade(t_room, "LAP", fade_types.generic)
	ds_list_add(global.ds_saveroom, id)
	ds_list_clear(global.ds_escapesaveroom)
    if (!global.level_data.lap2)
    {
        obj_music.lap2 = true
        global.level_data.lap2 = true
    }
    else if (!global.level_data.lap3)
    {
        obj_music.lap3 = true
        global.level_data.lap3 = true
    }
}