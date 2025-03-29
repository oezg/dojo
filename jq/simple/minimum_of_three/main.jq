split("\n")
| map(
    split(" ") | map(tonumber) | min
)
| join(" ")