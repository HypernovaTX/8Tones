///split(str,tag);

/**
    split()
    
    Author: Zack Banack
    May 8, 2015
    http://zackbanack.com/
    
    Returns the string between two tags if they
    exist, otherwise, returns an empty string.
    
    arguments:
        str - String type, the string to split
        tag - String type, the name of the tag
    
    returns:
        String type, the string between the two tags
*/

// ensure the variables symbolOpen, symbolClose, and symbolSlash have
// been declared prior to calling this function
var del1 = string(symbolOpen) + string(argument1) + string(symbolClose); // generate the opening tag
var del2 = string_insert(string(symbolSlash), del1, 2); // insert the slash for closing tag

// check if the tags exist within the string
if (string_pos(del1, argument0) != 0 && string_pos(del2, argument0) != 0) {
    // return the content between the two tags
    return string_copy(argument0, (string_pos(del1, argument0)) + string_length(del1),
     (string_pos(del2, argument0)) - (string_pos(del1, argument0) + string_length(del1)));
}

return ""; // return an empty string
