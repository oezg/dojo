include "array";
include "io";


def lcg:
    until(last == 0; last -= 1 | penultimate = (first * penultimate + second) % third);

multiline_input(lcg | penultimate)
