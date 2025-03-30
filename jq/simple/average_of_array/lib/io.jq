def multiline_input(f):
    split("\n")
    | map(
        split(" ") | map(tonumber) | f
    )
    | join(" ");