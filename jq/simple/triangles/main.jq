def triangle:
    (add / 2) as $middle
    | if [first + last, .[1] + last, first + .[1]] | any(. < $middle) then 0 else 1 end;

split("\n")
| map(
    split(" ") | map(tonumber) | triangle
)
| join(" ")