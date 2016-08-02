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
}
