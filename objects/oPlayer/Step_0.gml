//Передвижение
keySit = keyboard_check(ord("C"));
keyRun = keyboard_check(vk_shift);
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));//ord("Буква") сробатывается при ножатии той или иной буквы

keyJump = keyboard_check(vk_space);//vk_кнопка Нажатие по кнопкам каторые не являются буквами

//Определение в какую сторону идти(смотря что ты нажал)
move = keyRight - keyLeft;
hsp = move * walksp;
vsp += grv; //Гравитация


#region//Коллизия
if (place_meeting(x, y + vsp, oWall)) {	//Проверка наличии объекта(Wall) снизу
	while(!place_meeting(x, y + sign(vsp), oWall)) {//Постоянная проверка нету ли объект(Wall) по вертикале
		y += sign(vsp);                             //Доводить персонажа к объекту в притык
	}

	vsp = 0;

}
y += vsp;

if (place_meeting(x + hsp, y, oWall)) //Если ты косаешся объекта(Wall) по горизонтале
{
	while(!place_meeting(x + sign(hsp), y, oWall)) {
		x += sign(hsp);
	}

	hsp = 0;

}
x += hsp;

//прыжок
if ((keyJump) && (place_meeting(x, y + 1, oWall))) //Если прыжок нажат и под ногами объект
	{
		vsp -= 7;//на сколько сильно отталкивается вверх при ножатии прыжка
	}
	

#endregion

if (!place_meeting(x, y + 1, oWall)) {
	sprite_index = sPlayerJump;
	image_speed = 0;
	mask_index = sPlayer;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else {
	if (keySit) {
		sprite_index = sPlayerSit;
		mask_index = sPlayerSit;
		walksp = 2;
	}
	else {
		
		walksp = 4;
		mask_index = sPlayer;

		if(hsp == 0) {
			sprite_index = sPlayer;
		}
		else
		{
			sprite_index = sPlayerRun;
			mask_index = sPlayer;
			image_speed = 15;
	
		}

	}
	
}

//Если скорость передвижения не ровна 0 то персонаж меняет напровление спрайта туда куда он идёт
if (hsp != 0) image_xscale = sign(hsp);


#region//Спринт
if (keyRun && hsp != 0)
	{
	image_speed = 13;
	walksp = 6;
	}
	else
	{
		walksp = 4;
		image_speed = 9;
	}
#endregion

#region//Col with Boss
if (collision_circle(x, y, 100, oBoss, false, true)){
	AllowKillBoss();
}

#endregion
