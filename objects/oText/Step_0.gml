//draw_set_font(fontMainMenu);

//Уничтожаем текст после ухода
if (!place_meeting(oPlayer.x, oPlayer.y, oTable)) {
	instance_destroy();//Уничтожаем обьект "Текст"
}