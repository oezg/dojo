include "array";
include "io";


def bmi: 
    (first / second / second) as $score 
    | [18.5, 25, 30] 
    | find_index($score < .) // 3;

def grade:
    ["under", "normal", "over", "obese"][.];

multiline_input(bmi | grade)
