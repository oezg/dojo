include "lib/number";

map(
    digits
    | reverse
    | [foreach .[] as $digit (0; .+1; .*$digit)]
    | add // 0
) | join(" ")