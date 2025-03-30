include "array";

reduce .[] as $i ([]; .[$i] +=1) | rest | map(. // 0) | join(" ")