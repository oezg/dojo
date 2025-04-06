include "array";

def blackjack:
    try tonumber catch 10;




split(" ")
| partition(. == "A")
| second |= (map(blackjack) | add)
| first |= length
| if first == 0 or second > 10 or first + second + 10 > 21 then
    first + second
else
    first + second + 10
end
| if . > 21 then "Bust" end