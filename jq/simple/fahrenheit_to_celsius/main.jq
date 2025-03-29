def tocelsius:
    . - 32
    | . * 5 / 9
    | round;

map(tocelsius) | join(" ")