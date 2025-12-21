if (sprite_index == spr_pizzaportalend && !obj_fade.fade)
{
	image_speed = 0
	image_index = image_number - 1
	do_fade(t_room, "LAP", fade_types.generic)
	ds_list_add(global.ds_saveroom, id)
	ds_list_clear(global.ds_escapesaveroom)
	obj_music.lap_count = (obj_music.lap_count == undefined) ? 2 : obj_music.lap_count + 1;
	obj_music.lap2 = (obj_music.lap_count == 2);
	obj_music.lap3 = (obj_music.lap_count == 3);
}
