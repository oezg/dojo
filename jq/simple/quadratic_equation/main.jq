include "array";
include "io";

def format_roots(term1; term2; determinant):
    if determinant < 0 then
        "\(term1)+\(term2)i \(term1)-\(term2)i"
    elif term2 < 0 then
        "\(term1-term2) \(term1+term2)"
    else
        "\(term1+term2) \(term1-term2)"
    end;

def quadratic:
    {a: first, b: second, c: third}
    | (.b * .b - 4 * .a * .c) as $determinant
    | (if .b == 0 then 0 else -.b / .a / 2 end) as $first_term
    | (($determinant | abs | sqrt) / .a / 2) as $second_term
    | format_roots($first_term; $second_term; $determinant);

put(quadratic; "; ")