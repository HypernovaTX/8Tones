var _this_code_gets_string_of_pitch_, _Temp_S, _divv_, _indexx_;
_indexx_ = argument0 mod 12;
switch (_indexx_)
{
    case(0): _Temp_S = "C-"; break;
    case(1): _Temp_S = "C#"; break;
    case(2): _Temp_S = "D-"; break;
    case(3): _Temp_S = "D#"; break;
    case(4): _Temp_S = "E-"; break;
    case(5): _Temp_S = "F-"; break;
    case(6): _Temp_S = "F#"; break;
    case(7): _Temp_S = "G-"; break;
    case(8): _Temp_S = "G#"; break;
    case(9): _Temp_S = "A-"; break;
    case(10): _Temp_S = "A#"; break;
    case(11): _Temp_S = "B-"; break;
    default: _Temp_S = "X-"; break;
    
}

_divv_ = argument0 div 12;
return (_Temp_S);
