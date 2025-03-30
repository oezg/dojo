def miltiline_input(f):
    split("\n")
    | map(
        split(" ") | map(tonumber) | f
    )
    | join(" ");