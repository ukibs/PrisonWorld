//Argument 0: PNJ name
//Argument 1: PNJ instance

switch(argument0){
    //Living tree
    case "Living Tree":
        //Sprites
        argument1.front_idle = spr_livingTree_front_idle;
        argument1.front_attack = spr_livingTree_front_attack;
        argument1.front_death = spr_livingTree_front_death;
        argument1.back_idle = spr_livingTree_back_idle;
        argument1.back_attack = spr_livingTree_back_attack;
        argument1.back_death = spr_livingTree_back_death;
        //Stats
        argument1.life = 20;
        argument1.defense = 2;
        argument1.attack = 6;
        argument1.movement_speed = 1;
        enemy_strength = 4;
        //Behaviour
        argument1.combat_behaviour[0] = "Distance Attack";
        argument1.combat_behaviour[1] = "Aproach";
    break;
    //Skeleton
    case "Skeleton":
        //Stats
        argument1.front_idle = spr_skeleton_front_idle;
        argument1.front_attack = spr_skeleton_front_attack;
        argument1.front_death = spr_skeleton_front_death;
        argument1.back_idle = spr_skeleton_back_idle;
        argument1.back_attack = spr_skeleton_back_attack;
        argument1.back_death = spr_skeleton_back_death;
        //Stats
        argument1.life = 8;
        argument1.defense = 1;
        argument1.attack = 3;
        argument1.movement_speed = 3;
        enemy_strength = 1;
    break;
    //Fire Spirit
    case "Fire Spirit":
        //Sprites
        argument1.front_idle = spr_fireSpirit_front_idle;
        argument1.front_attack = spr_fireSpirit_front_attack;
        argument1.front_death = spr_fireSpirit_front_death;
        argument1.back_idle = spr_fireSpirit_back_idle;
        argument1.back_attack = spr_fireSpirit_back_attack;
        argument1.back_death = spr_fireSpirit_back_death;
        //Stats
        argument1.life = 6;
        argument1.defense = 2;
        argument1.attack = 10;
        argument1.movement_speed = 5;
        enemy_strength = 3;
    break;
    //Ghost
    case "Ghost":
        //Sprites
        argument1.front_idle = spr_ghost_front_idle;
        argument1.front_attack = spr_ghost_front_attack;
        argument1.front_death = spr_ghost_front_death;
        argument1.back_idle = spr_ghost_back_idle;
        argument1.back_attack = spr_ghost_back_attack;
        argument1.back_death = spr_ghost_back_death;
        //Stats
        argument1.life = 4;
        argument1.defense = 3;
        argument1.attack = 3;
        argument1.movement_speed = 3;
        enemy_strength = 1;
        //Beahciour
        argument1.combat_behaviour[0] = "Melee Attack";
        argument1.combat_behaviour[1] = "Move Away";
        argument1.combat_behaviour[2] = "Offensive Teleport";
    break;
    //Teeth ball
    case "Teeth Ball":
        //Sprites
        argument1.front_idle = spr_teethball_front_moving;
        argument1.front_attack = spr_teethball_front_charguing;
        argument1.front_death = spr_teethball_front_death;
        argument1.back_idle = spr_teethball_back_moving;
        argument1.back_attack = spr_teethball_back_charguing;
        argument1.back_death = spr_teethball_back_death;
        //Stats
        argument1.life = 6;
        argument1.defense = 1;
        argument1.attack = 5;
        argument1.movement_speed = 6;
        enemy_strength = 2;
        //Behaviour
        argument1.combat_behaviour[0] = "Calm Down";
        argument1.combat_behaviour[1] = "Charge";
        argument1.combat_behaviour[2] = "Move Around";
        argument1.combat_behaviour[3] = "Aproach";
    break;
    //Goatnie
    case "Goatnie":
        //Sprites
        argument1.mask_index = spr_goatnie_mask;
        argument1.front_idle = spr_goatnie_front_idle;
        argument1.front_attack = spr_goatnie_front_attack;
        argument1.front_death = spr_goatnie_front_death;
        argument1.back_idle = spr_goatnie_back_idle;
        argument1.back_attack = spr_goatnie_back_attack;
        argument1.back_death = spr_goatnie_back_death;
        //Stats
        argument1.life = 12;
        argument1.defense = 0;
        argument1.attack = 5;
        argument1.movement_speed = 4;
        //Behaviour
            //Here we will use the default one
    break;
    //Soldier
    case "Soldier":
        //Sprites
        argument1.mask_index = spr_soldier_mask;
        argument1.front_idle = spr_soldier_front_idle;
        argument1.front_attack = spr_soldier_front_attack;
        argument1.front_death = spr_soldier_front_death;
        argument1.back_idle = spr_soldier_back_idle;
        argument1.back_attack = spr_soldier_back_attack;
        argument1.back_death = spr_soldier_back_death;
        //Stats
        argument1.life = 10;
        argument1.defense = 1;
        argument1.attack = 4;
        argument1.movement_speed = 3;
        //Behaviour
            argument1.type = "Ally";
            //Here we will use the default one
    break;
    //Bow Soldier
    case "Bow Soldier":
        //Sprites
        argument1.mask_index = spr_soldier_mask;    //Demomento la del soldado sin arco
        argument1.front_idle = spr_soldier_bow_front;
        argument1.front_attack = spr_soldier_bow_front_attack;
        argument1.front_death = spr_soldier_bow_front_death;
        argument1.back_idle = spr_soldier_bow_back;
        argument1.back_attack = spr_soldier_bow_back_attack;
        argument1.back_death = spr_soldier_bow_back_death;
        //Stats
        argument1.life = 8;
        argument1.defense = 1;
        argument1.attack = 5;
        argument1.movement_speed = 3;
        //Behaviour
            argument1.type = "Ally";
            //
            //argument1.combat_behaviour[0] = "Move Away";
            argument1.combat_behaviour[1] = "Distance Attack";
            argument1.combat_behaviour[2] = "Approach";
    break;
}
//Common parameters
argument1.initial_life = argument1.life;
argument1.sprite_index = argument1.front_idle;
