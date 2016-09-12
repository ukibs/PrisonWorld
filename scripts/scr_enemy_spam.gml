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
        //Try with script
        script_execute(scr_pnj_assignment, 
            zone_habitat[terrain_to_use, enemy_to_use], enemy);
    force_deployed += enemy_strength;
}
