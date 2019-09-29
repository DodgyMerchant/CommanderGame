/// @func scr_wrap_around(value,min,max);
/// @desc returns the value wrapped.  If it is above or below the threshold it will wrap around
/// @arg {real} value	dec
/// @arg {real} min		dec
/// @arg {real} max		dec

var _val=argument[0];
var _max = argument[2];
var _min = argument[1];

if(_val mod 1 == 0)
{
    while(_val > _max || _val < _min)
    {
        if(_val > _max)
        {
            _val=_min + _val - _max - 1
        }
        else if (_val < _min)
        {
            _val=_max + _val - _min + 1;
        }
        else
            _val=_val;
    }
    return(_val);
}
else
{
    var _old = argument[0]+1;
    while(_val != _old)
    {
        _old=_val;
        if(_val<_min)
            _val=_max-(_min-_val);
        else if(_val >_max)
            _val=_min+(_val-_max);
        else
            _val=_val;
    }
    return(_val)
}
