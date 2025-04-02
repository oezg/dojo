include "array";
include "io";


def savings:
    debug("SAVINGS") |
    [while(first < .[1];
    first += (first * last | floor / 100))];

# multiline_input(savings)

def tzui:
;
