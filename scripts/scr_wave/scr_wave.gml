/// @func scr_wave(from, to, duration, offset);
/// @desc description
/// @arg {real} from	description
/// @arg {real} to		description
/// @arg {real} duration description
/// @arg {real} offset	description

// Returns a value that will wave back and forth between [from-to] over [duration] seconds
// Examples
//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
// Or here is a fun one! Make an object be all squishy!! ^u^
//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
//ME:
//offset: due to the script using the current run time as a counter the offsetz is to offset that time
//so you can start mid,begin,end of a cycle as you want
//1== one wave cycle offset
//as it is a WAVE 0.5 is the same as the starting position only in a different direction.
//0.25,0.75 are the peak of each waves

var a4 = (argument1 - argument0) * 0.5;
return argument0 + a4 + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi*2)) * a4;
