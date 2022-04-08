var halfw = w * 0.5;

//Draw box for text
draw_set_color(c_gray);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border, y-h-(border * 2), x+halfw+border, y, 15, 15, false);

//Отрисовывать текст
draw_set_alpha(1);
draw_set_colour(c_white);
//draw_set_font(fontMainMenu);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x, y - 9 - h - border, text);