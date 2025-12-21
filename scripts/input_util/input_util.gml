/*

	Quick usage tutorial:
	
	in the create event, construct the Input object like this:
	key_up = new Input(global.keybinds.up);
	
	if you want it to update with global.keybinds, run:
	key_up.update(global.keybinds.up);
	
	the array can store multiple input keys, controller support is not implemented as of now.
	
*/

enum INPUT_TYPE
{
	KEYBOARD,
	CONTROLLER,
	MOUSE
}

/// @summary Initializes an input key.
function Input(_keyname_array, _input_type = INPUT_TYPE.KEYBOARD, _device = 0) constructor
{
	device = _device; // the gamepad to check.
	type = _input_type;
    input = []; // will contain all of the raw ASCII values.
	
	check = false;
	pressed = false;
	released = false;
	
	// function is called in step so keybinds get refreshed.
	static update = function(_keyname_array)
	{
		var _inputarr = [];
		// process _keyname_array into ASCII values.
		
		if !is_array(_keyname_array) //if not an array, make it a single one
			_keyname_array = [_keyname_array];
		
		for (var i = 0; i < array_length(_keyname_array); i++)
		{
		    var _keyname = _keyname_array[i];
		    // see if its a number value or not.
		    if (is_real(_keyname))
		        array_push(_inputarr, _keyname);
		    else if (is_string(_keyname))
		        array_push(_inputarr, ord(_keyname));
		}
		if (!array_equals(input, _inputarr))
			input = _inputarr;
			
		// since this uses an update method, we can actually just private all of the check methods and run them here.
		
		check = __check();
		pressed = __pressed();
		released = __released();
	}
    
	update(_keyname_array);
	
    // check methods
    static __check = function()
    {
		switch (type)
		{
			case INPUT_TYPE.KEYBOARD:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
					if input[i] == vk_nokey //making sure a blank key is invalid
						continue;
		            if (keyboard_check(input[i]))
		                return true;
		        }
		        return false;
			}
			case INPUT_TYPE.CONTROLLER:
			{
				// TODO: handle controller input
			}
			case INPUT_TYPE.MOUSE:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (mouse_check_button(input[i]))
		                return true;
		        }
		        return false;
			}
		}

    }
    
    static __pressed = function()
    {
		switch (type)
		{
			case INPUT_TYPE.KEYBOARD:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
					if input[i] == vk_nokey
						continue;
		            if (keyboard_check_pressed(input[i]))
		                return true;
		        }
		        return false;
			}
			case INPUT_TYPE.CONTROLLER:
			{
				// TODO: handle controller input
			}
			case INPUT_TYPE.MOUSE:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (mouse_check_button_pressed(input[i]))
		                return true;
		        }
		        return false;
			}
		}
    }
    
    static __released = function()
    { 
		switch (type)
		{
			case INPUT_TYPE.KEYBOARD:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
					if input[i] == vk_nokey
						continue;
		            if (keyboard_check_released(input[i]))
		                return true;
		        }
		        return false;
			}
			case INPUT_TYPE.CONTROLLER:
			{
				// TODO: handle controller input
			}
			case INPUT_TYPE.MOUSE:
			{
				for (var i = 0; i < array_length(input); i++)
		        {
		            if (mouse_check_button_released(input[i]))
		                return true;
		        }
		        return false;
			}
		}
    }
}
