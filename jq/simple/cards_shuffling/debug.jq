def deck:
    [["C","D","H", "S"],
    [range(13) + 1
    | if . == 1 then "A"
    elif . == 10 then "T"
    elif . == 11 then "J"
    elif . == 12 then "Q"
    elif . == 13 then "K"
    else tostring
    end]]
    | [combinations | add];

reduce to_entries[] as $e (deck;
    .[$e.key] as $temp
    | .[$e.key] = .[$e.value]
    | .[$e.value] = $temp)