//Get the name of the ability
switch(argument0){
    //Primera del guerrero
    case "Slash":
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
    //Segunda del guerrero
    case "Shield":
        
    break;
    //Tercera del guerrero
    case "Dash":
        status_locked = true;
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
        //
        if(instance_exists(obj_mark)){
            direction = point_direction(x, y, obj_mark.x, obj_mark.y);
            looking_direction = round(direction / 90) * 90 + 45;
        }
        //Mas adelante haremos que atrape la tecla por parámetro
        if(key_action_1_pressed){
            shoot_force = 2;
        }
        if(key_action_1_maintained){
            shoot_force += 0.1;
        }
        if(key_action_1_released){            
            status_locked = true;
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
            alarm_set(argument1, 6);
            //Cooldown of the ability
            alarm_set(argument2, global.player[player_num, 10]);
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
        objective = instance_nearest(x, y, obj_enemy1);
        mark = instance_create(objective.x, objective.y, obj_mark);
        mark.objective = objective;
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 20]);
    break;
}
