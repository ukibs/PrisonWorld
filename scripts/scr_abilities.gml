//Get the name of the ability
switch(argument0){
    //Primera del guerrero
    case "Slash":
        total_lock = true;
        attack_instance = instance_create(x, y, obj_basic_attack);
        attack_instance.direction = looking_direction;
        attack_instance.image_angle = attack_instance.direction;
        attack_instance.damage = global.player[player_num, 4];
        //Duration of the ability
        alarm_set(argument1, 3);
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 10]);
    break;
    //Segunda del guerrero
    case "Shield":
        if(key_action_2_maintained){
            bonus_defense = 5;
            turning_lock = true;
            icon_to_use = spr_shield;
            action = 1;
            last_skill = 2;
        }
        if(key_action_2_released){
            bonus_defense = 0;
            turning_lock = false;
            last_skill = 0;
        }
    break;
    //Tercera del guerrero
    case "Dash":
        total_lock = true;
        last_attack_done = random(100);
        //Stablish dashing direction
        dashingH = 0;
        dashingV = 0;
        switch(looking_direction){
            case 0: dashingH = 1; break;
            case 90: dashingV = -1; break;
            case 180: dashingH = -1; break;
            case 270: dashingV = 1; break;
        }
        vspeed += dashingV * movement_speed * 3;
        hspeed += dashingH * movement_speed * 3;
        pushing = true;
        //Duration of the ability
        alarm_set(argument1, 20);
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 20]);
    break;
    //Primera de la exploradora
    case "Shoot":
        //Si tiene un enemigo fichado...
        if(instance_exists(obj_mark)){
            direction = point_direction(x, y, obj_mark.x, obj_mark.y);
            looking_direction = round(direction / 90) * 90 + 45;
        }        
        //Mas adelante haremos que atrape la tecla por parámetro
        if(key_action_1_pressed){
            movement_lock = true;
            shoot_force = 2;
            icon_to_use = spr_arrow;
            charge_required = 8;
            charge_amount = 0.1;
            last_skill = 1;
        }
        if(key_action_1_maintained){
            shoot_force += charge_amount;
            charge_done += charge_amount;
            action = 1;
        }
        if(key_action_1_released){ 
            movement_lock = false;   
            shoot_force = min(8, shoot_force);
            shoot_force = round(shoot_force);
            proyectile = instance_create(x, y, obj_arrow);
            if(!instance_exists(obj_mark))
                proyectile.direction = looking_direction;
            else
                proyectile.direction = direction;
            proyectile.image_angle = proyectile.direction;
            proyectile.speed = 25;
            proyectile.damage = shoot_force;
            //Duration of the ability
            //alarm_set(argument1, 6);
            //Cooldown of the ability
            alarm_set(argument2, global.player[player_num, 10]);
            //Para el icona de carga
            action = 0;
            charge_done = 0;
            last_skill = 0;
        }
    break;
    //Segunda de la exploradora
    case "Trap":
        trap = instance_create(x, y, obj_trap);
            //Lo revisaremos
        trap.damage = global.player[player_num, 4];
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 15]);
    break;
    //Tercera de la exploradora
    case "Mark":
        //Destroy the previous if it exist
        if(instance_exists(obj_mark)){
            with(obj_mark) 
                instance_destroy();
        }
        //And create the new one
        objective = instance_nearest(x, y, obj_enemy);
        mark = instance_create(objective.x, objective.y, obj_mark);
        mark.objective = objective;
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 20]);
    break;
    //Primera del monje
    case "Punch":
        //De momento la ahcemos igual que la del guerrero
        status_locked = true;
        attack_instance = instance_create(x, y, obj_basic_attack);
        attack_instance.direction = looking_direction;
        attack_instance.image_angle = attack_instance.direction;
        attack_instance.damage = global.player[player_num, 4];
        //Duration of the ability
        alarm_set(argument1, 3);
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 10]);
    break;
    //Segunda del monje
    case "Heal":
        for(i = 0; i < instance_number(obj_player); i++){
            //Cura a los compis cercanos
            objective = instance_find(obj_player, i);
            if(distance_to_object(objective) < 200){
                global.player[i, 3] += round(global.player[i, 2] / 2);
                global.player[i, 3] = min(global.player[i, 3], global.player[i, 2]);
            }
            //Y a ti, no te coje con lo de arriba
            global.player[player_num, 3] += round(global.player[player_num, 2] / 2);
            global.player[player_num, 3] = min(global.player[player_num, 3], global.player[i, 2]);
        }
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 15]);
    break;
    //Tercera del monje
    case "Flash":
        for(i = 0; i < instance_number(obj_enemy); i++){
            objective = instance_find(obj_enemy, i);
            if(distance_to_object(objective) < 200){
                objective.status_locked = true;
                objective.alarm[0] = 90;
            }
        }
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 20]);
    break;
    //Primera de la hechicera
    case "Soul Blast":
        //Mas adelante haremos que atrape la tecla por parámetro
        if(key_action_1_pressed){
            turning_lock = true;
            shoot_force = 3;
            icon_to_use = spr_arrow;    //Luego lo cambiamos
            charge_required = 10;
            charge_amount = 0.1;
            last_skill = 1;
        }
        if(key_action_1_maintained){
            shoot_force += charge_amount;
            charge_done += charge_amount;
            action = 1;
        }
        if(key_action_1_released){ 
            turning_lock = false;   
            shoot_force = min(10, shoot_force);
            shoot_force = round(shoot_force);
            proyectile = instance_create(x, y, obj_magic_missile);
            if(!instance_exists(obj_mark))
                proyectile.direction = looking_direction;
            else
                proyectile.direction = direction;
            proyectile.image_angle = proyectile.direction;
            proyectile.speed = 25;  //Igual la cambiamos
            proyectile.damage = shoot_force;
            //Cooldown of the ability
            alarm_set(argument2, global.player[player_num, 10]);
            //Para el icona de carga
            action = 0;
            charge_done = 0;
            last_skill = 0;
        }
    break;
    //Segunda de la hechicera
    case "Spectral Ray":
        if(key_action_2_pressed){
            movement_lock = true;
            ray = instance_create(x, y, obj_ray);
            ray.direction = looking_direction;
            ray.image_angle = ray.direction;
            ray.damage = 4;
            last_skill = 2;
        }
        if(key_action_2_maintained){
            ray.direction = looking_direction;
            ray.image_angle = ray.direction;
        }
        if(key_action_2_released){
            with(ray) instance_destroy();
            movement_lock = false;
            last_skill = 0;
        }
    break;
    //Tercera de la hechicera
    case "Lil Ghost":
        //Destroy it if previously created
        if(!instance_exists(obj_minion))
            with(obj_minion) instance_destroy();
        //And create a new one
        ghost = instance_create(x, y, obj_minion);
        ghost.master = self;
            //Lo revisaremos
        ghost.damage = 5;
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 15]);
    break;
}
