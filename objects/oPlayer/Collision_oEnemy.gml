if (hp >= 25 && damageDelay == 0) {
	hp -= 25;
	damageDelay = 90;
	recoil = 10;
	flash = 8;
}

if (hp <= 0) room_restart();

