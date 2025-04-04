def put(filter; separator):
    split("\n")
    | map(
        split(" ") | map(tonumber) | filter
    )
    | join(separator);


def multiline_input(f):
    put(f; " ");