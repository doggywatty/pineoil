image_angle += rotfuck;
jelq_vsp += 0.5;
if (place_meeting(x + jelq_hsp, y, obj_solid))
	instance_destroy();
if (place_meeting(x, y + jelq_vsp, obj_solid))
	instance_destroy();
x += jelq_hsp;
y += jelq_vsp;