//Yeah, enemy behaviour (combat)
    done = false;
    //Get the nearest player
    if(instance_exists(obj_player)){
        objective = instance_nearest(x, y, obj_player);
    }
    //And check
    for(i = 0; i < array_length_1d(quiet_behaviour); i++){
        switch(quiet_behaviour[i]){
            //Become agressive
            case "Become Aggressive":
                if(distance_to_object(objective) < 250 || general_alert == true){
                    alerted = true;
                    //Aaand done
                    done = true;
                }
            break;
            //Wild alarm if the beast is hurt
            case "Wild Alarm":
                //Pequeño arreglo para prevenir fallos
                if(life < initial_life && instance_exists(obj_enemy)){
                    obj_enemy.general_alert = true;
                }
            break;
            //Dar la alarma
                //Hay que ver como coño se traduce
            case "Give Alarm":
                if(distance_to_object(objective) < 250){
                    obj_enemy.general_alarm = true;
                }
            break;
            //Dar vueltas tranquilamente
            case "Walk Around":
                //Check the alarm to decide what to do
                if(alarm_get(2) == -1){
                    //Decide an action (0 - Stay, 1 - Walk)
                    action = irandom(1);
                    if(action == 1){
                        //Decide a direction
                        direction_to_move = irandom(3);
                        direction = direction_to_move * 90;
                        
                    }
                    //And put the alarm
                    alarm_set(2, irandom_range(10, 60));
                }
                else{   //If not execute the action
                    //Go walking
                    if(action == 1){
                        //De momento hacemos que vaya mas despacio de esta forma
                            //Pero sería bueno ajustar el sprite en velcoidad
                        switch(direction_to_move){
                            //Right
                            case 0: x += movement_speed/2; break;
                            //Up
                            case 1: y -= movement_speed/2; break;
                            //Left
                            case 2: x -= movement_speed/2; break;
                            //Down
                            default: y += movement_speed/2; break;
                        }
                    }
                    else{   //Or stay in the place
                        image_index = 0;
                    }
                }
            break;
        }
        //Save the last action for tests
        last_action = quiet_behaviour[i];
        //If the attitude has been selected...
        if(done == true)
            break;
    }
