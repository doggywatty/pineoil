function player_come()
{
	state = states.comefinished;
	image_index = 1;
	sprite_index = spr_player_come;
	scr_sound_multiple(sfx_comeshot);
	repeat (irandom_range(6, 12))
	{
		var dir = sign(xscale);
		var jeql = instance_create(x + (dir * 16), y + 22, obj_jelq);
		jeql.jelq_vsp = -4 + random_range(-2, 2);
		jeql.jelq_hsp = (10 * dir) + random_range(-2, 6);
	}
}

function player_comefinished()
{
	if anim_ended()
		state = states.normal;
}