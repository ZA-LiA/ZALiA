/// get_encoded_file_data(file name)


var _FILE_NAME = argument[0];


var _data = "";

if (file_exists(_FILE_NAME))
{
    var _FILE  = file_text_open_read(_FILE_NAME);
    while(      !file_text_eof(   _FILE)) 
    {   _data += file_text_readln(_FILE);  }
                 file_text_close( _FILE);
}
else
{
    show_debug_message("");
    show_debug_message("!!!! WARNING! get_encoded_file_data(). File '"+_FILE_NAME+"' does not exist !!!!");
    show_debug_message("");
}


return _data;




