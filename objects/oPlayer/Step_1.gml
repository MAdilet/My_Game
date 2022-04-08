damageDelay = max(0, damageDelay - 1);
recoil = max(0, recoil - 1);
	
x = x - lengthdir_x(recoil, point_direction(x, y, other.x, other.y));
y = y - lengthdir_y(recoil, point_direction(x, y, other.x, other.y));