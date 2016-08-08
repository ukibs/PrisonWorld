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
    */
    //And hostility
    if(i == 0){
        global.hex[i, 2] = 0;
        global.map_tile[i].terrain = 0;
        global.hex[i, 3] = 0;
        global.map_tile[i].hostility = 0;
    }
    else{
        global.hex[i, 2] = irandom_range(1, 3);
        global.map_tile[i].terrain = global.hex[i, 2];
        //A moderate hostilty for the initial places
        global.hex[i, 3] = irandom_range(20, 60);
        global.map_tile[i].hostility = global.hex[i, 3];
    }
}
