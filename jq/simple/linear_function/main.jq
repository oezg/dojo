include "lib/array";
include "lib/io";

def equation:
    ((last - second) / (third - first) | round) as $slope
    | [ $slope, second - first * $slope];


miltiline_input(equation | "(\(first) \(last))")