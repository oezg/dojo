include "array";
include "io";


def bmi:
    (first / second / second) as $bmi
    | if $bmi < 18.5 then
        0
    elif $bmi < 25 then
        1
    elif $bmi < 30 then
        2
    else
        3
    end;

def grade:
    ["under", "normal", "over", "obese"][.];

multiline_input(bmi | grade)
