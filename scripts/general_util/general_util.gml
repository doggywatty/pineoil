function audio_sound_get_asset(_index)
{
	var _name = audio_get_name(_index);
	return asset_get_index(_name);
}