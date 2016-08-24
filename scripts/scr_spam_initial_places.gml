//Instance the initial place
global.map_tile[0] = instance_create(room_width/2, room_height/2, obj_test_place);
//Instance the adjacnet places
global.map_tile[1] = instance_create(global.map_tile[0].x,
                                global.map_tile[0].y - sprite_get_height(spr_test_place),
                                obj_test_place);
global.map_tile[2] = instance_create(global.map_tile[0].x + (sprite_get_width(spr_test_place)*3/4),
                                global.map_tile[0].y - sprite_get_height(spr_test_place)/2,
                                obj_test_place);
global.map_tile[3] = instance_create(global.map_tile[0].x + sprite_get_width(spr_test_place)*3/4,
                                global.map_tile[0].y + sprite_get_height(spr_test_place)/2,
                                obj_test_place);
//The other half
global.map_tile[4] = instance_create(global.map_tile[0].x,
                                global.map_tile[0].y + sprite_get_height(spr_test_place),
                                obj_test_place);
global.map_tile[5] = instance_create(global.map_tile[0].x - sprite_get_width(spr_test_place)*3/4,
                                global.map_tile[0].y + sprite_get_height(spr_test_place)/2,
                                obj_test_place);
global.map_tile[6] = instance_create(global.map_tile[0].x - sprite_get_width(spr_test_place)*3/4,
                                global.map_tile[0].y - sprite_get_height(spr_test_place)/2,
                                obj_test_place);
//Create data structure
//global.map_tiles = ds_grid_create(7, 7);
for(i = 0; i < 7; i++){
    //Posicion en x
    global.hex[i, 0] = global.map_tile[i].x;
    //Posicion en y
    global.hex[i, 1] = global.map_tile[i].y;
    /*Terrain type
        0 - Settlement
        1 - Plains
        2 - Forest
        3 - Swamp
        4 - Desert
    */
    //And hostility
    if(i == 0){
        global.hex[i, 2] = 0;
        global.map_tile[i].terrain = 0;
        global.hex[i, 3] = 0;
        global.map_tile[i].hostility = 0;
    }
    else{
        //Terrain type
            //Not random
        global.hex[i, 2] = round((i + 1) / 3);   //Así debería dar llanos y bosque
        global.map_tile[i].terrain = global.hex[i, 2];
        /*//Vamos a prbar de otra forma
        adjacent = 0;   
        adjacent_places[0] = 0;
        //Si, hay que tragarse la array entera 
        for(j = 0; j < array_length_1d(global.map_tile); j++){
            //Buscamos los colindantes (hay que revisar la distancia)
                //Que no pille el asentamiento
            if(distance_to_object(global.map_tile[j] < 100) && 
                global.map_tile[j].terrain > 0){
                //Si lo es guardamos su terreno
                adjacent_places[adjacent] = global.map_tile[j].terrain;
                adjacent ++;
            }
        }
        //Decidimos tanto si cae uno de esos
        terrain_decider = irandom(5);
        if(terrain_decider < adjacent)
            //Como cual será de ellos
            global.hex[i, 2] = adjacent_places[terrain_decider];
        else    //Si no random y a tomar por culo
            global.hex[i, 2] = irandom_range(1, 4);
        global.map_tile[i].terrain = global.hex[i, 2];
        */        
        
        //A not very moderate hostilty for the initial places
        global.hex[i, 3] = irandom_range(25, 50);
        global.map_tile[i].hostility = global.hex[i, 3];      
        //Id
        global.hex[i, 4] = i;
        global.map_tile[i].hex_id = global.hex[i, 4];
    }
}
