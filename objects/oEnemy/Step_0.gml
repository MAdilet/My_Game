vsp += grv; //Гровитация

#region //Не уходит за край
if(grounded) && (!place_meeting(x+hsp, y+1, oWall))
{
	hsp = -hsp;
}
#endregion
#region //Вертикальная коллизия

//Не прикапываться к блокам снизу(Wall)
if (place_meeting(x, y + vsp, oWall)) {
	while(!place_meeting(x, y + sign(vsp), oWall)) {
		y += sign(vsp);
	}

	vsp = 0;//не изменять вертикальную позицию без причины

}
//Постоянное подение вниз
y += vsp;//типо гравитация
#endregion
#region //Гаризонтальная коллизия
//Не проходить сквозь блоки слево и право(oWall)
if (place_meeting(x + hsp, y, oWall)) {
	while(!place_meeting(x + sign(hsp), y, oWall)) {
		x += sign(hsp);
	}

	hsp = -hsp;//разварот в другую сторону

}
//Передвижение на лево и на право
x += hsp;
#endregion
#region //Анимаций
if (!place_meeting(x, y + 1, oWall)) {
	grounded = false;
	sprite_index = sEnemyJump;//принажатии прыжке анимация меняется на прыжок
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else {
	grounded = true;
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = sEnemy; //Стойка(спрайт Enemy)
	}
	else {
		sprite_index = sEnemyRun; //Бег/Ходьба
	}
}
/*
//Transporter
if (hsp != 0) image_xscale = sign(hsp) * size;//Что бы поворачивалась туда куда идёт(или туда куда шёл в последний раз)
image_yscale = size;*/
#endregion

//Если скорость передвижения не ровна 0 то персонаж меняет напровление спрайта туда куда он идёт
if (hsp != 0) image_xscale = sign(hsp);