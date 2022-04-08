// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AllowKillBoss(){
	
	if ((!instance_exists(oText)))
	{
		with(instance_create_layer(oBoss.x, oBoss.y-64, layer, oText))
		{
			length = 1;
		}
	}

	if (keyboard_check_pressed(ord("E"))) {
		oPotion.direction = point_direction(oPotion.x, oPotion.y, oBoss.x, oBoss.y)
		oPotion.speed = 5;
	}
}