////////////////////////////////////////////////////////////////
//
//url_dencode(argument0);
//
//URL-Dencodes a string according to RFC 1738
//Written by Insane
//http://gmc.yoyogames.com/index.php?showtopic=327587 
////////////////////////////////////////////////////////////////
{
    var orig, new, char, tmp;
    orig = argument0;
    new = "";
    char = 0;
    tmp = 0;
    for (ps = 1; ps <= string_length(orig); ps += 1) {
        char = string_char_at(orig, ps);
        if (char == "%") {
            ps += 1;
            char = string_upper(string_char_at(orig, ps));
            if (char = "A") char = "10";
            if (char = "B") char = "11";
            if (char = "C") char = "12";
            if (char = "D") char = "13";
            if (char = "E") char = "14";
            if (char = "F") char = "15";
            char = real(char);
            ps += 1;
            tmp = string_upper(string_char_at(orig, ps));
            if (tmp = "A") tmp = "10";
            if (tmp = "B") tmp = "11";
            if (tmp = "C") tmp = "12";
            if (tmp = "D") tmp = "13";
            if (tmp = "E") tmp = "14";
            if (tmp = "F") tmp = "15";
            tmp = real(tmp);
            new = new + chr(char * 16 + tmp);
        } else {
            new = new + char;
        }
    }
    return new;
}
