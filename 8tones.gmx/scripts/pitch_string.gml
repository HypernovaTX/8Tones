var _this_code_gets_string_of_pitch_, _temp_, _div_, _index_;
_index_ = argument0 mod 12;
_div_ = argument0 div 12;
//show_message(argument0);
//show_message(_index_);
if (global.reverse_PS == 0)
{
    switch (_index_)
    {
        case(0): _temp_ = "C-"; break;
        case(1): _temp_ = "C\#"; break;
        case(2): _temp_ = "D-"; break;
        case(3): _temp_ = "D\#"; break;
        case(4): _temp_ = "E-"; break;
        case(5): _temp_ = "F-"; break;
        case(6): _temp_ = "F\#"; break;
        case(7): _temp_ = "G-"; break;
        case(8): _temp_ = "G\#"; break;
        case(9): _temp_ = "A-"; break;
        case(10): _temp_ = "A\#"; break;
        case(11): _temp_ = "B-"; break;
        default: _temp_ = "X-"; break;
    }
    _this_code_gets_string_of_pitch_ = _temp_+string(_div_+1);
}

else if (global.reverse_PS == 1)
{
    switch (_index_)
    {
        case(0): _temp_ = "-C"; break;
        case(1): _temp_ = "\#C"; break;
        case(2): _temp_ = "-D"; break;
        case(3): _temp_ = "\#D"; break;
        case(4): _temp_ = "-E"; break;
        case(5): _temp_ = "-F"; break;
        case(6): _temp_ = "\#F"; break;
        case(7): _temp_ = "-G"; break;
        case(8): _temp_ = "\#G"; break;
        case(9): _temp_ = "-A"; break;
        case(10): _temp_ = "\#A"; break;
        case(11): _temp_ = "-B"; break;
        default: _temp_ = "-X"; break;
    }
    _this_code_gets_string_of_pitch_ = string(_div_+1)+_temp_;
}

return (_this_code_gets_string_of_pitch_);
