include "array";

def sdev:
    mean as $mean
    | map($mean - .)
    | map(. * .)
    | mean
    | sqrt
    | . / $mean * 100;


split(" ")
| [first, (rest | map(tonumber) | sdev)]
| select(second >= 4)
| first
