/// @desc Появление подсказки (нажать E)

if ((!instance_exists(oText)))
{
	with(instance_create_layer(oTable.x+64, oTable.y-64, layer, oText))
	{
		length = 1;
	}
}

if (keyboard_check_pressed(ord("E"))) {
	instance_create_layer(other.x-3, other.y-28, "Instances", oTableEffect);
	instance_destroy(oTable);
	
}