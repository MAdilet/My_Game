//Куда должна попасть камера
if (instance_exists(follow)) //проверка Есть ли обект follow(objPlayer)
{
	xTo =follow.x;//           То камера следует за ним
	yTo = follow.y;//по иксу и игрику
}

//Реальная позиция объекта
x += (xTo - x) / 25;//Делим что бы плавность была
y += (yTo - y) / 25;

x = clamp(x,view_w_half + limitation, room_width - view_w_half - limitation);//Что бы камера не выходила за рамки стен комнаты
y = clamp(y,view_h_half + limitation, room_height - view_h_half - limitation);                                  //и потолка


//Позиция камеры
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);//Что бы follow был не справо снизу а по центру
