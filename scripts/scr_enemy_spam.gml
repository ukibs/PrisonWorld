//Prueba ya no tan guarra
player_amount = global.num_players;
terrain_to_use = global.hex[global.hex_to_use, 2];
enemy_force = global.hostility_to_use / 5;
force_deployed = 0;
enemy_strength = 0;
//Establecemos enemigos por zona (de momento 2 por zona)
    //Plains
zone_habitat[1, 0] = "Teeth Ball";
zone_habitat[1, 1] = "Skeleton";
    //Forest
zone_habitat[2, 0] = "Living Tree";
zone_habitat[2, 1] = "Ghost";    
    //Swamp
zone_habitat[3, 0] = "Living Tree";
zone_habitat[3, 1] = "Skeleton";     
    //Desert
zone_habitat[4, 0] = "Fire Spirit";
zone_habitat[4, 1] = "Teeth Ball";     
//Enemies in proportion to the players
    //For the moment we use directly the valor
while(force_deployed < enemy_force * player_amount){
    //Rango de spameo (posición)
    randomX = irandom_range(200, room_width - 200);
    randomY = irandom_range(100, room_height - 200);
    
    enemy_to_use = irandom(array_length_2d(zone_habitat, terrain_to_use) - 1);
    enemy = instance_create(randomX, randomY, obj_enemy);  
    //Choose skin for the enemy
    //For now with number
    switch(zone_habitat[terrain_to_use, enemy_to_use]){
        //Living tree
        case "Living Tree":
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
            enemy_strength = 4;
            //Behaviour
            enemy.combat_behaviour[0] = "Distance Attack";
            enemy.combat_behaviour[1] = "Aproach";
        break;
        //Skeleton
        case "Skeleton":
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
            enemy_strength = 1;
        break;
        //Fire Spirit
        case "Fire Spirit":
            //Sprites
            enemy.front_idle = spr_fireSpirit_front_idle;
            enemy.front_attack = spr_fireSpirit_front_attack;
            enemy.front_death = spr_fireSpirit_front_death;
            enemy.back_idle = spr_fireSpirit_back_idle;
            enemy.back_attack = spr_fireSpirit_back_attack;
            enemy.back_death = spr_fireSpirit_back_death;
            //Stats
            enemy.life = 6;
            enemy.defense = 2;
            enemy.attack = 10;
            enemy.movement_speed = 5;
            enemy_strength = 3;
        break;
        //Ghost
        case "Ghost":
            //Sprites
            enemy.front_idle = spr_ghost_front_idle;
            enemy.front_attack = spr_ghost_front_attack;
            enemy.front_death = spr_ghost_front_death;
            enemy.back_idle = spr_ghost_back_idle;
            enemy.back_attack = spr_ghost_back_attack;
            enemy.back_death = spr_ghost_back_death;
            //Stats
            enemy.life = 4;
            enemy.defense = 3;
            enemy.attack = 3;
            enemy.movement_speed = 3;
            enemy_strength = 1;
            //Beahciour
            enemy.combat_behaviour[0] = "Melee Attack";
            enemy.combat_behaviour[1] = "Move Away";
            enemy.combat_behaviour[2] = "Offensive Teleport";
        break;
        //Teeth ball
        case "Teeth Ball":
            //Sprites
            enemy.front_idle = spr_teethball_front_moving;
            enemy.front_attack = spr_teethball_front_charguing;
            enemy.front_death = spr_teethball_front_death;
            enemy.back_idle = spr_teethball_back_moving;
            enemy.back_attack = spr_teethball_back_charguing;
            enemy.back_death = spr_teethball_back_death;
            //Stats
            enemy.life = 6;
            enemy.defense = 1;
            enemy.attack = 5;
            enemy.movement_speed = 6;
            enemy_strength = 2;
            //Behaviour
            enemy.combat_behaviour[0] = "Calm Down";
            enemy.combat_behaviour[1] = "Charge";
            enemy.combat_behaviour[2] = "Move Around";
            enemy.combat_behaviour[3] = "Aproach";
        break;
    }
    //Common parameters
    enemy.initial_life = enemy.life;
    enemy.sprite_index = enemy.front_idle;
    //enemy.type = enemy_type;
    force_deployed += enemy_strength;
}
