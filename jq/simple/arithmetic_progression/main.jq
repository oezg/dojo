def arith:
    (first + .[1] * (last - 1) / 2) * last;

split("\n")
| map(
    split(" ") | map(tonumber) | arith
)
| join(" ")