include "lib/array";
include "lib/io";

def digits:
    [while(. > 0; . / 10 | floor) % 10];


miltiline_input(first * second + third | digits | add)