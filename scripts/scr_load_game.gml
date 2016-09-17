//Chequearemos antes de usar este script que exista el archivo

//Open the file
loadFile = file_text_open_read("Save.sav");
//Write the global variables
    //Las organizaré más adelante
global.currency = file_text_read_real(loadFile);
//And close
file_text_close(loadFile);
