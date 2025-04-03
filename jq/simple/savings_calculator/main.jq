include "array";
include "io";


def savings:
    [while(first < .[1]; first += (first * last | floor / 100))];

multiline_input(savings | length)
