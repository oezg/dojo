include "lib/io";
include "lib/array";

def heron:
    until(.n == 0; .r = (.r + .s/.r) / 2 | .n -= 1);


multiline_input({s: first, n: second, r: 1} | heron | .r)