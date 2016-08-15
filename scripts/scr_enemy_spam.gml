//Prueba guarra
enemy_force = global.hostility_to_use / 10;
force_deployed = 0;
enemy_strength = 0;
while(force_deployed < enemy_force){
    randomX = irandom_range(200, room_width - 200);
    randomY = irandom_range(100, room_height - 200);
    enemy_type = irandom_range(1, 2);
    enemy = instance_create(randomX, randomY, obj_enemy1);
    //Choose skin for the enemy
    //For now with number
    switch(enemy_type){
        //Living tree
        case 1:
            //Sprites
            enemy.front_idle = spr_livingTree_front_idle;
            enemy.front_attack = spr_livingTree_front_attack;
            enemy.front_death = spr_livingTree_front_death;
            enemy.back_idle = spr_livingTree_back_idle;
            enemy.back_attack = spr_livingTree_back_attack;
            enemy.back_death = spr_livingTree_back_death;
            //Stats
            enemy.life = 20;
            enemy.defense = 2;
            enemy.attack = 6;
            enemy.movement_speed = 1;
            enemy.movement_speed = 1;
            enemy_strength = 4;
        break;
        //Skeleton
        case 2:
            //Stats
            enemy.front_idle = spr_skeleton_front_idle;
            enemy.front_attack = spr_skeleton_front_attack;
            enemy.front_death = spr_skeleton_front_death;
            enemy.back_idle = spr_skeleton_back_idle;
            enemy.back_attack = spr_skeleton_back_attack;
            enemy.back_death = spr_skeleton_back_death;
            //Stats
            enemy.life = 8;
            enemy.defense = 1;
            enemy.attack = 3;
            enemy.movement_speed = 3;
            enemy.movement_speed = 3;
            enemy_strength = 1;
        break;
    }
    //enemy.type = enemy_type;
    force_deployed += enemy_strength;
}