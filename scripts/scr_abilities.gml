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
        status_locked = true;
        proyectile = instance_create(x, y, obj_arrow);
        proyectile.direction = looking_direction;
        proyectile.image_angle = proyectile.direction;
        proyectile.speed = 25;
        proyectile.damage = global.player[player_num, 4];
        //Duration of the ability
        alarm_set(argument1, 6);
        //Cooldown of the ability
        alarm_set(argument2, global.player[player_num, 10]);
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
    
    break;
}
