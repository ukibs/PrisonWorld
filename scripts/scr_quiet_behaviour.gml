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
                if(life < initial_life){
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
        }
        //Save the last action for tests
        last_action = quiet_behaviour[i];
        //If the attitude has been selected...
        if(done == true)
            break;
    }
