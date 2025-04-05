include "array";

def blackjack:
    if test("[2-9]") then
        tonumber
    elif test("[TJQK]") then
        10
    else
        0
    end;




split(" ")
| partition(. == "A")
| second |= reduce .[] as $item (0; . + ($item | blackjack))
| first |= length
| if second > 21 then
    "Bust"
elif first == 0 then
    second
elif second > 10 then
    first + second
elif first + second + 10 > 21 then
    first + second
else
    first + second + 10
end
| if . > 21 then "Bust" end