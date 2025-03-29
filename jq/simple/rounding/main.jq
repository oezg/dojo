split("\n")
| map(
    split(" ") | map(tonumber) | first / last | round | if . == -0 then 0 end
)
| join(" ")