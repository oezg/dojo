def mean:
    add / length;

def sd:
    mean as $mean
    | map(. - $mean)
    | map(. * .)
    | mean
    | sqrt;


split(" ")
| {(first): .[1:] | map(tonumber) | sd}
| to_entries[0]
| select(.value >= 4)
| .key