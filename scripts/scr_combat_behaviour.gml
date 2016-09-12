    //Yeah, enemy behaviour (combat)
    done = false;
    //Point to the objective
    if(objective != noone){
        direction = point_direction(x, y, objective.x, objective.y);
    }
    for(i = 0; i < array_length_1d(combat_behaviour); i++){
        switch(combat_behaviour[i]){
            //Basic melee attack
            case "Melee Attack":
                //If the attack hasn´t started
                if(distance_to_object(objective) < 30 &&
                    sprite_index != back_attack && sprite_index != front_attack){
                    if(direction <= 180){
                        sprite_index = back_attack;
                    }
                    else{
                        sprite_index = front_attack;
                    }
                    image_index = 0;
                    //Here we decide between ally or enemy attack
                        //De momento un poco guarrete
                    if(type == "Enemy")
                        attack_to_use = obj_melee_attack;
                    else if(type == "Ally")
                        attack_to_use = obj_basic_attack;
                    done = true;
                }
                if(sprite_index == back_attack || sprite_index == front_attack)
                    done = true;
            break;
            //Basic distance attack
            case "Distance Attack":
                //If the attack hasn´t started
                if(distance_to_object(objective) < 300 &&
                    sprite_index != back_attack && sprite_index != front_attack){
                    if(direction <= 180){
                        sprite_index = back_attack;
                    }
                    else{
                        sprite_index = front_attack;
                    }
                    image_index = 0;
                    //Here we decide between ally or enemy attack
                        //De momento un poco guarrete
                    if(type == "Enemy")
                        //De momento se autoasigna la velocidad
                        attack_to_use = obj_enemy_proyectile;
                    else if(type == "Ally"){
                        attack_to_use = obj_arrow;
                        //attack_to_use.speed = 25;
                    }
                    
                    done = true;
                }
                if(sprite_index == back_attack || sprite_index == front_attack)
                    done = true;
            break;
            //Aproach to the player
                //This should be the last one in all the enemies
            case "Aproach":
                //Get the distance in both axis
                distanceX = abs(objective.x - x);
                distanceY = abs(objective.y - y);
                //If it´s farer in x
                if(distanceX > distanceY)
                    x += sign(objective.x - x) * movement_speed;
                else    //If not
                    y += sign(objective.y - y) * movement_speed;
                //Sprite using the direction parameter
                if(direction <= 180)
                    sprite_index = back_idle;
                else
                    sprite_index = front_idle;
                //Aaaand done
                done = true;
            break;
            //Move away from the players, basically the opposite to the upper one
            case "Move Away":
                if(distance_to_object(objective) < 300){
                    //Point it on the opposite direction
                    direction = direction + 180;
                    if(direction > 360) direction -= 360;
                    //Get distance in both planes
                    distanceX = abs(objective.x - x);
                    distanceY = abs(objective.y - y);
                    //If it´s farer in x
                    if(distanceX > distanceY)
                        x -= sign(objective.x - x) * movement_speed;
                    else    //If not
                        y -= sign(objective.y - y) * movement_speed;
                    //Sprite using the direction parameter
                    if(direction <= 180)
                        sprite_index = back_idle;
                    else
                        sprite_index = front_idle;
                    //Aaaand done
                    done = true;
                }
            break;
            //Offensive teleport
            case "Offensive Teleport":
                //A little of randomness
                x = random_range(objective.x - 20, objective.x + 20);
                y = random_range(objective.y - 20, objective.y + 20);
                //Aaaand done
                done = true;
            break;
            //Move around
            case "Move Around":
                if(distance_to_object(objective) < 200){
                    //Point it looking to one side
                    direction += 90;
                    if(direction > 360) direction -= 360;
                    //
                    direction_to_move = round((direction - 45) / 90);
                    switch(direction_to_move){
                        //Right
                        case 0: x += movement_speed; break;
                        //Up
                        case 1: y -= movement_speed; break;
                        //Left
                        case 2: x -= movement_speed; break;
                        //Down
                        default: y += movement_speed; break;
                    }
                    //Sprite using the direction parameter
                    if(direction <= 180)
                        sprite_index = back_idle;
                    else
                        sprite_index = front_idle;
                    //Aaaand done
                    done = true;
                }
            break;
            //Charge
            case "Charge":
                //Get distance in both planes
                distanceX = abs(objective.x - x);
                distanceY = abs(objective.y - y);
                //If the charge was in progress
                if(charge == true){
                    //Continue the charge
                    switch(charge_direction){
                        //Right
                        case 0: x += movement_speed * 2; break;
                        //Up
                        case 1: y -= movement_speed * 2; break;
                        //Left
                        case 2: x -= movement_speed * 2; break;
                        //Down
                        default: y += movement_speed * 2; break;
                    }
                    //Aaaand done
                    done = true;
                }
                //Determine if start the charge
                else if((distanceX < 20 || distanceY < 20) && 
                            distance_to_object(objective) < 200){
                //if((distanceX < 20 || distanceY < 20) && charge == false){
                    charge = true;
                    charge_direction = round((direction) / 90);
                    switch(charge_direction){
                        //Right
                        case 0: x += movement_speed; break;
                        //Up
                        case 1: y -= movement_speed; break;
                        //Left
                        case 2: x -= movement_speed; break;
                        //Down
                        default: y += movement_speed; break;
                    }
                    //Asign it an attack id
                    last_attack_done = random(100);
                    //Sprite using the direction parameter
                    if(direction <= 180)
                        sprite_index = back_attack;
                    else
                        sprite_index = front_attack;
                    //Put the animation on the begining
                    image_index = 0;
                    //Aaaand done
                    done = true;
                }
            break;
            //Return to a quiet behaviour
            case "Calm Down":
                if(distance_to_object(objective) > 250 && general_alert == false){
                    alerted = false;
                    done = true;
                }
            break;
        }
        //Save the last action for tests
        last_action = combat_behaviour[i];
        //If the attitude has been selected...
        if(done == true)
            break;
    }
