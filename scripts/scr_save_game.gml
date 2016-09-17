//Check for the file and destroy the old one
if(file_exists("Save.sav"))
    file_delete("Save.sav");
//Create a new one
saveFile = file_text_open_write("Save.sav");
//Write the global variables
    //Luego veré cómo lo organizo
file_text_write_real(saveFile, global.currency);
//And close
file_text_close(saveFile);
