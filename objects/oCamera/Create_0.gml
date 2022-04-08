cam =view_camera[0];//Просто переменная

follow = oPlayer;//За кем следить

view_w_half = camera_get_view_width(cam) * 0.5;//Тоже обычные переменные
view_h_half = camera_get_view_height(cam) * 0.5;//Можно /2
xTo = xstart;//Переменные
yTo = ystart;//Для удобства

//Огроничение

limitation = 4;
